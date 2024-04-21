package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;

public class PhoneNumber 
{
    private Integer phoneNumberId;
    private int countryCode;
    private long phoneNumber;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getPhoneNumberId() 
    { 
        return phoneNumberId; 
    }

    public void setPhoneNumberId(Integer phoneNumberId) throws InvalidDataException 
    { 
        this.phoneNumberId = phoneNumberId; 
    }

    public int getCountryCode() 
    { 
        return countryCode; 
    }

    public void setCountryCode(int countryCode) throws InvalidDataException 
    { 
    	Validation.isValidCountryCode(countryCode);
        this.countryCode = countryCode; 
    }

    public long getPhoneNumber() 
    { 
        return phoneNumber; 
    }

    public void setPhoneNumber(long phoneNumber) throws InvalidDataException 
    { 
    	Validation.isValidMobileNumber(phoneNumber);
        this.phoneNumber = phoneNumber; 
    }

	public void addDirtyField(String column) 
	{
		this.dirtyFields.add(column);
	}
	
	public void setDirtyField(List<String> dirtyFields) 
	{
		this.dirtyFields = dirtyFields;
	}
	
	@Override
	public String toString() 
	{
	    StringBuilder sb = new StringBuilder();
	    sb.append("PhoneNumber: \n");
	    sb.append("  phoneNumberId: ").append(phoneNumberId).append("\n");
	    sb.append("  countryCode: ").append(countryCode).append("\n");
	    sb.append("  phoneNumber: ").append(phoneNumber).append("\n");
	    return sb.toString();
	}

}
