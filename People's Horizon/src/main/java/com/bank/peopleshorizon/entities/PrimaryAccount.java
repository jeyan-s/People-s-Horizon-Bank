package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;

public class PrimaryAccount 
{
    private Integer primaryAccountId;
    private Integer customerId;
    private Integer mPin;
    private Integer accountNumber;
    private List<String> dirtyFields = new ArrayList<>();

    public Integer getPrimaryAccountId() 
    {
        return this.primaryAccountId;
    }

    public void setPrimaryAccountId(Integer primaryAccountId) throws InvalidDataException 
    {
    	Validation.isID(primaryAccountId, "Primary Account ID");
        this.primaryAccountId = primaryAccountId;
    }

    public Integer getCustomerId() 
    {
        return this.customerId;
    }

    public void setCustomerId(Integer customerId) throws InvalidDataException 
    {
    	Validation.isID(customerId, "Customer ID");
        this.customerId = customerId;
    }

    public Integer getMPin()
    {
        return this.mPin;
    }

    public void setMPin(Integer mPin) throws InvalidDataException
    {
    	Validation.isMobilePin(mPin);
        this.mPin = mPin;
    }

    public Integer getAccountNumber() 
    {
        return this.accountNumber;
    }

    public void setAccountNumber(Integer accountNumber) throws InvalidDataException 
    {
    	Validation.isValidAccountNumber(accountNumber);
        this.accountNumber = accountNumber;
    }

    public List<String> getDirtyFields() 
    {
        return this.dirtyFields;
    }

    public void addDirtyField(String column)
    {
        this.dirtyFields.add(column);
    	System.out.println(dirtyFields);
    }
    
    public void setDirtyField(List<String> dirtyFields) 
	{
		this.dirtyFields = dirtyFields;
	}

    @Override
    public String toString() 
    {
        StringBuilder sb = new StringBuilder();
        sb.append("PrimaryAccount: \n");
        sb.append("  primaryAccountId: ").append(primaryAccountId).append("\n");
        sb.append("  customerId: ").append(customerId).append("\n");
        sb.append("  accountNumber: ").append(accountNumber).append("\n");
        return sb.toString();
    }
}
