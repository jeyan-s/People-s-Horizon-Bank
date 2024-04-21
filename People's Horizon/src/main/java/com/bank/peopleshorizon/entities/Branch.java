package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;

public class Branch 
{
    private Integer branchId;
    private String branchName;
    private Integer phoneNumberId;
    private Integer addressId;
    private String branchCode;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getBranchId() 
    { 
        return branchId; 
    }

    public void setBranchId(Integer branchId) throws InvalidDataException 
    { 
    	Validation.isID(branchId, "Branch ID");
        this.branchId = branchId; 
    }

    public String getBranchName() 
    { 
        return branchName; 
    }

    public void setBranchName(String branchName) throws InvalidDataException 
    { 
    	Validation.isValidName(branchName, "Branch Name");
        this.branchName = branchName; 
    }

    public Integer getPhoneNumberId() 
    { 
        return phoneNumberId; 
    }

    public void setPhoneNumberId(Integer phoneNumberId) throws InvalidDataException 
    { 
        this.phoneNumberId = phoneNumberId; 
    }

    public Integer getAddressId() 
    { 
        return addressId; 
    }

    public void setAddressId(Integer addressId) throws InvalidDataException 
    { 
        this.addressId = addressId; 
    }

    public String getBranchCode() 
    { 
        return branchCode; 
    }

    public void setBranchCode(String branchCode) throws InvalidDataException 
    { 
    	Validation.isIFSCCode(branchCode);
        this.branchCode = branchCode; 
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
	    sb.append("Branch: \n");
	    sb.append("  branchId: ").append(branchId).append("\n");
	    sb.append("  branchName: ").append(branchName).append("\n");
	    sb.append("  phoneNumberId: ").append(phoneNumberId).append("\n");
	    sb.append("  addressId: ").append(addressId).append("\n");
	    sb.append("  branchCode: ").append(branchCode).append("\n");
	    return sb.toString();
	}

}
