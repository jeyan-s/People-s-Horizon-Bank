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
      color: white;
      text-align: center;
      cursor: pointer;
      min-width: 9.5vw;
      background-color: #7c3aed;
      border: none;
      height: 5.5vh;
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
      margin-left: 12vw;
      margin-top: -3vh;
      display: inline-block;
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
	  margin-top: 6vh;
	  margin-left: 1vw;
    }
  
    .cards-container {
      width: 70vw;
      display: grid;
      grid-template-columns: repeat(2, 1fr); 
      grid-gap: 20px;
    }

    .common-card 
   {
      border-radius: 2px;
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
      transition: all 0.3s ease;
      padding: 0 2vw;
      background: linear-gradient(to bottom, #F0E6F8, #DCD0F1, #C8B4EA, #B59AE3);
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

/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  width: 30%;
  font-size: 20px;
}

.cancelbtn {
	color: white;
	font-weight: bold;
  height: 5vh;
  background-color: red;
  background-color: #ccc;
}

.deletebtn {
color: white;
font-weight: bold;
  background-color: red;
  height: 5vh;
}

.container {
  padding: 40px;
  text-align: center;
}

.container p {
	font-size: 18px;
}

.modal 
{
  display: none; 
  position: fixed; 
  z-index: 1; 
  left: 17vw;
  top: 10vh;
  overflow: auto; 
  background-color: white;
  padding-top: 10px;
  height: 90vh;
  width: 83vw;
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; 
  border: 1px solid #888;
  width: 50%; 
}


hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 

.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}


.clearfix::after {
  content: "";
  clear: both;
  display: table;
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
	String sts = request.getParameter("status");
	Integer cid = (tmp == null || tmp.equals("Customer ID") ? null : Integer.parseInt(tmp));
	Status stat = (sts == null || sts.equals("Status") ? null : Status.valueOf(sts));
	String bCode = (String) request.getParameter("branchCode");
	String type = (String) request.getParameter("type");
	
	boolean accountsPage = type.equals("Accounts");
	boolean usersPage = type.equals("Users");
	boolean employeesPage = type.equals("Employees");
	boolean branchPage = type.equals("Branch");
	
	String uri = request.getContextPath();
	String url = "getAllAccounts";
	if (usersPage) url = "getUsers";
	if (employeesPage) url = "getAllEmployees";
	if (branchPage) url = "getAllBranch";
	if (accountsPage) url = "getAllAccounts";
	

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
	   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">Customer ID</option>
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
	 

	</div>
	
	<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
	  <%
		  if ((accountsPage || employeesPage) && userRole == Role.ADMIN || branchPage)
		  {
	  %>
		<select class="dropbtn" name = "branchCode">
		  <div class="dropdown-content" id="dropdownContent2">
   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">Branch Name</option>
		
		   <%
		  		for (Object branchCode: branchCodes)
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
	
	<%
		  if (accountsPage || employeesPage || usersPage)
		  {
	  %>
	<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
		<select class="dropbtn" name = "status">
		  <div class="dropdowNew-content" id="dropdownContent2">
   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">Status</option>
		   <%
		  		for (Status status: Status.values())
		  		{
		  %>
		  			  <option href="#" onclick="selectOption('Option A', 'dropdownButton2')"<%= status == stat ? "selected" : "" %>><%= status %></option>
		  <%
		  		}
		  %>
		  </div>	
		</select>
	</div>
	
	
	<%
		  }
		if (employeesPage)
		{
	%>
			<div id = "branch" class="dropdownNew" onclick="toggleDropdown(event, 'dropdownContent2')">
				<select class="dropbtn" name = "employeeId">
				  <div class="dropdowNew-content" id="dropdownContent2">
		   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">Employee ID</option>
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
	
	
	
	
	
	  <div class="search-div" style = "margin-left: 0vw; margin-top: -3vh">
		<input type = "submit" value = "Search" class = "search commonButton"></input>
	  </div>
  </div>
</form>

	<%
		if (employeesPage)
		{
	%>
		<div  class="search-div">
			 <form action="/Peoples_Horizon/Create_Account.jsp?type=addEmployee" method="post">
                 <button class = "search commonButton" type="submit" class="list-item"  style = "margin-left: 45vw; margin-top: -20vh !important">
                   <span class="list-span">Add Employee</span>
                 </button>
             </form>
         </div>
	<%
		}
	%>
	
	<%
		if (usersPage)
		{
	%>
		<div  class="search-div">
			 <form action="/Peoples_Horizon/Create_Account.jsp?type=addCustomer" method="post">
			 	 <input type = "hidden" name = "type" value = "addCustomer">
                 <button class = "search commonButton" type="submit" class="list-item"  style = "margin-left: 45vw; margin-top: -20vh !important">
                   <span class="list-span">Add Customer</span>
                 </button>
             </form>
         </div>
	<%
		}
	%>
	
	<%
		if (accountsPage)
		{
	%>
		<div  class="search-div">
			 <form action="/Peoples_Horizon/Create_Account.jsp?type=createAccount" method="post">
                 <button class = "search commonButton" type="submit" class="list-item"  style = "margin-left: 45vw; margin-top: -20vh !important">
                   <span class="list-span">Add Account</span>
                 </button>
             </form>
         </div>
	<%
		}
	%>
	
	<%
		if (branchPage)
		{
	%>
		<div  class="search-div">
			 <form action="/Peoples_Horizon/Create_Account.jsp?type=addBranch" method="post">
                 <button class = "search commonButton" type="submit" class="list-item"  style = "margin-left: 45vw; margin-top: -20vh !important">
                   <span class="list-span">Add Branch</span>
                 </button>
             </form>
         </div>
	<%
		}
	%>
	
	


<div class="cards-wrapper">
    <div class="cards-container">   
	    
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
									                      <p class="title"><%= key %></p>
									                      <p><%= fields.opt(key) %></p>
									                  </div>
			  <%
                    							}
			  %>
		    					
									    	 </div>
										     <div class="footer">
							                    <div class="action">
								                     <form action = "/Peoples_Horizon/Create_Account.jsp" method = "post">  
								                	 	<%
								                	 		for (String key: entity.keySet())
								                	 		{
								                	 	%>
								                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
								                	 	<%
								                	 		}
								                	 	%>
								                    	<input type = "hidden" name = "type" value = "updateCustomer">
								         
								                        <button class="action-btn edit-btn" name = "action" value = "update">Edit</button>
								                    </form>
													<form id="deleteForm" action="/Peoples_Horizon/api/deleteCustomer" method="POST" onsubmit="return false;">
								                	 	<input type = "hidden" name = "ID" value = "<%= entity.get("Customer ID") %>">	
														<button onclick="document.getElementById('deleteModal').style.display='block'" class="action-btn delete-btn" name = "action" value = "delete">Delete</button>
							                     	</form>
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
				             
				                      <p class="title"><%= key %></p>
				                      <p><%= fields.get(key) %></p>
				                  </div>
			  <%
                    		}
			  %>
    					
							    </div>
							     <div class="footer">
				                    <div class="action">
					                    <form action = "/Peoples_Horizon/Create_Account.jsp" method = "post">
				                    		<%
					                	 		for (String key: entity.keySet())
					                	 		{
					                	 	%>
					                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
					                	 	<%
					                	 		}
					                	 	%>
					                	 		     <input type = "hidden" name = "type" value = "updateAccount">
					                       			 <button class="action-btn edit-btn">Edit</button>
					                    </form>
					                    
		                    			<form  id="deleteForm" action = "/Peoples_Horizon/api/deleteAccount" method = "POST"  onsubmit="return false;">
					                	 	<input type = "hidden" name = "Account Number" value = "<%= entity.get("Account Number") %>">	
					                        <button  onclick="document.getElementById('deleteModal').style.display='block'"  class="action-btn delete-btn">Delete</button>
					                    </form>
				                    </div>
				                </div>
							</div>
        				
        
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
								                      <p class="title"><%= key %></p>
								                      <p><%= fields.opt(key) %></p>
								                  </div>
		  <%
                							}
		  %>
	    					
								    	 </div>
									     <div class="footer">
						                    <div class="action">
							                    <form action = "/Peoples_Horizon/Create_Account.jsp" method = "post">  
							                	 	<%
							                	 		for (String key: entity.keySet())
							                	 		{
							                	 	%>
							                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
							                	 	<%
							                	 		}
							                	 	%>
							                    	<input type = "hidden" name = "type" value = "updateEmployee">
							         
							                        <button class="action-btn edit-btn" name = "action" value = "update">Edit</button>
							                    </form>
						                        <form  id="deleteForm" action = "/Peoples_Horizon/api/deleteEmployee" method = "post"  onsubmit="return false;">
							                	 	<input type = "hidden" name = "Employee ID" value = "<%= entity.get("Employee ID") %>">	
						                     	   	<button  onclick="document.getElementById('deleteModal').style.display='block'"  class="action-btn delete-btn" name = "action" value = "delete">Delete</button>
						                     	</form>
						                    </div>
						                </div>
								</div>
   				<% 
            		}    
                    if (branchPage)
                    {
                		List<String> details = Arrays.asList("Branch ID", "Branch Name", "Branch Code", "Address", "Phone Number");
	                    String[] addressData = {"Street", "City", "District", "State", "Pin Code"};
	                    String address = getCombined(fields, addressData, 5, ", ");
	                    fields.put("Address", address);
	                    String phone = getCombined(fields, new String[]{"Country Code", "Phone Number"}, 2, " ");
	                    fields.put("Phone Number", "+" + phone);
	    		%>
	    
	    			
						   		 <div class="common-card">
						                <div class="status verified">
						                    <%= fields.get("Branch Name") %>
						                </div>
					                	 <div class="content">
					                	 
	       								<% 
				                    		for (String key: details)
				                    		{
	      								%>
								                  <div class="common-card-info">
								                      <p class="title"><%= key %></p>
								                      <p><%= fields.opt(key) %></p>
								                  </div>
		  								<%
                							}
		  								%>
	    					
								    	 </div>
									     <div class="footer">
						                    <div class="action">
							                    <form action = "/Peoples_Horizon/Create_Account.jsp" method = "post">  
							                	 	<%
							                	 		for (String key: entity.keySet())
							                	 		{
							                	 	%>
							                	 			<input type = "hidden" name = "<%= key %>" value = "<%= entity.get(key) %>">		                	 		
							                	 	<%
							                	 		}
							                	 	%>
							                    	<input type = "hidden" name = "type" value = "updateBranch">
							         
							                        <button class="action-btn edit-btn" name = "action" value = "update">Edit</button>
							                    </form>
						                        <form  id="deleteForm" action = "/Peoples_Horizon/api/deleteBranch" method = "post"  onsubmit="return false;">
							                	 	<input type = "hidden" name = "Branch ID" value = "<%= entity.get("Branch ID") %>">	
						                     	   	<button  onclick="document.getElementById('deleteModal').style.display='block'"  class="action-btn delete-btn" name = "action" value = "delete">Delete</button>
						                     	</form>
						                    </div>
						                </div>
								</div>
					
	    
	    
	    
	    <%
                    }
		        } 
		    }
	    %>
	    
	</div>   
</div>




   <center>
	    <div style = "display:grid; grid-template-columns: repeat(3, 20vw); justify-content:center">
	    	<div>
	    	<%
	    		if (currentPage > 1)
	    		{
	    	%>
			    <form action = "/Peoples_Horizon/api/<%= url %>?type=<%= type %>" method = "post"> 
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
			    <form action = "/Peoples_Horizon/api/<%= url %>" method = "post"> 
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

<script>
function deleteAccount() {
  // Submit the form
  document.getElementById('deleteForm').submit();

  // Close the modal
  document.getElementById('deleteModal').style.display = 'none';
}
</script>


<div id="deleteModal" class="modal">
  <span onclick="document.getElementById('deleteModal').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content" action="">
    <div class="container">
      <h1>Are you Sure want to Delete ?</h1>
    
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('deleteModal').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="button" onclick="deleteAccount()" class="deletebtn">Delete</button>
      </div>
    </div>
  </form>
</div>



</body>
</html>
