package com.bank.peopleshorizon.features;

import java.io.IOException;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.catalina.valves.JsonAccessLogValve;
import org.json.JSONObject;

import com.bank.peopleshorizon.entities.Customer;
import com.bank.peopleshorizon.entities.Nominee;
import com.bank.peopleshorizon.entities.User;
import com.bank.peopleshorizon.enums.PaymentMethod;
import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.enums.TransactionStatus;
import com.bank.peopleshorizon.entities.PhoneNumber;
import com.bank.peopleshorizon.entities.PrimaryAccount;
import com.bank.peopleshorizon.entities.Account;
import com.bank.peopleshorizon.entities.Address;
import com.bank.peopleshorizon.entities.Branch;
import com.bank.peopleshorizon.entities.Employee;
import com.bank.peopleshorizon.entities.Transaction;
import com.bank.peopleshorizon.databaseutils.Condition;
import com.bank.peopleshorizon.databaseutils.DataBaseUtils;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.formatter.LogFormatter;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.formatter.LogFormatter;
import com.bank.peopleshorizon.validation.Validation;
import com.google.gson.JsonObject;

public class Features
{
	Integer accountNumber, userId;
	private static int count = 0;
    private Role role;
    private Logger logger = Logger.getLogger("People's Horizon");
//    private static final ThreadLocal<PrimaryAccount> currentUser = new ThreadLocal<PrimaryAccount>();
    private static final ThreadLocal<Integer> currentUser = new ThreadLocal<>();
  
    
	private static String createAddress = "CREATE TABLE IF NOT EXISTS Address (addressId INT PRIMARY KEY AUTO_INCREMENT, houseNumber VARCHAR(10), street VARCHAR(20) NOT NULL, city VARCHAR(30) NOT NULL, district VARCHAR(30) NOT NULL, state VARCHAR(30) NOT NULL, pinCode INT(6) NOT NULL);";
	private static String createEmployee = "CREATE TABLE IF NOT EXISTS Employee (id INT PRIMARY KEY AUTO_INCREMENT, employeeId INT NOT NULL UNIQUE, branchId INT NOT NULL, FOREIGN KEY (employeeId) REFERENCES User(userId) ON DELETE CASCADE, FOREIGN KEY (branchId) REFERENCES Branch(branchId) ON DELETE CASCADE);";	
	private static String createPhoneNumber = "CREATE TABLE IF NOT EXISTS PhoneNumber (phoneNumberId INT PRIMARY KEY AUTO_INCREMENT, countryCode INT NOT NULL, phoneNumber BIGINT(10) NOT NULL UNIQUE);";	
	private static String createUser = "CREATE TABLE IF NOT EXISTS User (userId INT PRIMARY KEY AUTO_INCREMENT, firstName VARCHAR(50) NOT NULL, lastName VARCHAR(50) NOT NULL, email VARCHAR(100) UNIQUE, phoneNumberId INT NOT NULL, addressId INT NOT NULL, password VARCHAR(150) NOT NULL, userType INT NOT NULL, status INT, FOREIGN KEY (phoneNumberId) REFERENCES PhoneNumber(phoneNumberId) ON DELETE CASCADE, FOREIGN KEY (addressId) REFERENCES Address(addressId) ON DELETE CASCADE);";
	private static String createCustomer = "CREATE TABLE IF NOT EXISTS Customer (id INT PRIMARY KEY AUTO_INCREMENT, customerId INT NOT NULL, aadharNumber BIGINT(12) NOT NULL UNIQUE, panNumber VARCHAR(10) NOT NULL UNIQUE, fatherName VARCHAR(30) NOT NULL, motherName VARCHAR(30) NOT NULL, FOREIGN KEY (customerId) REFERENCES User(userId) ON DELETE CASCADE);";
	private static String createNominee = "CREATE TABLE IF NOT EXISTS Nominee (nomineeId INT PRIMARY KEY AUTO_INCREMENT, firstName VARCHAR(50) NOT NULL, lastName VARCHAR(50) NOT NULL, relationship VARCHAR(30), email VARCHAR(100) UNIQUE, phoneNumberId INT NOT NULL UNIQUE, addressId INT NOT NULL, FOREIGN KEY (phoneNumberId) REFERENCES PhoneNumber(phoneNumberId) ON DELETE CASCADE, FOREIGN KEY (addressId) REFERENCES Address(addressId) ON DELETE CASCADE);";	
	private static String createAccount = "CREATE TABLE IF NOT EXISTS Account (accountNumber INT PRIMARY KEY AUTO_INCREMENT, customerId INT NOT NULL, nomineeId INT, branchId INT NOT NULL, mPin INT NOT NULL, accountType VARCHAR(20) NOT NULL, balance DECIMAL(18, 2) NOT NULL, status INT, FOREIGN KEY (customerId) REFERENCES Customer(customerId) ON DELETE CASCADE, FOREIGN KEY (nomineeId) REFERENCES Nominee(nomineeId) ON DELETE CASCADE, FOREIGN KEY (branchId) REFERENCES Branch(branchId) ON DELETE CASCADE);";	
	private static String createBranch = "CREATE TABLE IF NOT EXISTS Branch (branchId INT PRIMARY KEY AUTO_INCREMENT, branchName VARCHAR(30) NOT NULL UNIQUE, phoneNumberId INT NOT NULL, addressId INT NOT NULL, branchCode VARCHAR(10) NOT NULL, FOREIGN KEY (phoneNumberId) REFERENCES PhoneNumber(phoneNumberId) ON DELETE CASCADE, FOREIGN KEY (addressId) REFERENCES Address(addressId) ON DELETE CASCADE);";	
	private static String createTransaction = "CREATE TABLE IF NOT EXISTS Transaction (id INT PRIMARY KEY AUTO_INCREMENT, transactionId INT, customerId INT NOT NULL, accountNumber INT NOT NULL, transferNumber INT, transactionType VARCHAR(20) NOT NULL, paymentMethod INT NOT NULL, amount DECIMAL(18, 2) NOT NULL, timeStamp BIGINT NOT NULL, closingBalance DECIMAL(18, 2) NOT NULL, status INT, branchCode VARCHAR(10), FOREIGN KEY (customerId) REFERENCES Customer(customerId) ON DELETE CASCADE, FOREIGN KEY (accountNumber) REFERENCES Account(accountNumber) ON DELETE CASCADE);";	
	private static String createPrimary = "CREATE TABLE IF NOT EXISTS PrimaryAccount (primaryAccountId INT PRIMARY KEY AUTO_INCREMENT, customerId INT NOT NULL UNIQUE, mPin INT, accountNumber INT NOT NULL UNIQUE, FOREIGN KEY (customerId) REFERENCES Customer(customerId) ON DELETE CASCADE, FOREIGN KEY (accountNumber) REFERENCES Account(accountNumber) ON DELETE CASCADE)";	
	
	private static String updateUserId = "ALTER TABLE User AUTO_INCREMENT = 100000";	
	private static String updateAccountNumber = "ALTER TABLE Account AUTO_INCREMENT = 1000000";
	private static String updateEmployeeId = "ALTER TABLE Employee AUTO_INCREMENT = 100000";	
	private static String updateTransactionId = "ALTER TABLE Transaction AUTO_INCREMENT = 100000";
	private static String updatePrimaryId = "ALTER TABLE PrimaryAccount AUTO_INCREMENT = 100000";
	private static String updatePhoneNumberId = "ALTER TABLE PhoneNumber AUTO_INCREMENT = 10000";	
	private static String updateAddressId = "ALTER TABLE Address AUTO_INCREMENT = 100000";
	private static String updateBranchId = "ALTER TABLE Branch AUTO_INCREMENT = 100000";
	private static String updateCustomerId = "ALTER TABLE Customer AUTO_INCREMENT = 10000";	
	private static String updateNomineeId = "ALTER TABLE Nominee AUTO_INCREMENT = 100000";


    private static String viewTransaction = "SELECT * FROM Transaction ";
    private static String countTransaction = "SELECT COUNT(*) as records FROM Transaction ";
    
	private static String ourAccount = "SELECT * FROM Account WHERE accountNumber = ? AND branchId = ? LIMIT 1";
	private static String getStatement = "SELECT t.transferNumber, t.transactionType as transactionType, t.paymentMethod as paymentMethod, t.timeStamp AS timeStamp, t.amount AS amount, t.closingBalance AS closingBalance, (SELECT b.branchCode FROM Branch b WHERE b.branchId = (SELECT acc.branchId FROM Account acc WHERE acc.accountNumber = t.transferNumber)) AS branchCode, (SELECT b.branchName FROM Branch b WHERE b.branchId = (SELECT acc.branchId FROM Account acc WHERE acc.accountNumber = t.transferNumber)) AS branchName FROM Transaction t";

	
	
    private static String prepGetAllAccounts = "SELECT * FROM Account ORDER BY accountNumber DESC LIMIT ?, ?";
    private static String prepCheckBalance = "SELECT balance FROM Account WHERE accountNumber = ?";
    private static String prepViewTransaction = "SELECT * FROM Transaction AS T INNER JOIN Account AS A ON T.accountNumber = A.accountNumber WHERE A.branchId = ? or ? is NULL  ORDER BY T.timeStamp DESC ";
    private static String prepCountTransaction = "SELECT COUNT(*) as records FROM Transaction ";
    
    private static String prepGetCustomer = "SELECT u.userId AS userId, u.firstName, u.lastName, u.email AS email, CONCAT('+', pn.countryCode, ' ', pn.phoneNumber) AS phoneNumber, b.branchName AS branchName, b.branchCode AS branchCode, acc.accountNumber AS accountNumber, u.userType AS userType, u.status AS status, a.houseNumber AS houseNumber, CONCAT(a.street, ', \n', a.city, ', ', a.district, ', \n', a.state, ' - ', a.pinCode) AS address FROM Customer c JOIN User u ON c.customerId = u.userId JOIN Account acc ON c.customerId = acc.customerId JOIN Branch b ON acc.branchId = b.branchId JOIN Address a ON u.addressId = a.addressId JOIN PhoneNumber pn ON u.phoneNumberId = pn.phoneNumberId WHERE acc.accountNumber = ?";
    private static String prepGetEmployee = "SELECT * FROM User LEFT JOIN Employee ON User.userId = Employee.employeeId LEFT JOIN PhoneNumber ON User.phoneNumberId = PhoneNumber.phoneNumberId LEFT JOIN Address ON User.addressId = Address.addressId LEFT JOIN Branch ON (Employee.branchId = Branch.branchId AND User.userType = 1) WHERE User.userId = ? ";
    
    private static String prepGetCredential = "SELECT password, userType FROM User WHERE userId = ?";
	private static String prepGetAccountNumbers = "SELECT Account.accountNumber AS accountNumber, Branch.branchName AS branchName, Branch.branchCode AS branchCode FROM Account INNER JOIN Branch ON Account.branchId = Branch.branchId INNER JOIN Customer ON Account.customerId = Customer.customerId WHERE Customer.customerId = ?  ORDER BY Account.accountNumber  DESC ";
	private static String prepGetPrimaryAccount = "SELECT * FROM PrimaryAccount WHERE customerId = ?";
	private static String prepGetMPin = "SELECT mPin FROM Account WHERE accountNumber = ?";

//	private static String prepGetCustomer = "SELECT c.customerId AS customerId, CONCAT(u.firstName, ' ', u.lastName) AS name, u.email AS email, CONCAT('+', pn.countryCode, ' ', pn.phoneNumber) AS phoneNumber, pa.accountNumber AS primaryAccountNumber, 2 AS userType, u.status AS status, a.houseNumber AS houseNumber, CONCAT(a.street, ', ', a.city, ', ', a.district, ', ', a.state, ' - ', a.pinCode) AS address, c.aadharNumber AS aadharNumber, c.panNumber AS panNumber, c.fatherName AS fatherName, c.motherName AS motherName FROM User u JOIN PrimaryAccount pa ON u.userId = pa.customerId JOIN Address a ON u.addressId = a.addressId JOIN PhoneNumber pn ON u.phoneNumberId = pn.phoneNumberId JOIN Customer c ON u.userId = c.customerId WHERE u.userType = 2 AND (c.customerId = ? OR ? IS NULL) AND (u.status = ? OR ? IS NULL) LIMIT ?, ?";
	private static String prepGetCustomers = "SELECT c.id, c.customerId, c.aadharNumber, c.panNumber, c.fatherName, c.motherName, u.userId, u.firstName, u.lastName, u.email, u.phoneNumberId, u.addressId, u.password, u.userType, u.status, pn.phoneNumberId AS phoneNumberId, pn.countryCode, pn.phoneNumber, a.addressId AS userAddressId, a.houseNumber, a.street, a.city, a.district, a.state, a.pinCode FROM Customer c INNER JOIN User u ON c.customerId = u.userId INNER JOIN PhoneNumber pn ON u.phoneNumberId = pn.phoneNumberId INNER JOIN Address a ON u.addressId = a.addressId WHERE u.userType = 2 AND (c.customerId = ? OR ? IS NULL) AND (u.status = ? OR ? IS NULL)  ORDER BY customerId DESC LIMIT ?, ?";
    private static String prepGetEmployees = "SELECT e.id AS employee_id, e.employeeId, u.userId AS user_id, u.firstName AS user_first_name, u.lastName AS user_last_name, u.email AS user_email, u.userType AS user_type, u.status AS user_status, b.branchId, b.branchName, a.addressId AS address_id, a.houseNumber, a.street, a.city, a.district, a.state, a.pinCode, pn.phoneNumberId AS phone_number_id, pn.countryCode, pn.phoneNumber FROM Employee e JOIN User u ON e.employeeId = u.userId JOIN Branch b ON e.branchId = b.branchId JOIN Address a ON u.addressId = a.addressId JOIN PhoneNumber pn ON u.phoneNumberId = pn.phoneNumberId WHERE (u.status = ? OR ? IS NULL) AND (b.branchName = ? OR ? IS NULL) ";
    private static String prepGetEmployeeProfile = "SELECT Employee.id AS employee_id, Employee.employeeId AS employee_employeeId, User.*, Branch.*, Address.*, PhoneNumber.* FROM Employee JOIN User ON Employee.employeeId = User.userId JOIN Branch ON Employee.branchId = Branch.branchId JOIN Address ON User.addressId = Address.addressId JOIN PhoneNumber ON User.phoneNumberId = PhoneNumber.phoneNumberId WHERE (Branch.branchName = ? OR ? IS NULL) AND (Employee.employeeId = ? OR ? IS NULL) AND (User.status = ? OR ? IS NULL) ORDER BY Employee.employeeId DESC LIMIT ?, ?";
    private static String countEmployeeProfile = "SELECT COUNT(*) AS records FROM Employee JOIN User ON Employee.employeeId = User.userId JOIN Branch ON Employee.branchId = Branch.branchId JOIN Address ON User.addressId = Address.addressId JOIN PhoneNumber ON User.phoneNumberId = PhoneNumber.phoneNumberId WHERE (Branch.branchName = ? OR ? IS NULL) AND (Employee.employeeId = ? OR ? IS NULL) AND (User.status = ? OR ? IS NULL)";
    private static String prepGetBranch = "SELECT Branch.*, PhoneNumber.*, Address.* FROM Branch JOIN PhoneNumber ON Branch.phoneNumberId = PhoneNumber.phoneNumberId JOIN Address ON Branch.addressId = Address.addressId WHERE (Branch.branchId = ? OR ? IS NULL) AND (Branch.branchName = ? OR ? IS NULL)  ORDER BY Branch.branchId DESC LIMIT ?, ?";
    private static String prepCountBranch = "SELECT COUNT(*) AS records FROM Branch JOIN PhoneNumber ON Branch.phoneNumberId = PhoneNumber.phoneNumberId JOIN Address ON Branch.addressId = Address.addressId WHERE (Branch.branchId = ? OR ? IS NULL) AND (Branch.branchName = ? OR ? IS NULL)";

	private static String prepCountGetUsers = "SELECT COUNT(*) AS records FROM User u JOIN PrimaryAccount pa ON u.userId = pa.customerId JOIN Address a ON u.addressId = a.addressId JOIN PhoneNumber pn ON u.phoneNumberId = pn.phoneNumberId JOIN Customer c ON u.userId = c.customerId WHERE u.userType = 2 AND (c.customerId = ? OR ? IS NULL) AND (u.status = ? OR ? IS NULL)";

	private Object depositLock = new Object();
    private Object addBranchLock = new Object();
	private Object addAccountLock = new Object();
	private Object addEmployeeLock = new Object();
	private Object changePasswordLock = new Object();
	private Object transferLock = new Object();
	private Object getBalanceLock = new Object();

    private DataBaseUtils dataBaseUtils = new DataBaseUtils();
	private Integer mPin;
	
	public Features() throws SQLException
	{
		getReady(createAddress);
		getReady(createPhoneNumber);
        getReady(createUser);
        getReady(createCustomer);
        getReady(createNominee);
        getReady(createBranch);
        getReady(createEmployee);
        getReady(createAccount);
        getReady(createTransaction);
		getReady(createPrimary);
		
		getReady(updateAccountNumber);
		getReady(updateUserId);
		getReady(updateEmployeeId);
		getReady(updateTransactionId);
		getReady(updatePrimaryId);
		getReady(updatePhoneNumberId);
		getReady(updateAddressId);
		getReady(updateBranchId);
		getReady(updateCustomerId);
		getReady(updateNomineeId);
    	logger.setLevel(Level.INFO);
//    	logger.setUseParentHandlers(false);

		System.out.println(++count);
		
    	try 
    	{
    		FileHandler file = new FileHandler("thread_dumps.log");
        	file.setFormatter(new LogFormatter());
    		logger.addHandler(file);
    	} 
    	catch (SecurityException | IOException e) 
    	{
    		logger.log(Level.WARNING, e.getMessage());
    	}
	}
    
    private void getReady(String query) throws SQLException 
    {
    	dataBaseUtils.update(query);
    }
	
	public Integer getCurrentUser() 
	{
		return this.userId;
	}
	 
	public Integer getCurrentAccount() 
	{
		return this.accountNumber;
    }
	
	private String getHash(String inputString) throws InvalidDataException
	{
		try 
		{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = digest.digest(inputString.getBytes());
            StringBuilder hexString = new StringBuilder();
            
            for (byte hashedByte : hashedBytes) 
            {
                String hex = Integer.toHexString(0xff & hashedByte);
                if (hex.length() == 1) 
                {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } 
		catch (Exception e) 
		{
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public boolean verify(int mPin)
	{
		System.out.println(this.mPin + mPin);
		return this.mPin == mPin;
	}
	
	public boolean authenticate(int userId, String userPassword) throws InvalidDataException
	{
		Utility.assertNonNull(userPassword);
		Object[] values = {userId};
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(prepGetCredential, values);
		
		if (rsltList.size() == 1)
		{
			JSONObject rslt = rsltList.get(0);
			String actualPassword = (String) rslt.opt("Password");
			
			if (getHash(userPassword).equals(actualPassword))
			{
				this.role = Role.values()[(int) rslt.opt("User Type")];
				this.userId = userId;
				if (this.role == Role.CUSTOMER)
				{
					PrimaryAccount primaryAccount = getPrimaryAccount(userId);
					this.accountNumber = primaryAccount.getAccountNumber();
					this.mPin = primaryAccount.getMPin();
				}
	    		logger.log(Level.INFO, "Authentication Success for " + userId);
				return true;
			}
		}

		logger.log(Level.INFO, "Authentication failed for " + userId);
		return false;
	}
	
	public Role authorize()
	{
		return this.role;
	}
	
	private Integer getMPin(int accountNumber) throws InvalidDataException
	{
		Object[] values = {accountNumber};
		JSONObject rslt = dataBaseUtils.executeQuery(prepGetMPin, values).get(0);
		Integer mPin = (Integer) rslt.opt("Mobile Pin");
		return mPin;
	}
	
	private PrimaryAccount getPrimaryAccount(int userId) throws InvalidDataException
	{
		Object[] values = {userId};
		JSONObject rslt = dataBaseUtils.executeQuery(prepGetPrimaryAccount, values).get(0);
		int accountNumber = (int) rslt.opt("Account Number");
		PrimaryAccount primaryAccount = new PrimaryAccount();
		primaryAccount.setCustomerId((int) rslt.opt("Customer ID"));
		primaryAccount.setMPin((int) rslt.opt("Mobile Pin"));
		primaryAccount.setAccountNumber(accountNumber);
		return primaryAccount;
	}
	
	public PrimaryAccount getPrimaryAccount() throws InvalidDataException
	{
		return getPrimaryAccount(userId);
	}
	
	public void setPrimaryAccount(int accountNumber) throws InvalidDataException
	{
		int mPin = getMPin(accountNumber);
		PrimaryAccount primaryAccount = new PrimaryAccount();
		primaryAccount.setAccountNumber(accountNumber);
		primaryAccount.setMPin(mPin);
		primaryAccount.addDirtyField("accountNumber");
		primaryAccount.addDirtyField("mPin");
		Condition condition = new Condition("customerId", "=", getCurrentUser());
		update(primaryAccount, condition);
		this.accountNumber = accountNumber;
		this.mPin = mPin;
		System.out.println("One on One");
	}
	
	public List<JSONObject> getMyAccounts() throws InvalidDataException
	{
		int userId = getCurrentUser();
		Object[] values = {userId};
		List<JSONObject> rslt = dataBaseUtils.executeQuery(prepGetAccountNumbers, values);
		logger.log(Level.INFO, "Retrieved account numbers for user " + userId);
		return rslt;
	}
	
	public double getDouble(Object balance)
	{
		BigDecimal balanceAmount = (BigDecimal) balance;
		return balanceAmount.doubleValue();
	}
	
	private void update(Object object, Condition condition) throws InvalidDataException
	{
		Utility.assertNonNull(object);
		Utility.assertNonNull(condition);
		try
		{
			dataBaseUtils.updateTable(object, condition);
		}
		
		catch (Exception e)
		{
			throw new InvalidDataException("Input Data Seems to Be Invalid !!", e);
		}
	}
	
	public void addBranch(Branch branch, PhoneNumber phoneNumber, Address address) throws InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException
	{
		Utility.assertNonNull(branch);
		Utility.assertNonNull(phoneNumber);
		Utility.assertNonNull(address);
		
		try
		{
			synchronized (addBranchLock)
			{
				dataBaseUtils.addBranch(branch, phoneNumber, address);
			}
			logger.log(Level.INFO, "Branch added successfully: " + branch);
		}
		catch (InvalidDataException e) 
		{
			logger.log(Level.INFO, "Failed to add Branch " + branch);
			throw e;
		}
	}
	
	public boolean addAccount(Account account, Nominee nominee) throws InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException
	{
		Utility.assertNonNull(account);
		account.setStatus(Status.ACTIVE);
		account.setAccountType("SALARY");
		try
		{
			synchronized (addAccountLock)
			{
				dataBaseUtils.addAccount(account, nominee);
			}
			logger.log(Level.INFO, "Account added Successfully");
			return true;
		}
		catch (InvalidDataException e)
		{
			logger.log(Level.INFO, "Failed to Add Account");
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public boolean addCustomer(Customer customer, User user, PhoneNumber phoneNumber, Address address, Nominee nominee) throws InvalidDataException, SQLException
	{
		Utility.assertNonNull(customer);
		Utility.assertNonNull(user);
		Utility.assertNonNull(phoneNumber);
		Utility.assertNonNull(address);

		String password = user.getPassword();
		Validation.isValidPassword(password);

		Long number = phoneNumber.getPhoneNumber();
        Validation.isValidMobileNumber(number);

		String email = user.getEmail();
		Validation.isValidEmail(email);
		
		user.setStatus(Status.ACTIVE);
		user.setUserType(Role.CUSTOMER);
		user.setPassword(getHash(user.getPassword()));
		boolean rslt = false;

		try
		{
			synchronized (addAccountLock)
			{
				rslt = dataBaseUtils.addAccount(customer, user, phoneNumber, address, nominee);
			}
			logger.log(Level.INFO, "Customer added Successfully");
			return rslt;
		}
		
		catch (Exception e)
		{
			logger.log(Level.WARNING, "Failed to Add Account: " + e.getMessage());
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public void addEmployee(Employee employee, User user, PhoneNumber phoneNumber, Address address) throws InvalidDataException, SQLException
	{
		Utility.assertNonNull(employee);
		Utility.assertNonNull(user);
		Utility.assertNonNull(phoneNumber);
		Utility.assertNonNull(address);

		String password = user.getPassword();
		Validation.isValidPassword(password);
		String email = user.getEmail();
		Validation.isValidEmail(email);

		user.setUserType(Role.EMPLOYEE);
		user.setStatus(Status.ACTIVE);
		user.setPassword(getHash(password));
		boolean rslt = false;
		
		synchronized (addBranchLock)
		{
			rslt = dataBaseUtils.addEmployee(employee, user, phoneNumber, address);
		}

		if (rslt)
		{
			logger.log(Level.INFO, "Employee added successfully: " + employee);
		}
		else
		{
			logger.log(Level.WARNING, "Failed to add employee: " + employee);
		}
	}

	public void addAdmin(User user, PhoneNumber phoneNumber, Address address) throws InvalidDataException, SQLException
	{
		Utility.assertNonNull(user);
		Utility.assertNonNull(phoneNumber);
		Utility.assertNonNull(address);

		String password = user.getPassword();
		Validation.isValidPassword(password);
//		String number = Long.toString(phoneNumber.getPhoneNumber());
//        Validation.isValidMobileNumber(number);
		String email = user.getEmail();
		Validation.isValidEmail(email);

		user.setUserType(Role.ADMIN);
		user.setStatus(Status.ACTIVE);
		user.setPassword(getHash(user.getPassword()));
		boolean rslt = false;
		
		
		rslt = dataBaseUtils.addNewAmin(user, phoneNumber, address);


		if (rslt)
		{
			logger.log(Level.INFO, "Admin added successfully: " + user);
		}
		else
		{
			logger.log(Level.WARNING, "Failed to add Admin: " + user);
		}
	}
	
	public void changePassword(String currentPassword, String newPassword) throws InvalidDataException
	{
		Utility.assertNonNull(currentPassword);
		Utility.assertNonNull(newPassword);
		
		Object[] values = {userId};
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(prepGetCredential, values);
		
		if (rsltList.size() == 1)
		{
			JSONObject rslt = rsltList.get(0);
			String actualPassword = (String) rslt.opt("Password");
			
			if (!getHash(currentPassword).equals(actualPassword))
			{
				throw new InvalidDataException("Current Password Doesn't Match");
			}
		}
		
		try
		{
			Validation.isValidPassword(newPassword);
			int userId = getCurrentUser();
			User user = new User();    
			user.setPassword(getHash(newPassword));
			user.addDirtyField("password");
			Condition condition = new Condition("userId", "=", userId);

			synchronized (changePasswordLock)
			{
				update(user, condition);
			}
			
			logger.log(Level.INFO, "Password changed successfully for user with ID " + userId);
		}
		
		catch (Exception e)
		{
			System.out.println(e.getMessage());
			logger.log(Level.WARNING, "Error occurred while changing password", e);
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public JSONObject getProfile(Role role) throws InvalidDataException
	{
		try
		{
			List<JSONObject> rslt = null;
			if (role == Role.CUSTOMER)
			{
				Object[] values = {accountNumber};
				rslt = dataBaseUtils.executeQuery(prepGetCustomer, values);
			}
			else if (role == Role.EMPLOYEE || role == Role.ADMIN)
			{
				Object[] values = {userId};
				rslt = dataBaseUtils.executeQuery(prepGetEmployee, values); // can use for both
			}
			logger.log(Level.INFO, "View Profile Successfull");
			return rslt.get(0);
		}
		
		catch (Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			logger.log(Level.WARNING, "Error occurred while viewing profile", e);
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public SimpleEntry<Long, List<JSONObject>> viewCustomers(Status status, Integer customerId, int page, int size) throws InvalidDataException
	{
		Object[] values = {customerId, customerId, status, status, (page - 1) * size, size};
		List<JSONObject> rslt = dataBaseUtils.executeQuery(prepGetCustomers, values);
		Object[] values1 = {status, customerId, status, customerId};
		JSONObject row = dataBaseUtils.executeQuery(prepCountGetUsers, values1).get(0);
		long items = (Long) row.opt("records");
		convertStatus(rslt);
		return new SimpleEntry<Long, List<JSONObject>>(items, rslt);
	}
	
	private void convertStatus(List<JSONObject> jsons)
	{
		for (int x = 0; x < jsons.size(); x++)
		{
			JSONObject json = jsons.get(x);
			Status status = Status.values()[(int) json.get("Status")];
			json.put("Status", status);
		}
	}
	
	public SimpleEntry<Long, List<JSONObject>> getAllAccounts(Status status, String branchId, Integer customerId, int page, int size) throws InvalidDataException
	{
		SimpleEntry<Long, List<JSONObject>> rslt = dataBaseUtils.getAllAccounts(status, branchId, customerId, page, size);
		convertStatus(rslt.getValue());
		logger.log(Level.INFO, "getAccounts() method called");
		return rslt;
	}
	
	public SimpleEntry<Long, List<JSONObject>> getAllEmployeeProfile(Status status, String branchId, Integer employeeId, int page, int size) throws InvalidDataException
	{
		Object[] values = {branchId, branchId, employeeId, employeeId, status, status, (page - 1) * size, size};
	    List<JSONObject> rsltSet = dataBaseUtils.executeQuery(prepGetEmployeeProfile, values);
	    Object[] values1 = {branchId, branchId, employeeId, employeeId, status, status};
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(countEmployeeProfile, values1);
		System.out.println(countEmployeeProfile + "countGetAccounts " + values);
		JSONObject row = rsltList.get(0);
		long records = (long) row.get("records");
	    SimpleEntry<Long, List<JSONObject>> rslt = new SimpleEntry<>(records, rsltSet);
	    return rslt;
	}
	
	public SimpleEntry<Long, List<JSONObject>> getAllBranch(String branchId, String branchCode, int page, int size) throws InvalidDataException
	{
		Object[] values = {branchId, branchId, branchCode, branchCode, (page - 1) * size, size};
	    List<JSONObject> rsltSet = dataBaseUtils.executeQuery(prepGetBranch, values);
	    Object[] values1 = {branchId, branchId, branchCode, branchCode};
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(prepCountBranch, values1);
		System.out.println(countEmployeeProfile + "countGetAccounts " + values);
		JSONObject row = rsltList.get(0);
		long records = (long) row.get("records");
	    SimpleEntry<Long, List<JSONObject>> rslt = new SimpleEntry<>(records, rsltSet);
	    return rslt;
	}
	
	private boolean isOurAccount(int accountNumber, String branchCode) throws InvalidDataException
	{
		StringBuilder query = new StringBuilder(ourAccount);
		Object[] values = {accountNumber, branchCode};
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query.toString(), values);
		return (rsltList.size() != 0);
		
	}
	
	public double getBalance() throws InvalidDataException       // Need the user id of currently logged in Customer/Employee/Admin
, SQLException
	{
		int accountNumber = getCurrentAccount();
		logger.log(Level.INFO, "Balance retrieved successfully for account number: " + getCurrentAccount());
		return getBalance(accountNumber);
	}
	
	private double getBalance(int accountNumber) throws InvalidDataException       // Need the user id of currently logged in Customer/Employee/Admin
, SQLException
	{
		JSONObject row = null;
		Object[] params = {accountNumber};
		synchronized (getBalanceLock)
		{
			row = dataBaseUtils.executeQuery(prepCheckBalance, params).get(0);
		}
		double rslt = getDouble(row.opt("Balance"));
		logger.log(Level.INFO, "getBalance() method is called using accountNumber" + accountNumber);
		return rslt;
	}
	
	public void depositAmount(double amount, PaymentMethod paymentMethod) throws InvalidDataException      // Need the user id of currently logged in Customer/Employee/Admin
	{
		try
		{
			Utility.assertNonNull(paymentMethod);
			Utility.assertPositive(amount);
			
			int accountNumber = getCurrentAccount();
			int customerId = getCurrentUser();
			Account account = new Account();
			account.addDirtyField("balance");
			Condition condition = new Condition("accountNumber", "=", accountNumber);
			
			Transaction transaction = new Transaction();
			
			int id = (int) Math.ceil(Math.random() * 100000000);
			transaction.setTransactionId(id);
			transaction.setCustomerId(customerId);
			transaction.setAccountNumber(accountNumber);
			transaction.setTransferNumber(null);
			transaction.setTransactionType("Credit");
			transaction.setPaymentMethod(paymentMethod);
			transaction.setAmount(amount);
			transaction.setTimeStamp(System.currentTimeMillis());
			transaction.setStatus(TransactionStatus.SUCCESS);
			
			synchronized (depositLock)
			{
				double balance = getBalance();
				balance += amount;
				account.setBalance(balance);
				transaction.setClosingBalance(balance);
				dataBaseUtils.updateTable(account, condition);				
				dataBaseUtils.insert(transaction);
			}
			
			logger.log(Level.INFO, "Amount deposited successfully to account number: " + accountNumber);
		}	

		catch (InvalidDataException e)
		{
			logger.log(Level.WARNING, "InvalidDataException occurred while depositing amount: " + e.getMessage(), e);
			throw new InvalidDataException(e.getMessage(), e);
		}
		
		catch (Exception e)
		{
			logger.log(Level.WARNING, "Error occurred while depositing amount: " + e.getMessage(), e);
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
	
	public void withdrawAmount(double amount, PaymentMethod paymentMethod) throws InvalidDataException
	{
		try
		{
			Utility.assertNonNull(paymentMethod);
			Utility.assertPositive(amount);
			
			int accountNumber = getCurrentAccount();
			Account account = new Account();
			int customerId = getCurrentUser();
			
			Transaction transaction = new Transaction();

			int id = (int) Math.ceil(Math.random() * 100000000);
			transaction.setTransactionId(id);
			transaction.setCustomerId(customerId);
			transaction.setAccountNumber(accountNumber);
			transaction.setTransferNumber(null);
			transaction.setTransactionType("Debit");
			transaction.setPaymentMethod(paymentMethod);
			transaction.setAmount(amount);
			transaction.setTimeStamp(System.currentTimeMillis());
			transaction.setStatus(TransactionStatus.SUCCESS);
			
			synchronized (getBalanceLock)
			{
				double balance = getBalance();
				balance -= amount;
				
				if (balance < 0)
				{
					throw new InvalidDataException("Oops !!  Insufficient Balance."); 
				}

				account.addDirtyField("balance");
				Condition condition = new Condition("accountNumber", "=", accountNumber);
				account.setBalance(balance);
				transaction.setClosingBalance(balance);
				
				dataBaseUtils.updateTable(account, condition);
				dataBaseUtils.insert(transaction);
			}
			
			logger.log(Level.INFO, "Withdraw amount successfull" + amount);
		}
		
		catch (InvalidDataException e)
		{
			logger.log(Level.WARNING, "InvalidDataException occurred while withdrawing amount: " + e.getMessage(), e);
			throw new InvalidDataException(e.getMessage(), e);
		}
		
		catch (Exception e)
		{
			logger.log(Level.WARNING, "Error occurred while withdrawing amount: " + e.getMessage(), e);
			throw new InvalidDataException("Input Data Seems to Be Invalid !!", e);
		}
	}
	
	public void transfer(int toAccountNumber, String branchCode, double amount, PaymentMethod paymentMethod) throws InvalidDataException 
    {
	    try 
	    {
			Utility.assertNonNull(paymentMethod);
			Utility.assertPositive(amount);
			
			int fromAccountNumber = getCurrentAccount();
			int customerId = getCurrentUser();
			
	        Account senderAccount = new Account();
	        Transaction senderTransaction = new Transaction();
	        Account recipientAccount = null;
	        Transaction recipientTransaction = null;
	        
	        senderAccount.setAccountNumber(fromAccountNumber);
	        senderAccount.addDirtyField("balance");
	        
	        int transactionId = (int) Math.ceil(Math.random() * 100000000);
	        
	        senderTransaction.setTransactionId(transactionId);
	        senderTransaction.setCustomerId(customerId);
	        senderTransaction.setAccountNumber(fromAccountNumber);
	        senderTransaction.setTransferNumber(toAccountNumber);
	        senderTransaction.setTransactionType("Debit");
			senderTransaction.setPaymentMethod(paymentMethod);
	        senderTransaction.setAmount(amount);
	        senderTransaction.setStatus(TransactionStatus.SUCCESS);
	        senderTransaction.setBranchCode(branchCode);
	        
	        
	        boolean ourAccount = isOurAccount(toAccountNumber, branchCode);
	        
	        if (ourAccount) 
	        {
		        recipientTransaction = new Transaction();
		        recipientAccount = new Account();
		        recipientAccount.setAccountNumber(toAccountNumber);
		        recipientAccount.addDirtyField("balance");
		        recipientTransaction.setTransactionId(transactionId);
		        recipientTransaction.setCustomerId(customerId);
		        recipientTransaction.setAccountNumber(toAccountNumber);
		        recipientTransaction.setTransferNumber(fromAccountNumber);
		        recipientTransaction.setTransactionType("Credit");
				recipientTransaction.setPaymentMethod(paymentMethod);
		        recipientTransaction.setAmount(amount);
		        recipientTransaction.setStatus(TransactionStatus.SUCCESS);
	        }
	        
	        synchronized (transferLock)
	        {
		        double senderBalance = getBalance();
		        senderBalance -= amount;
		        
		        if (senderBalance < 0) 
		        {
		            throw new InvalidDataException("Insufficient balance in Your account.");
		        }
		        
		        senderAccount.setBalance(senderBalance);
		        senderTransaction.setClosingBalance(senderBalance);
		        long timeStamp = System.currentTimeMillis();
		        
		        if (ourAccount)
		        {
			        double recipientBalance = getBalance(toAccountNumber);
			        recipientBalance += amount;
			        recipientAccount.setBalance(recipientBalance);
			        recipientTransaction.setClosingBalance(recipientBalance);
			        recipientTransaction.setTimeStamp(timeStamp);
		        }

				senderTransaction.setTimeStamp(timeStamp);
		        dataBaseUtils.addTransaction(senderAccount, recipientAccount, senderTransaction, recipientTransaction);
	        }
	        
			logger.log(Level.INFO, "Amount transferred successfully to " + toAccountNumber);
	    } 
	    catch (InvalidDataException e) 
	    {
			logger.log(Level.WARNING, "InvalidDataException occurred during transfer: " + e.getMessage(), e);
	        throw new InvalidDataException(e.getMessage(), e);
	    } 
	    catch (Exception e)
	    {
			logger.log(Level.WARNING, "Error occurred during transfer: " + e.getMessage(), e);
	        throw new InvalidDataException("Error occurred during transfer.", e);
	    }
	}
	
	public List<Transaction> getTransactions(String query, Object[] values) throws SQLException, InvalidDataException
	{
		System.out.println(query);
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query.toString(), values);
        List<Transaction> transactions = new ArrayList<>();
        
        for (JSONObject row : rsltList) 
        {
            Transaction transaction = new Transaction();
            transaction.setId((Integer) row.opt("Id"));
            transaction.setTransactionId((Integer) row.opt("Transaction ID"));
            transaction.setCustomerId((Integer) row.opt("Customer Id"));
            transaction.setAccountNumber((Integer) row.opt("Account Number"));
            transaction.setTransferNumber((Integer) row.opt("Transfer Number"));
            transaction.setTransactionType((String) row.opt("Transaction Type"));
            transaction.setPaymentMethod(PaymentMethod.values()[(Integer) row.opt("Payment Method")]);
            BigDecimal amount = (BigDecimal) row.opt("Amount");
            transaction.setAmount((Double) amount.doubleValue()); 
            transaction.setTimeStamp((Long) row.opt("Time Stamp"));
            amount = (BigDecimal) row.opt("Closing Balance");
            transaction.setClosingBalance((Double) amount.doubleValue()); 
            transaction.setStatus(TransactionStatus.values()[(Integer) row.opt("Status")]);
            transactions.add(transaction);
        }
        
        logger.log(Level.INFO, "Transaction history retrieved successfully for account number: " + accountNumber);
        return transactions;
	}
	
	public SimpleEntry<Long, List<Transaction>> getAllTransactions(int page, int size, Integer branchId) throws InvalidDataException 
	{
		try
		{
			StringBuilder query = new StringBuilder(prepViewTransaction);
			query.append(" LIMIT ?, ?");
			int start = (page - 1) * size;
			Object[] values = {branchId, branchId, start, size};
			List<Transaction> transactions = getTransactions(query.toString(), values);
			JSONObject row = dataBaseUtils.executeQuery(countTransaction, new Object[0]).get(0);
			long records = (long) row.opt("records");
			SimpleEntry<Long, List<Transaction>> rslt = new SimpleEntry<Long, List<Transaction>>(records, transactions);
			return rslt;
		} 
			    
	    catch (Exception e) 
	    {
			logger.log(Level.WARNING, "Error occurred while retrieving transaction history.", e);
	        throw new InvalidDataException(e.getMessage(), e);
	    }
	}

	public List<Transaction> transactionHistory(int page, int size) throws InvalidDataException 
	{
	    try 
	    {
	    	int accountNumber = getCurrentAccount();
	        StringBuilder query = new StringBuilder(viewTransaction);
	        query.append(" WHERE accountNumber = ?  ORDER BY timeStamp DESC LIMIT ?, ?");
	        Object[] values = {accountNumber, (page - 1) * size, size};
	        return getTransactions(query.toString(), values);
	    } 
	    
	    catch (Exception e) 
	    {
			logger.log(Level.WARNING, "Error occurred while retrieving transaction history.", e);
	        throw new InvalidDataException(e.getMessage(), e);
	    }
	}
	
	public long transactionHistoryCount() throws InvalidDataException
	{
		StringBuilder query = new StringBuilder(countTransaction);
        query.append(" WHERE accountNumber = ? ");
        Object[] values = {accountNumber};
        List<JSONObject> rsltSet = dataBaseUtils.executeQuery(query.toString(), values);
		JSONObject row = rsltSet.get(0);
		long records = (long) row.opt("records");
		return records;
	}
	
	public List<String> getBranchCodes() throws SQLException, InvalidDataException
	{
		String query = "SELECT DISTINCT branchCode FROM Branch";
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query, new Object[0]);
		List<String> rslt = new ArrayList<>();
		for (JSONObject x: rsltList)
		{
			rslt.add((String) x.opt("Branch Code"));
		}
		return rslt;
	}
	
	public List<Integer> getCustomerIds() throws SQLException, InvalidDataException
	{
		String query = "SELECT customerId FROM Customer";
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query, new Object[0]);
		List<Integer> rslt = new ArrayList<>();
		for (JSONObject x: rsltList)
		{
			rslt.add((Integer) x.opt("Customer ID"));
		}
		return rslt;
	}
	
	public List<Integer> getEmployeeIds() throws SQLException, InvalidDataException
	{
		String query = "SELECT employeeId FROM Employee";
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query, new Object[0]);
		List<Integer> rslt = new ArrayList<>();
		for (JSONObject x: rsltList)
		{
			rslt.add((Integer) x.opt("Employee ID"));
		}
		return rslt;
	}

	public List<Integer> getBranchIds() throws SQLException, InvalidDataException
	{
		String query = "SELECT branchId FROM Branch";
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query, new Object[0]);
		List<Integer> rslt = new ArrayList<>();
		for (JSONObject x: rsltList)
		{
			rslt.add((Integer) x.opt("Branch ID"));
		}
		return rslt;
	}
	
	public List<String> getBranchNames() throws SQLException, InvalidDataException
	{
		String query = "SELECT branchName FROM Branch";
		List<JSONObject> rsltList = dataBaseUtils.executeQuery(query, new Object[0]);
		List<String> rslt = new ArrayList<>();
		for (JSONObject x: rsltList)
		{
			rslt.add((String) x.opt("Branch Name"));
		}
		return rslt;
	}
	
	public List<JSONObject> getStatement(long from, long to) throws SQLException, InvalidDataException
	{
		StringBuilder query = new StringBuilder(getStatement);
		query.append(" WHERE t.timeStamp BETWEEN ? AND ? AND t.accountNumber = ? ");
		Object[] values = {from, to, getCurrentAccount()};
		List<JSONObject> result = dataBaseUtils.executeQuery(query.toString(), values);
		return result;
	}
	
	public boolean update(Object object, String key, int value) throws InvalidDataException
	{
		try
		{
			dataBaseUtils.updateTable(object, new Condition(key, " = ", value));
			return true;
		}
		catch (Exception e)
		{
			throw new InvalidDataException(e.getMessage(), e);
		}
	} 
	
	public boolean delete(String tableName, String key, int value) throws InvalidDataException
	{
		try
		{
			dataBaseUtils.deleteRow(tableName, new Condition(key, " = ", value));
			return true;
		}
		catch (Exception e)
		{
			throw new InvalidDataException(e.getMessage(), e);
		}
	}
}

