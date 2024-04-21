<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.StringJoiner" %>
<%@ page import="com.bank.peopleshorizon.enums.Status" %>
<%@ page import="com.bank.peopleshorizon.enums.Role" %>
<%@ page import="com.bank.peopleshorizon.entities.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Accounts</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <style>
  
  .body
  {
  		margin-left: 17vw;
  		margin-top: 8vh;
  }
  .heading 
  {
  		font: 5vh solid black;
  		font-weight: bold;
		font-family: Garamond;
		color: #01579b;
  }
  
  .commonButton, select, .select
{
    margin-top: 4vh;
    font-size: 2.5vh;
    font: bold 2.5vh Times New Roman;
    border: 1.5vh solid #29b6f6;
    cursor: pointer;
}

.commonButton:hover, .search
{
    background-color: #0288d1;
    background-color: #29b6f6;
}

input, select
{
    margin: 1vh;
    font-size: 2.2vh;
    height: 5.5vh;
    border-width:0.3vh;	
}

.search
{
	margin-top: 4vh;
}
  
    .dropbtn 
    {
      color: black;
      text-align: center;
      cursor: pointer;
      min-width: 9.5vw;
    }

    .dropdown-div 
    {
        margin-top: 1vh;
        margin-left: 8vw;
        margin-bottom: -4vh;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdownNew 
    {
      	display: inline-block;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content 
    {
      display: none;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
      transition: max-height 0.5s ease;
      overflow-y: auto;
      max-height: 16vh;
    }

    /* Links inside the dropdown */
    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {background-color: #f1f1f1;}
    
    .dropdownNew-container {
        display: flex;
        position: relative;
        z-index: 999; /* Set a high z-index to ensure dropdown is on top */
    }

    
    .dropdown-div
    {
    	margin-top: 3vh;
    }
    .search-div
    {
      margin-left: 25vw;
      margin-top: -3vh;
    }
    
    .next, .prev, .page
		{
			min-width: 5vw;
		    padding: 1vh 4vw;
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

		.cards-wrapper {
      display: flex;
      justify-content: center;
      align-items: center; 
    }
  
    .cards-container {
      width: 70vw;
      display: grid;
      grid-template-columns: repeat(2, 1fr); 
      grid-gap: 20px;
    }

    .common-card {
      border-radius: 2px;
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
      transition: all 0.3s ease;
      padding: 0 2vw;
      background-image: linear-gradient(-20deg, #7266251f 10%, #b39c1d1f 80%);
      display: grid;
      max-width: 30vw;
    }

    .status {
      text-align: right;
      text-transform: uppercase;
      font-weight: bold;
      font-size: 20px;
      margin-top: 2vh;
    }

    .title {
      text-align: center;
      padding: 10px 0;
      font-weight: bold;
    }

    .title i {
      font-size: 2.5em;
      line-height: 2em;
      border-radius: 50%;
      background-color: #fff;
      height: 75px;
      width: 75px;
      color: #546e7a;
      margin-top: -6em;
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }

    .content {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
    }

    .common-card-info {
      margin: 10px 0;
      font-size: 20px;
    }

    .common-card-info .title {
      text-align: left;
      margin: 0;
      padding: 5px 0;
    }

    .footer {
      text-align: center;
    }

    .action {
      display: flex;
      justify-content: center;
    }

    .action-btn {
      color: white;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 10px 10px;
      cursor: pointer;
      border-radius: 4px;
      width: 85px;
      margin-bottom: 2vh;
    }

    .edit-btn {
      background-color: #304ffe;
      font-weight: bold;
    }

    .delete-btn {
      background-color: red;
      font-weight: bold;
    }

    .edit-btn:hover {
      background-color: #1a237e;
    }

    .delete-btn:hover {
      background-color: #b71c1c;
    }
    
    .active-style {
      color: #1de9b6;
    }

    .blocked-style {
      color: red;
     }
  </style>
  
  
  
  
  
  
</head>
<body class = "body">

	<%@ include file = "Sidebar.jsp" %>

<%!
	
	public String getCombined(JSONObject fields, String[] addressData, int size, String sep)
	{
		StringJoiner columns = new StringJoiner(sep);
		for (String x: addressData)
		{
			Object field = fields.opt(x);
	     	String value = (field == null ? "" : field).toString();
			if (field != null) columns.add(value);
			fields.remove(x);
		}
		return columns.toString();		
	}
%>

<%


	int currentPage = (int) request.getAttribute("page");
	int maxPage = (int) request.getAttribute("maxPage");
	int nextPage = currentPage + 1, prevPage = currentPage - 1;
	
	List<Integer> customerIds = (List<Integer>) request.getAttribute("customerIds");
	List<String> branchCodes = (List<String>) request.getAttribute("branchCodes");
	List<Integer> employeeIds = (List<Integer>) request.getAttribute("employeeIds");
	
	String tmp = request.getParameter("customerId");
	Integer cid = (tmp == null || tmp.equals("All") ? null : Integer.parseInt(tmp));
	String bCode = (String) request.getParameter("branchCode");
	String type = (String) request.getParameter("type");
	
	boolean accountsPage = type.equals("Accounts");
	boolean usersPage = type.equals("Users");
	boolean employeesPage = type.equals("Employees");
	
	String uri = request.getContextPath();
	String url = "getAllAccounts";
	if (usersPage) url = "getUsers";
	if (employeesPage) url = "getAllEmployees";
	

    Object rslt = request.getAttribute("rslt");
    
    

    String activeStyle = "background: linear-gradient(to right,  #84ffff, #64ffda 100%);";
    String blockedStyle = "background: linear-gradient(to right,  #f8bbd0, #f48fb1 100%);";
%>
<div class = "heading">
  <h2 class = "heading"><center>Manage <%= type %></center></h2>
</div>

<form action = "<%= uri %>/api/<%= url %>" method = "post">
<input type = "hidden" name = "page" value = "1">
<div class="dropdown-div" style = "display: flex">
	<div class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent1')">
	  
	  <%
		  if (accountsPage || usersPage)
		  {
	  %>
		  <select id = "status" class="dropbtn" name = "customerId">
			  <div class="dropdown-content" id="dropdownContent1">
	   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
			  <%
			  		for (Integer customerId: customerIds)
			  		{
			  %>
			  	    <option value="<%= customerId %>" onclick="selectOption('Option 1', 'dropdownButton1')" <%= customerId.equals(cid) ? "selected" : "" %>><%= customerId %></option>
			  <%
			  		}
			  %>
			  </div>
		  <select>
	 <%
	 		}
	 %>
	 
	 <%
		  if (usersPage && false)
		  {
	  %>
		  <select id = "status" class="dropbtn" name = "userId">
			  <div class="dropdown-content" id="dropdownContent1">
	   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
			  <%
			  		for (Role role: Role.values())
			  		{
			  %>
			    		<option href="#" onclick="selectOption('Option 1', 'dropdownButton1')"  %>><%= role %></option>
			  <%
			  		}
			  %>
			  </div>
		  <select>
	 <%
	 		}
	 %>
	</div>
	
	<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
	  <%
		  if (accountsPage || employeesPage)
		  {
	  %>
		<select class="dropbtn" name = "branchCode">
		  <div class="dropdown-content" id="dropdownContent2">
   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
		
		   <%
		  		for (String branchCode: branchCodes)
		  		{
		  %>
		  			  <option href="#" onclick="selectOption('Option A', 'dropdownButton2')"  <%= branchCode.equals(bCode) ? "selected" : "" %>> <%= branchCode %></option>
		  <%
		  		}
		  %>
		  </div>
		</select>
	  <%
		  	}
	  %>
	</div>
	
	<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
		<select class="dropbtn" name = "status">
		  <div class="dropdowNew-content" id="dropdownContent2">
   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
		   <%
		  		for (Status status: Status.values())
		  		{
		  %>
		  			  <option href="#" onclick="selectOption('Option A', 'dropdownButton2')"> <%= status %></option>
		  <%
		  		}
		  %>
		  </div>
		</select>
	</div>
	
	<%
		if (employeesPage)
		{
	%>
			<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
				<select class="dropbtn" name = "status">
				  <div class="dropdowNew-content" id="dropdownContent2">
		   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
				   <%
				  		for (Integer empId: employeeIds)
				  		{
				  %>
				  			  <option href="#" onclick="selectOption('Option A', 'dropdownButton2')"> <%= empId %></option>
				  <%
				  		}
				  %>
				  </div>
				</select>
			</div>
	<%
		}
	%>
	
	  <div class="search-div">
		<input type = "submit" value = "Search" class = "search commonButton"></input>
	  </div>
  </div>
</form>


<div class="cards-wrapper">
      
	    
	   <%
            if (rslt != null && rslt instanceof List) 
            {
            	List<JSONObject> users = (List<JSONObject>) rslt;
            	
                for (JSONObject entity: users) 
                {
                    JSONObject fields = new JSONObject(entity.toString());
                    
                    if (usersPage)
                	  {
                    		List<String> details = Arrays.asList("User Name", "Customer ID", "Pan Number", "Aadhar Number", "Address", "Phone Number", "Email");
		                    Role role = Role.values()[(Integer) fields.get("User Type")];
		                    fields.put("User Type", role);
		                    entity.put("User Type", role);
		                    String[] addressData = {"House Number", "Street", "City", "District", "State", "Pin Code"};
		                    String address = getCombined(fields, addressData, 6, ", ");
		                    fields.put("Address", address);
		                    String phone = getCombined(fields, new String[]{"Country Code", "Phone Number"}, 2, " ");
		                    fields.put("Phone Number", "+" + phone);
		                    String name = getCombined(fields, new String[]{"First Name", "Last Name"}, 2, " ");
		                    fields.put("User Name", name);
		                    boolean blocked = fields.get("Status").equals("BLOCKED");
       %>
       
		                	
							    <div class="cards-container" style = "<%= (blocked ? blockedStyle : activeStyle) %>">
							   		 <div class="common-card">
							                <div class="status verified">
							                    <%= fields.get("Status") %>
							                </div>
						                	 <div class="content">
						                	 
		       <% 
					                    		for (String key: details)
					                    		{
		       %>
									                  <div class="common-card-info">
									                      <p class="common-card-title"><%= key %></p>
									                      <p><%= fields.opt(key) %></p>
									                  </div>
			  <%
                    							}
			  %>
		    					
									    	 </div>
										     <div class="footer">
							                    <div class="action">
								                     <form action = "/Peoples_Horizon/Edit.jsp" method = "post">  
								                	 	<%
								                	 		for (String key: entity.keySet())
								                	 		{
								                	 	%>
								                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
								                	 	<%
								                	 		}
								                	 	%>
								                    	<input type = "hidden" name = "type" value = "Customer">
								         
								                        <button class="action-btn edit-btn" name = "action" value = "update">Edit</button>
								                    </form>
							                        <form action = "/Peoples_Horizon/api/deleteCustomer" method = "post">
								                	 	<input type = "hidden" name = "ID" value = "<%= entity.get("Customer ID") %>">	
							                     	   	<button class="action-btn delete-btn" name = "action" value = "delete">Delete</button>
							                     	</form>
							                    </div>
							                </div>
									</div>
								</div>
						
    			<%--
					    <div class="card">
				              <div class="card-body">
				                <div class="status verified col-sm-12">
				                    <%= entity.get("customerId") %>
				                </div>
				                <div class="row content col-sm-12">
				                  <div class="info col-xs-6">
				                      <p class="title">Account Number</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Customer ID</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Branch Code</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Account Type</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Balance</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Status</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                </div>
				                <div class="footer col-sm-12">
				                    <div class="action">
				                        <button class="action-btn edit-btn">Edit</button>
				                        <button class="action-btn delete-btn">Delete</button>
				                    </div>
				                </div>
				              </div>
					    </div>
				--%>
	    <% 
                	}
                    if (accountsPage)
                    {
                		List<String> details = Arrays.asList("Account Number", "Customer ID", "Branch Name", "Branch Code", "Balance", "Account Type");
	                    boolean blocked = fields.get("Status").equals("BLOCKED");
        %>	
							    <div class="cards-container" style = "<%= (blocked ? blockedStyle : activeStyle) %>">
							   		 <div class="common-card">
							                <div class="status verified">
							                    <%= entity.get("Status") %>
							                </div>
				                	 <div class="content">
				                	 
       <% 
       						int count = 0;
                    		for (String key: details)
                    		{
       %>
				                  <div class="common-card-info">
				             
				                      <p class="common-card-title"><%= key %></p>
				                      <p><%= fields.get(key) %></p>
				                  </div>
			  <%
                    		}
			  %>
    					
							    </div>
							     <div class="footer">
				                    <div class="action">
					                    <form action = "/Peoples_Horizon/Edit.jsp" method = "post">
				                    		<%
					                	 		for (String key: entity.keySet())
					                	 		{
					                	 	%>
					                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
					                	 	<%
					                	 		}
					                	 	%>
					                	 		     <input type = "hidden" name = "type" value = "Account">
					                       			 <button class="action-btn edit-btn">Edit</button>
					                    </form>
					                    
		                    			<form action = "/Peoples_Horizon/api/deleteAccount" method = "post">
					                	 	<input type = "hidden" name = "Account Number" value = "<%= entity.get("Account Number") %>">	
					                        <button class="action-btn delete-btn">Delete</button>
					                    </form>
				                    </div>
				                </div>
							</div>
						</div>
        				
        				
        				<%-- 
        					<input type = "hidden" name = "entity" value = "<%= entity %>">
        
        					<div class="card">
				              <div class="card-body">
				                <div class="status verified col-sm-12">
				                    <%= entity.get("branchName") %>
				                </div>
				                <div class="row content col-sm-12">
				                  <div class="info col-xs-6">
				                      <p class="title">Account Number</p>
				                      <p><%= entity.get("accountNumber") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Customer ID</p>
				                      <p><%= entity.get("customerId") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Branch Code</p>
				                      <p><%= entity.get("branchCode") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Account Type</p>
				                      <p><%= entity.get("accountType") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Balance</p>
				                      <p><%= entity.get("balance") %></p>
				                  </div>
				                  <div class="info col-xs-6">
				                      <p class="title">Status</p>
				                      <p><%= entity.get("status") %></p>
				                  </div>
				                </div>
				                <div class="footer col-sm-12">
				                    <div class="action">
				                    <form action = "/Peoples_Horizon/Edit.jsp" method = "post">  
				          
				        				<input type = "hidden" name = "type" value = "Account">
				        				<input type = "hidden" name = "entity" value = "<%= entity.toString() %>">
				        				<input type = "hidden" name = "primary" value = "<%= 1726 %>">
				        				
				                        <button class="action-btn edit-btn" value = "edit">Edit</button>
				                        <button class="action-btn delete-btn" value = "delete">Delete</button>
				                    </form>
				                    </div>
				                </div>
				              </div>
					    </div>
					--%>
        
        <%
                    }
                    if (employeesPage)
                    {
                		List<String> details = Arrays.asList("User Name", "Employee ID", "Branch ID", "Branch Name", "Address", "Phone Number", "Email");
	                    Role role = Role.values()[(Integer) fields.get("User Type")];
	                    fields.put("User Type", role);
	                    entity.put("User Type", role);
	                    String[] addressData = {"House Number", "Street", "City", "District", "State", "Pin Code"};
	                    String address = getCombined(fields, addressData, 6, ", ");
	                    fields.put("Address", address);
	                    String phone = getCombined(fields, new String[]{"Country Code", "Phone Number"}, 2, " ");
	                    fields.put("Phone Number", "+" + phone);
	                    String name = getCombined(fields, new String[]{"First Name", "Last Name"}, 2, " ");
	                    fields.put("User Name", name);
	                    boolean blocked = fields.get("Status").equals("BLOCKED");
   %>
   
	                	
						    <div class="cards-container" style = "<%= (blocked ? blockedStyle : activeStyle) %>">
						   		 <div class="common-card">
						                <div class="status verified">
						                    <%= fields.get("Status") %>
						                </div>
					                	 <div class="content">
					                	 
	       <% 
				                    		for (String key: details)
				                    		{
	       %>
								                  <div class="common-card-info">
								                      <p class="common-card-title"><%= key %></p>
								                      <p><%= fields.opt(key) %></p>
								                  </div>
		  <%
                							}
		  %>
	    					
								    	 </div>
									     <div class="footer">
						                    <div class="action">
							                    <form action = "/Peoples_Horizon/Edit.jsp" method = "post">  
							                	 	<%
							                	 		for (String key: entity.keySet())
							                	 		{
							                	 	%>
							                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
							                	 	<%
							                	 		}
							                	 	%>
							                    	<input type = "hidden" name = "type" value = "'Employee">
							         
							                        <button class="action-btn edit-btn" name = "action" value = "update">Edit</button>
							                    </form>
						                        <form action = "/Peoples_Horizon/api/deleteCustomer" method = "post">
							                	 	<input type = "hidden" name = "Employee ID" value = "<%= entity.get("Employee ID") %>">	
						                     	   	<button class="action-btn delete-btn" name = "action" value = "delete">Delete</button>
						                     	</form>
						                    </div>
						                </div>
								</div>
							</div>
					
			<%--
				    <div class="card">
			              <div class="card-body">
			                <div class="status verified col-sm-12">
			                    <%= entity.get("customerId") %>
			                </div>
			                <div class="row content col-sm-12">
			                  <div class="info col-xs-6">
			                      <p class="title">Account Number</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                  <div class="info col-xs-6">
			                      <p class="title">Customer ID</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                  <div class="info col-xs-6">
			                      <p class="title">Branch Code</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                  <div class="info col-xs-6">
			                      <p class="title">Account Type</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                  <div class="info col-xs-6">
			                      <p class="title">Balance</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                  <div class="info col-xs-6">
			                      <p class="title">Status</p>
			                      <p><%= entity.get("customerId") %></p>
			                  </div>
			                </div>
			                <div class="footer col-sm-12">
			                    <div class="action">
			                        <button class="action-btn edit-btn">Edit</button>
			                        <button class="action-btn delete-btn">Delete</button>
			                    </div>
			                </div>
			              </div>
				    </div>
			--%>
    <% 
            		}    
		        } 
		    }
	    %>
	    
	    
</div>




   <center>
	    <div style = "display:grid; grid-template-columns: repeat(3, 20vw); justify-content:center">
	    	<div>
	    	<%
	    		if (currentPage > 1)
	    		{
	    	%>
			    <form action = "/Peoples_Horizon/api/<%= url %>?type=<%= type %>"> 
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
			    <form action = "/Peoples_Horizon/api/<%= url %>"> 
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

	<%@ include file = "Script.jsp" %>






</body>
</html>
