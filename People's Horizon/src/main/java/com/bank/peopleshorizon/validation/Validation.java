package com.bank.peopleshorizon.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.utility.Utility;

public class Validation
{
	private static Pattern mobile = Pattern.compile("^[7-9][\\d]{9}$");
	private static Pattern email = Pattern.compile("^[\\w\\._-]+@[\\w-]+\\.[A-Za-z.]{2,18}$");
	private static Pattern password = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=\\S+).{8,}$");
	private static String name = "^(\\p{L}{1,}((\\s\\p{L}{1,}){0,2})?\\s?\\p{L}{1,})|\\p{L}{1,}$";
	private static Pattern accountNumber = Pattern.compile("^\\d{6,8}$");
	private static String ID = "^\\d{6,10}$";
	private static String firstName = "([A-Z][a-z]*)[\\s-]?([A-Z][a-z]*)";
	private static String lastName = "^(?=\\p{L}{1,25}$)\\p{L}+$";
	
	public static void isValidPassword(String string) throws InvalidDataException
	{
		Utility.assertNonNull(string);
		if (!password.matcher(string).matches())
		{
			System.out.println(string);
			throw new InvalidDataException("Invalid Password");
		}
	}
	
	public static void isValidEmail(String string) throws InvalidDataException
	{
		Utility.assertNonNull(string);
		if (!email.matcher(string).matches())
		{
			throw new InvalidDataException("Invalid Email");
		}
	}
	
	public static void isValidMobileNumber(long phone) throws InvalidDataException
	{
		String number = String.valueOf(phone);
		Utility.assertNonNull(number);
		if (!mobile.matcher(number).matches())
		{
			throw new InvalidDataException("Invalid Mobile Number");
		}
	}
	
	public static void isValidAccountNumber(Integer account) throws InvalidDataException 
	{
	    Utility.assertNonNull(account);
	    String number = String.valueOf(account); 
	    if (!accountNumber.matcher(number).matches()) 
	    {
	        throw new InvalidDataException("Invalid Account Number");
	    }
	}
	
	public static boolean isID(long id, String message) throws InvalidDataException 
	{
        return isID(String.valueOf(id), message);
    }
	
	public static boolean isID(Integer id, String message) throws InvalidDataException 
	{
		Utility.assertNonNull(id);
		Utility.assertNonNull(message);
        return isID(String.valueOf(id), message);
    }

    public static boolean isID(String id, String message) throws InvalidDataException 
    {
        Pattern pattern = Pattern.compile(ID);
        Matcher matcher = pattern.matcher(id);
        boolean rslt = matcher.matches();
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid " + message);
        }
        return rslt;
    }
    
    public static boolean isValidFirstName(String fName) throws InvalidDataException 
    {
        boolean isValid = Pattern.matches(firstName, fName.trim());
        
        if (!isValid) 
        {
            throw new InvalidDataException("Invalid First Name");
        }
        
        return isValid;
    }

    public static boolean isValidLastName(String lName) throws InvalidDataException 
    {
        Pattern pattern = Pattern.compile(lastName);
        Matcher matcher = pattern.matcher(lName.trim());
        boolean isValid = matcher.matches();
        
        if (!isValid) 
        {
            throw new InvalidDataException("Invalid Last Name");
        }
        
        return isValid;
    }
    
    public static boolean isValidAmount(double amount) throws InvalidDataException 
    {
        if (amount < 0) 
        {
            throw new InvalidDataException("Amount must not be negative");
        } 
        else if (amount >= 10000000) 
        {
            throw new InvalidDataException("Amount is Too Large");
        } 
        return true;
    }
    
    public static boolean isValidHouseNumber(String hNumber) throws InvalidDataException 
    {
        String houseNumber = "^\\d{1,3}(?:\\s?/\\s?\\d{1,3})?$";
        boolean rslt = Pattern.matches(houseNumber, hNumber.trim());
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid House Number");
        }
        return rslt;
    }
    
    public static boolean isValidPincode(Integer pincode) throws InvalidDataException 
    {
    	Utility.assertNonNull(pincode);
        String pinCode = "^\\d{6}$";
        String pincodeString = String.valueOf(pincode);
        boolean rslt =  Pattern.matches(pinCode, pincodeString);
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid Pin Code");
        }
        return rslt;
    }
    
    public static boolean isMobilePin(Integer mPin) throws InvalidDataException 
    {
    	Utility.assertNonNull(mPin);
    	String number = String.valueOf(mPin);
        String mobilePin = "^0*\\d{1,6}$";
        boolean rslt = number.matches(mobilePin);
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid Mobile PIN");
        }
        return rslt;
    }
    
    public static boolean isValidCountryCode(int code) throws InvalidDataException 
    {
        String countryCode = "^\\d{1,3}$";
        String codeString = String.valueOf(code);
        boolean rslt = Pattern.matches(countryCode, codeString);
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid Country Code");
        }
        return rslt;
    }
    
    public static boolean isValidAadharNumber(long number) throws InvalidDataException 
    {
        String aadhar = "^\\d{12}$";
        String numberString = String.valueOf(number);
        boolean rslt = Pattern.matches(aadhar, numberString);
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid Aadhar Number");
        }
        return rslt;
    }
    
    public static boolean isValidPAN(String pan) throws InvalidDataException 
    {
        String PAN = "^[A-Z]{5}[0-9]{4}[A-Z]{1}$";
        boolean rslt = Pattern.matches(PAN, pan);
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid PAN Number");
        }
        return rslt;
    }
    
    public static boolean isValidName(String string, String message) throws InvalidDataException 
    {
        boolean rslt = Pattern.matches(name, string.trim());
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid " + message);
        }
        return rslt;
    }
    
    public static boolean isAlpha(String string, String message) throws InvalidDataException 
    {
        boolean rslt = string.matches("[a-zA-Z ]+");
        if (!rslt)
        {
        	throw new InvalidDataException("Invalid " + message);
        }
        return rslt;
    }
    
    public static String isIFSCCode(String branchCode) throws InvalidDataException
	{

        String ifsc_regex = "^[A-Z]{4}[0][\\d]{5}$";
        Pattern pattern = Pattern.compile(ifsc_regex);
        Matcher matcher = pattern.matcher(branchCode);
        if (matcher.matches()) 
		{
            return branchCode;
        }
		else 
		{
            throw new InvalidDataException("Invalid IFSC Code");
        }
	}	
    
}