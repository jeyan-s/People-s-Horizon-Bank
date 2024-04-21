package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.validation.Validation;


public class Employee extends User
{
    private Integer id;
    private Integer employeeId;
    private Integer branchId;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getId() 
    { 
        return id; 
    }
    
    public void setId(Integer id) throws InvalidDataException 
    { 
    	Validation.isID(id, "ID");
        this.id = id; 
    }
    
    public Integer getEmployeeId() 
    { 
        return employeeId; 
    }
    
    public void setEmployeeId(Integer employeeId) throws InvalidDataException 
    { 
    	Validation.isID(employeeId, "ID");
        this.employeeId = employeeId; 
    }

    public Integer getBranchId() 
    { 
        return branchId; 
    }
    
    public void setBranchId(Integer branchId) throws InvalidDataException 
    { 
    	Validation.isID(branchId, "ID");
        this.branchId = branchId; 
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
	    sb.append("Employee: \n");
	    sb.append("  id: ").append(id).append("\n");
	    sb.append("  employeeId: ").append(employeeId).append("\n");
	    sb.append("  branchId: ").append(branchId).append("\n");
	    return sb.toString();
	}

}
