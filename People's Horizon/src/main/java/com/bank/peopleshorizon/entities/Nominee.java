package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;

public class Nominee extends PhoneNumber
{
    private Integer nomineeId;
    private String firstName;
    private String lastName;
    private String relationship;
    private String email;
    private Integer phoneNumberId;
    private Integer addressId;
	private List<String> dirtyFields = new ArrayList<>();

    public int getNomineeId() 
    {
        return this.nomineeId;
    }

    public void setNomineeId(int nomineeId) throws InvalidDataException 
    {
    	Validation.isID(nomineeId, "Nominee ID");
        this.nomineeId = nomineeId;
    }

    public String getFirstName() 
    {
        return this.firstName;
    }

    public void setFirstName(String firstName) throws InvalidDataException 
    {
    	Validation.isValidFirstName(firstName);
        this.firstName = firstName;
    }

    public String getLastName() 
    {
        return this.lastName;
    }

    public void setLastName(String lastName) throws InvalidDataException 
    {
    	Validation.isValidLastName(lastName); 	
        this.lastName = lastName;
    }

    public String getRelationship() 
    {
        return this.relationship;
    }

    public void setRelationship(String relationship) throws InvalidDataException 
    {
    	Validation.isValidName(relationship, "RelationShip");
        this.relationship = relationship;
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
    	Validation.isID(phoneNumberId, "Phone Number ID");
        this.phoneNumberId = phoneNumberId;
    }

    public Integer getAddressId() 
    {
        return this.addressId;
    }

    public void setAddressId(Integer addressId) throws InvalidDataException 
    {
    	Validation.isID(addressId, "Address ID");
        this.addressId = addressId;
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
	    sb.append("Nominee: \n");
	    sb.append("  nomineeId: ").append(nomineeId).append("\n");
	    sb.append("  firstName: ").append(firstName).append("\n");
	    sb.append("  lastName: ").append(lastName).append("\n");
	    sb.append("  relationship: ").append(relationship).append("\n");
	    sb.append("  email: ").append(email).append("\n");
	    sb.append("  phoneNumberId: ").append(phoneNumberId).append("\n");
	    sb.append("  addressId: ").append(addressId).append("\n");
	    return sb.toString();
	}

}
