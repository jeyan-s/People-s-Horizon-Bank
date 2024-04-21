package com.bank.peopleshorizon.utility;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.regex.*;

import com.bank.peopleshorizon.exceptions.InvalidDataException;

public class Utility
{
	public static void assertNonNull(Object object) throws InvalidDataException
	{
		if (object == null)
		{
			throw new InvalidDataException("Input Object cannot be null");
		}
	}
	
	public static void assertPositive(double data) throws InvalidDataException
	{
		if (data <= 0)
		{
			throw new InvalidDataException("Amount Must be Positive !");
		}
	}
	
	private static void assertInRange(double data, double limit, String message) throws InvalidDataException
	{
		if (data > limit)
		{
			throw new InvalidDataException("Amount is too Large !");
		}
	}
	
	public static void assertAmountInRange(double data, double limit) throws InvalidDataException
	{
		assertInRange(data, limit, "Amount is too Large !");
	}
	
	public static void assertDaysInRange(double data, double limit) throws InvalidDataException
	{
		if (data > limit)
		{
			assertInRange(data, limit, "Time Period is too Large !");
		}
	}
	
	public static String getTimeStamp(long currentTimeMillis)
	{
        Date currentDate = new Date(currentTimeMillis);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String formattedDate = sdf.format(currentDate);
        return formattedDate;
	}
	
	public static String getDate(long currentTimeMillis) 
	{
	    Date currentDate = new Date(currentTimeMillis);
	    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
	    String formattedDate = sdf.format(currentDate);
	    return formattedDate;
	}

	public static String assertIFSC(String branchCode) throws InvalidDataException
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
	
	public static String getAmount(String valueAsString) 
	{
	    double value;
	    try 
	    {
			value = Double.parseDouble(valueAsString);
			DecimalFormat df = new DecimalFormat("0.00");
			return df.format(value);
		}
		catch (NumberFormatException e) 
		{
			return "Invalid input format: " + valueAsString;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
    
}