<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.peopleshorizon.entities.Account" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Customers</title>
    <link rel="stylesheet" href="Admin.css"> 
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>
    .account-container {
    display: flex;
    flex-wrap: wrap;
    }

    .active-style {
    color: #1de9b6;
    }

    .blocked-style {
    color: red;
    }

    .card {
    flex: 1 1 calc(50% - 20px);
    max-width: calc(50% - 20px);
    height: 320px;
    margin: 10px;
    margin-top: 40px;
    border-radius: 2px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    transition: all 0.3s ease;
    padding: 0 10px;
    background-image: linear-gradient(-20deg, #29b6f6 40%, #81d4fa 80%);
    }

    .status {
    text-align: right;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 20px;
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

    .info {
    margin: 10px 0;
    font-size: 20px;
    }

    .info .title {
    text-align: left;
    margin: 0;
    padding: 5px 0;
    }

    .footer {
    text-align: center;
    }

    .action {
    display: inline-block;
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

    </style>
</head>
<body class = "account-container container">
    <div class="row card first">
        <div class="title col-sm-12">
            <i class="fa fa-university"></i>
        </div>
        <div class="status verified col-sm-12">
            Palladam
        </div>
        <div class="row content col-sm-12">
            <div class="info col-xs-6">
                <p class="title">Account Number</p>
                <p>112111551</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Customer ID</p>
                <p>112111551</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Balance</p>
                <p>1000000</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Status</p>
                <p><i class="fa fa-circle active-style"></i> Active</p>
            </div>
        </div>
        <div class="footer col-sm-12">
            <div class="action">
                <button class="action-btn edit-btn">Edit</button>
                <button class="action-btn delete-btn">Delete</button>
            </div>
        </div>
    </div>
    <div class="row card first">
        <div class="title col-sm-12">
            <i class="fa fa-university"></i>
        </div>
        <div class="status verified col-sm-12">
            Palladam
        </div>
        <div class="row content col-sm-12">
            <div class="info col-xs-6">
                <p class="title">Account Number</p>
                <p>112111551</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Customer ID</p>
                <p>112111551</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Balance</p>
                <p>1000000</p>
            </div>
            <div class="info col-xs-6">
                <p class="title">Status</p>
                <p><i class="fa fa-circle active-style"></i> Active</p>
            </div>
        </div>
        <div class="footer col-sm-12">
            <div class="action">
                <button class="action-btn edit-btn">Edit</button>
                <button class="action-btn delete-btn">Delete</button>
            </div>
        </div>
    </div>

    <!-- Repeat the account cards for each account -->
    <%@ page import="java.util.Map" %>
    <%@ page import="com.bank.peopleshorizon.entities.Account" %>
    <% 
    	List<Map<String, Object>> accounts = (List<Map<String, Object>>) request.getAttribute("rslt");
        //double balance = accounts.get(1000000).getBalance();
    %>
    
    	<p> Accounts: <%= accounts %> </p>
    <!-- Display the balance -->
    
</body>
</html>
