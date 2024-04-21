<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.peopleshorizon.entities.Transaction" %>
<%@ page import="com.bank.peopleshorizon.utility.Utility" %>

<!doctype html>
<html lang="en">
	<head>
        <title>People's Horizon</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Home.css">
    </head>
    
    
    
    <style>
    
    :root
    {
    	--headingColor: rgb(124 58 237);
    	--bodyColor: #ffffff;
    }
    
    body
    {
    	background-color: var(--bodyColor);
    	margin-top: -2vh;
    }
    
    				.main-content {
  margin-top: 10vh;
  margin-left: 17vw;
/*   display: flex; */
  display: grid;
  grid-template-columns: 1fr 1fr; 
  grid-template-rows: auto auto; 
  grid-gap: 20px;
}


 .profile-card 
 {
	 min-height: 27vh;
	 box-shadow: 0px 4px 30px -15px #673ab7;
	 background: #fff;
	 border-radius: 12px;
	 max-width: 38vw;
	 position: relative;
	 box-shadow: none;
	 border: 2px solid #e2e8f0;
}

 .profile-card__cnt {
	 text-align: center;
	 padding: 20px;
	 transition: all 0.3s;
}
 .profile-card__name 
 {
	 font-size: 2.1vw;
	 font-weight: bold !important;
	 color: rgb(124 58 237);
}

 .profile-card-ctr {
	 display: flex;
	 justify-content: center;
	 align-items: center;
}

 .zp-card {
	 color: black;
	 font-size: 20px;
   font-family: Roboto Flex, sans-serif;
	 margin-top: 10px;
/* 	 box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.12); */
	 background-color: #fff;
	 border-radius: 1px;
	 position: relative;
	 overflow: hidden;
}
 .zp-lst-wrapper {
	 clear: both;
	 border-bottom: 3px solid #eff2f7;
	 line-height: 27px;
	 margin: 15px;
	 position: relative;
}
 .zp-lst-wrapper .zp-left-label {
	 width: calc(50% - 20px);
	 float: left;
	 padding-top: 0 !important;
	 padding-right: 20px;
	 position: relative;
	 padding-bottom: 4px;
	 text-indent: 15px;
	 text-align: left;
	 font-weight: bold;
}
 .zp-lst-wrapper .zp-right-label {
	 text-align: left;
	 padding-top: 0 !important;
	 padding-right: 20px;
	 position: relative;
	 margin-bottom: 5px;
	 padding-bottom: 5px;
	 font-weight: bold;
	 color: #455a64;
}
 .zp-lst-wrapper::after {
	 content: "";
	 clear: both;
	 display: table;
}
 .zp-lst-wrapper:last-child {
	 border-bottom: none;
}
 
 .profile-card__cnt {
	 text-align: center;
	 padding: 20px;
	 transition: all 0.3s;
}

.balance-wrapper {
	min-height: 27vh;
  max-width: 38vw;
  box-shadow: 0px 4px 30px -15px rgba(13, 28, 39, 0.6);
  background: #fff;
  border-radius: 12px;
/*   position: relative; */
	 box-shadow: none;
	 border: 2px solid #e2e8f0;
}

.money-icon {
  width: 10vw;
  margin-left: 5vw;
}

.balance-left-label {
  float: left;
  width: 17vw;
}

.balance-amount 
{
  float: left;
  text-align: left;
  font-size: 2.5vw;
  width: 17vw;
  margin-top: 6.7vh;
  color: blue;
  font-weight: bold;
}


.transaction-wrapper {
	height: 50vh;
  box-shadow: 0px 4px 30px -15px rgba(13, 28, 39, 0.6);
  background: #fff;
  border-radius: 12px;
  top: 45vh;
  left: 19vw;
  width: 79vw; 
	 box-shadow: none;
	 border: 2px solid #e2e8f0;
}

.transaction-title {
  
}

.item:nth-child(3) {
  grid-column: span 2; 
}

.transaction-wrapper .profile-card__name {
/*   text-align: left; */
  
  margin-left: 1vw;
  margin-top: 2vh;
  font-weight: 500;
  font-size: 1.5rem;
}

.transaction-heading {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.view-all {
  color: rgb(139 92 246);
  margin-right: 2vw;
  gap: 0.5rem;
  align-items: center;
  display: inline-flex;
}

.view-all  span 
{
  font-family: Roboto Flex, sans-serif;
  font-size: 1.5rem;
  font-weight: bold;
  line-height: 1.5rem;
}

.view-all svg {
  width: 1.5vw;
}

.view-all:hover {
  color: rgb(76, 18, 207);
}

.transaction-data {
  display: grid;
}

.t-row {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
}

.t-cell 
{
	color: black;
	font-size: 2vh;
	padding: 1vw;
	padding-left: 2vw;
}

.t-data
{
	color: #64748b;
	font-weight: bold;
}

.type
{
	text-align: center;
	padding: 1vh;
	border-radius: 30px;
}



.t-header 
{
  font-weight: bold;
}


	table
	{
		margin-left: 1vw;
    	text-align: center;
    }

    
    </style>
    
    <style>
		.DashBoard
		{
			background-color: #ddd1fd;
			color: #8b5cf6;
		}
	</style>
    
    
    
    <body>
    
        <%@ include file = "../Sidebar.jsp" %>	
    	
    	<%
    		JSONObject profile = (JSONObject) request.getAttribute("profile");
			Object balance = request.getAttribute("balance");
			Object transactionsObj = request.getAttribute("transactions");
	        if (profile == null) profile = new JSONObject();
	        if (balance == null) balance = new JSONObject();
	        if (transactionsObj == null) transactionsObj = new JSONObject();
	        boolean customer = userRole == Role.CUSTOMER;
	        boolean emoloyee = userRole == Role.EMPLOYEE;
	        boolean admin = userRole == Role.ADMIN;
	        out.println(profile);
    	%>
    	
        
        <div class="main-content">
        
            <div class="item profile-wrapper">
                <div class="profile-card js-profile-card">
                <div class="profile-card__cnt js-profile-cnt">
                    <div class="profile-card__name">Welcome, <%= profile.opt("First Name") %> <%= profile.opt("Last Name") %> 👋</div>
                </div>
                <div class="zp-card">
                    <div class="zp-card-body">
                    <div class="zp-lst-wrapper">
                        <div class="zp-left-label">User ID</div>
                        <div class="zp-right-label"><%= profile.opt("User ID") %></div>
                    </div>
                    <div class="zp-lst-wrapper">
                        <div class="zp-left-label">Email ID</div>
                        <div class="zp-right-label"><%= profile.opt("Email") %></div>
                    </div>
                    <div class="zp-lst-wrapper">
                        <div class="zp-left-label">Phone Number</div>
                        <div class="zp-right-label"><%= profile.opt("Phone Number") %></div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
             <%
            	if (customer)
            	{
            %>
            <div class="item balance-wrapper">
                <div class="balance-card">
                <div class="profile-card__cnt js-profile-cnt">
                    <div class="profile-card__name">Account Balance</div>
                    <div class="balance-lst-wrapper">
                    <div class="balance-left-label">
                        <svg viewBox="0 0 1024 1024" class="money-icon icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <path d="M908.8 742.4c0 14.08-11.52 25.6-25.6 25.6H140.8c-14.08 0-25.6-11.52-25.6-25.6V358.4c0-14.08 11.52-25.6 25.6-25.6h742.4c14.08 0 25.6 11.52 25.6 25.6v384z" fill="#c8a1f7"></path>
                            <path d="M883.2 780.8H140.8c-21.76 0-38.4-16.64-38.4-38.4V358.4c0-21.76 16.64-38.4 38.4-38.4h742.4c21.76 0 38.4 16.64 38.4 38.4v384c0 21.76-16.64 38.4-38.4 38.4zM140.8 345.6c-7.68 0-12.8 5.12-12.8 12.8v384c0 7.68 5.12 12.8 12.8 12.8h742.4c7.68 0 12.8-5.12 12.8-12.8V358.4c0-7.68-5.12-12.8-12.8-12.8H140.8z" fill="#231C1C"></path>
                            <path d="M844.8 652.8V448c-28.16 0-51.2-23.04-51.2-51.2H230.4c0 28.16-23.04 51.2-51.2 51.2v204.8c28.16 0 51.2 23.04 51.2 51.2h563.2c0-28.16 23.04-51.2 51.2-51.2z" fill="#c8a1f7"></path>
                            <path d="M806.4 716.8H217.6v-12.8c0-21.76-16.64-38.4-38.4-38.4h-12.8V435.2h12.8c21.76 0 38.4-16.64 38.4-38.4v-12.8h588.8v12.8c0 21.76 16.64 38.4 38.4 38.4h12.8v230.4h-12.8c-21.76 0-38.4 16.64-38.4 38.4v12.8z m-564.48-25.6h540.16c5.12-25.6 24.32-44.8 49.92-49.92V459.52c-25.6-5.12-44.8-24.32-49.92-49.92H241.92c-5.12 25.6-24.32 44.8-49.92 49.92v181.76c25.6 5.12 44.8 24.32 49.92 49.92z" fill="#231C1C"></path>
                            <path d="M345.6 550.4a179.2 166.4 90 1 0 332.8 0 179.2 166.4 90 1 0-332.8 0Z" fill="#E1E0A6"></path>
                            <path d="M512 742.4c-98.56 0-179.2-85.76-179.2-192s80.64-192 179.2-192 179.2 85.76 179.2 192-80.64 192-179.2 192z m0-358.4c-84.48 0-153.6 74.24-153.6 166.4s69.12 166.4 153.6 166.4 153.6-74.24 153.6-166.4-69.12-166.4-153.6-166.4z" fill="#231C1C"></path>
                            <path d="M499.2 371.2h25.6v358.4h-25.6z" fill="#231C1C"></path>
                            <path d="M512 691.2c-21.76 0-42.24-8.96-56.32-24.32-12.8-14.08-20.48-33.28-20.48-52.48h25.6c0 12.8 5.12 25.6 14.08 34.56 10.24 10.24 23.04 16.64 37.12 16.64 28.16 0 51.2-23.04 51.2-51.2s-23.04-51.2-51.2-51.2c-42.24 0-76.8-34.56-76.8-76.8s34.56-76.8 76.8-76.8 76.8 34.56 76.8 76.8h-25.6c0-28.16-23.04-51.2-51.2-51.2s-51.2 23.04-51.2 51.2 23.04 51.2 51.2 51.2c42.24 0 76.8 34.56 76.8 76.8s-34.56 76.8-76.8 76.8z" fill="#231C1C"></path>
                        </g>
                        </svg>
                    </div>
                    <div class="balance-right-label balance-amount">₹ <%= Utility.getAmount(String.valueOf(balance)) %><div>
                        </div>
                    </div>
                    </div>

                </div>
                </div>
      
            </div>
            <%
            	}
            	else
            	{
            %>
            <div>
            </div>
            <%
            	}
            %>
            <div class="item transaction-wrapper">
                <div class="transaction-heading">
                <div class="profile-card__cnt js-profile-cnt">
                    <div class="profile-card__name">Recent Transactions</div>
                </div>
                <form action="/Peoples_Horizon/api/getAllTransactions" method="get">
                    <input type = "hidden" name = "type" value = "getAllTransactions">
                    <input type = "hidden" name = "page" value = "1">
                      <button type="submit" class="list-item">
                        <span class="list-span">Transactions</span>
                      </button>
                  </form>
                <a  href="/Peoples_Horizon/api/<%= customer ? "transactionHistory" : "getAllTransactions" %>" class="view-all">
                    <span>View all</span>
                    <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" viewBox="0 0 24 24" data-icon="lucide:arrow-right" class="iconify w-4 h-4 group-hover:translate-x-1 transition-transform duration-300 iconify--lucide">
                    <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14m-7-7l7 7l-7 7"></path>
                    </svg>
                </a>
                </div>
                <div class="transaction-data">
                <table>
                <center>
	                <thead>
		                <tr>
			                <div class="t-row t-header">
			                   <th><div class="t-cell">DATE</div></th>
								<th><div class="t-cell">RECIPIENT</div></th>
								<th><div class="t-cell">AMOUNT</div></th>
								<th><div class="t-cell">CLOSING BALANCE</div></th>
								<th><div class="t-cell">TYPE</div></th>
								<th><div class="t-cell">PAYMENT METHOD</div></th>

			                    
			                </div>
		                </tr>
	                </thead>
                
	                <tbody>
                	<%
                	if (transactionsObj != null && transactionsObj instanceof List) 
    	            {
    	                List<Transaction> transactions = (List<Transaction>) transactionsObj;
    	                for (Transaction x : transactions) 
    	                {
    	                	String type = x.getTransactionType();
    	                	boolean credit = type.equals("Credit");
    	                	String style = (credit ? "color: #2ac0af; background-color: #69f0ae40;" : "color: #f06292; background-color: #f8bbd040;"); 
                	%>
		                <tr>
			                <div class="t-row">
			                    <td><div class="t-data"><%= Utility.getDate(x.getTimeStamp()) %></div></td>
			                    <td><div class="t-data"><%= x.getTransferNumber() %></div></td>
			                    <td><div class="t-data"><%= Utility.getAmount(String.valueOf(x.getAmount())) %></div></td>
			                    <td><div class="t-data"><%= Utility.getAmount(String.valueOf(x.getClosingBalance())) %></div></td>
			                    <td><div class="t-data type" style = "<%= style %>"><%= type %></div></td>
			                    <td><div class="t-data"><%= x.getPaymentMethod() %></div></td>
			                </div>
			            </tr>
                <%
                		}
       	                if (transactions.size() == 0)
       	                {
                %>
                			<tr>
                			<div class="t-row">
                   				<td colspan = "6"><div class="t-cell">No Transactions Found !</div></td>
                   			</div>
                   			</tr>
                <%
       	                }
    	            }
                	else 
                    {
                %>
                		<tr>
                		<td>
                			<div class="t-row"></div></td>
                   			<td><div class="t-row"></div></td>
                   			<td><div class="t-row"></td>
                   				<td><div class="t-cell">No Transactions Found !</div></td>
                   			</div>
                <%
                	}
                %>
	                </tbody>
	                </center>
               
                </table>
                </div>
            </div>
            </div>
    </body>
    
    
</html>