<%@page import="org.json.JSONObject"%>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.bank.peopleshorizon.utility.Utility" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="/Peoples_Horizon/Login.css"> 
    <style>

        h2 
        {
            text-align: center;
        }
        form 
        {
            display: flex;
            flex-direction: column;
        }
        label 
        {
        	text-align: left;
        	color: blue;
        	font: 2vh bold blue;
            margin-bottom: 5px;
            margin-left: 1vw;
        }
        input[type="text"],
        input[type="email"] {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #007bff;
            outline: none;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover 
        {
            background-color: #0056b3;
        }
        input[readonly] 
        {
       		opacity: 0.65;
		    pointer-events: none;
		}
		.container 
		{
		    width: 30vw;
		    height: 315vh;
		    display: flex;
		    flex-direction: column;
            align-items: center;
		}

    </style>
</head>
<body>
	<%
		String type = request.getParameter("type");
	    Map<String, String> entity = new HashMap<>();
	    String json = request.getParameter("rslt");
	    out.println(json);
	%>
    <div class="container">
        <h2><%= type %> Details</h2>	
        <form action="/Peoples_Horizon/api/update<%= type %>" method="post">
        	<%
        		List<String> params =  Collections.list(request.getParameterNames());
        		for (String x: params)
        		{
        	%>
		            <label for="firstName"><%= x %></label>
		            <input type="text" id="firstName" name="<%= x %>" value="<%= request.getParameter(x) %>">
		    <%
        		}
		    %>
		    	<input type="submit" value="Update">
        </form>
    </div>
</body>
</html>