package com.bank.peopleshorizon.databaseutils;

public class Condition 
{
    private String columnName;
    private String operator;
    private int value;

    public Condition() {}

    public Condition(String columnName, String operator, int value) 
    {
        this.columnName = columnName;
        this.operator = operator;
        this.value = value;
    }

    public String getColumnName() 
    {
        return columnName;
    }

    public void setColumnName(String columnName) 
    {
        this.columnName = columnName;
    }

    public String getOperator() 
    {
        return operator;
    }

    public void setOperator(String operator) 
    {
        this.operator = operator;
    }

    public int getValue() 
    {
        return value;
    }

    public void setValue(int value) 
    {
        this.value = value;
    }

    public String toString() 
    {
        return columnName + " " + operator + " " + value + " ";
    }
}
