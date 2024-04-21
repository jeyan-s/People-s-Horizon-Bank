package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;

public class Address 
{
    private Integer addressId;
    private String houseNumber;
    private String street;
    private String city;
    private String district;
    private String state;
    private int pinCode;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getAddressId() 
    { 
        return addressId; 
    }

    public void setAddressId(Integer addressId) throws InvalidDataException 
    { 
        this.addressId = addressId; 
    }

    public String getHouseNumber()
    { 
        return houseNumber; 
    }

    public void setHouseNumber(String houseNumber)  throws InvalidDataException 
    { 
    	if (houseNumber != null)
    	{
    		Validation.isValidHouseNumber(houseNumber);
    	}
        this.houseNumber = houseNumber; 
    }

    public String getStreet() 
    { 
        return street; 
    }

    public void setStreet(String street) throws InvalidDataException 
    {     	
//    	Validation.isAlpha(street, "Street");
        this.street = street; 
    }

    public String getCity() 
    { 
        return city; 
    }

    public void setCity(String city) throws InvalidDataException 
    { 
//    	Validation.isAlpha(city, "City");
        this.city = city; 
    }

    public String getDistrict() 
    { 
        return district; 
    }

    public void setDistrict(String district) throws InvalidDataException 
    { 
//    	Validation.isAlpha(district, "District");
        this.district = district; 
    }

    public String getState() 
    { 
        return state; 
    }

    public void setState(String state) throws InvalidDataException 
    { 
    	Validation.isAlpha(state, "State");
        this.state = state; 
    }

    public int getPinCode() 
    { 
        return pinCode; 
    }

    public void setPinCode(int pinCode) throws InvalidDataException 
    { 
//    	Validation.isValidPincode(pinCode);
        this.pinCode = pinCode; 
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
	    sb.append("Address: \n");
	    sb.append("  addressId: ").append(addressId).append("\n");
	    sb.append("  houseNumber: ").append(houseNumber).append("\n");
	    sb.append("  street: ").append(street).append("\n");
	    sb.append("  city: ").append(city).append("\n");
	    sb.append("  district: ").append(district).append("\n");
	    sb.append("  state: ").append(state).append("\n");
	    sb.append("  pinCode: ").append(pinCode).append("\n");
	    return sb.toString();
	}

}
