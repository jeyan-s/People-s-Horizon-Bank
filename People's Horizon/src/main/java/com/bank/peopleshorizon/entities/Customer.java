package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;


public class Customer extends User
{
	private Integer id;
	private Integer customerId;
	private long aadharNumber;
	private String panNumber;
	private String fatherName;
	private String motherName;
	private List<String> dirtyFields = new ArrayList<>();
	
	public Integer getId()
	{
		return this.id;
	}
	
	public void setId(Integer id) throws InvalidDataException
	{
		this.id = id;
	}
	
	public Integer getCustomerId()
	{
		return this.customerId;
	}
	
	public void setCustomerId(Integer customerId) throws InvalidDataException
	{
		this.customerId = customerId;
	}
	
	public long getAadharNumber()
	{
		return this.aadharNumber;
	}
	
	public void setAadharNumber(long aadharNumber) throws InvalidDataException
	{
		Validation.isValidAadharNumber(aadharNumber);
		this.aadharNumber = aadharNumber;
	}
	
	public String getPanNumber()
	{
		return this.panNumber;
	}
	
	public void setPanNumber(String panNumber) throws InvalidDataException
	{
		Validation.isValidPAN(panNumber);
		this.panNumber = panNumber;
	}
	
	public String getFatherName()
	{
		return this.fatherName;
	}
	
	public void setFatherName(String fatherName) throws InvalidDataException
	{
//		Validation.isValidName(fatherName, "Father Name");
		this.fatherName = fatherName;
	}
	
	public String getMotherName()
	{
		return this.motherName;
	}
	
	public void setMotherName(String motherName) throws InvalidDataException
	{
//		Validation.isValidFirstName(motherName);
		this.motherName = motherName;
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
	    sb.append("Customer Information: \n");
	    sb.append("  id: ").append(id).append("\n");
	    sb.append("  customerId: ").append(customerId).append("\n");
	    sb.append("  aadharNumber: ").append(aadharNumber).append("\n");
	    sb.append("  panNumber: ").append(panNumber).append("\n");
	    sb.append("  fatherName: ").append(fatherName).append("\n");
	    sb.append("  motherName: ").append(motherName).append("\n");
	    return sb.toString();
	}

}