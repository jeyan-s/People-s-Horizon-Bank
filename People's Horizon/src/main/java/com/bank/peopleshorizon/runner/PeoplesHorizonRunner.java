package com.bank.peopleshorizon.runner;

import com.bank.peopleshorizon.features.Features;
import com.bank.peopleshorizon.entities.User;
import com.bank.peopleshorizon.enums.PaymentMethod;
import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.testdata.TestData;

import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.json.JSONObject;

import com.bank.peopleshorizon.entities.Address;
import com.bank.peopleshorizon.entities.Branch;
import com.bank.peopleshorizon.entities.Customer;
import com.bank.peopleshorizon.entities.PhoneNumber;
import com.bank.peopleshorizon.entities.Account;
import com.bank.peopleshorizon.entities.Transaction;

public class PeoplesHorizonRunner
{
	private static Scanner input = new Scanner(System.in);	
	
	public static void multiThreadCheck()
	{
		try
		{
			Features feature1 = new Features();
			Features feature2 = new Features();
			
	        Thread thread1 = new Thread(() -> 
	        {
	            try 
	            {
					feature1.authenticate(1, "123");
				}
	            catch (InvalidDataException e) 
	            {
					e.printStackTrace();
				}

	            System.out.println("Current user for feature 1: " + feature1.getCurrentUser());
	        });

	        Thread thread2 = new Thread(() -> 
	        {
	            try 
	            {
	                thread1.join();
					feature2.authenticate(2, "password456");
				} 
	            catch (Exception e)
	            {
					e.printStackTrace();
				}

	            System.out.println("Current user for feature 2: " + feature1.getCurrentUser());
	        });

	        thread1.start();
	        thread2.start();
		}
		
		catch (Exception e)
		{
			
		}
	}
	
	public static void main(String[] a)
	{
		TestData testData = new TestData();
		System.out.println("SUCCESS");
		Scanner input = new Scanner(System.in);
		
		int userId;
		String userPassword;
		boolean currentUser;
		
//		multiThreadCheck();

		/*
		try
		{
			Features features = new Features();
			while (true)
			{
				System.out.println("Enter your Customer ID: ");
				userId = input.nextInt();
				input.nextLine();
				System.out.println("Enter your Password: ");
				userPassword = input.nextLine();
				currentUser = features.authenticate(userId, userPassword);
				
				
				
				if (currentUser)
				{
					Role role = features.authorize();
					while (true)
					{
						if (role == Role.ADMIN)
						{
							int option = 0;
							
							while (true)
							{
								System.out.println("1) Add an Account for a New Customer");
								System.out.println("2) Create Account for Existing Customer");
								System.out.println("3) Remove Account");
								System.out.println("4) Block a Customer");
								System.out.println("5) Update Details of a Customer");
								System.out.println("6) View Your Profile");
								System.out.println("7) Update Your Profile");
								System.out.println("8) View Employees of a specific branch");
								System.out.println("9) View Customers of a specific branch.");
								System.out.println("10) View Employees of the Bank");
								System.out.println("11) View Customers of the Bank");
								System.out.println("12) Add New Employee");
								System.out.println("13) Update details of an existing employee.");
								System.out.println("14) Add a new branch to the bank.");
								System.out.println("15) View Transactions for Specified Time");
								System.out.println("16) Block an Employee");
								System.out.println("17) Change Password");
								System.out.println("18) Log Out");
								
								System.out.println("Enter Your Option: ");
								option = input.nextInt();
							
								if (option == 1)
								{
									System.out.println("Enter Customer details:");
							        System.out.print("Aadhar Number: ");
							        long aadharNumber = input.nextLong();
							        input.nextLine(); 
							        
							        System.out.print("Pan Number: ");
							        String panNumber = input.nextLine();
							        
							        System.out.print("Father's Name: ");
							        String fatherName = input.nextLine();
							        
							        System.out.print("Mother's Name: ");
							        String motherName = input.nextLine();
		
							        System.out.print("First Name: ");
							        String firstName = input.nextLine();
							        
							        System.out.print("Last Name: ");
							        String lastName = input.nextLine();
							        
							        System.out.print("Email: ");
							        String email = input.nextLine();
							        
							        System.out.print("Phone Number Id: ");
							        int phoneNumberId = input.nextInt();
							        
							        System.out.print("Address Id: ");
							        int addressId = input.nextInt();					        
							        input.nextLine();
							        
							        System.out.print("Password: ");
							        String password = input.nextLine();
		
							        System.out.println("\nEnter PhoneNumber details:");
							        System.out.print("Country Code: ");
							        int countryCode = input.nextInt();
							        
							        System.out.print("Phone Number: ");
							        long phoneNumber = input.nextLong();
		
							        System.out.println("\nEnter Address details:");
							        System.out.print("House Number: ");
							        String houseNumber = input.next();					        
							        input.nextLine();
							        
							        System.out.print("Street: ");
							        String street = input.nextLine();
							        
							        System.out.print("City: ");
							        String city = input.nextLine();
							        
							        System.out.print("District: ");
							        String district = input.nextLine();
							        
							        System.out.print("State: ");
							        String state = input.nextLine();
							        
							        System.out.print("Pin Code: ");
							        int pinCode = input.nextInt();
							        
							        System.out.print("Branch Id: ");
							        int branchId = input.nextInt();
							        input.nextLine(); 
							        
							        System.out.print("Account Type: ");
							        String accountType = input.nextLine();
							        
							        System.out.print("Balance: ");
							        double balance = input.nextDouble();
							        input.nextLine(); 
							        
							        Customer customer = new Customer();
							        customer.setAadharNumber(aadharNumber);
							        customer.setPanNumber(panNumber);
							        customer.setFatherName(fatherName);
							        customer.setMotherName(motherName);
							        
							        User user = new User();
							        user.setFirstName(firstName);
							        user.setLastName(lastName);
							        user.setEmail(email);
							        user.setPassword(password);
								}
							}
						}
						
						else if (role == Role.EMPLOYEE) 
						{
							System.out.println("Employee Home");
							System.out.println("1) Add New Account");
							System.out.println("2) Create Account for Existing Customer");
							System.out.println("3) Remove Account");
							System.out.println("4) Block Customer");
							System.out.println("5) Update Details of a Customer");
							System.out.println("6) View Profile");
							System.out.println("7) Update Profile");
							System.out.println("8) View Employees of a particular branch");
							System.out.println("9) View Customers of a particular branch");
							System.out.println("10) View Transactions for Specified Time");
							System.out.println("11) Change Password");
							System.out.println("12) Log Out");
							
							System.out.println("Enter your Option: ");
							int option = input.nextInt();
							input.nextLine();
							
							if (option == 6)
							{
								JSONObject user = features.viewProfile();
								System.out.println(user);
							}
							if (option == 8)
							{
								Map<Integer, Customer> rslt = features.viewCustomers();
								System.out.println(rslt);
							}
							if (option == 12)
							{
								break;
							}
						}
	
						else
						{
							try
							{
								List<Account> accounts = features.getMyAccounts();
								int accountsLength = accounts.size();
								
								for (int x = 0; x < accountsLength; x++)
								{
									 System.out.println((x + 1) + ") Account Number: " + accounts.get(x));
								}
								System.out.println((accountsLength + 1) + ") Log Out");
								
								System.out.println("Enter your Option: ");
								int accountOption = input.nextInt();
								input.nextLine();
								
								if (accountOption == accountsLength + 1)
								{
									return;
								}
								
//								boolean currentAccount = features.setCurrentAccount(accounts.get(accountOption - 1).getAccountNumber());
								
								if (true)
								{
									while (true)
									{
										System.out.println("Customer Home");
										System.out.println("1) View Profile");
										System.out.println("2) Check Balance");
										System.out.println("3) View Transaction History");
										System.out.println("4) Transfer Funds");
										System.out.println("5) Withdraw Amount");
										System.out.println("6) Deposit Amount");
										System.out.println("7) Change Password");
										System.out.println("8) Get Back to Select Account");
										
										int option = input.nextInt();
										input.nextLine();
										
										if (option == 1)
										{
											User user = features.viewProfile();
											System.out.println(user);
										}
										
										else if (option == 2)
										{
											System.out.println("Your Balance: " + features.getBalance());
										}
										
										else if (option == 3)
										{
											List<Transaction> rslt = features.transactionHistory();
											System.out.println("Your Transaction History: ");
											for (Transaction x: rslt)
											{
												System.out.println(x);
											}
										}
										
										else if (option == 4)
										{
											System.out.print("Enter Receiver's Account Number: ");
									        int receiverAccountNumber = input.nextInt();

									        System.out.print("Enter amount to transfer: ");
									        double amount = input.nextDouble();
									        
											features.transfer(receiverAccountNumber, amount, PaymentMethod.UPI);
											System.out.println("Transfer Successful !");
										}
										
										else if (option == 5)
										{
									        System.out.print("Enter amount to Withdrawl: ");
									        double amount = input.nextDouble();
											features.withdrawAmount(amount, PaymentMethod.UPI);
										}
										
										else if (option == 6)
										{
									        System.out.print("Enter amount to Deposit: ");
									        double amount = input.nextDouble();
											features.depositAmount(amount, PaymentMethod.UPI);
										}
										
										else if (option == 7)
										{
									        System.out.print("Enter New Password: ");
									        String newPassword = input.nextLine();
											features.changePassword(newPassword);
										}
										
										else if (option == 8)
										{
											break;
										}
										
										else
										{
											System.out.println("Invalid Option !");
										}
									}
								}
								break;
							}
							catch (Exception e)
							{
								e.printStackTrace();
								break;
							}
						}
					}
				}
				
				else
				{
					System.out.println("Invalid User ID or Password !");
				}
			}
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		
		
//		try
//		{
//			Features features = new Features();
//			User rslt = features.viewProfile(1);
//			System.out.println(rslt.getFirstName());
//			System.out.println(features.viewCustomers(4));
//			System.out.println(features.checkBalance(4));
//			features.depositAmount(4, 8000);
//			System.out.println(features.checkBalance(4));
//			features.withdrawAmount(4, 10000);
//			System.out.println(features.checkBalance(4));
//
//			//features.addBranch("sulur", 9123456780L, "Coimbatore" );
//			//features.addEmployee(123, rslt, 9234561787L, "Chennai");
//			
////			User userProfile = features.viewProfile(customerUser.getUserId());
//            System.out.println("User Profile:");
////            System.out.println(userProfile);
//            
//            
//
//
//		}
//		
//		catch (Exception e)
//		{
//			e.printStackTrace();
//		}

		 */
	}
}