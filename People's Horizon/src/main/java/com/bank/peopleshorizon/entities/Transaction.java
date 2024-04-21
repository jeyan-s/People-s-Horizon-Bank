package com.bank.peopleshorizon.entities;

import java.util.ArrayList;
import java.util.List;

import com.bank.peopleshorizon.enums.PaymentMethod;
import com.bank.peopleshorizon.enums.TransactionStatus;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.utility.Utility;
import com.bank.peopleshorizon.validation.Validation;
import com.mysql.cj.util.Util;

public class Transaction
{
    private Integer id;
    private Integer transactionId;
    private Integer customerId;
    private Integer accountNumber;
    private Integer transferNumber;
    private String transactionType;
    private PaymentMethod paymentMethod;
    private double amount;
    private long timeStamp;
    private double closingBalance;
    private TransactionStatus status;
    private String branchCode;
	private List<String> dirtyFields = new ArrayList<>();

    public Integer getId() 
    { 
        return id; 
    }

    public void setId(Integer id) throws InvalidDataException 
    { 
//    	Validation.isID(id, "ID");
        this.id = id; 
    }

    public Integer getTransactionId() 
    { 
        return transactionId; 
    }

    public void setTransactionId(Integer transactionId) throws InvalidDataException 
    { 
//    	Validation.isID(transactionId, "Transaction ID");
        this.transactionId = transactionId; 
    }

    public Integer getCustomerId() 
    { 
        return customerId; 
    }

    public void setCustomerId(Integer customerId) throws InvalidDataException 
    { 
//    	Validation.isID(customerId, "ID");
        this.customerId = customerId; 
    }

    public Integer getAccountNumber() 
    { 
        return accountNumber; 
    }

    public void setAccountNumber(Integer accountNumber) throws InvalidDataException 
    { 
    	Validation.isValidAccountNumber(accountNumber);
        this.accountNumber = accountNumber; 
    }

    public Integer getTransferNumber() 
    { 
        return transferNumber; 
    }

    public void setTransferNumber(Integer transferNumber) throws InvalidDataException 
    { 
//    	Validation.isValidAccountNumber(transferNumber);
        this.transferNumber = transferNumber; 
    }

    public String getTransactionType() 
    { 
        return transactionType; 
    }

    public void setTransactionType(String transactionType) throws InvalidDataException 
    { 
    	Utility.assertNonNull(transactionType);
        this.transactionType = transactionType; 
    }
    
    public PaymentMethod getPaymentMethod() 
    {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) throws InvalidDataException
    {
    	Utility.assertNonNull(paymentMethod);
        this.paymentMethod = paymentMethod;
    }
    
    public double getAmount() 
    { 
        return amount; 
    }

    public void setAmount(Double amount) throws InvalidDataException 
    { 
    	Validation.isValidAmount(amount);
        this.amount = amount; 
    }

    public long getTimeStamp() 
    { 
        return timeStamp; 
    }

    public void setTimeStamp(Long timeStamp) throws InvalidDataException 
    { 
    	Utility.assertNonNull(timeStamp);
        this.timeStamp = timeStamp; 
    }

    public double getClosingBalance() 
    { 
        return closingBalance; 
    }

    public void setClosingBalance(double closingBalance) throws InvalidDataException 
    { 
    	Validation.isValidAmount(closingBalance);
        this.closingBalance = closingBalance; 
    }

    public TransactionStatus getStatus() 
    { 
        return status; 
    }

    public void setStatus(TransactionStatus status) throws InvalidDataException 
    { 
    	Utility.assertNonNull(status);
        this.status = status; 
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
	    sb.append("Transaction: \n");
	    sb.append("  id: ").append(id).append("\n");
	    sb.append("  transactionId: ").append(transactionId).append("\n");
	    sb.append("  customerId: ").append(customerId).append("\n");
	    sb.append("  accountNumber: ").append(accountNumber).append("\n");
	    sb.append("  transferNumber: ").append(transferNumber).append("\n");
	    sb.append("  transactionType: ").append(transactionType).append("\n");
	    sb.append("  amount: ").append(amount).append("\n");
	    sb.append("  timeStamp: ").append(timeStamp).append("\n");
	    sb.append("  closingBalance: ").append(closingBalance).append("\n");
	    sb.append("  status: ").append(status).append("\n");
	    return sb.toString();
	}

}
