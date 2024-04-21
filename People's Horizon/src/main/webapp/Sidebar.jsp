<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page import="com.bank.peopleshorizon.enums.Role" %>
<%@page import="java.util.ArrayList"%>

<!doctype html>
<html lang="en">
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Sidebar.css">
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function toggleDropdown() 
            {
                var dropdown = document.getElementById("dropdown");
                dropdown.classList.toggle("show-dropdown");
            }
        </script>
        
        
        
        
        <style type="text/css">
        
        :root
        {
        	--sidebarColor: #f1f5f9;
        	--headingColor: rgb(124, 58, 237);
        	--dropdownColor: #e1f5fe;
        }
        		body{
  padding: 2.5vh;
}
.title {
	color: #5C6AC4;
}

.topbar
{
  top:0;
  left:0;
  position: fixed;
  width: 100vw;
  height: 10vh;
  background-color: var(--sidebarColor) !important;
  display: flex;
  align-items: center;
   box-shadow: 300px 1px 25px var(--sidebarColor); 
}

.app-name 
{
  font-size: 3vw;
  line-height: 1.5rem;
  font-family: "Roboto Flex", sans-serif;
  color: var(--headingColor);
  margin-left: 40%;
  font-weight: bold;
}


.sidebar
{
  width: 15.5vw;
  height: 100%;
  z-index: 50;
  top:0;
  left:0;
  background-color: var(--sidebarColor) !important;
  position: fixed;
}

.sidebar-content
{
  padding-bottom: 1.5rem;
  padding-top: 1.5rem;
  padding-left: 1.25rem;
  width: 90%;
  position: relative;
}

.menu, ol, ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

ul {
  display: block;
  /*list-style-type: disc;*/
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
    padding: 1.5vh;
}

.list-item
{
  	color: #37474f;
}

.list-item:hover 
{
  background-color: #ddd6fe;
  border-radius: 0.5rem;
}

.active:hover {
  background-color: rgb(221 214 254);
  color: rgb(124 58 237);
  border-radius: 0.5rem;
  cursor: pointer;
}

a {
  color: inherit;
  text-decoration: inherit;
}

.list-item 
{
  display: flex;
  align-items: center;
  gap: 0.75rem;
  border-radius: 0.5rem;
  padding-bottom: 0.75rem;
  padding-top: 0.75rem;
  padding-left: 1rem;
  padding-right: 1rem;
  width: 12.5vw;
}

button 
{
  border: none; 
  background: none;
}

span
{
  font-weight: bold;
  font-size: 1vw;
  line-height: 1.25rem; 
  font-family: Roboto Flex, sans-serif;
  display: block;
}



/* svg {
  width: 2.5rem;
  height: 2.5rem;
  display: block;
  vertical-align: middle;
}
 */
.logo {
  text-align: center; 
  margin-left: -1em;
  margin-top: -1em;
}

.dropdown 
{
	  width: 18.1vw;
	  margin-top: 105px;
	  max-height: 35vh;
	  overflow-y: auto;
	  position: fixed;
	  z-index: 99999;
}

.accounts 
{
  margin-left: 8vw;
  display: flex;
  overflow-y: auto;	
}

.account {
  width: 15vw;
  height: 50px;
  padding: 20px;
  background-color: #ecf0f1;
  border-radius: 20px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
  display: flex;
  align-items: center;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.account:hover {
  background-color: rgb(221 214 254);
  color: rgb(124 58 237);
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.circle {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #898989;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  font-weight: bold;
  color: #fff;
  margin-right: 20px;
}

.account-info {
  flex: 1;
  text-align: left;
}

.account p {
  color: #34495e;
  font-size: 16px;
  font-family: Roboto Flex, sans-serif;
  font-weight: bold;
  margin: 10px 0;
}

.current-account {
  border: 2px solid #2980b9;
  box-shadow: 0 0 20px rgba(41, 128, 185, 0.5);
}

.dropdown {
  display: none;
  position: absolute;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.show-dropdown {
  display: block;
}

.down-arrow 
{
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid #34495e; 
}

.active {
position: relative;
    background-color: var(--dropdownColor);
    color: rgb(124 58 237);
}
        
        
        </style>
        
        
        
    </head>
    <body>
    <%
		List<JSONObject> myAccounts = (List<JSONObject>) request.getAttribute("accounts");
		Object primaryAccount = session.getAttribute("primary");
		if (myAccounts == null) myAccounts = new ArrayList<>();
		if (primaryAccount == null) primaryAccount = 0;
		Role userRole = (Role) session.getAttribute("role");
    %>
        <div class="topbar">
            <h2 class="app-name">PEOPLE'S HORIZON </h2>
            
            <%
            	if (userRole == Role.CUSTOMER)
            	{
            %>
	            <div class="accounts">
	                <div class="account active" onclick="toggleDropdown()">
		                <div class="circle">D</div>
			                <div class="account-info">
			                 <%
			                	for (JSONObject account: myAccounts)
			                	{
			                		if (primaryAccount.equals(account.opt("Account Number")))
			                				{
			                %>
			                    <p><%= account.opt("Branch Name") %></p>
			                <%
			                	}}
			                %>
			                    <p><%= primaryAccount %></p>
			                </div>
		                <div class="down-arrow"></div>
	                </div>
	               
	                <div class="dropdown" id="dropdown">
		                <form action = "/Peoples_Horizon/api/switchAccount" method = "post">
			                <%
			                	for (JSONObject account: myAccounts)
			                	{
			                		if (primaryAccount.equals(account.opt("Account Number"))) continue;
			                %>
					                <button name = "account" value = "<%= account.opt("Account Number") %>">
						                <div class="account">
						                    <div class="circle">M</div>
						                    <div class="account-info">
						                    <p><%= account.opt("Branch Name") %></p>
						                    <p><%= account.opt("Account Number") %></p>
						                    </div>
						                </div>
					                </button>
					        <%
			                	}
					        %>
					        
					        
					      
				        </form>
	                
	                <!-- Add more accounts as needed -->
	                </div>
            	</div>
	           <%
            	}
	           %>
            </div>
            <div class="sidebar">
            <div class="sidebar-content">
                <ul id="sidebar-menu" class="menu">
                <li class="logo">
                    <a href="http://locahost:8080/Peoples_Horizon/PeoplesHorizon.jsp">
                    <svg version="1.0" id="Layer_1" xmlns="http://www.w3.org/2000/svg" width="7vw" height="7vh" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 64 64" enable-background="new 0 0 64 64" xml:space="preserve" fill="#000000">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                        <g>
                            <g>
                            <rect x="18" y="25" fill="#506C7F" width="4" height="29"></rect>
                            <rect x="30" y="25" fill="#506C7F" width="4" height="29"></rect>
                            <rect x="42" y="25" fill="#506C7F" width="4" height="29"></rect>
                            </g>
                            <g>
                            <rect x="48" y="25" fill="#b3c7cb" width="4" height="29"></rect>
                            <rect x="24" y="25" fill="#b3c7cb" width="4" height="29"></rect>
                            <rect x="36" y="25" fill="#b3c7cb" width="4" height="29"></rect>
                            <rect x="12" y="25" fill="#b3c7cb" width="4" height="29"></rect>
                            </g>
                            <g>
                            <path fill="#cfb3f9" d="M8,56c-1.104,0-2,0.896-2,2h52c0-1.104-0.895-2-2-2H8z"></path>
                            <path fill="#cfb3f9" d="M60,60H4c-1.104,0-2,0.896-2,2h60C62,60.896,61.105,60,60,60z"></path>
                            </g>
                            <path fill="#cfb3f9" d="M4,23h56c0.893,0,1.684-0.601,1.926-1.461c0.24-0.86-0.125-1.785-0.889-2.248l-28-17 C32.725,2.1,32.365,2,32,2c-0.367,0-0.725,0.1-1.037,0.29L2.961,19.291c-0.764,0.463-1.129,1.388-0.888,2.247 C2.315,22.399,3.107,23,4,23z"></path>
                            <g>
                            <path fill="#394240" d="M60,58c0-2.209-1.791-4-4-4h-2V25h6c1.795,0,3.369-1.194,3.852-2.922c0.484-1.728-0.242-3.566-1.775-4.497 l-28-17C33.439,0.193,32.719,0,32,0s-1.438,0.193-2.076,0.581l-28,17c-1.533,0.931-2.26,2.77-1.775,4.497 C0.632,23.806,2.207,25,4,25h6v29H8c-2.209,0-4,1.791-4,4c-2.209,0-4,1.791-4,4v2h64v-2C64,59.791,62.209,58,60,58z M4,23 c-0.893,0-1.685-0.601-1.926-1.462c-0.241-0.859,0.124-1.784,0.888-2.247l28-17.001C31.275,2.1,31.635,2,32,2 c0.367,0,0.725,0.1,1.039,0.291l28,17c0.764,0.463,1.129,1.388,0.887,2.248C61.686,22.399,60.893,23,60,23H4z M52,25v29h-4V25H52z M46,25v29h-4V25H46z M40,25v29h-4V25H40z M34,25v29h-4V25H34z M28,25v29h-4V25H28z M22,25v29h-4V25H22z M16,25v29h-4V25H16z M8,56h48c1.105,0,2,0.896,2,2H6C6,56.896,6.896,56,8,56z M2,62c0-1.104,0.896-2,2-2h56c1.105,0,2,0.896,2,2H2z"></path>
                            <path fill="#394240" d="M32,9c-2.762,0-5,2.238-5,5s2.238,5,5,5s5-2.238,5-5S34.762,9,32,9z M32,17c-1.656,0-3-1.343-3-3 s1.344-3,3-3c1.658,0,3,1.343,3,3S33.658,17,32,17z"></path>
                            </g>
                            <circle fill="#efdad7" cx="32" cy="14" r="3"></circle>
                        </g>
                        </g>
                    </svg>
                    </a>
                </li>
                <li>
                    <form class = "list-item DashBoard" style = "width: 10.5vw" action="/Peoples_Horizon/api/Home" method = "post" class="list-item">
                        <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="2.5em" height="2.5em" viewBox="0 0 256 256" data-icon="ph:gauge-duotone" class="iconify w-6 h-6 iconify--ph">
                        <g fill="currentColor">
                            <path d="M232 160v24a8 8 0 0 1-8 8H32a8 8 0 0 1-8-8v-22.87C24 103.65 70.15 56.2 127.63 56A104 104 0 0 1 232 160Z" opacity=".2"></path>
                            <path d="M207.06 80.67A111.24 111.24 0 0 0 128 48h-.4C66.07 48.21 16 99 16 161.13V184a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-24a111.25 111.25 0 0 0-32.94-79.33ZM224 184H119.71l54.76-75.3a8 8 0 0 0-12.94-9.42L99.92 184H32v-22.87c0-3.08.15-6.12.43-9.13H56a8 8 0 0 0 0-16H35.27c10.32-38.86 44-68.24 84.73-71.66V88a8 8 0 0 0 16 0V64.33A96.14 96.14 0 0 1 221 136h-21a8 8 0 0 0 0 16h23.67c.21 2.65.33 5.31.33 8Z"></path>
                        </g>
                        </svg>
                        <button class = "dashboardButton" type = "submit">
                        
	                        <span class="list-span">
	                        	Dashboard
	                        </span>
                        </button>
                    </form>
                </li>
				
			<%
				if (userRole == Role.CUSTOMER)
				{
			%>	
                <li>
                    <form action="/Peoples_Horizon/api/viewProfile" method="get">
	                    <button type="submit" class="list-item Profile">
	                        <svg fill="#77767b" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" width="2.5em" height="2.5em" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 45.532 45.532" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M22.766,0.001C10.194,0.001,0,10.193,0,22.766s10.193,22.765,22.766,22.765c12.574,0,22.766-10.192,22.766-22.765 S35.34,0.001,22.766,0.001z M22.766,6.808c4.16,0,7.531,3.372,7.531,7.53c0,4.159-3.371,7.53-7.531,7.53 c-4.158,0-7.529-3.371-7.529-7.53C15.237,10.18,18.608,6.808,22.766,6.808z M22.761,39.579c-4.149,0-7.949-1.511-10.88-4.012 c-0.714-0.609-1.126-1.502-1.126-2.439c0-4.217,3.413-7.592,7.631-7.592h8.762c4.219,0,7.619,3.375,7.619,7.592 c0,0.938-0.41,1.829-1.125,2.438C30.712,38.068,26.911,39.579,22.761,39.579z"></path> </g> </g></svg>
	                        <span class="list-span">
	                        Profile
	                        </span>
	                    </button>
                    </form>
                </li>

                <li>
                    <form action="/Peoples_Horizon/api/finance?type=Transfer" method="post">
                    <button type="submit" name="action" value="Transfer Fund" class="list-item TransferAmount">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" width="2.5em" height="2.5em" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 489.4 489.4" xml:space="preserve" fill="#000000">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <g>
                            <g>
                                <path style="fill:#ffffff;" d="M221,155.3c0,10.1-8.2,18.2-18.2,18.2H27.2c-10.1,0-18.2-8.2-18.2-18.2V29.2 C9,19.1,17.2,11,27.2,11h175.5c10.1,0,18.2,8.2,18.2,18.2v126.1H221z"></path>
                                <path d="M0,29.2v126.1c0,15,12.2,27.3,27.3,27.3H106v27.3H79.7c-5,0-9.1,4.1-9.1,9.1s4.1,9.1,9.1,9.1h70.6c5,0,9.1-4.1,9.1-9.1 s-4.1-9.1-9.1-9.1H124v-27.3h78.7c15,0,27.3-12.2,27.3-27.3V29.2c0-15-12.2-27.3-27.3-27.3H27.2C12.2,1.9,0,14.2,0,29.2z M211.9,29.2v126.1c0,5-4.1,9.1-9.1,9.1H27.2c-5,0-9.1-4.1-9.1-9.1V29.2c0-5,4.1-9.1,9.1-9.1h175.5 C207.8,20.1,211.9,24.2,211.9,29.2z"></path>
                                <path d="M462.2,261.4H286.6c-15,0-27.3,12.2-27.3,27.3v126c0,15,12.2,27.3,27.3,27.3h78.7v27.3H339c-5,0-9.1,4.1-9.1,9.1 s4.1,9.1,9.1,9.1h70.7c5,0,9.1-4.1,9.1-9.1s-4.1-9.1-9.1-9.1h-26.3V442h78.7c15,0,27.3-12.2,27.3-27.3V288.6 C489.4,273.6,477.2,261.4,462.2,261.4z M471.3,414.7c0,5-4.1,9.1-9.1,9.1H286.6c-5,0-9.1-4.1-9.1-9.1V288.6c0-5,4.1-9.1,9.1-9.1 h175.5c5,0,9.1,4.1,9.1,9.1v126.1H471.3z"></path>
                                <path d="M278.3,101.3h87v95.3c0,1.1,0.2,2.2,0.6,3.2l-16.7-16.7c-3.5-3.5-9.3-3.5-12.8,0s-3.5,9.3,0,12.8l31.6,31.6 c1.8,1.8,4.1,2.7,6.4,2.7s4.6-0.9,6.4-2.7l31.6-31.6c3.5-3.5,3.5-9.3,0-12.8s-9.3-3.5-12.8,0l-16.7,16.7c0.4-1,0.6-2.1,0.6-3.2 V92.3c0-5-4.1-9.1-9.1-9.1h-96.1c-5,0-9.1,4.1-9.1,9.1C269.3,97.3,273.3,101.3,278.3,101.3z"></path>
                                <path d="M105.9,402.4c0,5,4.1,9.1,9.1,9.1h96.1c5,0,9.1-4.1,9.1-9.1s-4.1-9.1-9.1-9.1h-87V298c0-1.1-0.2-2.2-0.6-3.2l16.7,16.7 c1.8,1.8,4.1,2.7,6.4,2.7s4.6-0.9,6.4-2.7c3.5-3.5,3.5-9.3,0-12.8l-31.6-31.6c-3.5-3.5-9.3-3.5-12.8,0L77,298.7 c-3.5,3.5-3.5,9.3,0,12.8s9.3,3.5,12.8,0l16.7-16.7c-0.4,1-0.6,2.1-0.6,3.2V402.4L105.9,402.4z"></path>
                            </g>
                            </g>
                        </g>
                        </svg>
                        <span class="list-span">
                        Transfer
                        </span>
                    </button>
                    </form>
                </li>
                <li>
                    <form action= "/Peoples_Horizon/api/finance?type=Withdrawl" method="post">
                     <button type="submit" name="action" value="Withdraw Amount" class="list-item WithdrawlAmount">
                        <svg viewBox="0 0 16 16" version="1.1" xmlns="http://www.w3.org/2000/svg" width="2.5em" height="2.5em" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000" transform="rotate(180)">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <path fill="#444" d="M8 0l2 3h-1v2h-2v-2h-1l2-3z"></path>
                            <path fill="#444" d="M15 7v8h-14v-8h14zM16 6h-16v10h16v-10z"></path>
                            <path fill="#444" d="M8 8c1.657 0 3 1.343 3 3s-1.343 3-3 3h5v-1h1v-4h-1v-1h-5z"></path>
                            <path fill="#444" d="M5 11c0-1.657 1.343-3 3-3h-5v1h-1v4h1v1h5c-1.657 0-3-1.343-3-3z"></path>
                        </g>
                        </svg>
                        <span class="list-span">Withdrawal</span>
                    </button>
                    </form>
                </li>
                <li>
                    <form action="/Peoples_Horizon/api/finance?type=Deposit" method="post">
                    <button type="submit" name="action" value="Deposit Amount" class="list-item DepositAmount">
                        <svg fill="#000000" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" width="2.5em" height="2.5em" transform="rotate(270)">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <g data-name="11. Phone" id="_11._Phone">
                            <path d="M14,6a1,1,0,0,0,0-2H8A1,1,0,0,0,8,6Z"></path>
                            <path d="M21,8.84v-4A4.8,4.8,0,0,0,16.21,0H5.79A4.8,4.8,0,0,0,1,4.79V27.21A4.8,4.8,0,0,0,5.79,32H16.21A4.8,4.8,0,0,0,21,27.21v-.05A10,10,0,0,0,21,8.84ZM16.21,30H5.79A2.79,2.79,0,0,1,3,27.21V4.79A2.79,2.79,0,0,1,5.79,2H16.21A2.79,2.79,0,0,1,19,4.79V8.2A10.2,10.2,0,0,0,17,8a9.92,9.92,0,0,0-7,2.89V10a1,1,0,0,0-2,0V26a1,1,0,0,0,2,0v-.89A9.92,9.92,0,0,0,17,28a10.19,10.19,0,0,0,1.93-.19A2.79,2.79,0,0,1,16.21,30ZM17,26a8,8,0,0,1-7-4.14V14.14A8,8,0,1,1,17,26Z"></path>
                            <path d="M17,15h2a1,1,0,0,0,0-2H18a1,1,0,0,0-2,0v.18A3,3,0,0,0,17,19a1,1,0,0,1,0,2H15a1,1,0,0,0,0,2h1a1,1,0,0,0,2,0v-.18A3,3,0,0,0,17,17a1,1,0,0,1,0-2Z"></path>
                            <path d="M30,5H27.41l.3-.29a1,1,0,1,0-1.42-1.42l-2,2a1,1,0,0,0,0,1.42l2,2a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L27.41,7H30a1,1,0,0,0,0-2Z"></path>
                            </g>
                        </g>
                        </svg>
                        <span class="list-span">
                        Deposit
                        </span>
                    </button>
                    </form>
                </li>
                <li>
                    <form action="/Peoples_Horizon/api/getStatement" method="post">
                    <button type="submit" name="action" value="View Statement" class="list-item Statement">
                        <svg fill="#000000" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" width="2.5em" height="2.5em">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                            <g data-name="27 receipt" id="_27_receipt">
                            <path d="M57.46,4.05H6.54A3.037,3.037,0,0,0,3.5,7.08V17.27A3.037,3.037,0,0,0,6.54,20.3h5.11V58.01a1,1,0,0,0,.68.95,1.023,1.023,0,0,0,1.12-.35,14.657,14.657,0,0,1,6.35-4.85,14.186,14.186,0,0,1,7.78-.74,14.873,14.873,0,0,1,3.99,1.33,17.809,17.809,0,0,1,2.39,1.53c.37.27.75.54,1.14.8a17.055,17.055,0,0,0,8.58,3.23c.53.03,1.06.05,1.61.05,1.08,0,2.22-.06,3.45-.17a12.37,12.37,0,0,0,2.12-.32c.99-.26,1.49-.75,1.49-1.46V20.3h5.11a3.037,3.037,0,0,0,3.04-3.03V7.08A3.037,3.037,0,0,0,57.46,4.05ZM11.65,14.23H9.57V10.12h2.08Zm38.7,43.3c-.02.01-.03.01-.05.02a10.143,10.143,0,0,1-1.73.25,34.3,34.3,0,0,1-4.78.12,15.237,15.237,0,0,1-7.58-2.9c-.37-.25-.73-.5-1.08-.76a19.293,19.293,0,0,0-2.67-1.7,16.483,16.483,0,0,0-4.52-1.51,16.258,16.258,0,0,0-8.88.85,16.52,16.52,0,0,0-5.41,3.48V10.12h36.7ZM58.5,17.27a1.037,1.037,0,0,1-1.04,1.03H52.35V16.23h3.08a1,1,0,0,0,1-1V9.12a1,1,0,0,0-1-1H8.57a1,1,0,0,0-1,1v6.11a1,1,0,0,0,1,1h3.08V18.3H6.54A1.037,1.037,0,0,1,5.5,17.27V7.08A1.037,1.037,0,0,1,6.54,6.05H57.46A1.037,1.037,0,0,1,58.5,7.08Zm-6.15-3.04V10.12h2.08v4.11Z"></path>
                            <path d="M24.85,14.21a1,1,0,0,1-1,1H17.74a1,1,0,0,1,0-2h6.11A1,1,0,0,1,24.85,14.21Z"></path>
                            <path d="M36.06,14.21a1,1,0,0,1-1,1H28.94a1,1,0,0,1,0-2h6.12A1,1,0,0,1,36.06,14.21Z"></path>
                            <path d="M47.26,14.21a1,1,0,0,1-1,1H40.15a1,1,0,0,1,0-2h6.11A1,1,0,0,1,47.26,14.21Z"></path>
                            <path d="M35.06,25.98A2.785,2.785,0,0,1,33,27.91v.54a1,1,0,1,1-2,0v-.7a7.81,7.81,0,0,1-1.29-.68c-.16-.1-.32-.2-.47-.28a1,1,0,0,1,.97-1.75c.18.1.37.21.56.33a3,3,0,0,0,1.53.64.89.89,0,0,0,.83-.55c.03-.12.03-.27-.21-.43l-2.45-1.64a2.494,2.494,0,0,1-1.1-1.67,2.3,2.3,0,0,1,.5-1.81A2.731,2.731,0,0,1,31,19.08v-.77a1,1,0,0,1,2,0v.67a2.81,2.81,0,0,1,.85.38l.98.65a1,1,0,0,1,.27,1.39.987.987,0,0,1-1.38.27l-.98-.65a1.06,1.06,0,0,0-1.31.13.321.321,0,0,0-.08.27.51.51,0,0,0,.23.31l2.46,1.64A2.345,2.345,0,0,1,35.06,25.98Z"></path>
                            <path d="M36.06,44.77a1,1,0,0,1-1,1H17.74a1,1,0,0,1,0-2H35.06A1,1,0,0,1,36.06,44.77Z"></path>
                            <path d="M47.26,32.55a1,1,0,0,1-1,1H40.15a1,1,0,1,1,0-2h6.11A1,1,0,0,1,47.26,32.55Z"></path>
                            <path d="M47.26,36.62a1,1,0,0,1-1,1H40.15a1,1,0,0,1,0-2h6.11A1,1,0,0,1,47.26,36.62Z"></path>
                            <path d="M47.26,40.69a1,1,0,0,1-1,1H40.15a1,1,0,0,1,0-2h6.11A1,1,0,0,1,47.26,40.69Z"></path>
                            <path d="M47.26,44.77a1,1,0,0,1-1,1H40.15a1,1,0,0,1,0-2h6.11A1,1,0,0,1,47.26,44.77Z"></path>
                            <path d="M36.06,40.69a1,1,0,0,1-1,1H17.74a1,1,0,1,1,0-2H35.06A1,1,0,0,1,36.06,40.69Z"></path>
                            <path d="M36.06,36.62a1,1,0,0,1-1,1H17.74a1,1,0,0,1,0-2H35.06A1,1,0,0,1,36.06,36.62Z"></path>
                            <path d="M36.06,32.55a1,1,0,0,1-1,1H17.74a1,1,0,1,1,0-2H35.06A1,1,0,0,1,36.06,32.55Z"></path>
                            </g>
                        </g>
                        </svg>
                        <span class="list-span">
                        Statement
                        </span>
                    </button>
                    </form>
                </li>
                <li>
                    <form action="/Peoples_Horizon/api/transactionHistory" method="get">
                    <input type = "hidden" name = "type" value = "transactionHistory">
                    <button type="submit" class="list-item Transactions" name="page" value = "1">
                        <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="2.5em" height="2.5em" viewBox="0 0 256 256" class="iconify w-6 h-6 iconify--ph">
                        <g fill="currentColor">
                            <path d="m208 176l-32 32v-64ZM80 112V48L48 80Z" opacity=".2"></path>
                            <path d="m213.66 170.34l-32-32A8 8 0 0 0 168 144v24H48a8 8 0 0 0 0 16h120v24a8 8 0 0 0 13.66 5.66l32-32a8 8 0 0 0 0-11.32ZM184 188.69v-25.38L196.69 176Zm-109.66-71A8 8 0 0 0 88 112V88h120a8 8 0 0 0 0-16H88V48a8 8 0 0 0-13.66-5.66l-32 32a8 8 0 0 0 0 11.32ZM72 67.31v25.38L59.31 80Z"></path>
                        </g>
                        </svg>
                        <span class="list-span">
                        Transactions
                        </span>
                    </button>
                    </form>
                </li>
                <%
					}
					if (userRole == Role.EMPLOYEE || userRole == Role.ADMIN)
					{
                %>
                <!-- 
                <li>
                  <form action="/Peoples_Horizon/Create_Account.jsp?type=addCustomer" method="post">
                      <button type="submit" class="list-item"> 
                        <span class="list-span">Add Customer</span>
                      </button>
                  </form>
                </li>
                <li>
                  <form action="/Peoples_Horizon/Create_Account.jsp?type=createAccount" method="post">
                      <button type="submit" class="list-item">
                        <span class="list-span">Create Account</span>
                      </button>
                  </form>
								</li>
                <li>
                  <form action="/Peoples_Horizon/Create_Account.jsp?type=addEmployee" method="post">
                      <button type="submit" class="list-item">
                        <span class="list-span">Add Employee</span>
                      </button>
                  </form>
				</li>
				
				-->
				
				
                <li>
                  <form action="/Peoples_Horizon/api/getUsers" method="post">
                    <input type = "hidden" name = "page" value = "1">
                      <button type="submit" class="list-item">
                        <span class="list-span">Users</span>
                      </button>
                  </form>
                </li>
                <li>
                  <form action="/Peoples_Horizon/api/getAllAccounts" method="post">
                    <input type = "hidden" name = "page" value = "1">
                      <button type="submit" class="list-item">
                        <span class="list-span">Accounts</span>
                      </button>
                  </form>
				</li>
                <li>
                  <form action="/Peoples_Horizon/api/getAllTransactions" method="get">
                    <input type = "hidden" name = "type" value = "getAllTransactions">
                    <input type = "hidden" name = "page" value = "1">
                      <button type="submit" class="list-item">
                        <span class="list-span">Transactions</span>
                      </button>
                  </form>
                </li>
                
                <%
					}
					if (userRole == Role.ADMIN)
					{
                %>

						<li>
		                  <form action="/Peoples_Horizon/api/getAllEmployees" method="post">
		                      <button type="submit" class="list-item"> 
		                        <span class="list-span">Employees</span>
		                      </button>
		                  </form>
		                </li>
		                
		                <li>
		                  <form action="/Peoples_Horizon/api/getAllBranch" method="post">
		                      <button type="submit" class="list-item"> 
		                        <span class="list-span">Branches</span>
		                      </button>
		                  </form>
		                </li>
	           <%
					}
	           %>
	           		<li>
			           <form action="/Peoples_Horizon/api/finance?type=Password" method="post">
							<button type="submit" class="list-item"> 
					        	<span class="list-span">Change Password</span>
					        </button>	
					   </form>
					</li>
		            <li>
			           <form action="/Peoples_Horizon/api/logout" method="post">
					        <button type="submit" class="list-item"> 
					        	<span class="list-span">Log out</span>
					        </button>
					   </form>
					</li>
					
                </ul>
            </div>
            </div>
    </body>
</html>

