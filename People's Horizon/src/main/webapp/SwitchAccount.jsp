<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.bank.peopleshorizon.entities.Account" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Switch Account</title>
    <style>
    
    .heading h2
  {
  		font: 5vh solid black;
  		font-weight: bold;
		font-family: Garamond;
		color: #01579b;
  }
  
  body 
{
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: rgb(234, 244, 254);
}
 

    .container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    h1 {
      color: #2980b9;
    }

    .accounts {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .account {
      margin: 20px;
      padding: 20px;
      background-color: #ecf0f1;
      border-radius: 20px;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
      display: flex;
      align-items: center;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .account:hover 
    {
      background-color: #dfe6e9;
      transform: translateY(-5px);
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    }

    .circle {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #448aff;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 24px;
      color: #fff;
      margin-right: 20px; 
    }

    .account-info 
    {
      flex: 1; 
      text-align: left; 
    }

    .account p 
    {
      color: #34495e;
      font-size: 2.3vh;
      font-weight: bold;
      margin: 5px 0;
    }

    .current-account 
    {
      border: 2px solid #2980b9;
      box-shadow: 0 0 20px rgba(41, 128, 185, 0.5);
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
	
	.card, .account
    {
	    width: 18vw;
	    height: 10vh;
        border-radius: 2px;
        transition: all 0.3s ease;
        background-image: linear-gradient(-20deg, #d9f1f9 40%, #a4d4f2 80%);
    }
  </style>
   <link rel = "stylesheet" href = "Login.css">
</head>
<body>
    <div class="container">
		<div class = "heading">
		  <h2><center> Switch Account </center></h2>
		</div>
        <div class="accounts">
            <%
                List<JSONObject> accounts = (List<JSONObject>) request.getAttribute("rslt");
            	
                for (JSONObject account: accounts)
                {
                    int accountNumber = (int) account.get("Account Number");
                    String branchName = (String) account.get("Branch Name");
                    String branchCode = (String) account.get("Branch Code");
                    String firstLetter = "";
                    if (branchName != null && !branchName.isEmpty()) 
                    {
                         firstLetter = branchName.substring(0, 1);
                    }
            %>
            
            <form action = "/Peoples_Horizon/api/switchAccount?accountNumber=<%= accountNumber %>" method = "post">
            	<button style = "border:none;background-color:white" type = "submit">
		            <div class="account" >
		                <div class="circle"><%= firstLetter %></div>
                    <div class="account-info">
                      <p><%= accountNumber %></p>
                      <p><%= branchCode %></p>
                      <p><%= branchName %></p>
                    </div>
		            </div>
	           	</button>
	        </form>
            <%
                }
            %>
        </div>
				<form action = "/Peoples_Horizon/Dummy.jsp"> 
					<input type = "hidden" name = "user" value = "customer">
			    	<button class = "next" type = "submit" name = "type"> Go Home </button>
			    </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
