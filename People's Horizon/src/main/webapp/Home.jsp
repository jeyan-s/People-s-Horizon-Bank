<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Home Page</title>
		<link rel="stylesheet" href="Dummy.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<style>
			body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* Background color */
        }
        .header {
            background-color: #29b6f6; /* Header background color */
            color: #fff; /* Header text color */
            padding: 20px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        
        .menu {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .menu li {
            padding: 15px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .menu li:hover {
            background-color: #1e88e5;
        }
        .menu li a {
            color: #fff;
            text-decoration: none;
        }
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); 
            margin-top: -10vh;
            font-size: 24px;
        }
        .custom-container {
            max-width: 650px;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-left: 250px;
            margin-top: 30px; 
        }
        .header {
            margin-bottom: 30px;
        }
        .header h1 {
            color: #fff; /* Header text color */
            font-size: 36px;
            margin-bottom: 10px;
        }
        .header p {
            color: #666;
            font-size: 16px;
        }
        .user-heading {
            margin-bottom: 40px; /* Increased gap between user-heading and options */
        }
        .options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 50px;
        }
        .option-menu {
            font-size: 22px;
            padding: 15px;
            background-color: #29b6f6;
            color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            cursor: pointer;
            width: 250px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .option:hover {
            transform: translateY(-5px);
        }

		</style>
	</head>
	<body>
	
        <div class="header">
            <h1>People's Horizon</h1>
        </div>

		<%
			String user = request.getParameter("user");
			boolean admin = user.equals("admin");
			boolean employee = user.equals("employee");
			boolean customer = user.equals("customer");
		%>
		<div class="container">
		    <button id="sidebarToggle">
				<svg style = "height:5vh!important;margin-left:-2.5vw" xmlns="http://www.w3.org/2000/svg" data-name="Layer 330" viewBox="0 0 46.99 46.88" id="menu"><rect width="23.5" height="9.29" x="23.5" fill="#3a0ca3" rx="4.64"></rect><rect width="9.41" height="9.29" x=".28" fill="#f72585" rx="4.64"></rect><rect width="9.41" height="9.29" x="37.52" y="37.59" fill="#f72585" rx="4.64"></rect><rect width="23.5" height="9.29" x=".47" y="37.59" fill="#3a0ca3" rx="4.64"></rect><rect width="46.99" height="9.29" y="18.85" fill="#4361ee" rx="4.64"></rect></svg>		
			</button>
		    <div id="sidebar" class="sidebar">
			    <form>
			        <button id = "backButton" class="side" type="button" name="Back">Back</button>
			    </form>
			
			    <form action="/Peoples_Horizon/api/viewProfile" method="get">
			        <button class="side" type="submit" name="viewProfile">View Profile</button>
			    </form>
			
			    <form action="/Peoples_Horizon/Customer/Amount.jsp?type=changePassword" method="post">
			        <button class="side" type="submit" name="action" value="Change Password">Change Password</button>
			    </form>
			
				<%
					if (customer)
					{
				%>
					    <form action="/Peoples_Horizon/api/getMyAccounts" method="get">
					        <button class="side" type="submit" name="action" value="Log out">Switch Account</button>
					    </form>
				<%
					}
				%>
			
			    <form action="/Peoples_Horizon/api/logout" method="post">
			        <button class="side" type="submit" name="action" value="Log out">Log out</button>
			    </form>
		
		    </div>
		    
		<div class="main-container">
        <div class="custom-container">
            <div class="user-heading">
                <h1 style="color: #29b6f6; margin: 0;">Bank <%= user %></h1>
                <p>Welcome to your banking portal.</p>
            </div>
				<div class="options">
					<%
						if (customer)
						{
					%>
					<form id = "checkBalance">
							<button class="option-menu" type="submit" name="checkBalance" value="Check Balance"><p>Check Balance</p></button>
					</form>
					<form action="/Peoples_Horizon/Customer/Amount.jsp?type=TransferAmount" method="post">
							<button class="option-menu" type="submit" name="action" value="Transfer Fund"><p>Transfer Fund</p></button>
					</form>
						
					<form action="/Peoples_Horizon/api/transactionHistory" method="get">
						<input type = "hidden" name = "type" value = "transactionHistory">
							<button class="option-menu" type="submit" name="page" value = "1"><p>Transaction History</p></button>
					</form>
						
					<form action="/Peoples_Horizon/api/getStatement" method="get">
						<button class="option-menu" type="submit" name="action" value="View Statement"><p>View Statement</p></button>
					</form>				
					<form action="/Peoples_Horizon/Customer/Amount.jsp?type=WithdrawlAmount" method="post">
						<button class="option-menu" type="submit" name="action" value="Withdraw Amount"><p>Withdraw Amount</p></button>
					</form>
					<form action="/Peoples_Horizon/Customer/Amount.jsp?type=DepositAmount" method="post">
						<button class="option-menu" type="submit" name="action" value="Deposit Amount"><p>Deposit Amount</p></button>
					</form>
					<%
						}
						if (admin || employee)
						{
					%>
					<form action="/Peoples_Horizon/Create_Account.jsp?type=createNewAccount" method="post">
						<button type="submit" class="option-menu"><p>Create New Account</p></button>
					</form>
					
					<form action="/Peoples_Horizon/Create_Account.jsp?type=createAccount" method="post">
						<button type="submit" class="option-menu"><p>Create Account</p></button>
					</form>
					
					<form action="/Peoples_Horizon/Create_Account.jsp?type=addEmployee" method="post">
						<button type="submit" class="option-menu"><p>Add Employee</p></button>
					</form>
					
					<form action="/Peoples_Horizon/api/getUsers" method="get">
						<input type = "hidden" name = "page" value = "1">
						<button type="submit" class="option-menu"><p>View All Users</p></button>
					</form>
				
					<form action="/Peoples_Horizon/api/getAllAccounts" method="get">
						<input type = "hidden" name = "page" value = "1">
						<button type="submit" class="option-menu"><p>Manage Accounts</p></button>
					</form>
					
					<form action="/Peoples_Horizon/api/getAllTransactions" method="get">
						<input type = "hidden" name = "type" value = "getAllTransactions">
						<input type = "hidden" name = "page" value = "1">
						<button type="submit" class="option-menu"><p>View all transactions</p></button>
					</form>
					<%
						}
						if (admin)
						{
					%>
							
							<form action="/Peoples_Horizon/Create_Account.jsp?type=addBranch" method="post">
								<button type="submit" class="option-menu"><p>Add Branch</p></button>
							</form>
					<%
						}
					%>
				</div>
			</div>
		</div>
		
		
		
		
		
	    <%@ include file = "Popup.jsp" %>	

<!-- 
		<script>
			$("#checkBalance").submit(function(event) 
		    {
		        event.preventDefault(); 
		        var formData = $(this).serialize();
		        $.ajax(
		        {
		            type: "GET",
		            url: "/Peoples_Horizon/api/checkBalance",
		            data: formData,
		            success: function(response) 
		            {
		                console.log(response);
		                var url = "/Peoples_Horizon/Dummy.jsp?user=customer";

		                displayPopup(response, true, null);
		            },
		            error: function(xhr, textStatus, error) 
		            {
		                console.error(error);
		            }
		        });
		    });
		</script>
-->


		<script type="text/javascript">
		
		$("#checkBalance").submit(function(event) {
		    event.preventDefault();
		    var formData = $(this).serialize();
		    $.ajax({
		        type: "GET",
		        url: "/Peoples_Horizon/api/checkBalance",
		        data: formData,
		        success: function(response) {
		            console.log(response, "hii");
		     		displayPopup(response.message, true, null);
		        },
		        error: function(xhr, textStatus, error) {
		            console.error(error);
		        }
		    });
		});
	
		
		</script>
		
		
		
		<script type="text/javascript">
			document.getElementById("sidebarToggle").addEventListener("click", function(e) {
			    e.stopPropagation();
			    toggleSidebar();
			});
	
			document.getElementById("backButton").addEventListener("click", function() {
			    hideSidebar();
			});
	
			document.addEventListener("click", function(e) {
			    var sidebar = document.getElementById("sidebar");
			    var sidebarToggle = document.getElementById("sidebarToggle");
			    var overlay = document.getElementById("overlay");
	
			    if (!sidebar.contains(e.target) && !sidebarToggle.contains(e.target)) {
			        hideSidebar();
			    }
			});
	
			function toggleSidebar() {
			    var sidebar = document.getElementById("sidebar");
			    var mainContent = document.getElementById("mainContent");
			    var overlay = document.getElementById("overlay");
	
			    sidebar.classList.toggle("show-sidebar");
			    mainContent.classList.toggle("blur");
			    overlay.classList.toggle("show-overlay");
			}
	
			function hideSidebar() {
			    var sidebar = document.getElementById("sidebar");
			    var mainContent = document.getElementById("mainContent");
			    var overlay = document.getElementById("overlay");
	
			    sidebar.classList.remove("show-sidebar");
			    mainContent.classList.remove("blur");
			    overlay.classList.remove("show-overlay");
			}

		</script>
		</body>
</html>


