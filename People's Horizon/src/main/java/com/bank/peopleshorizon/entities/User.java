package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.enums.Role;
import com.bank.peopleshorizon.enums.Status;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.validation.Validation;

public class User extends PhoneNumber
{
	private Integer userId;
	private String firstName;
	private String lastName;
	private String email;
	private Integer phoneNumberId;
	private Integer addressId;
	private String password; 
	private Role userType;
	private Status status;
	private List<String> dirtyFields = new ArrayList<>();
	
	public Integer getUserId()
	{
		return this.userId;
	}
	
	public void setUserId(Integer userId) throws InvalidDataException
	{
		Validation.isID(userId, "User ID");
		this.userId = userId;
	}
	
	public String getFirstName()
	{
		return this.firstName;
	}
	
	public void setFirstName(String firstName) throws InvalidDataException
	{
//		Validation.isValidFirstName(firstName);
		this.firstName = firstName;
	}
	
	public String getLastName()
	{
		return this.lastName;
	}
	
	public void setLastName(String lastName) throws InvalidDataException
	{
//		Validation.isValidLastName(lastName);
		this.lastName = lastName;
	}
	
	public String getEmail()
	{
		return this.email;
	}
	
	public void setEmail(String email) throws InvalidDataException
	{
		Validation.isValidEmail(email);
		this.email = email;
	}
	
	public Integer getPhoneNumberId()
	{
		return this.phoneNumberId;
	}
	
	public void setPhoneNumberId(Integer phoneNumberId) throws InvalidDataException
	{
		this.phoneNumberId = phoneNumberId;
	}
	
	public Integer getAddressId()
	{
		return this.addressId;
	}
	
	public void setAddressId(Integer addressId) throws InvalidDataException
	{
		this.addressId = addressId;
	}
	
	public String getPassword()
	{
		return this.password;
	}
	
	public void setPassword(String password) throws InvalidDataException
	{
		this.password = password;
	}
	
	public Role getUserType()
	{
		return this.userType;
	}
	
	public void setUserType(Role userType) throws InvalidDataException
	{
		Utility.assertNonNull(userType);
		this.userType = userType;
	}
	
	public Status getTransactionStatus()
	{
		return this.status;
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
	    sb.append("User: \n");
	    sb.append("  userId: ").append(userId).append("\n");
	    sb.append("  firstName: ").append(firstName).append("\n");
	    sb.append("  lastName: ").append(lastName).append("\n");
	    sb.append("  email: ").append(email).append("\n");
	    sb.append("  phoneNumberId: ").append(phoneNumberId).append("\n");
	    sb.append("  addressId: ").append(addressId).append("\n");
	    sb.append("  userType: ").append(userType).append("\n");
	    sb.append("  status: ").append(status).append("\n");
	    return sb.toString();
	}
}