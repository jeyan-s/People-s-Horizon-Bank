<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.peopleshorizon.entities.Transaction" %>
<%@ page import="com.bank.peopleshorizon.utility.Utility" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
	<link rel="stylesheet" type="text/css" href="/Peoples_Horizon/Login.css">
	<style>
		
		.body
		{
			margin-left: 17vw;
			margin-top: 10vh;
		}
		.next, .prev, .page
		{
		    padding: 1vh 2vw;
		    margin-top: 4vh;
		    font-size: 2.5vh;
		    font: bold 2.5vh Times New Roman;
		    background-color: #29b6f6;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		.next:hover, .prev:hover
		{
		    background-color: #0288d1;
		    color: rgb(250, 250, 250);
		}
		
		.heading h2
  {
  		font: 5vh solid black;
  		font-weight: bold;
		font-family: Garamond;
		color: #01579b;
  }
		.Transactions
		{
			background-color: #ddd1fd;
			color: #8b5cf6;
		}
	</style>
</head>
<body class = "body">

        <%@ include file = "../Sidebar.jsp" %>	
    <table border="1">
        <thead>
            <tr>
            	<h2>
	                <th>Transaction ID</th>
	                <th>Customer ID</th>
	                <th>Account Number</th>
	                <th>Transfer Number</th>
	                <th>Transaction Type</th>
	                <th>Payment Method</th>
	                <th>Amount</th>
	                <th>Timestamp</th>
	                <th>Closing Balance</th>
	                <th>Status</th>
                </h2>
            </tr>
        </thead>
        <tbody>
            <%
            String type = (String) request.getParameter("type");
            int currentPage = (int) request.getAttribute("page");
            int maxPage = (int) request.getAttribute("maxPage");
            int nextPage = currentPage + 1, prevPage = currentPage - 1;
            Object transactionsObj = request.getAttribute("transactions");
            if (transactionsObj != null && transactionsObj instanceof List) 
            {
                List<Transaction> transactions = (List<Transaction>) transactionsObj;
                for (Transaction transaction : transactions) 
                {
            %>
                    <tr>
                        <td><%= transaction.getTransactionId() %></td>
                        <td><%= transaction.getCustomerId() %></td>
                        <td><%= transaction.getAccountNumber() %></td>
                        <td><%= transaction.getTransferNumber() %></td>
                        <td><%= transaction.getTransactionType() %></td>
                        <td><%= transaction.getPaymentMethod() %></td>
                        <td><%= transaction.getAmount() %></td>
                        <td><%= Utility.getTimeStamp(transaction.getTimeStamp()) %></td>
                        <td><%= transaction.getClosingBalance() %></td>
                        <td><%= transaction.getStatus() %></td>
                    </tr>
            <%
                }
                if (transactions.size() == 0)
                {
            %>
               		<tr>
                      	<td colspan="10">No transactions found.</td>
                  	</tr>
            <%
                }
            }
            else 
            {
            %>
                <tr>
                    <td colspan="10">No transactions found.</td>
                </tr>
            <%
            }
            %>
        </tbody>
    </table>
    <center>
	    <div style = "display:grid; grid-template-columns: repeat(3, 10vw); justify-content:center">
	    	<div>
	    	<%
	    		if (currentPage > 1)
	    		{
	    	%>
			    <form action = "/Peoples_Horizon/api/<%= type %>?type=<%= type %>"> 
					<input type = "hidden" name = "page" value = "<%= prevPage %>">
			    	<button class = "prev" type = "submit" name = "type" value = "<%= type %>"> Prev > </button>
			    </form>
			<%
	    		}
			%>
			</div>
		    <div>
		   		<button class = "page" type = "submit" value = "<%= currentPage %>"> <%= currentPage %> </button>
		    </div>
		    <div>
		    <%
	    		if (currentPage < maxPage)
	    		{
	    	%>
			    <form action = "/Peoples_Horizon/api/<%= type %>"> 
					<input type = "hidden" name = "page" value = "<%= nextPage %>">
			    	<button class = "next" type = "submit" name = "type" value = "<%= type %>"> Next > </button>
			    </form>
		    <%
	    		}
			%>
			</div>
		</div>
		
    </center>
    <div style = "margin-bottom: 4vh"></div>
</body>
</html>
