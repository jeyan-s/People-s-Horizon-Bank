
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Collections" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <link rel="stylesheet" href="Login.css"> 
    <style>	
    	.body
    		{
    			margin-left: 16vw;
    			margin-top: 15vh;
    			height: 80vh;
    			align-items: center;
    		}
    		.container
    		{
    			margin-left: 20vw;
    		}
    	
		input
		{
			width: 31.4vw;
		}
		h3
		{
			font-size: 3vh;
		}
		label
		{
			margin-left: -20vw;
			text-align: left;
			display: block;
			padding-top: 1vh;
			width: 10vw;
		}
		
		#FirstHalf
		{
			margin-left: -20vw;
			margin-bottom: -20vh;
			display: inline-block;
			height: 1vh;
		}
		
		#LastHalf
		{
			margin-left: 13vw;
		}
		
		.label, label
		{
			color: blue;
		}

	</style>
	
	



</head>
<body class = "body">
	<%@ include file = "Sidebar.jsp" %>
<%
    String customerId = request.getParameter("Customer ID");
    String firstName = request.getParameter("First Name");
    String lastName = request.getParameter("Last Name");
    String email = request.getParameter("Email");
    String aadharNumber = request.getParameter("Aadhar Number");
    String panNumber = request.getParameter("Pan Number");
    String fatherName = request.getParameter("Father Name");
    String motherName = request.getParameter("Mother Name");
    String branchCode = request.getParameter("Branch Code");
    String branchName = request.getParameter("Branch Name");
    String balance = request.getParameter("Balance");
    String accountType = request.getParameter("Account Type");
    String branchId = request.getParameter("Branch ID");
    String nomineeFirstName = request.getParameter("Nominee First Name");
    String nomineeLastName = request.getParameter("Nominee Last Name");
    String relationship = request.getParameter("Relationship");
    String nomineeEmail = request.getParameter("Nominee Email");
    String mPin = request.getParameter("Mobile PIN");
    List<String> need = Arrays.asList(customerId, firstName, lastName, email, aadharNumber, panNumber, fatherName, motherName, branchCode, branchName, balance, accountType, branchId, nomineeFirstName, nomineeLastName, relationship, nomineeEmail, mPin);
    
%>
	

   	<% 
   		int height = 190, nextHeight = 235;
   		String heading = "Customer Details", submit = "Add Customer";
   		String user = "customer";
   		String type = request.getParameter("type");
   		boolean create = type.equals("createAccount") || type.equals("updateAccount");
   		boolean createNew = type.equals("addCustomer") || type.equals("updateCustomer");
   		boolean addEmployee = type.equals("addEmployee") || type.equals("updateEmployee");
   		boolean addBranch = type.equals("addBranch") || type.equals("updateBranch");
   		boolean edit = type.equals("updateAccount");
   		boolean editNew = type.equals("updateCustomer");
   		boolean updateEmployee = type.equals("updateEmployee");
   		boolean updateBranch = type.equals("updateBranch");
   		boolean editPage = edit || editNew || updateEmployee || updateBranch;
   		
   		if (create) 
   		{
   			height = 95;
   			nextHeight = 140;
   			heading = "Account Details";
   			submit = "Create Account";
   		}
   		if (createNew) 
   		{
   			height = 182;
   			nextHeight = 140;
   			heading = "Customer Details";
   			submit = "Create Account";
   		}
   		if (addEmployee)
   		{
   			user = "employee";
   			heading = "Employee Details";
   			submit = "Add Employee";
   			height = 150;
   		}
   		if (addBranch)
   		{
   			user = "branch";
   			heading = "Branch Details";
   			submit = "Add Branch";
   			height = 115;
   		}
   		if (edit) submit = "Update Account";
   		if (editNew) submit = "Update Customer";
   		if (updateEmployee) submit = "Update Employee";
   		if (updateBranch) submit = "Update Branch";
   		String noneStyle = editPage ? "label" : "";
   	%>
   	
   	<style>
   		.<%= noneStyle %>
   		{
   			display: none;
   		}
   	</style>	
   	
    <div style = "width:40vw; height: <%= height %>vh" class="container">
        <h2 style = "text-align: center"><%= heading %></h2>
        <form id="submit" action="/Peoples_Horizon/api/<%= type %>" method="post">
    <center>
    		
        <!-- Customer ID -->
        <% if (create) { %>
        <%= request.getAttribute("branchIds") %>
        <label id="customerIdLabel" for="customerId" >Customer ID:</label>
<input type="number" id="customerId" name="Customer ID" placeholder="Customer ID" style="width: 31.4vw; display: inline-block; -moz-appearance: textfield; appearance: textfield;" value="<%= customerId == null ? "" : customerId %>" required <%= editPage ? "readonly" : "" %>><br>
        <% } %>

        <!-- First Name, Last Name, Email -->
        <% if (createNew || addEmployee) { %>
        <label id="FirstHalf" for="firstName">First Name:</label>
        <label id="LastHalf" for="lastName">Last Name:</label>
        <input type="text" id="firstName" name="First Name" placeholder="First Name" style="width: 15vw; display: inline-block; -moz-appearance: textfield; appearance: textfield;" value="<%= firstName == null ? "" : firstName %>" required>
        <input type="text" id="lastName" name="Last Name" placeholder="Last Name" style="width: 15vw; display: inline-block; -moz-appearance: textfield; appearance: textfield;" value="<%= lastName == null ? "" : lastName %>" required><br>
        <label for="email">Email ID:</label>
        <input type="text" id="email" name="Email" placeholder="Email ID" style="width: 31.4vw; display: block; -moz-appearance: textfield; appearance: textfield;" value="<%= email == null ? "" : email %>" required>
        <% } %>

        <!-- Aadhar Number, PAN Number, Father Name, Mother Name -->
        <% if (createNew) { %>
        <label for="aadharNumber">Aadhar Number:</label>
        <input type="number" min = "100000000000" max = "999999999999" id="aadharNumber" name="Aadhar Number" placeholder="Aadhar Number" style="width: 31.4vw; display: block; -moz-appearance: textfield; appearance: textfield;" value="<%= aadharNumber == null ? "" : aadharNumber %>" required>
        <label for="panNumber">PAN Number:</label>
        <input type="text" id="panNumber" name="Pan Number" placeholder="PAN Number" style="width: 31.4vw; display: block;" value="<%= panNumber == null ? "" : panNumber %>" required>
        <label for="fatherName">Father Name:</label>
        <input type="text" id="fatherName" name="Father Name" placeholder="Father Name" style="width: 31.4vw; display: block;" value="<%= fatherName == null ? "" : fatherName %>" required>
        <label for="motherName">Mother Name:</label>
        <input type="text" id="motherName" name="Mother Name" placeholder="Mother Name" style="width: 31.4vw; display: block;" value="<%= motherName == null ? "" : motherName %>" required>
        <% } %>

        <!-- Branch Code, Branch Name -->
        <% if (addBranch) { %>
        <label for="branchCode">Branch Code:</label>
        <input type="text" id="branchCode" name="Branch Code" placeholder="Branch Code" style="width: 31.4vw; display: inline-block" value="<%= branchCode == null ? "" : branchCode %>" required><br>
        <label for="branchName">Branch Name:</label>
        <input type="text" id="branchName" name="Branch Name" placeholder="Branch Name" style="width: 31.4vw; display: inline-block" value="<%= branchName == null ? "" : branchName %>" required><br>
        <% } %>

        <!-- Address -->
        <% if (createNew || addEmployee || addBranch) { %>
        <jsp:include page="Address.jsp?user=<%= user %>" />
        <% } %>

        <!-- Balance, Account Type -->
        <% if (create) { %>
        <label for="balance">Balance:</label>
        <input type="number" min = "0" max = "1000000000" id="balance" name="Balance" placeholder="Balance" style="width: 31.4vw; display: block; -moz-appearance: textfield; appearance: textfield;" value="<%= balance == null ? "" : balance %>" required>
        <label for="accountType">Account Type:</label>
        <input type="text" id="accountType" name="Account Type" placeholder="Account Type" style="width: 31.4vw; display: block;" value="<%= accountType == null ? "" : accountType %>" required>
        <label for="mPin">Mobile PIN:</label>
        <input type="number" min = "100000" max = "999999" id="mPin" name="Mobile Pin" placeholder="Mobile PIN" style="width: 31.4vw; display: block; -moz-appearance: textfield; appearance: textfield;" value="<%= mPin == null ? "" : mPin %>" required>
        <% } %>

        <!-- Branch ID (if not adding branch) -->
        <% if (create || addEmployee) { %>
        <label for="branchId">Branch ID:</label>
        <input type="number" min = "100000" max = "9999999999" id="branchId" name="Branch Id" placeholder="Branch ID" style="width: 31.4vw; display: block; -moz-appearance: textfield; appearance: textfield;" value="<%= branchId == null ? "" : branchId %>" required>
        <% } %>

	<%
		if (false)
		{
	%>
        <!-- Nominee Checkbox -->
        <% if (create) { %>
        <div style="display: none; align-items: center; justify-content: center;">
            <input style="height: 4.5vh; width: 1.5vw; display: flex;" type="checkbox" id="nominee" name="nominee" onchange="toggleFields()">
            <label for="nominee"><h4 style="font-size: 2.5vh">Add Nominee</h4></label>
        </div>
        <% } %>

        <!-- Nominee Fields (Hidden by default) -->
        <div id="nomineeFields" style="display: none;">
            <h3>Nominee Details</h3>
            <label for="nomineeFirstName">Nominee First Name:</label>
            <input type="text" id="nomineeFirstName" name="nomineeFirstName" placeholder="Nominee First Name" style="width: 15vw; display: inline-block" value="<%= nomineeFirstName == null ? "" : nomineeFirstName %>">
            <label for="nomineeLastName">Nominee Last Name:</label>
            <input type="text" id="nomineeLastName" name="nomineeLastName" placeholder="Nominee Last Name" style="width: 15vw; display: inline-block" value="<%= nomineeLastName == null ? "" : nomineeLastName %>">
            <label for="relationship">Relationship:</label>
            <input type="text" id="relationship" name="relationship" placeholder="Relationship" style="width: 31.4vw; display: block;" value="<%= relationship == null ? "" : relationship %>">
            <label for="nomineeEmail">Nominee Email:</label>
            <input type="email" id="nomineeEmail" name="nomineeEmail" placeholder="Email" style="width: 31.4vw; display: block;" value="<%= nomineeEmail == null ? "" : nomineeEmail %>">
            <%@ include file="Address.jsp" %>
        </div>
	<%
		}
	%>
        <!-- Password Fields -->
        <% if (createNew || addEmployee) { %>
        <label  class = "label" for="password">Password:</label>
        <input  type= <%= editPage ? "hidden" : "password" %>  class="password" name="Password" placeholder="Password" style="width: 31.4vw; display: block;" required>
        <label class = "label" for="reEnterPassword">Re-Enter Password:</label>
        <input type= <%= editPage ? "hidden" : "password" %>  class="reEnterPassword" name="reEnterPassword" placeholder="Re-Enter Password" style="width: 31.4vw; display: block;" required>
        <% } %>
        
        <%
        		List<String> params =  Collections.list(request.getParameterNames());
        		for (String x: params)
        		{
        			if (!need.contains(x))
        			{
        	%>
		            <input type="hidden" id="firstName" name="<%= x %>" value="<%= request.getParameter(x) %>">
		    <%
        			}
        		}
		    %>

        <div class="message" id="addCustomerMessage"><p id="errorMessage"></p></div>

        <input class="commonButton" type="submit" value="<%= submit %>">
    </center>
</form>
    </div>
    
    <script>
			function toggleFields() 
			{
			    var nominee = document.getElementById("nominee");
			    var collectiveDataFields = document.getElementById("nomineeFields");
			    var container = document.getElementsByClassName("container")[0];
			
			    if (nominee.checked) 
			    {
			        collectiveDataFields.style.display = "block";
			        container.style.height = "<%= nextHeight %>vh"; 
			    } 
			    else 
			    {
			        collectiveDataFields.style.display = "none";
			        container.style.height = "<%= height %>vh";
			    }
			}
	</script>
	
	
	
	
	<%@ include file = "../Popup.jsp" %>	

	<script>
		$("#submit").submit(function(event) 
	    {
	        event.preventDefault(); 
	        var formData = $(this).serialize(); 
	        var typeValue = "<%= type %>";
	        console.log(typeValue);
	        $.ajax(
	        {
	            type: "POST",
	            url: "/Peoples_Horizon/api/" + typeValue,
	            data: formData,
	            success: function(response) 
	            {
	                console.log("Success  ", response);
	                var url = "/Peoples_Horizon/api/Home";

	                displayPopup(response.message, true, url);
	            },
	            error: function(xhr, textStatus, error) 
	            {
	            	displayPopup(xhr.responseJSON.message, false, null);
	            }
	        });
	    });
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
