<%@page import="org.json.JSONObject"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.peopleshorizon.utility.Utility" %>
<%@ page import="com.bank.peopleshorizon.enums.PaymentMethod" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/Peoples_Horizon/Login.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</head>
<style>
	
	.body
	{
		margin-left: 31vw;
		margin-top: 11vh;
		background-color: white;
	}
    
      .heading h2
  {
  		font: 4vh solid black;
  		font-weight: bold;
		font-family: Garamond;
		color: #01579b;
  }
  
    .statementProfile {
        display: flex;
        justify-content: space-between;
        align-items: flex-start; /* Align items at the start */
        margin-bottom: 20px;
        padding: 20px;
        margin-left: -13.5vw; /* Adjust 800px according to the width of your table */
    }

    .personal {
        font-size: 24px;
        color: #333333;
    }

    .name, .address 
    {
        display: block;
        word-wrap: break-word; /* Allow wrapping for long words */
    }

    .name {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .address 
    {
        font-style: italic;
    }

    /* Statement */
    .statement-div 
    {
        font-size: 24px;
        color: #666666;
        max-width: calc(100% - 20px - 800px); /* Adjust 800px according to the width of your table and 20px for padding */
        margin-right: calc((100% - 90vw) / 2); /* Adjust 800px according to the width of your table */
    }

    .statement-title,
    .statement-time 
    {
        font-size: 24px;
    }
	
	input[type="date"], .search
	{
		height: 5vh;
		width: 13vw;
		background-color: #29b6f6;
		border: none;
		color: white;	
	}
	.search
	{
		width: 8vw;
	}
	
	.statementTable
	{
		margin-left: -13vw;
	}
	
	.commonForm
	{
		margin-left: 27vw;
		margin-top: -2vh;
		height: 10vh;
	}
	
	.Statement
	{
		background-color: #ddd1fd;
		color: #8b5cf6;
	}

</style>

<body class = "body">

        <%@ include file = "../Sidebar.jsp" %>	
	<%
		List<JSONObject> rslt = (List<JSONObject>) request.getAttribute("rslt");
		JSONObject profile = (JSONObject) request.getAttribute("profile");
	%>
	<form class = "commonForm" action = "/Peoples_Horizon/api/getStatement" method = "post">
		<input type="date" name="from" placeholder = "From Date" required>
		<input type="date" id="to" name="to" placeholder = "To Date" required>
		<input type = "submit" value = "Search" class = "search"></input>
	</form>
	<div class = "statementProfile">
		<div class = "personal">
			<div class = "name">
				<%= profile.opt("First Name")%> <%= profile.opt("Last Name") %>
			</div>
			<div class = "address">
				<%= profile.opt("address") %>
			</div>
		</div>
		
		<div class = "statment-div">
			<div class = "statement-title">
				Account Statement as of
			</div> 
			<div class = "statement-time">
				<%= Utility.getDate((Long) request.getAttribute("from")) %>
				to 
				<%= Utility.getDate((Long) request.getAttribute("to")) %>
			</div>
		</div>
	</div>
	
	<table class = "statementTable" border="1">
        <thead>
            <tr>
		        <th>Time Stamp</th>
		        <th>Recipient Acct No.</th>
		        <th>Branch Name</th>
		        <th>Branch Code</th>
		        <th>Credit</th>
		        <th>Debit</th>
		        <th>Closing Balance</th>
		        <th>Payment Method</th>
		    </tr>
	   </thead>
       <tbody>
		    <% 
			    for (JSONObject x: rslt) 
			    {
			    	boolean isCredit = x.opt("Transaction Type").equals("Credit");
			    	String amount = x.opt("Amount").toString();
			    	String credit = (isCredit ? amount : "-");
			    	String debit = (isCredit ? "-" : amount);
		    %>
				    <tr>
				        <td><%= Utility.getTimeStamp((long) x.opt("Time Stamp")) %></td>
				        <td><%= x.opt("Transfer Number") %></td>
				        <td><%= x.opt("Branch Name") %></td>
				        <td><%= x.opt("Branch Code") %></td>
				        <td><%= credit %></td>
				        <td><%= debit %></td>
				        <td><%= x.opt("Closing Balance") %></td>
				        <td><%= PaymentMethod.values()[(int) x.opt("Payment Method")] %></td>
				    </tr>
		    <% 
		    	}
		    	if (rslt == null || rslt.size() == 0)
		    	{
		    %>
			    	<tr>
			    		<td colspan = "8"> No Transactions Found </td>
			    	</tr>
		    <%
		    	}
		    %>
	   </tbody>
</table>
</body>
</html>