package com.bank.peopleshorizon.testdata;

import java.sql.SQLException;

import com.bank.peopleshorizon.entities.Account;
import com.bank.peopleshorizon.entities.Address;
import com.bank.peopleshorizon.entities.Branch;
import com.bank.peopleshorizon.entities.Customer;
import com.bank.peopleshorizon.entities.Employee;
import com.bank.peopleshorizon.entities.Nominee;
import com.bank.peopleshorizon.entities.PhoneNumber;
import com.bank.peopleshorizon.entities.User;
import com.bank.peopleshorizon.enums.PaymentMethod;
import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.features.Features;
import com.bank.peopleshorizon.databaseutils.Condition;
import com.bank.peopleshorizon.databaseutils.DataBaseUtils;

public class TestData
{
	public TestData()
	{
	    String[] tableNames = {"Transaction", "Employee", "PrimaryAccount", "Account", "Branch", "Nominee", "Customer", "User", "PhoneNumber", "Address"};
	    
		DataBaseUtils dataBaseUtils = new DataBaseUtils();
		
		try 
		{
			for (String x: tableNames)
			{
				dataBaseUtils.dropTable(x);
			}
			
			// Branch phone numbers
	        PhoneNumber branchPhoneNumber1 = new PhoneNumber();
	        branchPhoneNumber1.setCountryCode(1);
	        branchPhoneNumber1.setPhoneNumber(8789012325L);

	        PhoneNumber branchPhoneNumber2 = new PhoneNumber();
	        branchPhoneNumber2.setCountryCode(1);
	        branchPhoneNumber2.setPhoneNumber(7890123426L);

	        PhoneNumber branchPhoneNumber3 = new PhoneNumber();
	        branchPhoneNumber3.setCountryCode(1);
	        branchPhoneNumber3.setPhoneNumber(8901263527L);

	        PhoneNumber branchPhoneNumber4 = new PhoneNumber();
	        branchPhoneNumber4.setCountryCode(1);
	        branchPhoneNumber4.setPhoneNumber(9123456729L);

	        // Customer phone numbers
	        PhoneNumber customerPhoneNumber1 = new PhoneNumber();
	        customerPhoneNumber1.setCountryCode(1);
	        customerPhoneNumber1.setPhoneNumber(9783012325l);

	        PhoneNumber customerPhoneNumber2 = new PhoneNumber();
	        customerPhoneNumber2.setCountryCode(1);
	        customerPhoneNumber2.setPhoneNumber(7820123426l);

	        PhoneNumber customerPhoneNumber3 = new PhoneNumber();
	        customerPhoneNumber3.setCountryCode(1);
	        customerPhoneNumber3.setPhoneNumber(8201234267l);

	        PhoneNumber customerPhoneNumber4 = new PhoneNumber();
	        customerPhoneNumber4.setCountryCode(1);
	        customerPhoneNumber4.setPhoneNumber(9223256789l);
	        
	        PhoneNumber employeePhoneNumber1 = new PhoneNumber();
	        employeePhoneNumber1.setCountryCode(1);
	        employeePhoneNumber1.setPhoneNumber(9783012320L);
	        
	        PhoneNumber adminPhoneNumber1 = new PhoneNumber();
	        adminPhoneNumber1.setCountryCode(1);
	        adminPhoneNumber1.setPhoneNumber(9783017320L);
	        
	        Address branchAddress1 = new Address();
	        branchAddress1.setStreet("Gandhi Road");
	        branchAddress1.setCity("Chennai");
	        branchAddress1.setDistrict("Chennai");
	        branchAddress1.setState("Tamil Nadu");
	        branchAddress1.setPinCode(600001);

	        Address branchAddress2 = new Address();
	        branchAddress2.setStreet("MG Road");
	        branchAddress2.setCity("Bangalore");
	        branchAddress2.setDistrict("Bangalore");
	        branchAddress2.setState("Karnataka");
	        branchAddress2.setPinCode(560001);

	        Address branchAddress3 = new Address();
	        branchAddress3.setStreet("Vivekananda Road");
	        branchAddress3.setCity("Hyderabad");
	        branchAddress3.setDistrict("Hyderabad");
	        branchAddress3.setState("Telangana");
	        branchAddress3.setPinCode(500001);

	        Address branchAddress4 = new Address();
	        branchAddress4.setStreet("Rajaji Street");
	        branchAddress4.setCity("Coimbatore");
	        branchAddress4.setDistrict("Coimbatore");
	        branchAddress4.setState("Tamil Nadu");
	        branchAddress4.setPinCode(641001);

	        Address branchAddress5 = new Address();
	        branchAddress5.setStreet("Thiruvananthapuram Road");
	        branchAddress5.setCity("Trivandrum");
	        branchAddress5.setDistrict("Thiruvananthapuram");
	        branchAddress5.setState("Kerala");
	        branchAddress5.setPinCode(695001);

	        Address branchAddress6 = new Address();
	        branchAddress6.setStreet("Anna Nagar");
	        branchAddress6.setCity("Madurai");
	        branchAddress6.setDistrict("Madurai");
	        branchAddress6.setState("Tamil Nadu");
	        branchAddress6.setPinCode(625001);

	        Address branchAddress7 = new Address();
	        branchAddress7.setStreet("Kamaraj Road");
	        branchAddress7.setCity("Mysore");
	        branchAddress7.setDistrict("Mysore");
	        branchAddress7.setState("Karnataka");
	        branchAddress7.setPinCode(570001);

	        Address branchAddress8 = new Address();
	        branchAddress8.setStreet("Periyar Street");
	        branchAddress8.setCity("Pondicherry");
	        branchAddress8.setDistrict("Puducherry");
	        branchAddress8.setState("Puducherry");
	        branchAddress8.setPinCode(605001);
	        
	        Address employeeAddress1 = new Address();
	        employeeAddress1.setStreet("Main Street");
	        employeeAddress1.setCity("New York");
	        employeeAddress1.setDistrict("Manhattan");
	        employeeAddress1.setState("New York");
	        employeeAddress1.setPinCode(100101);


			Branch branch1 = new Branch();
			branch1.setBranchCode("PZON018345");
			branch1.setBranchName("Main Street Branch");

			Branch branch2 = new Branch();
			branch2.setBranchCode("PZON014345");
			branch2.setBranchName("Palladam Branch");

			Branch branch3 = new Branch();
			branch3.setBranchCode("PZON014345");
			branch3.setBranchName("Coimbatore Branch");

			Branch branch4 = new Branch();
			branch4.setBranchCode("PZON012375");
			branch4.setBranchName("Gandhipuram Branch");
			
			
	        User user1 = new User();
	        user1.setFirstName("John");
	        user1.setLastName("Doe");
	        user1.setEmail("john.doe@example.com");
	        user1.setPassword("Nino@001");
	        user1.setUserType(Role.CUSTOMER);
	        user1.setStatus(Status.ACTIVE);

	        User user2 = new User();
	        user2.setFirstName("Alice");
	        user2.setLastName("Smith");
	        user2.setEmail("alice.smith@example.com");
	        user2.setPassword("Sindhu@001");
	        user2.setUserType(Role.CUSTOMER);
	        user2.setStatus(Status.ACTIVE);

	        User user3 = new User();
	        user3.setFirstName("Admin");
	        user3.setLastName("Adminson");
	        user3.setEmail("admin@example.com");
	        user3.setPassword("Admin-123");
	        user3.setUserType(Role.CUSTOMER);
	        user3.setStatus(Status.ACTIVE);

	        User user4 = new User();
	        user4.setFirstName("Agent");
	        user4.setLastName("Agentson");
	        user4.setEmail("agent@example.com");
	        user4.setPassword("Agent:123");
	        user4.setUserType(Role.CUSTOMER);
	        user4.setStatus(Status.ACTIVE);
	        
	        User user5 = new User();
	        user5.setFirstName("Alice");
	        user5.setLastName("Wonderland");
	        user5.setEmail("alice@example.com");
	        user5.setPassword("Alice@123");
	        user5.setUserType(Role.EMPLOYEE);
	        user5.setStatus(Status.ACTIVE);
	        
	        User user6 = new User();
	        user6.setFirstName("Dwayne");
	        user6.setLastName("Johnson");
	        user6.setEmail("dwayne.johnson@example.com");
	        user6.setPassword("therock123");
	        user6.setUserType(Role.CUSTOMER);
	        user6.setStatus(Status.ACTIVE);
	        
	        User user7 = new User();
	        user7.setFirstName("Roman");
	        user7.setLastName("Reigns");
	        user7.setEmail("roman.reigns@justice.com");
	        user7.setPassword("Reigns@99");
	        user7.setUserType(Role.CUSTOMER);
	        user7.setStatus(Status.ACTIVE);

			Customer customer1 = new Customer();
			customer1.setAadharNumber(123426789012L);
			customer1.setPanNumber("ABCDE1234F");
			customer1.setFatherName("John Doe");
			customer1.setMotherName("Jane Doe");

			Customer customer2 = new Customer();
			customer2.setAadharNumber(234267890123L);
			customer2.setPanNumber("FGHIJ5678K");
			customer2.setFatherName("John Smith");
			customer2.setMotherName("Jane Smith");

			Customer customer3 = new Customer();
			customer3.setAadharNumber(345678201234L);
			customer3.setPanNumber("KLMNO9012P");
			customer3.setFatherName("Michael Johnson");
			customer3.setMotherName("Maria Johnson");

			Customer customer4 = new Customer();
			customer4.setAadharNumber(456782012345L);
			customer4.setPanNumber("PQRST3456U");
			customer4.setFatherName("William Brown");
			customer4.setMotherName("Emily Brown");


			Account account1 = new Account();
			account1.setCustomerId(100000);
			account1.setBranchId(100000);
			account1.setAccountType("Savings");
			account1.setBalance(10000.0);
			account1.setStatus(Status.ACTIVE);
			account1.setMPin(111111);

			Account account2 = new Account();
			account2.setCustomerId(100000);
			account2.setBranchId(100001);
			account2.setAccountType("Savings");
			account2.setBalance(15000.0);
			account2.setStatus(Status.ACTIVE);
			account2.setMPin(222222);

			Account account3 = new Account();
			account3.setCustomerId(100000);
			account3.setBranchId(100002);
			account3.setAccountType("Current");
			account3.setBalance(20000.0);
			account3.setStatus(Status.ACTIVE);
			account3.setMPin(333333);

			Account account4 = new Account();
			account4.setCustomerId(100000);
			account4.setBranchId(100003);
			account4.setAccountType("Savings");
			account4.setBalance(12000.0);
			account4.setStatus(Status.ACTIVE);
			account4.setMPin(444444);

			Account account5 = new Account();
			account5.setCustomerId(100001);
			account5.setBranchId(100000);
			account5.setAccountType("Current");
			account5.setBalance(18000.0);
			account5.setStatus(Status.ACTIVE);
			account5.setMPin(555555);

			Account account6 = new Account();
			account6.setCustomerId(100002);
			account6.setBranchId(100001);
			account6.setAccountType("Savings");
			account6.setBalance(22000.0);
			account6.setStatus(Status.ACTIVE);
			account6.setMPin(666666);

			Account account7 = new Account();
			account7.setCustomerId(100002);
			account7.setBranchId(100003);
			account7.setAccountType("Current");
			account7.setBalance(14000.0);
			account7.setStatus(Status.ACTIVE);
			account7.setMPin(777777);

			Account account8 = new Account();
			account8.setCustomerId(100004);
			account8.setBranchId(100001);
			account8.setAccountType("Savings");
			account8.setBalance(16000.0);
			account8.setStatus(Status.ACTIVE);
			account8.setMPin(888888);
			
			Employee employee1 = new Employee();
			employee1.setBranchId(100000);

			Features features = new Features();
			
			features.addBranch(branch1, branchPhoneNumber1, branchAddress1);
			features.addBranch(branch2, branchPhoneNumber2, branchAddress2);
			features.addBranch(branch3, branchPhoneNumber3, branchAddress3);
			features.addBranch(branch4, branchPhoneNumber4, branchAddress4);
			
			features.addCustomer(customer1, user1, customerPhoneNumber1, branchAddress1, null);
			features.addCustomer(customer2, user2, customerPhoneNumber2, branchAddress2, null);
			features.addCustomer(customer3, user3, customerPhoneNumber3, branchAddress3, null);
			features.addCustomer(customer4, user4, customerPhoneNumber4, branchAddress4, null);
			
			features.addAccount(account1, null);
			features.addAccount(account2, null);
			features.addAccount(account3, null);
			features.addAccount(account4, null);
			features.addAccount(account5, null);
			features.addAccount(account6, null);
			features.addAccount(account7, null);
			
			features.addEmployee(employee1, user5, employeePhoneNumber1, employeeAddress1);
			features.addAdmin(user7, adminPhoneNumber1, branchAddress3);
			branch1.setBranchId(100000);
			branch1.setBranchName("One in Millions Branch");
			dataBaseUtils.updateTable(branch1, new Condition("branchId", " = ", 1));
			
			User user8 = new User();
			user8.setFirstName("Roman");
			user8.setLastName("Reigns");
			user8.setEmail("roman.reigns@wwe.com");
			user8.setPassword("Roman@123");
			user8.setUserType(Role.CUSTOMER);
			user8.setStatus(Status.ACTIVE);

			Customer customer5 = new Customer();
			customer5.setAadharNumber(123456789012L);
			customer5.setPanNumber("ABCZE1234F");
			customer5.setFatherName("Leati Joseph Anoa'i Sr.");
			customer5.setMotherName("Patricia A. Anoa'i");

			PhoneNumber customerPhoneNumber5 = new PhoneNumber();
			customerPhoneNumber5.setCountryCode(1);
			customerPhoneNumber5.setPhoneNumber(9882543210L);

			Address branchAddress9 = new Address();
			branchAddress9.setStreet("555 WWE Ave");
			branchAddress9.setCity("Stamford");
			branchAddress9.setDistrict("Fairfield");
			branchAddress9.setState("Connecticut");
			branchAddress9.setPinCode(6902);

			Account account9 = new Account();
			account9.setCustomerId(100006);
			account9.setBranchId(100000);
			account9.setAccountType("Savings");
			account9.setBalance(50000.0);
			account9.setStatus(Status.ACTIVE);
			account9.setMPin(999999);

			features.addCustomer(customer5, user8, customerPhoneNumber5, branchAddress9, null);
			features.addAccount(account9, null);

			
			User user9 = new User();
			user9.setFirstName("John");
			user9.setLastName("Cena");
			user9.setEmail("john.cena@wwe.com");
			user9.setPassword("Cena@123");
			user9.setUserType(Role.CUSTOMER);
			user9.setStatus(Status.ACTIVE);

			Customer customer6 = new Customer();
			customer6.setAadharNumber(987654321098L); // Unique Aadhar number
			customer6.setPanNumber("ZYXWV9876Q");
			customer6.setFatherName("John Cena Sr.");
			customer6.setMotherName("Carol Cena");

			PhoneNumber customerPhoneNumber6 = new PhoneNumber();
			customerPhoneNumber6.setCountryCode(1);
			customerPhoneNumber6.setPhoneNumber(9871234560L); // Unique phone number

			Address branchAddress10 = new Address();
			branchAddress10.setStreet("123 Main Street");
			branchAddress10.setCity("Los Angeles");
			branchAddress10.setDistrict("Los Angeles");
			branchAddress10.setState("California");
			branchAddress10.setPinCode(90001);

			Account account10 = new Account();
			account10.setCustomerId(100006); // Unique customer ID
			account10.setBranchId(100000);
			account10.setAccountType("Checking");
			account10.setBalance(75000.0);
			account10.setStatus(Status.ACTIVE);
			account10.setMPin(888888);

			features.addCustomer(customer6, user9, customerPhoneNumber6, branchAddress10, null);
			features.addAccount(account10, null);

			User user10 = new User();
			user10.setFirstName("Becky");
			user10.setLastName("Lynch");
			user10.setEmail("becky.lynch@wwe.com");
			user10.setPassword("Lynch@123");
			user10.setUserType(Role.CUSTOMER);
			user10.setStatus(Status.ACTIVE);

			Customer customer7 = new Customer();
			customer7.setAadharNumber(654321098765L); // Unique Aadhar number
			customer7.setPanNumber("ABCDE6789G");
			customer7.setFatherName("Conor Quinlan");
			customer7.setMotherName("Colette Quinlan");

			PhoneNumber customerPhoneNumber7 = new PhoneNumber();
			customerPhoneNumber7.setCountryCode(1);
			customerPhoneNumber7.setPhoneNumber(9876543211L); // Unique phone number

			Address branchAddress11 = new Address();
			branchAddress11.setStreet("456 Oak Street");
			branchAddress11.setCity("Dublin");
			branchAddress11.setDistrict("County Dublin");
			branchAddress11.setState("Leinster");
			branchAddress11.setPinCode(12345);

			Account account11 = new Account();
			account11.setCustomerId(100007); // Unique customer ID
			account11.setBranchId(100001);
			account11.setAccountType("Savings");
			account11.setBalance(62000.0);
			account11.setStatus(Status.ACTIVE);
			account11.setMPin(777777);

			features.addCustomer(customer7, user10, customerPhoneNumber7, branchAddress11, null);
			features.addAccount(account11, null);

			
			User user11 = new User();
			user11.setFirstName("Seth");
			user11.setLastName("Rollins");
			user11.setEmail("seth.rollins@wwe.com");
			user11.setPassword("Rollins@123");
			user11.setUserType(Role.CUSTOMER);
			user11.setStatus(Status.ACTIVE);

			Customer customer8 = new Customer();
			customer8.setAadharNumber(123098765432L); // Unique Aadhar number
			customer8.setPanNumber("FGHIJ1234K");
			customer8.setFatherName("Kevin Lopez");
			customer8.setMotherName("Elena Lopez");

			PhoneNumber customerPhoneNumber8 = new PhoneNumber();
			customerPhoneNumber8.setCountryCode(1);
			customerPhoneNumber8.setPhoneNumber(9876543222L); // Unique phone number

			Address branchAddress12 = new Address();
			branchAddress12.setStreet("789 Elm Street");
			branchAddress12.setCity("Davenport");
			branchAddress12.setDistrict("Scott");
			branchAddress12.setState("Iowa");
			branchAddress12.setPinCode(52801);

			Account account12 = new Account();
			account12.setCustomerId(100008); // Unique customer ID
			account12.setBranchId(100003);
			account12.setAccountType("Checking");
			account12.setBalance(48000.0);
			account12.setStatus(Status.ACTIVE);
			account12.setMPin(666666);

			features.addCustomer(customer8, user11, customerPhoneNumber8, branchAddress12, null);
			features.addAccount(account12, null);

			
			User user12 = new User();
			user12.setFirstName("Dwayne");
			user12.setLastName("Johnson");
			user12.setEmail("dwayne.johnson@wwe.com");
			user12.setPassword("Rock@123");
			user12.setUserType(Role.CUSTOMER);
			user12.setStatus(Status.ACTIVE);

			Customer customer9 = new Customer();
			customer9.setAadharNumber(456789012345L); // Unique Aadhar number
			customer9.setPanNumber("LMNOP5678R");
			customer9.setFatherName("Rocky Johnson");
			customer9.setMotherName("Ata Maivia");

			PhoneNumber customerPhoneNumber9 = new PhoneNumber();
			customerPhoneNumber9.setCountryCode(1);
			customerPhoneNumber9.setPhoneNumber(9876543233L); // Unique phone number

			Address branchAddress13 = new Address();
			branchAddress13.setStreet("1010 Sunset Blvd");
			branchAddress13.setCity("Los Angeles");
			branchAddress13.setDistrict("Los Angeles");
			branchAddress13.setState("California");
			branchAddress13.setPinCode(90001);

			Account account13 = new Account();
			account13.setCustomerId(100009); // Unique customer ID
			account13.setBranchId(100003);
			account13.setAccountType("Savings");
			account13.setBalance(100000.0);
			account13.setStatus(Status.ACTIVE);
			account13.setMPin(555555);

			features.addCustomer(customer9, user12, customerPhoneNumber9, branchAddress13, null);
			features.addAccount(account13, null);

			
			User user13 = new User();
			user13.setFirstName("Alexa");
			user13.setLastName("Bliss");
			user13.setEmail("alexa.bliss@wwe.com");
			user13.setPassword("Bliss@123");
			user13.setUserType(Role.CUSTOMER);
			user13.setStatus(Status.ACTIVE);

			Customer customer10 = new Customer();
			customer10.setAadharNumber(987654321012L); // Unique Aadhar number
			customer10.setPanNumber("STUVW6789S");
			customer10.setFatherName("Bob Kaufman");
			customer10.setMotherName("Angela Kaufman");

			PhoneNumber customerPhoneNumber10 = new PhoneNumber();
			customerPhoneNumber10.setCountryCode(1);
			customerPhoneNumber10.setPhoneNumber(9876543244L); // Unique phone number

			Address branchAddress14 = new Address();
			branchAddress14.setStreet("1234 Bliss Lane");
			branchAddress14.setCity("Columbus");
			branchAddress14.setDistrict("Franklin");
			branchAddress14.setState("Ohio");
			branchAddress14.setPinCode(43201);

			Account account14 = new Account();
			account14.setCustomerId(100010); // Unique customer ID
			account14.setBranchId(100001);
			account14.setAccountType("Checking");
			account14.setBalance(55000.0);
			account14.setStatus(Status.ACTIVE);
			account14.setMPin(444444);

			features.addCustomer(customer10, user13, customerPhoneNumber10, branchAddress14, null);
			features.addAccount(account14, null);

			
			User user14 = new User();
			user14.setFirstName("Glenn");
			user14.setLastName("Jacobs");
			user14.setEmail("glenn.jacobs@wwe.com");
			user14.setPassword("Kane@123");
			user14.setUserType(Role.CUSTOMER);
			user14.setStatus(Status.ACTIVE);

			Customer customer11 = new Customer();
			customer11.setAadharNumber(876543210987L); // Unique Aadhar number
			customer11.setPanNumber("KLMNO1234T");
			customer11.setFatherName("Gilbert Jacobs");
			customer11.setMotherName("Jean Jacobs");

			PhoneNumber customerPhoneNumber11 = new PhoneNumber();
			customerPhoneNumber11.setCountryCode(1);
			customerPhoneNumber11.setPhoneNumber(9876543255L); // Unique phone number

			Address branchAddress15 = new Address();
			branchAddress15.setStreet("666 Demon Drive");
			branchAddress15.setCity("Parts Unknown");
			branchAddress15.setDistrict("Unknown");
			branchAddress15.setState("Unknown");
			branchAddress15.setPinCode(00000);

			Account account15 = new Account();
			account15.setCustomerId(100011); // Unique customer ID
			account15.setBranchId(100000);
			account15.setAccountType("Savings");
			account15.setBalance(75000.0);
			account15.setStatus(Status.ACTIVE);
			account15.setMPin(333333);

			features.addCustomer(customer11, user14, customerPhoneNumber11, branchAddress15, null);
			features.addAccount(account15, null);

			features.authenticate(100000, "Nino@001");
			features.transfer(100002, "PZON012345", 938, PaymentMethod.GPAY);
			features.transfer(100006, "PZON012945", 638, PaymentMethod.UPI);
			features.withdrawAmount(63, PaymentMethod.GPAY);
			features.depositAmount(8135, PaymentMethod.GPAY);
			features.withdrawAmount(138, PaymentMethod.GPAY);
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}