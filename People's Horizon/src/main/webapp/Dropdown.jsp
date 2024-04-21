<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.commonDropdown
	{
		margin-top: -4vh;
		margin-bottom: 2vh;
	}
</style>
</head>
	<body>
		<%
			List<JSONObject> accounts = (List<JSONObject>) request.getAttribute("accounts");
			Integer primary = (Integer) request.getAttribute("primary"); 
		%>
			<div class="commonDropdown" onclick="toggleDropdown(event, 'dropdownContent1')">
			  <select id = "status" class="commonDropbtn" name = "accountNumber">
				  <div class="commonDropdown-content" id="dropdownContent1">
		   			    <option href="#" onclick="selectOption('Option A', 'dropdownButton2')">All</option>
				  <%
				  		for (JSONObject acct: accounts)
				  		{
				  			Integer account = (Integer) acct.get("Account Number");
							out.println(account);
				  %>
				  	    	<option value="<%= account %>" onclick="selectOption('Option 1', 'dropdownButton1')" <%= account.equals(primary) ? "selected" : "" %>><%= account %></option>
				  <%
				  		}
				  %>
				  </div>
			  </select>
			</div>
		
	</body>
</html>