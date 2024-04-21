package com.bank.peopleshorizon.databaseutils;

import java.sql.Statement;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import org.json.JSONObject;

import java.util.AbstractMap.SimpleEntry;

import com.bank.peopleshorizon.entities.Account;
import com.bank.peopleshorizon.entities.Address;
import com.bank.peopleshorizon.entities.Branch;
import com.bank.peopleshorizon.entities.Customer;
import com.bank.peopleshorizon.entities.Employee;
import com.bank.peopleshorizon.entities.Nominee;
import com.bank.peopleshorizon.entities.PhoneNumber;
import com.bank.peopleshorizon.entities.PrimaryAccount;
import com.bank.peopleshorizon.entities.Transaction;
import com.bank.peopleshorizon.entities.User;
import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.validation.Validation;

public class DataBaseUtils
{
	private String url = "jdbc:mysql://localhost:3306/PeoplesHorizon";
    private String userName = "root";
    private String password = "Nino@001";
    
    
    private static Map<String, String> columnMap = new HashMap<>();

    static 
    {
        columnMap.put("id", "ID");
        columnMap.put("aadharNumber", "Aadhar Number");
        columnMap.put("panNumber", "Pan Number");
        columnMap.put("fatherName", "Father Name");
        columnMap.put("motherName", "Mother Name");
        columnMap.put("primaryAccount", "Primary Account");
        columnMap.put("userId", "User ID");
        columnMap.put("firstName", "First Name");
        columnMap.put("lastName", "Last Name");
        columnMap.put("email", "Email");
        columnMap.put("phoneNumberId", "Phone Number ID");
        columnMap.put("addressId", "Address ID");
        columnMap.put("password", "Password");
        columnMap.put("userType", "User Type");
        columnMap.put("status", "Status");
        columnMap.put("nomineeId", "Nominee ID");
        columnMap.put("relationship", "Relationship");
        columnMap.put("employeeId", "Employee ID");
        columnMap.put("branchId", "Branch ID");
        columnMap.put("countryCode", "Country Code");
        columnMap.put("phoneNumber", "Phone Number");
        columnMap.put("branchName", "Branch Name");
        columnMap.put("branchCode", "Branch Code");
        columnMap.put("houseNumber", "House Number");
        columnMap.put("street", "Street");
        columnMap.put("city", "City");
        columnMap.put("district", "District");
        columnMap.put("state", "State");
        columnMap.put("pinCode", "Pin Code");
        columnMap.put("balance", "Balance");
        columnMap.put("transactionId", "Transaction ID");
        columnMap.put("customerId", "Customer ID");
        columnMap.put("transferNumber", "Transfer Number");
        columnMap.put("transactionType", "Transaction Type");
        columnMap.put("paymentMethod", "Payment Method");
        columnMap.put("amount", "Amount");
        columnMap.put("timeStamp", "Time Stamp");
        columnMap.put("closingBalance", "Closing Balance");
        columnMap.put("primaryId", "Primary ID");
        columnMap.put("accountNumber", "Account Number");
        columnMap.put("mPin", "Mobile Pin");
        columnMap.put("accountType", "Account Type");
    }

    
    
    private static String getAccounts = "SELECT a.accountNumber, a.customerId, a.branchId, a.accountType, a.balance, a.status, " +
            "b.branchId, b.branchName, b.branchCode, b.phoneNumberId " +
            "FROM Account a JOIN Branch b ON a.branchId = b.branchId " +
            "WHERE (a.customerId = ? OR ? IS NULL) AND " +
            "(b.branchName = ? OR ? IS NULL) AND " +
            "(a.status = ? OR ? IS NULL) LIMIT ?, ?";
    
    private static String countGetAccounts = "SELECT COUNT(*) AS records " +
            "FROM Account a JOIN Branch b ON a.branchId = b.branchId " +
            "WHERE (a.customerId = ? OR ? IS NULL) AND " +
            "(b.branchName = ? OR ? IS NULL) AND " +
            "(a.status = ? OR ? IS NULL)";

	
	public DataBaseUtils() 
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	private String getColumns(String[] fields, String joinBy)
	{
		StringJoiner columns = new StringJoiner(joinBy);
		for (String x: fields)
		{
			columns.add(x);
		}
		return columns.toString();
	}
	
	private String getTemplate(int size, String string, String joinBy)
	{
		StringJoiner template = new StringJoiner(joinBy);
		for (int x = 0; x < size; x++)
		{
			template.add(string);
		}
		return template.toString();
	}
	
	public void update(String query) throws SQLException 
	{
		try (Connection connection = DriverManager.getConnection(url, userName, password))
		{
			try (Statement statement = connection.createStatement())
			{
				statement.executeUpdate(query);
			}
		}
	}
	
	public static void addStatement(PreparedStatement statement, Object object, Field[] fields) throws IllegalArgumentException, IllegalAccessException, SQLException
	{
		for (int x = 1; x < fields.length - 1; x++)
		{
			fields[x].setAccessible(true);
			Object value = fields[x].get(object);
			
			if (value instanceof String)
			{
				statement.setString(x, (String) value);
			}
			
			else if (value instanceof Integer)
			{
				statement.setInt(x, (int) value);
			}
			
			else if (value instanceof Long)
			{	
				statement.setLong(x, (long) value);		
			}
			
			else if (value instanceof Double)
			{
				statement.setDouble(x, (double) value);
			}
			
			else if (value instanceof Date)
			{
				statement.setDate(x, (Date) value);
			}
			
			else if (value instanceof Time)
			{
				statement.setTime(x, (Time) value);
			}
			
			else if (value instanceof Timestamp)
			{
				statement.setTimestamp(x, (Timestamp) value);
			}
			
			else if (value == null)
			{
				statement.setNull(x, Types.NULL);
			}
			
			else if (value instanceof Enum<?>) 
			{
	            Enum<?> enumObj = (Enum<?>) value;
	            statement.setInt(x, enumObj.ordinal());
	        }
		}
	}
	
	public Integer insert(Object object) throws IllegalArgumentException, IllegalAccessException, SQLException, InvalidDataException
	{
		try (Connection connection = DriverManager.getConnection(this.url, this.userName, this.password))
		{		
			return insert(connection, object);
		}
	}
	
	public Integer insert(Connection connection, Object object) throws IllegalArgumentException, IllegalAccessException, SQLException, InvalidDataException
	{
		String joinBy = ", ", string = "?";
		Class<? extends Object> entity = object.getClass();
		String tableName = entity.getSimpleName();
		Field[] allFields = entity.getDeclaredFields();
		int fieldsLength = allFields.length - 1;
		String[] fields = new String[fieldsLength - 1];
		
		for (int x = 1; x < fieldsLength; x++)
		{
			fields[x - 1] = allFields[x].getName();
		}
		
		StringBuilder query = new StringBuilder("INSERT INTO ");
		query.append(tableName);
		query.append(" (");
		query.append(getColumns(fields, joinBy));
		query.append(") VALUES (");
		query.append(getTemplate(fieldsLength - 1, string, joinBy));
		query.append(")");
		
		
		try (PreparedStatement statement = connection.prepareStatement(query.toString(),  Statement.RETURN_GENERATED_KEYS))
		{
			addStatement(statement, object, allFields);
			statement.executeUpdate();
			try (ResultSet rsltSet = statement.getGeneratedKeys())
			{
				rsltSet.next();
				return rsltSet.getInt(1);
			}
		}
	}
	
	public void addBranch(Branch branch, PhoneNumber phoneNumber, Address address) throws InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException
	{
		Utility.assertNonNull(branch);
		Utility.assertNonNull(phoneNumber);
		Utility.assertNonNull(address);
		Connection connection = null;
		
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
			Integer phoneNumberId = insert(connection, phoneNumber);
			branch.setPhoneNumberId(phoneNumberId);
			Integer addressId = insert(connection, address);
			branch.setAddressId(addressId);
			insert(connection, branch);
			connection.commit();
		}
		
		catch (InvalidDataException e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}
		
		finally
		{
			connection.close();
		}
	}
	
	private int addAccount(Connection connection, Account account, Nominee nominee) throws InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException
	{
		Utility.assertNonNull(account);
		account.setStatus(Status.ACTIVE);
		Integer nomineeId = null;
		if (nominee != null) 
		{
			nomineeId = insert(connection, nominee);
		}
		account.setNomineeId(nomineeId);
		int accountNumber = insert(connection, account);
		return accountNumber;
	}
	
	public int addAccount(Account account, Nominee nominee) throws IllegalArgumentException, IllegalAccessException, SQLException, InvalidDataException, NoSuchFieldException, SecurityException
	{
		System.out.println("Called");
		Connection connection = null;
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
			int accountNumber = addAccount(connection, account, nominee);
			PrimaryAccount primaryAccount = new PrimaryAccount();
			primaryAccount.setCustomerId(account.getCustomerId());
			primaryAccount.setAccountNumber(accountNumber);
			primaryAccount.setMPin(account.getMPin());
			
			try
			{
				insert(connection, primaryAccount);
			}
			catch (SQLException e)
			{
				System.out.println("YES ");
				JSONObject primary = executeQuery("SELECT * FROM PrimaryAccount WHERE customerId = ?", new Object[]{account.getCustomerId()}).get(0);
//				primaryAccount.setPrimaryAccountId("");
				primaryAccount.addDirtyField("accountNumber");
				primaryAccount.addDirtyField("mPin");
				updateTable(connection, primaryAccount, new Condition("customerId", " = ", account.getCustomerId()));
			}
			connection.commit();
			return accountNumber;
		}
		
		catch (InvalidDataException e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}
		
		finally
		{
			connection.close();
		}
	}
	
	public boolean addAccount(Customer customer, User user, PhoneNumber phoneNumber, Address address, Nominee nominee) throws InvalidDataException, SQLException
	{
		Connection connection = null;
		
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
			Integer phoneNumberId = insert(connection, phoneNumber);
			Integer addressId = insert(connection, address);
			user.setPhoneNumberId(phoneNumberId);
			user.setAddressId(addressId);
			Integer userId = insert(connection, user);
			customer.setCustomerId(userId);
			insert(connection, customer);
			connection.commit();
			return true;
		}
		
		catch (Exception e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}
		
		finally
		{
			connection.close();
		}
	}
	
	public boolean addEmployee(Employee employee, User user, PhoneNumber phoneNumber, Address address) throws InvalidDataException, SQLException
	{
		Connection connection = null;
		
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
			Integer phoneNumberId = insert(connection, phoneNumber);
			Integer addressId = insert(connection, address);
			user.setPhoneNumberId(phoneNumberId);
			user.setAddressId(addressId);
			int userId = insert(connection, user);
			employee.setEmployeeId(userId);
			insert(connection, employee);
			connection.commit();
			return true;
		}
		
		catch (Exception e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}

		finally
		{
			connection.close();
		}
	}
	
	public boolean addTransaction(Account senderAccount, Account recipientAccount, Transaction senderTransaction, Transaction recipientTransaction) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException, SQLException, InvalidDataException
	{
		Connection connection = null;
		Condition recipientCondition = null;
		int fromAccountNumber = senderAccount.getAccountNumber();
        long timeStamp = System.currentTimeMillis();
        
		Condition senderCondition = new Condition("accountNumber", "=", fromAccountNumber);
        
        if (recipientAccount != null)
        {
    		int toAccountNumber = recipientAccount.getAccountNumber();
	        recipientCondition = new Condition("accountNumber", "=", toAccountNumber);
	        recipientTransaction.setTimeStamp(timeStamp);
        }
		
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
	        updateTable(connection, senderAccount, senderCondition);
	        insert(connection, senderTransaction);
	        if (recipientTransaction != null)
	        {
		        updateTable(connection, recipientAccount, recipientCondition);
		        insert(connection, recipientTransaction);
	        }
	        connection.commit();
	        return true;
		}
		
		catch (Exception e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}

		finally
		{
			connection.close();
		}
	}
	
	private boolean updateTable(Connection connection, String query) throws SQLException
	{
		Statement statement = connection.createStatement();
		{
			statement.executeUpdate(query);
		}
		return true;
	}
	
	public boolean updateTable(Object object, Condition condition) throws IllegalAccessException, NoSuchFieldException, SecurityException, SQLException, InvalidDataException
	{
		String query = getUpdateQuery(object, condition);
		System.out.println(query);
	    try (Connection connection = DriverManager.getConnection(url, userName, password))
	    {
	    	return updateTable(connection, query.toString());
	    }
	    catch (Exception e)
	    {
	    	System.out.println(e.getMessage());
	    	throw new InvalidDataException(e.getMessage(), e);
	    }
	}
	
	public boolean updateTable(Connection connection, Object object, Condition condition) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException, SQLException
	{
		String query = getUpdateQuery(object, condition);
	    return updateTable(connection, query.toString());
	}
	
	private String normalizeUpdates(String fieldName, Object value)
	{
		StringBuilder update = new StringBuilder(fieldName);
        update.append(" = ");
        if (value instanceof Enum<?>) 
		{
            Enum<?> enumObj = (Enum<?>) value;
            value = enumObj.ordinal();
        }
        if (value instanceof String) 
		{
            StringBuilder string = new StringBuilder("\"");
            string.append((String) value);
            string.append("\"");
            value = string;
        }
        update.append(value);
        return update.toString();
	}
	
	public String getUpdateQuery(Object object, Condition condition) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException, SQLException
	{
	    String joinBy = ", ";
	    Object currentObject = object;
	    Class<? extends Object> entity = currentObject.getClass();

	    String tableName = entity.getSimpleName();
	    
	    Field dirtyField = entity.getDeclaredField("dirtyFields");
	    dirtyField.setAccessible(true);
	    
	    List<String> dirtyFields = (List<String>) dirtyField.get(currentObject);
	    
	    int fieldLength = dirtyFields.size();
	    String[] updates;
	    Field updateField;
	    
	    System.out.println(dirtyFields + " " + fieldLength);
	    
	    if (fieldLength == 0)
	    {
	    	Field[] fields = entity.getDeclaredFields();
	    	int fieldsLength = fields.length;
	    	updates = new String[fieldsLength - 1];
	    	
	    	for (int x = 0; x < fieldsLength - 1; x++)
	    	{
	    		Field field = fields[x]; 
	    		field.setAccessible(true);
		        Object value = field.get(currentObject);
	    		String fieldName = field.getName();
	    		String update = normalizeUpdates(fieldName, value);
		        updates[x] = update.toString();
	    	}
	    }
	    
	    else
	    {
	    	updates = new String[fieldLength];
		    for (int x = 0; x < fieldLength; x++)
		    {
		        String fieldName = dirtyFields.get(x);
		        updateField = entity.getDeclaredField(fieldName);
		        updateField.setAccessible(true);
		        Object value = updateField.get(currentObject);
		        String update = normalizeUpdates(fieldName, value);
		        updates[x] = update.toString();
		    }
	    }
	    
	    StringBuilder query = new StringBuilder("UPDATE ");
	    query.append(tableName);
	    query.append(" SET ");
	    query.append(getColumns(updates, joinBy));
	    query.append(" WHERE ");
	    query.append(condition.toString());
	    
	    return query.toString();
	}
	 
	
	public void dropTable(String tableName) throws SQLException
	{
		StringBuilder query = new StringBuilder("DROP TABLE IF EXISTS ");
		query.append(tableName);
		update(query.toString());
	}

	public List<Map<String, Object>> select(String query) throws SQLException 
	{
		List<Map<String, Object>> rslt = new ArrayList<>(); 
		Map<String, Object> row;
		
		try (Connection connection = DriverManager.getConnection(url, userName, password);
			 Statement statement = connection.createStatement())
		{
			ResultSet resultSet = statement.executeQuery(query); 
			while (resultSet.next()) 
			{
	            row = new HashMap<>();
	            int columnCount = resultSet.getMetaData().getColumnCount();
	            
	            for (int i = 1; i <= columnCount; i++) 
	            {
	                String columnName = resultSet.getMetaData().getColumnName(i);
	                Object columnValue = resultSet.getObject(i);
	                row.put(columnName, columnValue);
	            }
	            
	            rslt.add(row);
	        }
		    return rslt;
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
			throw e;
		}
	}

	public void deleteRow(String tableName, Condition condition) throws SQLException
	{
		StringBuilder query = new StringBuilder("DELETE FROM ");
		query.append(tableName);
		query.append(" WHERE ");
		query.append(condition.toString());
		try (Connection connection = DriverManager.getConnection(url, userName, password);
			 Statement statement = connection.createStatement())
		{
			statement.executeUpdate(query.toString());
		}
		System.out.println(query);
	}
	
	public boolean addNewAmin(User user, PhoneNumber phoneNumber, Address address) throws SQLException, InvalidDataException 
	{
		Connection connection = null;
		
		try 
		{
			connection = DriverManager.getConnection(this.url, this.userName, this.password);
			connection.setAutoCommit(false);
			Integer phoneNumberId = insert(connection, phoneNumber);
			Integer addressId = insert(connection, address);
			user.setPhoneNumberId(phoneNumberId);
			user.setAddressId(addressId);
			insert(connection, user);
			connection.commit();
			return true;
		}
		
		catch (Exception e)
		{
			connection.rollback();
			throw new InvalidDataException(e.getMessage(), e);
		}

		finally
		{
			connection.close();
		}
	}
	
	public SimpleEntry<Long, List<JSONObject>> getAllAccounts(Status status, String branch, Integer customerId, int page, int size) throws InvalidDataException 
	{
	    Object[] values = {customerId, customerId, branch, branch, status, status, (page - 1) * size, size};
	    List<JSONObject> rsltSet = executeQuery(getAccounts, values);
	    Object[] values1 = {customerId, customerId, branch, branch, status, status};
		List<JSONObject> rsltList = executeQuery(countGetAccounts, values1);
		System.out.println(countGetAccounts + "countGetAccounts " + values);
		JSONObject row = rsltList.get(0);
		long records = (long) row.get("records");
	    SimpleEntry<Long, List<JSONObject>> rslt = new SimpleEntry<>(records, rsltSet);
	    return rslt;
//	    try (Connection connection = DriverManager.getConnection(this.url, this.userName, this.password);
//	         PreparedStatement statement = connection.prepareStatement(getAccounts)) {
//	        
//	        
//	        if (customerId != null) {
//	            statement.setInt(1, customerId); // Adjust index according to SQL query
//	            statement.setInt(2, customerId); // Adjust index according to SQL query
//	        } else {
//	            statement.setNull(1, Types.INTEGER); // Set parameter to NULL
//	            statement.setNull(2, Types.INTEGER); // Set parameter to NULL
//	        }
//	        
//	        if (branch != null) {
//	            statement.setString(3, branch); // Adjust index according to SQL query
//	            statement.setString(4, branch); // Adjust index according to SQL query
//	        } else {
//	            statement.setNull(3, Types.INTEGER); // Set parameter to NULL
//	            statement.setNull(4, Types.INTEGER); // Set parameter to NULL
//	        }
//	        
//	        if (status != null) {
//	            statement.setInt(5, status.ordinal()); // Adjust index according to SQL query, add 1 to match with 1-based indexing
//	            statement.setInt(6, status.ordinal()); // Adjust index according to SQL query, add 1 to match with 1-based indexing
//	        } else {
//	            statement.setNull(5, Types.INTEGER); // Set parameter to NULL
//	            statement.setNull(6, Types.INTEGER); // Set parameter to NULL
//	        }
//	        
//	        statement.setInt(7, (page - 1) * size); 
//            statement.setInt(8, size);
//            
//	        System.out.println(statement.toString());
//	        
//	        ResultSet resultSet = statement.executeQuery();
//	        
//	        while (resultSet.next()) {
//	            row = new HashMap<>();
//	            int columnCount = resultSet.getMetaData().getColumnCount();
//	            
//	            for (int i = 1; i <= columnCount; i++) {
//	                String columnName = resultSet.getMetaData().getColumnName(i);
//	                Object columnValue = resultSet.getObject(i);
//	                row.put(columnName, columnValue);
//	            }
//	            
//	            rslt.add(row);
//	        }
//	        return rslt;
//	    } catch (Exception e) {
//	        throw new InvalidDataException(e.getMessage(), e);
//	    }
	}
	
	
	
	
	
	
	
	
	
	

	 public List<JSONObject> executeQuery(String queryString, Object[] params) throws InvalidDataException 
	 {
	        List<JSONObject> result = new ArrayList<>();

	        try (Connection connection = DriverManager.getConnection(url, userName, password);
		         PreparedStatement preparedStatement = connection.prepareStatement(queryString))
	        {
	            for (int i = 0; i < params.length; i++) 
	            {
	                Object param = params[i];
	                int paramIndex = i + 1;
	                if (param instanceof Integer) 
	                {
	                    preparedStatement.setInt(paramIndex, (Integer) param);
	                } 
	                else if (param instanceof String) 
	                {
	                    preparedStatement.setString(paramIndex, (String) param);
	                }
	                else if (param instanceof Double) 
	                {
	                    preparedStatement.setDouble(paramIndex, (Double) param);
	                }
	                else if (param instanceof Float) 
	                {
	                    preparedStatement.setFloat(paramIndex, (Float) param);
	                }
	                else if (param instanceof Long) 
	                {
	                    preparedStatement.setLong(paramIndex, (Long) param);
	                }
	                else if (param instanceof Date) 
	                {
	                    preparedStatement.setDate(paramIndex, (Date) param);
	                }
	                else if (param instanceof Time) 
	                {
	                    preparedStatement.setTime(paramIndex, (Time) param);
	                }
	                else if (param instanceof Timestamp) 
	                {
	                    preparedStatement.setTimestamp(paramIndex, (Timestamp) param);
	                } 
	                else if (param instanceof Enum) 
	                {
	                    preparedStatement.setInt(paramIndex, ((Enum<?>) param).ordinal());
	                } 
	                else if (param == null) 
	                {
	                    preparedStatement.setNull(paramIndex, Types.INTEGER);
	                } 
	            }

	            System.out.println("\n" + preparedStatement);
	            ResultSet resultSet = preparedStatement.executeQuery();

	            ResultSetMetaData metaData = resultSet.getMetaData();
	            int columnCount = metaData.getColumnCount();

	            while (resultSet.next()) 
	            {
	                JSONObject row = new JSONObject();
	                for (int i = 1; i <= columnCount; i++) 
	                {
	                    String columnName = metaData.getColumnName(i);
	                    String field = columnMap.getOrDefault(columnName, columnName);
	                    Object value = resultSet.getObject(i);
	                    row.put(field, value);
	                }
	                result.add(row);
	            }	        
	        } 
	        catch (SQLException e) 
	        {
	            e.printStackTrace();
	            throw new InvalidDataException(e.getMessage(), e);
	        }
	        
	        System.out.println(result + "\n");
	        return result;
	 }
	 
}