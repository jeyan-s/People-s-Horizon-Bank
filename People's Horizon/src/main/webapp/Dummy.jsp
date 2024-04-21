<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.bank.peopleshorizon.enums.Role" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Home Page</title>
		<link rel="stylesheet" href="Dummy.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<style>
			.option , .side
			{
				height: 6vh;
				width: 12vw;
				font-size: 2vh;
				padding: 0;
			}
			svg
			{
				height: 10vh;
				width: 8vw;
				padding-bottom: 3vh;
			}
			.side 
			{
			    font-weight: bold;
			    font-size: 2.3vh; /* Increased font size */
			    color: #01579b;
			    background-color: #81d4fa;
			    height: 6vh !important;
			    width: 20vw;
			    border: 1px solid #26c6da;
			    text-align: center; 
			    margin-bottom: 0;
			}

			.side:hover {
			    background-color: #00bcd4;
			    transition: background-color 0.3s ease;
			}
			
		</style>
	</head>
	<body>
	
		<%
			Role role = (Role) session.getAttribute("role");
			String user = role.toString().toLowerCase();
			boolean admin = user.equals("admin");
			boolean employee = user.equals("employee");
			boolean customer = user.equals("customer");
		%>
		<%= user %>
	
	
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
		    <div id="mainContent" class="main-content">
		
				<center>
			        <div class = "heading" >
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="256" height="256" viewBox="0 0 256 256" xml:space="preserve"><defs></defs><g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)"><rect x="19.65" y="29.55" rx="0" ry="0" width="50.71" height="48.86" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(103,115,108); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0)"/><path d="M 29.894 47.031 c 0.976 0 1.767 -0.791 1.767 -1.767 v -8.427 H 15.63 v 8.427 c 0 0.976 0.791 1.767 1.767 1.767 h 1.142 V 66.62 h -1.142 c -0.976 0 -1.767 0.791 -1.767 1.767 v 8.427 h 16.031 v -8.427 c 0 -0.976 -0.791 -1.767 -1.767 -1.767 h -1.142 V 47.031 H 29.894 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(91,101,95); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 55.249 47.031 c 0.976 0 1.767 -0.791 1.767 -1.767 v -8.427 H 40.985 v 8.427 c 0 0.976 0.791 1.767 1.767 1.767 h 1.142 V 66.62 h -1.142 c -0.976 0 -1.767 0.791 -1.767 1.767 v 8.427 h 16.031 v -8.427 c 0 -0.976 -0.791 -1.767 -1.767 -1.767 h -1.142 V 47.031 H 55.249 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(91,101,95); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 76.603 13.694 H 13.397 c -0.976 0 -1.767 0.791 -1.767 1.767 v 14.674 c 0 0.976 0.791 1.767 1.767 1.767 h 63.205 c 0.976 0 1.767 -0.791 1.767 -1.767 V 15.461 C 78.37 14.485 77.579 13.694 76.603 13.694 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(151,166,157); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><polygon points="78.37,27.98 78.37,21.36 70.86,15.58 60.59,15.58 60.59,27.98 " style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(131,146,137); fill-rule: nonzero; opacity: 1;" transform="  matrix(1 0 0 1 0 0) "/><path d="M 81.264 15.584 H 8.736 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -3.059 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 72.529 c 0.976 0 1.767 0.791 1.767 1.767 v 3.059 C 83.031 14.793 82.24 15.584 81.264 15.584 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><polygon points="37.71,8.99 29.14,15.58 70.86,15.58 62.29,8.99 " style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(103,115,108); fill-rule: nonzero; opacity: 1;" transform="  matrix(1 0 0 1 0 0) "/><path d="M 45 36.837 h 36.264 c 0.976 0 1.767 -0.791 1.767 -1.767 v -5.403 c 0 -0.549 -0.255 -1.066 -0.689 -1.4 l -36.264 -27.9 c -0.635 -0.489 -1.52 -0.489 -2.155 0 l -36.264 27.9 c -0.435 0.334 -0.689 0.852 -0.689 1.4 v 5.403 c 0 0.976 0.791 1.767 1.767 1.767 H 45 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(182,195,187); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 53.015 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 38.751 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 53.015 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 78.37 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 64.106 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 78.37 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><rect x="14.54" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/><path d="M 27.661 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 13.397 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 27.661 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 36.985 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 36.985 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 62.339 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 62.339 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 11.63 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 11.63 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><rect x="39.89" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/><rect x="65.25" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/><path d="M 83.031 83.407 H 6.969 v -4.826 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 72.529 c 0.976 0 1.767 0.791 1.767 1.767 V 83.407 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(151,166,157); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 88.883 90 H 1.117 v -4.826 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 84.233 c 0.976 0 1.767 0.791 1.767 1.767 V 90 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(182,195,187); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 45 13 c 5.36 0 9.706 4.345 9.706 9.706 S 50.36 32.412 45 32.412 s -9.706 -4.345 -9.706 -9.706 S 39.64 13 45 13 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 42.738 13.276 c -2.714 2.243 -4.443 5.634 -4.443 9.43 c 0 3.796 1.73 7.187 4.443 9.43 c -4.267 -1.021 -7.443 -4.85 -7.443 -9.43 C 35.294 18.126 38.47 14.297 42.738 13.276 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(72,80,75); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/><path d="M 50.476 23.671 c -0.572 -1.196 -1.987 -1.749 -3.155 -2.098 c -1.403 -0.419 -1.705 -0.779 -1.77 -0.915 c -0.042 -0.088 -0.023 -0.232 0.044 -0.396 c 0.209 -0.467 0.821 -0.794 1.488 -0.794 c 0.479 0 0.93 0.169 1.224 0.437 c 0.217 0.198 0.535 0.236 0.803 0.116 l 0.702 -0.315 c 0.464 -0.208 0.61 -0.812 0.273 -1.193 c -0.513 -0.58 -1.23 -0.992 -2.042 -1.177 v -0.829 c 0 -0.421 -0.342 -0.763 -0.763 -0.763 h -0.72 c -0.421 0 -0.763 0.342 -0.763 0.763 v 0.918 c -1.011 0.32 -1.843 1.008 -2.265 1.951 c -0.412 1.006 -0.231 1.779 -0.005 2.249 c 0.572 1.196 1.986 1.75 3.155 2.098 c 1.404 0.418 1.706 0.779 1.771 0.915 c 0.042 0.088 0.023 0.233 -0.044 0.396 c -0.209 0.467 -0.821 0.793 -1.488 0.793 c -0.479 0 -0.93 -0.168 -1.223 -0.437 c -0.217 -0.198 -0.534 -0.236 -0.802 -0.116 l -0.702 0.314 c -0.469 0.21 -0.607 0.819 -0.266 1.203 c 0.477 0.539 1.129 0.933 1.87 1.133 v 0.863 c 0 0.421 0.342 0.763 0.763 0.763 h 0.72 c 0.421 0 0.763 -0.342 0.763 -0.763 v -0.863 c 1.087 -0.294 1.984 -1.087 2.451 -2.097 c 0.491 -1.038 0.424 -1.834 0.285 -2.285 C 50.667 24.18 50.606 23.989 50.476 23.671 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(254,250,240); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/></g></svg>
		        		<h1>PEOPLE'S HORIZON</h1>
		     			<!--  <h1>People's <span style="color: #0000ff;">Horizon</span></h1> -->
		        	</div>
		
		     </center>
		
				<div class="content">
		    
		      		<div class="grid-container">
				        
				        <%
							if (customer)
							{
				        %>
				        <div>
				         	<svg viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:#cbecf9;}.cls-2{fill:#ffffff;}.cls-3{fill:#90fc95;}.cls-4{fill:#2fb1ea;}.cls-5{fill:#e5f5fc;}.cls-6{fill:#1a96e2;}.cls-7{fill:#ffc444;}.cls-8{fill:#ffe76e;}.cls-9{fill:#d4ffd4;}.cls-10{fill:#ffbdbd;}.cls-11{fill:#bbf1ff;}.cls-12{fill:#fff4c5;}</style> </defs> <title>business economic finance interprise company search</title> <g id="Layer_2" data-name="Layer 2"> <path class="cls-1" d="M156,73.48h28.74V188.74a12,12,0,0,1-12,12H61.09a12,12,0,0,1-12-12v-144a12,12,0,0,1,12-12h83V61.48A12,12,0,0,0,156,73.48Z"></path> <path class="cls-2" d="M156,73.48h28.74V176.17a12,12,0,0,1-12,12H61.09a12,12,0,0,1-12-12V44.74a12,12,0,0,1,12-12h83V61.48A12,12,0,0,0,156,73.48Z"></path> <rect class="cls-3" x="109.89" y="40.44" width="14.09" height="91.64" rx="7.04" ry="7.04" transform="translate(203.2 -30.67) rotate(90)"></rect> <rect class="cls-3" x="94.33" y="76.33" width="14.09" height="60.51" rx="7.04" ry="7.04" transform="translate(207.96 5.21) rotate(90)"></rect> <rect class="cls-3" x="88.52" y="102.46" width="14.09" height="48.89" rx="7.04" ry="7.04" transform="translate(222.47 31.34) rotate(90)"></rect> <rect class="cls-3" x="105.41" y="105.89" width="14.09" height="82.67" rx="7.04" ry="7.04" transform="translate(259.68 34.77) rotate(90)"></rect> <path class="cls-1" d="M184.79,81.4H156a12,12,0,0,1-12-12V40.66l40.74,32.82Z"></path> <path class="cls-4" d="M172.79,202.74H61.09a14,14,0,0,1-14-14v-144a14,14,0,0,1,14-14h83a2,2,0,0,1,2,2V61.48a10,10,0,0,0,10,10h28.74a2,2,0,0,1,2,2V188.74A14,14,0,0,1,172.79,202.74Zm-111.7-168a10,10,0,0,0-10,10v144a10,10,0,0,0,10,10h111.7a10,10,0,0,0,10-10V75.48H156a14,14,0,0,1-14-14V34.74Z"></path> <path class="cls-5" d="M184.79,73.48H156a12,12,0,0,1-12-12V32.74Z"></path> <path class="cls-4" d="M184.79,75.48H156a14,14,0,0,1-14-14V32.74a2,2,0,0,1,3.41-1.41L186.2,72.07a2,2,0,0,1-1.41,3.41ZM146,37.57V61.48a10,10,0,0,0,10,10H180Z"></path> <path class="cls-4" d="M198.67,223.5,157.18,182a6,6,0,0,1,8.49-8.49L207.16,215a6,6,0,0,1-8.49,8.49Z"></path> <path class="cls-6" d="M172.48,180.34l-6.82-6.82a6,6,0,0,0-8.49,8.49l6.82,6.82A52.44,52.44,0,0,0,172.48,180.34Z"></path> <circle class="cls-7" cx="131.74" cy="148.08" r="42"></circle> <circle class="cls-8" cx="131.74" cy="144.77" r="38.69"></circle> <path class="cls-4" d="M131.74,192.08a44,44,0,1,1,44-44A44,44,0,0,1,131.74,192.08Zm0-84a40,40,0,1,0,40,40A40,40,0,0,0,131.74,108.08Z"></path> <circle class="cls-7" cx="131.74" cy="145.5" r="32.87"></circle> <circle class="cls-2" cx="131.74" cy="148.08" r="30.29"></circle> <path class="cls-3" d="M121.05,127.35a9.39,9.39,0,0,0-2.6-6.49,30.39,30.39,0,0,0-14.81,15.93h8A9.43,9.43,0,0,0,121.05,127.35Z"></path> <path class="cls-3" d="M162,146.66a9.38,9.38,0,0,0-5.14-1.53H101.59c-.09,1-.14,2-.14,2.95A30.14,30.14,0,0,0,106,164h50.88c.23,0,.45,0,.67,0a30.14,30.14,0,0,0,4.5-15.89C162,147.6,162,147.13,162,146.66Z"></path> <path class="cls-4" d="M131.74,180.37A32.29,32.29,0,1,1,164,148.08,32.32,32.32,0,0,1,131.74,180.37Zm0-60.58A28.29,28.29,0,1,0,160,148.08,28.32,28.32,0,0,0,131.74,119.79Z"></path> <circle class="cls-9" cx="194" cy="44" r="5"></circle> <circle class="cls-9" cx="39" cy="142" r="4"></circle> <circle class="cls-9" cx="33" cy="47" r="3"></circle> <circle class="cls-9" cx="202" cy="107" r="2"></circle> <circle class="cls-9" cx="229" cy="227" r="1"></circle> <circle class="cls-10" cx="215" cy="249" r="5"></circle> <circle class="cls-10" cx="207" cy="179" r="4"></circle> <circle class="cls-10" cx="68" cy="237" r="3"></circle> <circle class="cls-10" cx="206" cy="18" r="2"></circle> <circle class="cls-10" cx="110" cy="19" r="1"></circle> <circle class="cls-11" cx="28" cy="105" r="5"></circle> <circle class="cls-11" cx="118" cy="244" r="4"></circle> <circle class="cls-11" cx="215" cy="125" r="3"></circle> <circle class="cls-11" cx="200" cy="80" r="2"></circle> <circle class="cls-11" cx="31" cy="213" r="1"></circle> <circle class="cls-12" cx="57" cy="7" r="5"></circle> <circle class="cls-12" cx="170" cy="21" r="4"></circle> <circle class="cls-12" cx="33" cy="176" r="3"></circle> <circle class="cls-12" cx="44" cy="80" r="2"></circle> <circle class="cls-12" cx="232" cy="158" r="1"></circle> </g> </g></svg>
				        	<form id = "checkBalance">
				    			<button class="option" type="submit" name="checkBalance" value="Check Balance">Check Balance</button>
							</form>
						</div>
							
						<div>
							<svg width="12vw" height="18vh" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#f88;}.cls-2{fill:#f97171;}.cls-3{fill:#90fc95;}.cls-4{fill:#52e355;}.cls-5{fill:#cbecf9;}.cls-6{fill:#ffffff;}.cls-7{fill:#2fb1ea;}.cls-8{fill:#e5f5fc;}.cls-9{fill:#d4ffd4;}.cls-10{fill:#ffbdbd;}.cls-11{fill:#bbf1ff;}.cls-12{fill:#fff4c5;}</style></defs><title>business economic finance interprise company transfer</title><g id="Layer_2" data-name="Layer 2"><path class="cls-1" d="M191,52H124.74V48.72a5,5,0,0,0-7.5-4.33l-16.09,9.29a5,5,0,0,0,0,8.66l16.09,9.29a5,5,0,0,0,7.5-4.33V64H191a2,2,0,0,1,2,2v86h12V66A14,14,0,0,0,191,52Z"/><rect class="cls-2" x="192.99" y="141.59" width="12" height="10"/><path class="cls-3" d="M154.85,193.84l-16.09-9.29a5,5,0,0,0-7.5,4.33v3.29H66.83a2,2,0,0,1-2-2V104h-12v86.16a14,14,0,0,0,14,14h64.44v3.29a5,5,0,0,0,7.5,4.33l16.09-9.29A5,5,0,0,0,154.85,193.84Z"/><rect class="cls-4" x="52.83" y="104.01" width="12" height="10"/><path class="cls-5" d="M76.24,43.37H88.65V97a7,7,0,0,1-7,7H31a7,7,0,0,1-7-7V31a7,7,0,0,1,7-7H69.24V36.37A7,7,0,0,0,76.24,43.37Z"/><path class="cls-6" d="M76.24,43.37H88.65V90a7,7,0,0,1-7,7H31a7,7,0,0,1-7-7V31a7,7,0,0,1,7-7H69.24V36.37A7,7,0,0,0,76.24,43.37Z"/><path class="cls-5" d="M88.65,49.17H76.24a7,7,0,0,1-7-7V29.75L88.31,42.11Z"/><path class="cls-7" d="M81.65,106H31a9,9,0,0,1-9-9V31a9,9,0,0,1,9-9H69.24a2,2,0,0,1,2,2V36.37a5,5,0,0,0,5,5H88.65a2,2,0,0,1,2,2V97A9,9,0,0,1,81.65,106ZM31,26a5,5,0,0,0-5,5V97a5,5,0,0,0,5,5H81.65a5,5,0,0,0,5-5V45.37H76.24a9,9,0,0,1-9-9V26Z"/><path class="cls-8" d="M88.65,43.37H76.24a7,7,0,0,1-7-7V24Z"/><path class="cls-7" d="M88.65,45.37H76.24a9,9,0,0,1-9-9V24a2,2,0,0,1,3.41-1.41L90.06,42a2,2,0,0,1-1.41,3.41ZM71.24,28.79v7.58a5,5,0,0,0,5,5h7.58Z"/><path class="cls-5" d="M219.6,171.4H232V225a7,7,0,0,1-7,7H174.35a7,7,0,0,1-7-7V159a7,7,0,0,1,7-7H212.6V164.4A7,7,0,0,0,219.6,171.4Z"/><path class="cls-6" d="M219.6,171.4H232V218a7,7,0,0,1-7,7H174.35a7,7,0,0,1-7-7V159a7,7,0,0,1,7-7H212.6V164.4A7,7,0,0,0,219.6,171.4Z"/><path class="cls-5" d="M232,177.19H219.6a7,7,0,0,1-7-7V157.78l19.07,12.36Z"/><path class="cls-7" d="M225,234H174.35a9,9,0,0,1-9-9V159a9,9,0,0,1,9-9H212.6a2,2,0,0,1,2,2V164.4a5,5,0,0,0,5,5H232a2,2,0,0,1,2,2V225A9,9,0,0,1,225,234Zm-50.66-80a5,5,0,0,0-5,5v66a5,5,0,0,0,5,5H225a5,5,0,0,0,5-5V173.4H219.6a9,9,0,0,1-9-9V154Z"/><path class="cls-8" d="M232,171.4H219.6a7,7,0,0,1-7-7V152Z"/><path class="cls-7" d="M232,173.4H219.6a9,9,0,0,1-9-9V152a2,2,0,0,1,3.41-1.41L233.42,170A2,2,0,0,1,232,173.4ZM214.6,156.82v7.58a5,5,0,0,0,5,5h7.58Z"/><circle class="cls-9" cx="151.25" cy="115" r="5"/><circle class="cls-9" cx="213" cy="126" r="4"/><circle class="cls-9" cx="131.25" cy="177" r="3"/><circle class="cls-9" cx="163.25" cy="76" r="2"/><circle class="cls-9" cx="162.25" cy="30" r="1"/><circle class="cls-10" cx="154.25" cy="249" r="5"/><circle class="cls-10" cx="146.25" cy="86" r="4"/><circle class="cls-10" cx="181.25" cy="48" r="3"/><circle class="cls-10" cx="158" cy="171" r="2"/><circle class="cls-10" cx="121" cy="239.5" r="1"/><circle class="cls-11" cx="99.25" cy="142" r="5"/><circle class="cls-11" cx="77" cy="222" r="4"/><circle class="cls-11" cx="78.25" cy="5" r="3"/><circle class="cls-11" cx="116.25" cy="40" r="2"/><circle class="cls-11" cx="115.25" cy="87" r="1"/><circle class="cls-12" cx="109.25" cy="220" r="5"/><circle class="cls-12" cx="134.25" cy="25" r="4"/><circle class="cls-12" cx="130.25" cy="112" r="3"/><circle class="cls-12" cx="40" cy="135" r="2"/><circle class="cls-12" cx="167.25" cy="135" r="1"/></g></svg>
							<form action="/Peoples_Horizon/api/finance?type=Transfer" method="post">
				    			<button class="option" type="submit" name="action" value="Transfer Fund">Transfer Fund</button>
							</form>
						</div>
							
						<div>
							<svg width="12vw" height="18vh"  viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:#52e355;}.cls-2{fill:#90fc95;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#cbecf9;}.cls-5{fill:#ffffff;}.cls-6{fill:#f88;}.cls-7{fill:#a4ecff;}.cls-8{fill:#ffe76e;}.cls-9{fill:#d4ffd4;}.cls-10{fill:#ffbdbd;}.cls-11{fill:#bbf1ff;}.cls-12{fill:#fff4c5;}</style> </defs> <title>business economic finance interprise company presentation</title> <g id="Layer_2" data-name="Layer 2"> <rect class="cls-1" x="24" y="24" width="208" height="20" rx="10" ry="10"></rect> <rect class="cls-2" x="24" y="24" width="198.51" height="13.2" rx="6.15" ry="6.15"></rect> <path class="cls-3" d="M222,46H34a12,12,0,0,1,0-24H222a12,12,0,0,1,0,24ZM34,26a8,8,0,0,0,0,16H222a8,8,0,0,0,0-16Z"></path> <rect class="cls-1" x="24" y="172" width="208" height="20" rx="10" ry="10"></rect> <rect class="cls-2" x="24" y="172" width="198.51" height="13.2" rx="6.15" ry="6.15"></rect> <path class="cls-3" d="M222,194H34a12,12,0,0,1,0-24H222a12,12,0,0,1,0,24ZM34,174a8,8,0,0,0,0,16H222a8,8,0,0,0,0-16Z"></path> <rect class="cls-4" x="44" y="44" width="168" height="128"></rect> <rect class="cls-5" x="44" y="54.44" width="168" height="117.56"></rect> <path class="cls-3" d="M212,174H44a2,2,0,0,1-2-2V44a2,2,0,0,1,2-2H212a2,2,0,0,1,2,2V172A2,2,0,0,1,212,174ZM46,170H210V46H46Z"></path> <circle class="cls-6" cx="128" cy="222" r="10"></circle> <path class="cls-3" d="M128,234a12,12,0,1,1,12-12A12,12,0,0,1,128,234Zm0-20a8,8,0,1,0,8,8A8,8,0,0,0,128,214Z"></path> <path class="cls-3" d="M128,214a2,2,0,0,1-2-2V192a2,2,0,0,1,4,0v20A2,2,0,0,1,128,214Z"></path> <path class="cls-6" d="M200,79.67a24,24,0,0,0-22-23.58V79.67Z"></path> <path class="cls-7" d="M174,56.09a24,24,0,1,0,16.57,43L174,82.5Z"></path> <path class="cls-8" d="M180.83,83.67l12.71,12.71a23.92,23.92,0,0,0,6.19-12.71Z"></path> <rect class="cls-8" x="59.22" y="65.25" width="14.09" height="91.64" rx="7.04" ry="7.04"></rect> <rect class="cls-8" x="79.54" y="96.38" width="14.09" height="60.51" rx="7.04" ry="7.04"></rect> <rect class="cls-8" x="99.86" y="108" width="14.09" height="48.89" rx="7.04" ry="7.04"></rect> <rect class="cls-8" x="120.18" y="74.22" width="14.09" height="82.67" rx="7.04" ry="7.04"></rect> <circle class="cls-9" cx="232" cy="128" r="5"></circle> <circle class="cls-9" cx="100" cy="208" r="4"></circle> <circle class="cls-9" cx="224" cy="202" r="3"></circle> <circle class="cls-9" cx="31" cy="144" r="2"></circle> <circle class="cls-9" cx="38" cy="51" r="1"></circle> <circle class="cls-10" cx="29" cy="95" r="5"></circle> <circle class="cls-10" cx="18" cy="44" r="4"></circle> <circle class="cls-10" cx="15" cy="170" r="3"></circle> <circle class="cls-10" cx="232" cy="53" r="2"></circle> <circle class="cls-10" cx="240" cy="146" r="1"></circle> <circle class="cls-11" cx="152" cy="211" r="5"></circle> <circle class="cls-11" cx="12" cy="132" r="4"></circle> <circle class="cls-11" cx="5" cy="90" r="3"></circle> <circle class="cls-11" cx="33" cy="206" r="2"></circle> <circle class="cls-11" cx="42" cy="203" r="1"></circle> <circle class="cls-12" cx="249" cy="193" r="5"></circle> <circle class="cls-12" cx="224" cy="89" r="4"></circle> <circle class="cls-12" cx="74" cy="203" r="3"></circle> <circle class="cls-12" cx="181" cy="204" r="2"></circle> <circle class="cls-12" cx="228" cy="67" r="1"></circle> </g> </g></svg>
							<form action="/Peoples_Horizon/api/transactionHistory" method="get">
								<input type = "hidden" name = "type" value = "transactionHistory">
							    <button class="option" type="submit" name="page" value = "1">Transaction History</button>
							</form>
						</div>
							
						<div>
			            	<svg width="12vw" height="18vh"  viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:#cbecf9;}.cls-2{fill:#ffffff;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#90fc95;}.cls-5{fill:#ffd659;}.cls-6{fill:#ffc444;}.cls-7{fill:#ffb32f;}.cls-8{fill:#ffe76e;}.cls-9{fill:#d4ffd4;}.cls-10{fill:#ffbdbd;}.cls-11{fill:#bbf1ff;}.cls-12{fill:#fff4c5;}</style> </defs> <title>business economic finance interprise company receipt</title> <g id="Layer_2" data-name="Layer 2"> <path class="cls-1" d="M232,36V232l-28-28.79L176,232l-28-28.79L120,232,92,203.79,64,232V36A12,12,0,0,1,76,24H220A12,12,0,0,1,232,36Z"></path> <path class="cls-2" d="M220.5,36V205.5L204,187.85l-28,28.79-28-28.79-28,28.79L92,188.43,64,216.64V36A12,12,0,0,1,76,24H208.5A12,12,0,0,1,220.5,36Z"></path> <path class="cls-3" d="M232,234a2,2,0,0,1-1.43-.61L204,206.08l-26.57,27.32a2.06,2.06,0,0,1-2.87,0L148,206.08l-26.57,27.32A2,2,0,0,1,120,234h0a2,2,0,0,1-1.42-.59L92,206.63,65.42,233.41A2,2,0,0,1,62,232V36A14,14,0,0,1,76,22H220a14,14,0,0,1,14,14V232a2,2,0,0,1-2,2ZM92,201.79a2,2,0,0,1,1.42.59L120,229.15l26.58-27.33a2.06,2.06,0,0,1,2.87,0L176,229.13l26.57-27.32a2.06,2.06,0,0,1,2.87,0L230,227.08V36a10,10,0,0,0-10-10H76A10,10,0,0,0,66,36V227.15l24.58-24.76A2,2,0,0,1,92,201.79Z"></path> <path class="cls-4" d="M163,165.79H84a6,6,0,0,1,0-12h79a6,6,0,0,1,0,12Z"></path> <path class="cls-4" d="M129.85,50H84a6,6,0,0,1,0-12h45.85a6,6,0,0,1,0,12Z"></path> <path class="cls-4" d="M199.49,78.95H84a6,6,0,0,1,0-12H199.49a6,6,0,0,1,0,12Z"></path> <path class="cls-4" d="M199.49,107.9H84a6,6,0,0,1,0-12H199.49a6,6,0,0,1,0,12Z"></path> <path class="cls-4" d="M163,136.84H84a6,6,0,0,1,0-12h79a6,6,0,1,1,0,12Z"></path> <rect class="cls-5" x="24" y="81.76" width="80" height="50.48"></rect> <polygon class="cls-6" points="103.56 89.34 104 81.76 24.61 81.76 24.61 89.48 64 123.05 103.56 89.34"></polygon> <path class="cls-3" d="M104,134.24H24a2,2,0,0,1-2-2V81.76a2,2,0,0,1,2-2h80a2,2,0,0,1,2,2v50.48A2,2,0,0,1,104,134.24Zm-78-4h76V83.76H26Z"></path> <polygon class="cls-7" points="104 132.24 64 107 24 132.24 104 132.24"></polygon> <polygon class="cls-6" points="89.5 128 63.7 113.22 38.5 128 89.5 128"></polygon> <path class="cls-3" d="M104,134.24H24a2,2,0,0,1-1.07-3.69l40-25.24a2,2,0,0,1,2.13,0l40,25.24a2,2,0,0,1-1.07,3.69Zm-73.08-4H97.08L64,109.36Z"></path> <polygon class="cls-8" points="104 81.76 64 115.84 24 81.76 104 81.76"></polygon> <path class="cls-3" d="M64,117.84a2,2,0,0,1-1.3-.48l-40-34.08A2,2,0,0,1,24,79.76h80a2,2,0,0,1,1.3,3.52l-40,34.08A2,2,0,0,1,64,117.84ZM29.43,83.76,64,113.22,98.57,83.76Z"></path> <path class="cls-8" d="M204.1,155.29h-9.22a3.4,3.4,0,0,1,0-6.8H212a4.5,4.5,0,0,0,0-9h-8v-3.4a4.5,4.5,0,0,0-9,0v3.4h-.11a12.4,12.4,0,0,0,0,24.8h9.22a3.4,3.4,0,0,1,0,6.81H187a4.5,4.5,0,0,0,0,9h8v3.4a4.5,4.5,0,0,0,9,0v-3.4h.11a12.4,12.4,0,0,0,0-24.81Z"></path> <circle class="cls-9" cx="7" cy="123" r="5"></circle> <circle class="cls-9" cx="128" cy="248" r="4"></circle> <circle class="cls-9" cx="248" cy="141" r="3"></circle> <circle class="cls-9" cx="189" cy="6" r="2"></circle> <circle class="cls-9" cx="240" cy="50" r="1"></circle> <circle class="cls-10" cx="245" cy="121" r="5"></circle> <circle class="cls-10" cx="223" cy="10" r="4"></circle> <circle class="cls-10" cx="19" cy="149" r="3"></circle> <circle class="cls-10" cx="24" cy="59" r="2"></circle> <circle class="cls-10" cx="85" cy="16" r="1"></circle> <circle class="cls-11" cx="45" cy="234" r="5"></circle> <circle class="cls-11" cx="245" cy="176" r="4"></circle> <circle class="cls-11" cx="131" cy="12" r="3"></circle> <circle class="cls-11" cx="225" cy="238" r="2"></circle> <circle class="cls-11" cx="208" cy="227" r="1"></circle> <circle class="cls-12" cx="19" cy="190" r="5"></circle> <circle class="cls-12" cx="250" cy="79" r="4"></circle> <circle class="cls-12" cx="175" cy="243" r="3"></circle> <circle class="cls-12" cx="42" cy="207" r="2"></circle> <circle class="cls-12" cx="157" cy="15" r="1"></circle> </g> </g></svg>			
							<form action="/Peoples_Horizon/api/getStatement" method="get">
							    <button class="option" type="submit" name="action" value="View Statement">View Statement</button>
							</form>
						</div>
							
						<div>
							<svg width="12vw" height="18vh"  viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:#6dd0fc;}.cls-2{fill:#a4ecff;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#cbecf9;}.cls-5{fill:#ffffff;}.cls-6{fill:#ffc444;}.cls-7{fill:#ffe76e;}.cls-8{fill:#52e355;}.cls-9{fill:#90fc95;}.cls-10{fill:#d4ffd4;}.cls-11{fill:#ffbdbd;}.cls-12{fill:#bbf1ff;}.cls-13{fill:#fff4c5;}</style> </defs> <title>business economic finance interprise company get money</title> <g id="Layer_2" data-name="Layer 2"> <rect class="cls-1" x="-8" y="174.07" width="64" height="40" transform="translate(218.07 170.07) rotate(90)"></rect> <rect class="cls-2" x="-6.83" y="172.9" width="55.94" height="34.28" transform="translate(211.18 168.9) rotate(90)"></rect> <path class="cls-3" d="M44,228.07H4a2,2,0,0,1-2-2v-64a2,2,0,0,1,2-2H44a2,2,0,0,1,2,2v64A2,2,0,0,1,44,228.07Zm-38-4H42v-60H6Z"></path> <rect class="cls-4" x="26.8" y="183.28" width="56" height="21.59" transform="translate(248.87 139.28) rotate(90)"></rect> <rect class="cls-5" x="30.19" y="185.7" width="49.53" height="10.28" transform="translate(245.8 135.88) rotate(90)"></rect> <path class="cls-3" d="M65.59,224.07H44a2,2,0,0,1-2-2v-56a2,2,0,0,1,2-2H65.59a2,2,0,0,1,2,2v56A2,2,0,0,1,65.59,224.07Zm-19.59-4H63.59v-52H46Z"></path> <path class="cls-6" d="M74.87,170.07H65.59v48h7.7A40.55,40.55,0,0,1,96,225h0a40.55,40.55,0,0,0,22.72,7h0a54.88,54.88,0,0,0,26.19-6.65l28.87-15.68a9.68,9.68,0,0,0,3.42-13.9h0A9.68,9.68,0,0,0,165,192.46l-24.81,12.05a32.63,32.63,0,0,1-18.67,3h0a32.63,32.63,0,0,1-19.73-10.38l-3-3.28a9.68,9.68,0,0,1,2-14.67l9.59-6.1a9.68,9.68,0,0,0,2.39-14.17l-.12-.15A9.68,9.68,0,0,0,100,156.47l-20.11,12.2A9.68,9.68,0,0,1,74.87,170.07Z"></path> <path class="cls-7" d="M177.22,195.77A9.68,9.68,0,0,0,165,192.46l-24.81,12.05a32.63,32.63,0,0,1-18.67,3c-7.59-1-18.63-8.77-23.78-14.43l-3-3.28a9.68,9.68,0,0,1,2-14.67l9.59-6.1c4.84-3.08,10-5.62,6.45-10.12l-.12-.15A9.68,9.68,0,0,0,100,156.47l-20.11,12.2a9.68,9.68,0,0,1-5,1.4H72v40.07H73.3a40.55,40.55,0,0,1,22.72,7h0a40.55,40.55,0,0,0,22.72,7,54.87,54.87,0,0,0,26.19-6.65l28.87-15.68C178.82,199,177.22,195.77,177.22,195.77Z"></path> <path class="cls-3" d="M118.74,234a42.4,42.4,0,0,1-23.85-7.31,38.42,38.42,0,0,0-21.6-6.62h-7.7a2,2,0,0,1-2-2v-48a2,2,0,0,1,2-2h9.27a7.66,7.66,0,0,0,4-1.11L99,154.76a11.69,11.69,0,0,1,15.21,2.74l.12.15a11.68,11.68,0,0,1-2.89,17.09l-9.59,6.1a7.68,7.68,0,0,0-1.56,11.64l3,3.28a30.63,30.63,0,0,0,36,7l24.81-12.05a11.68,11.68,0,0,1,10.67,20.76L145.89,227.1A57,57,0,0,1,118.74,234ZM67.59,216.07h5.7a42.4,42.4,0,0,1,23.85,7.31,38.42,38.42,0,0,0,21.6,6.62A53,53,0,0,0,144,223.59l28.87-15.68a7.68,7.68,0,0,0,2.71-11,7.71,7.71,0,0,0-9.73-2.63L141,206.31a34.63,34.63,0,0,1-40.75-7.86l-3-3.28a11.68,11.68,0,0,1,2.37-17.7l9.59-6.1a7.69,7.69,0,0,0,3.45-5.2,7.59,7.59,0,0,0-1.55-6L111,160a7.69,7.69,0,0,0-10-1.8l-20.11,12.2a11.67,11.67,0,0,1-6.06,1.69H67.59Z"></path> <circle class="cls-3" cx="24" cy="208.83" r="6"></circle> <circle class="cls-8" cx="182" cy="137.18" r="30"></circle> <circle class="cls-9" cx="182" cy="133.63" r="26.44"></circle> <path class="cls-3" d="M182,169.18a32,32,0,1,1,32-32A32,32,0,0,1,182,169.18Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,182,109.18Z"></path> <path class="cls-6" d="M182,159.18a22,22,0,1,1,22-22A22,22,0,0,1,182,159.18Z"></path> <path class="cls-7" d="M182,159.18A19.15,19.15,0,1,1,201.15,140,19.17,19.17,0,0,1,182,159.18Z"></path> <path class="cls-3" d="M182,161.18a24,24,0,1,1,24-24A24,24,0,0,1,182,161.18Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,182,117.18Z"></path> <path class="cls-3" d="M184.25,134.68h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,1,0,0-5h-3.6v-1.36a2.5,2.5,0,1,0-5,0V127a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,0,1,0,2.71H175.9a2.5,2.5,0,0,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0v-1.37a6.35,6.35,0,0,0-.25-12.7Z"></path> <circle class="cls-8" cx="134" cy="74" r="30"></circle> <circle class="cls-9" cx="134" cy="70.44" r="26.44"></circle> <path class="cls-3" d="M134,106a32,32,0,1,1,32-32A32,32,0,0,1,134,106Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,134,46Z"></path> <path class="cls-6" d="M134,96a22,22,0,1,1,22-22A22,22,0,0,1,134,96Z"></path> <path class="cls-7" d="M134,96a19.15,19.15,0,1,1,19.15-19.15A19.17,19.17,0,0,1,134,96Z"></path> <path class="cls-3" d="M134,98a24,24,0,1,1,24-24A24,24,0,0,1,134,98Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,134,54Z"></path> <path class="cls-3" d="M136.25,71.5h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,0,0,0-5h-3.6V62.43a2.5,2.5,0,0,0-5,0V63.8a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,1,1,0,2.71H127.9a2.5,2.5,0,0,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0V84.2a6.35,6.35,0,0,0-.25-12.7Z"></path> <circle class="cls-8" cx="222" cy="54" r="30"></circle> <circle class="cls-9" cx="222" cy="50.44" r="26.44"></circle> <path class="cls-3" d="M222,86a32,32,0,1,1,32-32A32,32,0,0,1,222,86Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,222,26Z"></path> <path class="cls-6" d="M222,76a22,22,0,1,1,22-22A22,22,0,0,1,222,76Z"></path> <path class="cls-7" d="M222,76a19.15,19.15,0,1,1,19.15-19.15A19.17,19.17,0,0,1,222,76Z"></path> <path class="cls-3" d="M222,78a24,24,0,1,1,24-24A24,24,0,0,1,222,78Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,222,34Z"></path> <path class="cls-3" d="M224.25,51.5h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,0,0,0-5h-3.6V42.43a2.5,2.5,0,0,0-5,0V43.8a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,1,1,0,2.71H215.9a2.5,2.5,0,1,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0V64.2a6.35,6.35,0,0,0-.25-12.7Z"></path> <circle class="cls-10" cx="93.5" cy="123" r="5"></circle> <circle class="cls-10" cx="60.5" cy="84" r="4"></circle> <circle class="cls-10" cx="173.5" cy="43" r="3"></circle> <circle class="cls-10" cx="88" cy="235.5" r="2"></circle> <circle class="cls-10" cx="46" cy="57.5" r="1"></circle> <circle class="cls-11" cx="11" cy="129.5" r="5"></circle> <circle class="cls-11" cx="124" cy="249.5" r="4"></circle> <circle class="cls-11" cx="100" cy="21.5" r="3"></circle> <circle class="cls-11" cx="244.5" cy="170" r="2"></circle> <circle class="cls-11" cx="69" cy="23.5" r="1"></circle> <circle class="cls-12" cx="130" cy="7.5" r="5"></circle> <circle class="cls-12" cx="128.5" cy="129" r="4"></circle> <circle class="cls-12" cx="227.5" cy="235" r="3"></circle> <circle class="cls-12" cx="221.5" cy="104" r="2"></circle> <circle class="cls-12" cx="83" cy="47.5" r="1"></circle> <circle class="cls-13" cx="245" cy="117.5" r="5"></circle> <circle class="cls-13" cx="128.5" cy="181" r="4"></circle> <circle class="cls-13" cx="70.5" cy="67" r="3"></circle> <circle class="cls-13" cx="44.5" cy="132" r="2"></circle> <circle class="cls-13" cx="60.5" cy="233" r="1"></circle> </g> </g></svg>
							<form action= "/Peoples_Horizon/api/finance?type=Withdrawl" method="post">
							    <button class="option" type="submit" name="action" value="Withdraw Amount">Withdraw Amount</button>
							</form>
						</div>
							
						<div>
							<svg width="12vw" height="18vh"  viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:#90fc95;}.cls-2{fill:#52e355;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#ffe76e;}.cls-5{fill:#ffc444;}.cls-6{fill:#cbecf9;}.cls-7{fill:#ffffff;}.cls-8{fill:#a4ecff;}.cls-9{fill:#6dd0fc;}.cls-10{fill:#d4ffd4;}.cls-11{fill:#ffbdbd;}.cls-12{fill:#bbf1ff;}.cls-13{fill:#fff4c5;}</style> </defs> <title>business economic finance interprise company wallet</title> <g id="Layer_2" data-name="Layer 2"> <rect class="cls-1" x="32.22" y="62.88" width="106.05" height="58.82" transform="translate(90.23 -33.24) rotate(45)"></rect> <path class="cls-2" d="M143.53,109,116.21,81.67H36a22.08,22.08,0,0,0-2.79.18l68.73,68.73Z"></path> <path class="cls-3" d="M101.94,152.58a2,2,0,0,1-1.41-.59l-75-75a2,2,0,0,1,0-2.83L67.13,32.59a2.06,2.06,0,0,1,2.83,0l75,75a2,2,0,0,1,0,2.83L103.35,152A2,2,0,0,1,101.94,152.58Zm-72.16-77,72.16,72.16L140.7,109,68.54,36.83Z"></path> <path class="cls-4" d="M120.68,116.6l-11.13,11.13a10.77,10.77,0,0,0-15.23,0L49.8,83.21A10.77,10.77,0,0,0,49.8,68L60.93,56.85a10.77,10.77,0,0,0,15.23,0l44.52,44.52A10.77,10.77,0,0,0,120.68,116.6Z"></path> <path class="cls-5" d="M94.32,127.73a10.77,10.77,0,0,1,15.23,0l11.13-11.13a10.77,10.77,0,0,1,0-15.23L101,81.67H51.07a10.8,10.8,0,0,1-1.27,1.54Z"></path> <path class="cls-3" d="M109.55,129.73h0a2,2,0,0,1-1.41-.59,8.77,8.77,0,0,0-12.4,0,2.06,2.06,0,0,1-2.83,0L48.38,84.62a2,2,0,0,1,0-2.83,8.77,8.77,0,0,0,0-12.4,2,2,0,0,1,0-2.83L59.52,55.43a2,2,0,0,1,2.83,0,8.78,8.78,0,0,0,12.4,0,2,2,0,0,1,2.83,0L122.1,100a2,2,0,0,1,0,2.83,8.77,8.77,0,0,0,0,12.4,2,2,0,0,1,0,2.83L111,129.15A2,2,0,0,1,109.55,129.73Zm-7.62-7.16a12.67,12.67,0,0,1,7.51,2.44l8.52-8.52a12.79,12.79,0,0,1,0-15L76,59.57a12.8,12.8,0,0,1-15,0l-8.52,8.52a12.79,12.79,0,0,1,0,15L94.43,125A12.67,12.67,0,0,1,101.94,122.58Z"></path> <circle class="cls-6" cx="85.24" cy="92.29" r="10.94" transform="translate(-40.29 87.31) rotate(-45)"></circle> <path class="cls-3" d="M85.24,105.22a12.93,12.93,0,1,1,9.15-3.78h0A12.9,12.9,0,0,1,85.24,105.22Zm0-21.88a8.94,8.94,0,1,0,6.32,15.26h0a8.94,8.94,0,0,0-6.32-15.26ZM93,100h0Z"></path> <rect class="cls-1" x="97.74" y="62.88" width="106.05" height="58.82" transform="translate(322.62 50.95) rotate(135)"></rect> <path class="cls-2" d="M134.06,150.58l68.73-68.73a22.08,22.08,0,0,0-2.79-.18H119.79L92.47,109Z"></path> <path class="cls-3" d="M134.06,152.58a2,2,0,0,1-1.41-.59L91.06,110.4a2,2,0,0,1,0-2.83l75-75a2.06,2.06,0,0,1,2.83,0l41.59,41.59a2,2,0,0,1,0,2.83l-75,75A2,2,0,0,1,134.06,152.58ZM95.3,109l38.77,38.77,72.16-72.16L167.46,36.83Z"></path> <path class="cls-4" d="M115.32,116.6l11.13,11.13a10.77,10.77,0,0,1,15.23,0L186.2,83.21a10.77,10.77,0,0,1,0-15.23L175.07,56.85a10.77,10.77,0,0,1-15.23,0l-44.52,44.52A10.77,10.77,0,0,1,115.32,116.6Z"></path> <path class="cls-5" d="M115.32,116.6l11.13,11.13a10.77,10.77,0,0,1,15.23,0L186.2,83.21a10.8,10.8,0,0,1-1.27-1.54H135l-19.7,19.7A10.77,10.77,0,0,1,115.32,116.6Z"></path> <path class="cls-3" d="M141.68,129.73h0a2,2,0,0,1-1.41-.59,8.77,8.77,0,0,0-12.4,0,2.06,2.06,0,0,1-2.83,0L113.9,118a2,2,0,0,1,0-2.83,8.77,8.77,0,0,0,0-12.4,2,2,0,0,1,0-2.83l44.52-44.52a2,2,0,0,1,2.83,0,8.78,8.78,0,0,0,12.4,0,2,2,0,0,1,2.83,0l11.13,11.13a2,2,0,0,1,0,2.83,8.77,8.77,0,0,0,0,12.4,2,2,0,0,1,0,2.83l-44.52,44.52A2,2,0,0,1,141.68,129.73ZM118,116.49l8.52,8.52a12.78,12.78,0,0,1,15,0L183.48,83.1a12.79,12.79,0,0,1,0-15L175,59.57a12.8,12.8,0,0,1-15,0L118,101.48a12.79,12.79,0,0,1,0,15Z"></path> <circle class="cls-6" cx="150.76" cy="92.29" r="10.94" transform="translate(-21.1 133.63) rotate(-45)"></circle> <path class="cls-3" d="M150.76,105.22a12.9,12.9,0,0,1-9.15-3.78h0a13,13,0,1,1,9.15,3.78Zm-6.32-6.61a8.94,8.94,0,1,0,0-12.64,9,9,0,0,0,0,12.64Z"></path> <rect class="cls-1" x="64.98" y="57.61" width="106.05" height="58.82" transform="translate(205.02 -30.98) rotate(90)"></rect> <rect class="cls-2" x="88.59" y="81.67" width="58.82" height="58.38"></rect> <path class="cls-3" d="M147.41,142H88.59a2,2,0,0,1-2-2V34a2,2,0,0,1,2-2h58.82a2,2,0,0,1,2,2V140A2,2,0,0,1,147.41,142Zm-56.82-4h54.82V36H90.59Z"></path> <path class="cls-4" d="M125.87,129.28H110.13a10.77,10.77,0,0,0-10.77-10.77v-63a10.77,10.77,0,0,0,10.77-10.77h15.74a10.77,10.77,0,0,0,10.77,10.77v63A10.77,10.77,0,0,0,125.87,129.28Z"></path> <path class="cls-5" d="M110.13,129.28h15.74a10.77,10.77,0,0,1,10.77-10.77V81.67H99.36v36.84A10.77,10.77,0,0,1,110.13,129.28Z"></path> <path class="cls-3" d="M125.87,131.28H110.13a2,2,0,0,1-2-2,8.78,8.78,0,0,0-8.77-8.77,2,2,0,0,1-2-2v-63a2,2,0,0,1,2-2,8.78,8.78,0,0,0,8.77-8.77,2,2,0,0,1,2-2h15.74a2,2,0,0,1,2,2,8.78,8.78,0,0,0,8.77,8.77,2,2,0,0,1,2,2v63a2,2,0,0,1-2,2,8.78,8.78,0,0,0-8.77,8.77A2,2,0,0,1,125.87,131.28Zm-13.9-4H124a12.8,12.8,0,0,1,10.61-10.61V57.38A12.8,12.8,0,0,1,124,46.77H112a12.8,12.8,0,0,1-10.61,10.61v59.28A12.8,12.8,0,0,1,112,127.28Z"></path> <circle class="cls-7" cx="118" cy="87.02" r="10.94"></circle> <path class="cls-6" d="M118,98a10.93,10.93,0,0,0,9.53-16.3H108.47A10.93,10.93,0,0,0,118,98Z"></path> <path class="cls-3" d="M118,100A12.94,12.94,0,1,1,130.94,87,13,13,0,0,1,118,100Zm0-21.88A8.94,8.94,0,1,0,126.94,87,9,9,0,0,0,118,78.08Z"></path> <rect class="cls-8" x="24" y="91.67" width="188" height="130.33" rx="12" ry="12"></rect> <rect class="cls-9" x="24" y="107.28" width="188" height="99.11"></rect> <path class="cls-3" d="M200,224H36a14,14,0,0,1-14-14V103.67a14,14,0,0,1,14-14H200a14,14,0,0,1,14,14V210A14,14,0,0,1,200,224ZM36,93.67a10,10,0,0,0-10,10V210a10,10,0,0,0,10,10H200a10,10,0,0,0,10-10V103.67a10,10,0,0,0-10-10Z"></path> <rect class="cls-6" x="24" y="114" width="188" height="85.67"></rect> <rect class="cls-7" x="24" y="121.05" width="188" height="71.56"></rect> <path class="cls-3" d="M212,201.67H24a2,2,0,0,1-2-2V114a2,2,0,0,1,2-2H212a2,2,0,0,1,2,2v85.67A2,2,0,0,1,212,201.67Zm-186-4H210V116H26Z"></path> <rect class="cls-2" x="182.04" y="139.71" width="49.96" height="34.25" rx="6" ry="6"></rect> <rect class="cls-1" x="182.04" y="139.71" width="49.96" height="27.94" rx="5.42" ry="5.42"></rect> <path class="cls-3" d="M226,176H188a8,8,0,0,1-8-8V145.71a8,8,0,0,1,8-8h38a8,8,0,0,1,8,8V168A8,8,0,0,1,226,176Zm-38-34.25a4,4,0,0,0-4,4V168a4,4,0,0,0,4,4h38a4,4,0,0,0,4-4V145.71a4,4,0,0,0-4-4Z"></path> <circle class="cls-10" cx="133" cy="7" r="5"></circle> <circle class="cls-10" cx="8" cy="128" r="4"></circle> <circle class="cls-10" cx="115" cy="248" r="3"></circle> <circle class="cls-10" cx="250" cy="189" r="2"></circle> <circle class="cls-10" cx="206" cy="240" r="1"></circle> <circle class="cls-11" cx="151" cy="239" r="5"></circle> <circle class="cls-11" cx="246" cy="223" r="4"></circle> <circle class="cls-11" cx="107" cy="19" r="3"></circle> <circle class="cls-11" cx="197" cy="24" r="2"></circle> <circle class="cls-11" cx="240" cy="85" r="1"></circle> <circle class="cls-12" cx="22" cy="45" r="5"></circle> <circle class="cls-12" cx="66" cy="233" r="4"></circle> <circle class="cls-12" cx="224" cy="29" r="3"></circle> <circle class="cls-12" cx="18" cy="225" r="2"></circle> <circle class="cls-12" cx="29" cy="208" r="1"></circle> <circle class="cls-13" cx="219" cy="76" r="5"></circle> <circle class="cls-13" cx="177" cy="250" r="4"></circle> <circle class="cls-13" cx="13" cy="175" r="3"></circle> <circle class="cls-13" cx="49" cy="42" r="2"></circle> <circle class="cls-13" cx="238" cy="131" r="1"></circle> </g> </g></svg>
							<form action="/Peoples_Horizon/api/finance?type=Deposit" method="post">
							    <button class="option" type="submit" name="action" value="Deposit Amount">Deposit Amount</button>
							</form>
						</div>
						<%
							}
				        	if (admin || employee)
				        	{
				        %>
					        	<form action="/Peoples_Horizon/Create_Account.jsp?type=createNewAccount" method="post">
								    <button type="submit" class="option"><h3>Create New Account</h3></button>
								</form>
								
								<form action="/Peoples_Horizon/Create_Account.jsp?type=createAccount" method="post">
								    <button type="submit" class="option"><h3>Create Account</h3></button>
								</form>
								
								<form action="/Peoples_Horizon/Create_Account.jsp?type=addEmployee" method="post">
								    <button type="submit" class="option"><h3>Add Employee</h3></button>
								</form>
								
								<form action="/Peoples_Horizon/api/getUsers" method="get">
									<input type = "hidden" name = "page" value = "1">
								    <button type="submit" class="option"><h3>View All Users</h3></button>
								</form>
							
								<form action="/Peoples_Horizon/api/getAllAccounts" method="get">
									<input type = "hidden" name = "page" value = "1">
								  	<button type="submit" class="option"><h3>Manage Accounts</h3></button>
								</form>
								
								<form action="/Peoples_Horizon/api/getAllTransactions" method="get">
									<input type = "hidden" name = "type" value = "getAllTransactions">
									<input type = "hidden" name = "page" value = "1">
								    <button type="submit" class="option"><h3>View all transactions</h3></button>
								</form>
						<%
				        	}
				        	if (admin)
				        	{
						%>
								
								<form action="/Peoples_Horizon/Create_Account.jsp?type=addBranch" method="post">
								    <button type="submit" class="option"><h3>Add Branch</h3></button>
								</form>
						<%
				        	}
						%>
						</div>
					</div>
		    	</div>
		    <div id="overlay" class="overlay"></div> <!-- Add overlay div -->
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
		    
		<footer style = "background-color:blue; height: 6vh; font-size: 5vh;">Developed by, Jeyan</footer>
	</body>
</html>


