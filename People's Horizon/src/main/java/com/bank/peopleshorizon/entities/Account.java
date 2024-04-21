package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.validation.Validation;

public class Account extends Customer
{
    private Integer accountNumber;
    private Integer customerId;
    private Integer nomineeId;
    private Integer branchId;
    private Integer mPin;
    private String accountType;
    private double balance;
    private Status status;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getAccountNumber() 
    { 
        return accountNumber; 
    }

    public void setAccountNumber(Integer accountNumber) throws InvalidDataException 
    {
    	Validation.isValidAccountNumber(accountNumber);
        this.accountNumber = accountNumber; 
    }

    public Integer getCustomerId() 
    { 
        return customerId; 
    }

    public void setCustomerId(Integer customerId) throws InvalidDataException 
    { 
    	Validation.isID(customerId, "Customer ID");
        this.customerId = customerId; 
    }

    public Integer getNomineeId() 
    { 
        return nomineeId; 
    }

    public void setNomineeId(Integer nomineeId) throws InvalidDataException 
    { 
    	if (nomineeId != null)
    	{
    		Validation.isID(nomineeId, "Nominee ID");
    	}
        this.nomineeId = nomineeId; 
    }

    public Integer getBranchId() 
    { 
        return branchId; 
    }

    public void setBranchId(Integer branchId) throws InvalidDataException 
    { 
    	Validation.isID(branchId, "Branch ID");
        this.branchId = branchId; 
    }

    public Integer getMPin()
    {
        return mPin;
    }

    public void setMPin(Integer mPin) throws InvalidDataException
    {
    	Validation.isMobilePin(mPin);
        this.mPin = mPin;
    }

    public String getAccountType() 
    { 
        return accountType; 
    }

    public void setAccountType(String accountType) throws InvalidDataException 
    { 
    	Utility.assertNonNull(accountType);
        this.accountType = accountType; 
    }

    public double getBalance() 
    { 
        return balance; 
    }

    public void setBalance(double balance) throws InvalidDataException 
    { 
    	Validation.isValidAmount(balance);
        this.balance = balance; 
    }

    public Status getStatus() 
    { 
        return status; 
    }

    public void setStatus(Status status) throws InvalidDataException 
    { 
    	Utility.assertNonNull(status);
        this.status = status; 
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
	    sb.append("Account: \n");
	    sb.append("  accountNumber: ").append(accountNumber).append("\n");
	    sb.append("  customerId: ").append(customerId).append("\n");
	    sb.append("  nomineeId: ").append(nomineeId).append("\n");
	    sb.append("  branchId: ").append(branchId).append("\n");
	    sb.append("  accountType: ").append(accountType).append("\n");
	    sb.append("  balance: ").append(balance).append("\n");
	    sb.append("  status: ").append(status).append("\n");
	    return sb.toString();
	}

}
