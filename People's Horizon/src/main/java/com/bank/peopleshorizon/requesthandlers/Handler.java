package com.bank.peopleshorizon.requesthandlers;

import java.io.BufferedReader;
import java.util.Date;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.ParseException;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.AbstractMap.SimpleEntry;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

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
import com.bank.peopleshorizon.enums.PaymentMethod;
import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.features.Features;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.validation.Validation;
import com.mysql.cj.util.Util;

public class Handler 
{
	private static Features features;
	private static final int SIZE = 8;
	
    static 
    {
    	try 
    	{
			features = new Features();
		} 
    	catch (SQLException e) 
    	{
			e.printStackTrace();
		}
    }
   
	public static void addBranch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
         
        	String branchName = request.getParameter("Branch Name");
        	String branchCode = request.getParameter("Branch Code");
        	String houseNumber = request.getParameter("House Number");
        	String street = request.getParameter("Street");
        	String city = request.getParameter("City");
        	String district = request.getParameter("District");
        	String state = request.getParameter("State");
        	int pinCode = Integer.parseInt(request.getParameter("Pin Code"));
        	int countryCode = Integer.parseInt(request.getParameter("Country Code"));
        	long phoneNumberValue = Long.parseLong(request.getParameter("Phone Number"));
        	
        	
        	
        	Branch branch = new Branch();
        	branch.setBranchName(branchName);
        	branch.setBranchCode(branchCode);
        	
        	Address address = new Address();
        	address.setHouseNumber(houseNumber);
        	address.setStreet(street);
        	address.setCity(city);
        	address.setDistrict(district);
        	address.setState(state);
        	address.setPinCode(pinCode);
        	
        	PhoneNumber phoneNumber = new PhoneNumber();
        	phoneNumber.setCountryCode(countryCode);
        	phoneNumber.setPhoneNumber(phoneNumberValue);
        	
        	Utility.assertIFSC(branchCode);
        	Validation.isValidMobileNumber(phoneNumberValue);
        	
            features.addBranch(branch, phoneNumber, address);
            response.getWriter().write("Branch Added Successfully !");
			json.put("message", "Branch Added Successfully !");
			response.getWriter().print(json);
        
	}
	
	public static void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
        try
        {
        	String firstName = request.getParameter("First Name");
        	String lastName = request.getParameter("Last Name");
        	String email = request.getParameter("Email");
        	String password = request.getParameter("Password");
        	
        	long aadharNumber = Long.parseLong(request.getParameter("Aadhar Number"));
        	String panNumber = request.getParameter("Pan Number");
        	String fatherName = request.getParameter("Father Name");
        	String motherName = request.getParameter("Mother Name");
        	
        	String houseNumber = request.getParameter("House Number");
        	String street = request.getParameter("Street");
        	String city = request.getParameter("City");
        	String district = request.getParameter("District");
        	String state = request.getParameter("State");
        	int pinCode = Integer.parseInt(request.getParameter("Pin Code"));
        	
        	int countryCode = Integer.parseInt(request.getParameter("Country Code"));
        	long phoneNumberValue = Long.parseLong(request.getParameter("Phone Number"));
        	
//        	String checkboxValue = request.getParameter("nominee");
        	
        	User user = new User();
        	user.setFirstName(firstName);
        	user.setLastName(lastName);
        	user.setEmail(email);
        	user.setPassword(password);
        	
        	Customer customer = new Customer();
        	customer.setAadharNumber(aadharNumber);
        	customer.setPanNumber(panNumber);
        	customer.setFatherName(fatherName);
        	customer.setMotherName(motherName);
        	
        	Address address = new Address();
        	address.setHouseNumber(houseNumber);
        	address.setStreet(street);
        	address.setCity(city);
        	address.setDistrict(district);
        	address.setState(state);
        	address.setPinCode(pinCode);
        	
        	PhoneNumber phoneNumber = new PhoneNumber();
        	phoneNumber.setCountryCode(countryCode);
        	phoneNumber.setPhoneNumber(phoneNumberValue);
        	
        	
//        	Nominee nominee = null;
//        	
//        	if (checkboxValue != null && checkboxValue.equals("on"))
//        	{
//        		String nomineeFirstName = request.getParameter("firstName");
//        		String nomineeLastName = request.getParameter("lastName");
//        		String relationship = request.getParameter("relationship");
//        		String nomineeEmail = request.getParameter("email");
//        		
//        		nominee = new Nominee();
//        		nominee.setFirstName(nomineeFirstName);
//        		nominee.setLastName(nomineeLastName);
//        		nominee.setRelationship(relationship);
//        		nominee.setEmail(nomineeEmail);
//        	}
        	
	        features.addCustomer(customer, user, phoneNumber, address, null);
			json.put("message", "Account Added Successfully !");
			response.getWriter().print(json);
        }
        catch (Exception e)
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}	
	}
	
	public static void addAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException, IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			int customerId = Integer.parseInt(request.getParameter("Customer ID"));
			int branchId = Integer.parseInt(request.getParameter("Branch Id"));
			int mPin = Integer.parseInt(request.getParameter("Mobile Pin"));
			BigDecimal balanceAmount = new BigDecimal(request.getParameter("Balance"));
			double balance = balanceAmount.doubleValue();
			String checkboxValue = request.getParameter("nominee");
			
			Account account = new Account();
			account.setCustomerId(customerId);
			account.setBranchId(branchId);
			System.out.println(customerId + " G " + branchId + " H " + mPin + " " + balance);
			account.setBalance(balance);
			account.setMPin(mPin);
			
			Nominee nominee = null;
			
			if (checkboxValue != null && checkboxValue.equals("on"))
			{
				String nomineeFirstName = request.getParameter("nomineeFirstName");
				String nomineeLastName = request.getParameter("nomineeLastName");
				String relationship = request.getParameter("relationship");
				String nomineeEmail = request.getParameter("nomineeEmail");
				
				nominee = new Nominee();
				nominee.setFirstName(nomineeFirstName);
				nominee.setLastName(nomineeLastName);
				nominee.setRelationship(relationship);
				nominee.setEmail(nomineeEmail);
			}
			features.addAccount(account, nominee);
			json.put("message", "Account Added Successfully !");
			response.getWriter().print(json);
		}
		catch (InvalidDataException e)
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}	
	}
	
	public static void addEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
        try
        {
        	String firstName = request.getParameter("First Name");
        	String lastName = request.getParameter("Last Name");
        	String email = request.getParameter("Email");
        	String password = request.getParameter("Password");
        	
        	String houseNumber = request.getParameter("House Number");
        	String street = request.getParameter("Street");
        	String city = request.getParameter("City");
        	String district = request.getParameter("District");
        	String state = request.getParameter("State");
        	int pinCode = Integer.parseInt(request.getParameter("Pin Code"));
        	
        	int countryCode = Integer.parseInt(request.getParameter("Country Code"));
        	long phoneNumberValue = Long.parseLong(request.getParameter("Phone Number"));
        	
        	int branchId = Integer.parseInt(request.getParameter("Branch ID"));
        	
        	
        	User user = new User();
        	user.setFirstName(firstName);
        	user.setLastName(lastName);
        	user.setEmail(email);
        	user.setPassword(password);
        	
        	Address address = new Address();
        	address.setHouseNumber(houseNumber);
        	address.setStreet(street);
        	address.setCity(city);
        	address.setDistrict(district);
        	address.setState(state);
        	address.setPinCode(pinCode);
        	
        	PhoneNumber phoneNumber = new PhoneNumber();
        	phoneNumber.setCountryCode(countryCode);
        	phoneNumber.setPhoneNumber(phoneNumberValue);
        	
        	Employee employee = new Employee();
        	employee.setBranchId(branchId);
        	
        	features.addEmployee(employee, user, phoneNumber, address);
			json.put("message", "Employee Added Successfully !");
			response.getWriter().print(json);
        }
		catch (InvalidDataException e)
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}	
	}

	public static void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		request.setAttribute("size", 5);
		Role role = features.authorize();
		if (role == Role.CUSTOMER)
		{
			viewProfile(request, response);
			getBalance(request, response);
			viewTransactions(request, response);
			getAccounts(request, response);
		}
		if (role == Role.EMPLOYEE || role == Role.ADMIN)
		{
			JSONObject profile = viewProfile(request, response);
			if (role == Role.EMPLOYEE)
			{
				request.getSession().setAttribute("Branch ID", profile.get("Branch Name"));
			}
			getAllTransactions(request, response);
		}
	}
	
	public static boolean login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, InvalidDataException
	{
		String uid = request.getParameter("userId");
		Validation.isID(uid, "User ID");
		int userId = Integer.parseInt(uid);
		String password = request.getParameter("password");
		Role role = null;
		HttpSession session = request.getSession();
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		boolean rslt = false;
		
		try
		{
			if (features.authenticate(userId, password))
			{
				role = features.authorize();
				rslt = true;
				session.setAttribute("userId", userId);
				session.setAttribute("role", role);
				getInfo(request, response);
				request.getRequestDispatcher("/PeoplesHorizon.jsp").forward(request, response);
			}
			return rslt;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", "Authentication Failed !");
			response.getWriter().print(json);
			return false;
		}
	}
	
	public static void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.invalidate();
		response.sendRedirect("/Peoples_Horizon/Login.jsp");
		json.put("message", "Account Successfully Logged Out :)");
		response.getWriter().print(json);
	}
	
	public static Double getBalance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			double balance = features.getBalance();
			request.setAttribute("balance", balance);
			return balance;
		}
		catch (Exception e)
		{
			json.put("error", e.getMessage());
			response.getWriter().print(json);
			return null;
		}	
	}
	
	public static void transferFund(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		String toAcct = request.getParameter("toAccount");
		int toAccount = Integer.parseInt(toAcct);
		Validation.isValidAccountNumber(toAccount);
		
		String ifscCode = request.getParameter("toIFSC");
		Utility.assertIFSC(ifscCode);
		
		String amt = request.getParameter("amount");
		double amount = Double.parseDouble(amt);

		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			PaymentMethod paymentMethod = PaymentMethod.UPI;
			Validation.isValidAccountNumber(toAccount);
			Integer mPin = Integer.parseInt(request.getParameter("mPin"));
			if (!features.verify(mPin))
			{
				throw new InvalidDataException("Mobile PIN doesn't Matched !");
			}
			Utility.assertIFSC(ifscCode);
			Utility.assertPositive(amount);
			Utility.assertAmountInRange(amount, 200000);
			features.transfer(toAccount, ifscCode, amount, paymentMethod);
			json.put("message", "Amount Transfered Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e) 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static JSONObject viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		Role role = (Role) session.getAttribute("role");
		try
		{
			JSONObject user = features.getProfile(role);
			request.setAttribute("profile", user);
			if (role == Role.CUSTOMER)
			{
				session.setAttribute("Account Number", user.get("Account Number"));
			}
			if (role == Role.EMPLOYEE)
			{
				session.setAttribute("branchId", user.get("Branch ID"));
			}
			return user;
		}
		catch (Exception e) 
		{
			response.setContentType("application/json");
			json.put("error", e.getMessage());
			response.getWriter().print(json);
			return null;
		}
	}
	
	public static List<Transaction> viewTransactions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			String tmp = request.getParameter("page");
			int page = (tmp == null ? 1: Integer.parseInt(tmp));
			Integer fragment = (Integer) request.getAttribute("size");
			int size = (fragment == null ? SIZE : fragment);
			List<Transaction> transactions = features.transactionHistory(page, size);
			long items = features.transactionHistoryCount();
			int maxPage = (int) Math.ceil(items / (float) size);
			System.out.println(items + " " + maxPage);
			
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}
			
			request.setAttribute("page", page);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("transactions", transactions);

			return transactions;
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
			return null;
		}
	}
	
	public static void withdrawlAmount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			double amount = Double.parseDouble(request.getParameter("amount"));
			Integer mPin = Integer.parseInt(request.getParameter("mPin"));
			if (!features.verify(mPin))
			{
				throw new InvalidDataException("Mobile PIN doesn't Matched !");
			}
			Utility.assertPositive(amount);
			Utility.assertAmountInRange(amount, 200000);
			PaymentMethod paymentMethod = PaymentMethod.UPI;
			features.withdrawAmount(amount, paymentMethod);
			json.put("message", "Amount Withdrawled Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e) 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void depositAmount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			PaymentMethod paymentMethod = PaymentMethod.UPI;
			double amount = Double.parseDouble(request.getParameter("amount"));
			Integer mPin = Integer.parseInt(request.getParameter("mPin"));
			if (!features.verify(mPin))
			{
				throw new InvalidDataException("Mobile PIN doesn't Matched !");
			}
			Utility.assertPositive(amount);
			Utility.assertAmountInRange(amount, 200000);
			features.depositAmount(amount, paymentMethod);
			json.put("message", "Amount Deposited Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e) 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String reEnterPassword = request.getParameter("confirmPassword");
			if (newPassword.equals(reEnterPassword))
			{
				features.changePassword(currentPassword, newPassword);
				json.put("message", "Password Changed Successfully !");
				response.getWriter().print(json);
			}
			else
			{
				throw new InvalidDataException("New Password and Re-Enter Password Doesn't Match !");
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{

		String stat = request.getParameter("status");
		String cid = request.getParameter("customerId");
		String all = "All";
		int page = Integer.parseInt(request.getParameter("page"));
		
		Status status = null;
		Integer customerId = null;
		
		if (stat != null && !stat.equals("Status"))
		{
			status = Status.valueOf(stat);
		}
		if (cid != null && !cid.equals("Customer ID"))
		{
			customerId = Integer.parseInt(cid);
		}
		System.out.println(cid + "Hello");
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			SimpleEntry<Long, List<JSONObject>> rslt = features.viewCustomers(status, customerId, page, SIZE);
			System.out.println(rslt);
			List<Integer> customerIds = features.getCustomerIds();
			long items = rslt.getKey();
			int maxPage = (int) Math.ceil(items / (float) SIZE);
			System.out.println(maxPage);
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}
			System.out.println(rslt.getValue());
			request.setAttribute("rslt", rslt.getValue());
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("page", page);
			request.setAttribute("customerIds", customerIds);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getAllAccounts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		String tmp = request.getParameter("page");
		int page = (tmp == null ? 1 : Integer.parseInt(tmp));
		HttpSession session = request.getSession();
		Role role = (Role) session.getAttribute("role");
		
		try
		{
			String stat = request.getParameter("status");
			String bid = request.getParameter("branchCode");
			String cid = request.getParameter("customerId");
			String all = "All";
			
			Status status = null;
			String branchCode = null;
			Integer customerId = null;
			if (stat != null && !stat.equals("Status"))
			{
				status = Status.valueOf(stat);
			}
			if (bid != null && !bid.equals("Branch Name"))
			{
				branchCode = bid;
			}
			if (cid != null && !cid.equals("Customer ID"))
			{
				customerId = Integer.parseInt(cid);
			}
			if (role == Role.EMPLOYEE)
			{
				branchCode = (String) session.getAttribute("Branch ID");
			}
			
			SimpleEntry<Long, List<JSONObject>> rslt = features.getAllAccounts(status, branchCode, customerId, page, SIZE);
			System.out.println("Debug: " + rslt);
			List<String> branchCodes = features.getBranchNames();
			List<Integer> customerIds = features.getCustomerIds();
			long items = rslt.getKey();
			int maxPage = (int) Math.ceil(items / (float) SIZE);
			
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}
			request.setAttribute("branchCodes", branchCodes);
			request.setAttribute("customerIds", customerIds);
			request.setAttribute("rslt", rslt.getValue());
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("page", page);
			System.out.println("Hello Bella");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getAllEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		String tmp = request.getParameter("page");
		int page = (tmp == null ? 1 : Integer.parseInt(tmp));
		Role role = (Role) request.getSession().getAttribute("role");
		
		try
		{
			String stat = request.getParameter("status");
			String bid = request.getParameter("branchCode");
			String eid = request.getParameter("employeeId");
			
			Status status = null;
			String branchId = null;
			Integer employeeId = null;
			if (stat != null && !stat.equals("Status"))
			{
				status = Status.valueOf(stat);
			}
			if (bid != null && !bid.equals("Branch Name"))
			{
				branchId = bid;
			}
			if (eid != null && !eid.equals("Employee ID"))
			{
				employeeId = Integer.parseInt(eid);
			}
			
			SimpleEntry<Long, List<JSONObject>> rslt = features.getAllEmployeeProfile(status, branchId, employeeId, page, SIZE);
			System.out.println("Debug: " + rslt);
			List<String> branchCodes = features.getBranchNames();
			List<Integer> employeeIds = features.getEmployeeIds();
			long items = rslt.getKey();
			int maxPage = (int) Math.ceil(items / (float) SIZE);
			
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}
			request.setAttribute("branchCodes", branchCodes);
			request.setAttribute("employeeIds", employeeIds);
			request.setAttribute("rslt", rslt.getValue());
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("page", page);
			System.out.println("Hello Bella");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getAllBranch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		String tmp = request.getParameter("page");
		int page = (tmp == null ? 1 : Integer.parseInt(tmp));
		Role role = (Role) request.getSession().getAttribute("role");
		
		try
		{
			String bid = request.getParameter("branchId");
			String bCode = request.getParameter("branchCode");
			String all = "All";
			
			String branchId = null;
			String branchCode = null;
			
			if (bid != null && !bid.equals("Branch ID"))
			{
				branchId = bid;
			}
			if (bCode != null && !bCode.equals("Branch Name"))
			{
				branchCode = bCode;
			}
			
			SimpleEntry<Long, List<JSONObject>> rslt = features.getAllBranch(branchId, branchCode, page, SIZE);
			System.out.println("Debug: " + rslt);
			List<String> branchCodes = features.getBranchNames();
			List<Integer> branchIds = features.getBranchIds();
			long items = rslt.getKey();
			int maxPage = (int) Math.ceil(items / (float) SIZE);
			
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}
			System.out.println(rslt.getValue());
			request.setAttribute("branchCodes", branchCodes);
			request.setAttribute("branchIds", branchIds);
			request.setAttribute("rslt", rslt.getValue());
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("page", page);
			System.out.println("Hello Bella");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getAllTransactions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			HttpSession session = request.getSession();
			String tmp = request.getParameter("page");
			int page = (tmp == null ? 1: Integer.parseInt(tmp));
			Integer fragment = (Integer) request.getAttribute("size");
			int size = (fragment == null ? SIZE : fragment);
			Integer branchId = (Integer) session.getAttribute("branchId");
			if ((Role) request.getSession().getAttribute("role") == Role.ADMIN) branchId = null;
			SimpleEntry<Long, List<Transaction>> rslt = features.getAllTransactions(page, size, branchId);
			long items = rslt.getKey();
			List<Transaction> transactions = rslt.getValue();
			int maxPage = (int) Math.ceil(items / size);
			
			if (page < 1) 
			{
	            page = 1;
	        }
			if (page > maxPage)
			{
				page = maxPage + 1;
			}

			request.setAttribute("page", page);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("transactions", transactions);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void switchAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			int accountNumber = Integer.parseInt(request.getParameter("account"));
			features.setPrimaryAccount(accountNumber);
			json.put("rslt", "Account Switched Successfully :)");
			response.getWriter().print(json);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void getMyAccounts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			List<JSONObject> rslt = features.getMyAccounts();
			System.out.println(rslt);
			request.setAttribute("rslt", rslt);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			json.put("error", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	
	public static void getStatement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidDataException, SQLException, ParseException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			String fromDate = request.getParameter("from");
			String toDate = request.getParameter("to");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			long from, to;
			if (fromDate != null)
			{
				System.out.println(fromDate + toDate);
		        Date dateFrom = dateFormat.parse(fromDate);
		        Date dateTo = dateFormat.parse(toDate);
		        from = dateFrom.getTime();
		        to = dateTo.getTime();
			}
			else
			{
				Calendar calendar = Calendar.getInstance();
		        to = calendar.getTimeInMillis();
		        
		        calendar.add(Calendar.DAY_OF_MONTH, -30);
		        from = calendar.getTimeInMillis();
	
			}
			long differenceInMillis = Math.abs(from - to);
	        long daysDifference = TimeUnit.MILLISECONDS.toDays(differenceInMillis);
	        Utility.assertDaysInRange(daysDifference, 30);
	        
	
			System.out.println(Utility.getTimeStamp(from) + " " + Utility.getTimeStamp(to));
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			JSONObject profile = features.getProfile((Role) request.getSession().getAttribute("role"));
			List<JSONObject> rslt = features.getStatement(from, to);
			request.setAttribute("profile", profile);
			request.setAttribute("rslt", rslt);

			json.put("message", "Statements Retrieved Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			json.put("error", "Error Occured while Fetching Statement !");
			response.getWriter().print(json);
		}
	}
	
	private static Map<String, String> getParams(HttpServletRequest request)
	{
		Map<String, String> paramMap = new HashMap<>();
        List<String> paramNameList = Collections.list(request.getParameterNames());
        
        for (String paramName : paramNameList) 
        {
            String paramValue = request.getParameter(paramName);
            paramMap.put(paramName, paramValue);
        }
        
        return paramMap;
	}
	
//	

	public static void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			Map<String, String> params = getParams(request);
			System.out.println(params);
			
			Customer customer = new Customer();
			User user = new User();
			Address address = new Address();
			PhoneNumber phoneNumber = new PhoneNumber();
	
			int customerKey = Integer.parseInt(params.get("ID"));
			int userKey = Integer.parseInt(params.get("User ID"));
			int addressKey = Integer.parseInt(params.get("Address ID"));
			int phoneNumberKey = Integer.parseInt(params.get("Phone Number ID"));
			
			customer.setId(customerKey);
			customer.setCustomerId(Integer.parseInt(params.get("Customer ID")));
			customer.setAadharNumber(Long.parseLong(params.get("Aadhar Number")));
			customer.setPanNumber(params.get("Pan Number"));
			customer.setFatherName(params.get("Father Name"));
			customer.setMotherName(params.get("Mother Name"));
	
			user.setUserId(userKey);
			user.setFirstName(params.get("First Name"));
			user.setLastName(params.get("Last Name"));
			user.setEmail(params.get("Email"));
			user.setPhoneNumberId(Integer.parseInt(params.get("Phone Number ID")));
			user.setAddressId(Integer.parseInt(params.get("Address ID")));
			user.setUserType(Role.valueOf(params.get("User Type")));
			user.setStatus(Status.valueOf(params.get("Status")));
			user.setDirtyField(List.of("firstName", "lastName", "userType", "status"));
	
			address.setAddressId(addressKey);
			address.setHouseNumber(params.get("House Number"));
			address.setStreet(params.get("Street"));
			address.setCity(params.get("City"));
			address.setDistrict(params.get("District"));
			address.setState(params.get("State"));
			address.setPinCode(Integer.parseInt(params.get("Pin Code")));
	
			phoneNumber.setPhoneNumberId(phoneNumberKey);
			phoneNumber.setCountryCode(Integer.parseInt(params.get("Country Code")));
			phoneNumber.setPhoneNumber(Long.parseLong(params.get("Phone Number")));
	
			features.update(customer, "id", customerKey);
			features.update(user, "userId", userKey);
			features.update(address, "addressId", addressKey);
			features.update(phoneNumber, "phoneNumberId", phoneNumberKey);
			System.out.println("Queen");
			json.put("message", "Customer Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (InvalidDataException e)
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("message", e.getMessage());
			response.getWriter().print(json);
		}
	}
	
	public static void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			Map<String, String> params = getParams(request);
			Account account = new Account();
			int accountKey = Integer.parseInt(params.get("Account Number"));
			String nominee = params.get("Nominee ID");
			Integer nomineeId = (nominee != null ? Integer.parseInt(nominee) : null);
			
			account.setAccountNumber(accountKey);
			account.setNomineeId(nomineeId);
			account.setBranchId(Integer.parseInt(params.get("Branch ID")));
			account.setAccountType(params.get("Account Type"));
			account.setStatus(Status.valueOf(params.get("Status")));
			account.setDirtyField(List.of("branchId", "status", "accountType", "nomineeId"));
		
			features.update(account, "accountNumber", accountKey);
			json.put("message", "Account Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("message", "Error Occured while Updating Account !");
			response.getWriter().print(json);
		}
	}
	
	public static void updateBranch(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try
		{
			Map<String, String> params = getParams(request);
			Branch branch = new Branch();
			Address address = new Address();
			PhoneNumber phoneNumber = new PhoneNumber();
			int branchKey = Integer.parseInt(params.get("Branch ID"));
			int addressKey = Integer.parseInt(params.get("Address ID"));
			int phoneNumberKey = Integer.parseInt(params.get("Phone Number ID"));
			
			branch.setBranchId(branchKey);
			branch.setAddressId(addressKey);
			branch.setBranchCode(params.get("Branch Code"));
			branch.setBranchName(params.get("Branch Name"));
			branch.setPhoneNumberId(phoneNumberKey);
	
			address.setAddressId(addressKey);
			address.setHouseNumber(params.get("House Number"));
			address.setStreet(params.get("Street"));
			address.setCity(params.get("City"));
			address.setDistrict(params.get("District"));
			address.setState(params.get("State"));
			address.setPinCode(Integer.parseInt(params.get("Pin Code")));
	
			phoneNumber.setPhoneNumberId(phoneNumberKey);
			phoneNumber.setCountryCode(Integer.parseInt(params.get("Country Code")));
			phoneNumber.setPhoneNumber(Long.parseLong(params.get("Phone Number")));
			features.update(branch, "branchId", branchKey);
			features.update(address, "addressId", addressKey);
			features.update(phoneNumber, "phoneNumberId", phoneNumberKey);
			json.put("message", "Branch Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", "Error Occured while Updating Branch !");
			response.getWriter().print(json);
		}
	}
	
	public static void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			int customerKey = Integer.parseInt(request.getParameter("ID"));
			features.delete("Customer", "customerId", customerKey);
			features.delete("User", "userId", customerKey);
			json.put("message", "Customer Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", "Error Occured while Deleting Customer !");
			response.getWriter().print(json);
		}
	}

	public static void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			int accountKey = Integer.parseInt(request.getParameter("Account Number"));
			features.delete("Account", "accountNumber", accountKey);
			json.put("message", "Customer Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", "Error Occured while Deleting Customer !");
			response.getWriter().print(json);
		}
	}
	
	public static void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		
		try
		{
			int employeeKey = Integer.parseInt(request.getParameter("Employee ID"));
			features.delete("Customer", "customerId", employeeKey);
			features.delete("User", "userId", employeeKey);
			json.put("message", "Customer Details Updated Successfully !");
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			json.put("error", "Error Occured while Deleting Customer !");
			response.getWriter().print(json);
		}
	}
	
	public static List<JSONObject> getAccounts(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		String type = request.getParameter("type");
		List<JSONObject> account = null;
		HttpSession session = request.getSession();
		Role role = (Role) session.getAttribute("role");
		System.out.println(role);
		if (role == Role.CUSTOMER)
		{
			account = features.getMyAccounts();
			PrimaryAccount primary = features.getPrimaryAccount();
			request.setAttribute("accounts", account);
			if (primary != null)
			{
				request.setAttribute("primary", primary.getAccountNumber());
				session.setAttribute("primary", primary.getAccountNumber());
			}
		}
		
		if (type != null && type.equals("Withdrawl"))
		{
			request.getRequestDispatcher("/Customer/Amount.jsp?type=WithdrawlAmount").forward(request, response);
		}
		if (type != null && type.equals("Deposit"))
		{
			request.getRequestDispatcher("/Customer/Amount.jsp?type=DepositAmount").forward(request, response);
		}
		if (type != null && type.equals("Transfer"))
		{
			request.getRequestDispatcher("/Customer/Amount.jsp?type=TransferAmount").forward(request, response);
		}
		if (type != null && type.equals("Password"))
		{
			request.getRequestDispatcher("/Customer/Amount.jsp?type=changePassword").forward(request, response);
		}
		
		return account; 
	}
	
	public static void createDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, InvalidDataException, SQLException, IOException
	{
		List<Integer> branchIds = features.getBranchIds();
		List<Integer> customerIds = features.getCustomerIds();
		request.setAttribute("branchIds", branchIds);
		request.setAttribute("customerIds", customerIds);
		System.out.println("All Set");
	}
}
