<!DOCTYPE html>
<%@ page import = "org.json.JSONObject" %>
<%@ page import = "com.bank.peopleshorizon.enums.Status" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device	-width, initial-scale=1.0">
    <link rel="stylesheet" href="Profile.css">
    <title>User Profile</title>
    <style>
    
    :root
        {
        	--sidebarColor: #f1f5f9;
        	--headingColor: rgb(124, 58, 237);
        	--dropdownColor: #e1f5fe;
        }
        
    body
    {
    	margin-left: 17vw;
    	margin-top: 10vh;
    }
   
    a, a:hover {
        text-decoration: none;
    }
    
    .icon {
        display: inline-block;
        width: 1em;
        height: 1em;
        stroke-width: 0;
        stroke: currentColor;
        fill: currentColor;
    }
    .wrapper 
    {
        height: 90vh;
        margin-left: -5vw;
        width: 83vw;
        display: flex;
    }
    .profile-card {
        width: 100%;
        min-height: 46vh;
        margin: auto;
        box-shadow: 0px 8px 60px -10px rgba(13, 28, 39, 0.6);
        background: #fff;
        border-radius: 12px;
        max-width: 800px;
	 box-shadow: none;
	 border: 2px solid #e2e8f0;
	 background-color: var(--sidebarColor);
    }

    .profile-card__img {
        width: 10vh;
        height: 10vh;
        margin-left: auto;
        margin-right: auto;
        transform: translateY(-50%);
        border-radius: 50%;
        overflow: hidden;
        z-index: 4;
        box-shadow: 0px 5px 50px 0px rgba(68, 108, 252, 0.8), 0px 0px 0px 7px rgba(74, 107, 255, 0.5);
    }

    .profile-card__img img 
    {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
    }
    .profile-card__cnt 
    {
        margin-top: -35px;
        padding: 0 20px;
        padding-bottom: 40px;
        transition: all 0.3s;
    }
    .profile-card__name {
        font-weight: 700;
        font-size: 35px;
        color: #6944ff;
        margin-bottom: 15px;
    }
    .profile-card__txt {
        font-size: 24px;
        font-weight: 500;
        color: #324e63;
        margin-bottom: 15px;
    }
    .profile-card__txt strong {
        font-weight: 700;
    }

    .profile-card-loc__icon {
        display: inline-flex;
        font-size: 27px;
        margin-right: 10px;
    }

    .profile-card-ctr {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 40px;
    }

    .profile-card__button 
    {
        background: none;
        border: none;
        font-family: 'Quicksand', sans-serif;
        font-weight: 700;
        font-size: 19px;
        margin: 15px 35px;
        padding: 15px 40px;
        min-width: 201px;
        border-radius: 50px;
        min-height: 55px;
        color: #fff;
        cursor: pointer;
        backface-visibility: hidden;
        transition: all 0.3s;
    }


    .profile-card__button:focus {
        outline: none !important;
    }


    .profile-card__button.button--blue {
        background: linear-gradient(45deg, #1da1f2, #0e71c8);
        box-shadow: 0px 4px 30px rgba(19, 127, 212, 0.4);
    }
    .profile-card__button.button--blue:hover {
        box-shadow: 0px 7px 30px rgba(19, 127, 212, 0.75);
    }

    .zp-card {
        color: black;
        font-size: 22px;
        margin-top: 20px;
        box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.12);
        box-shadow: none;
        background-color: #fff;
        border-radius: 2px;
        overflow: hidden;
		 background-color: var(--sidebarColor);
    }
    .zp-lst-wrapper {
        clear: both;
        border-bottom: 3px solid #eceff1;
        line-height: 4vh;
        margin: 1.5vh;
    }
    .zp-lst-wrapper .zp-left-label {
        width: calc(50% - 20px);
        float: left;
        padding-top: 0 !important;
        padding-right: 20px;
        padding-bottom: 4px;
        text-indent: 15px;
        text-align: left;
    }
    .zp-lst-wrapper .zp-right-label {
        text-align: left;
        padding-top: 0 !important;
        padding-right: 20px;
        margin-bottom: 5px;
        padding-bottom: 5px;
    }
    .zp-lst-wrapper::after {
        content: "";
        clear: both;
        display: table;
    }
    .zp-lst-wrapper:last-child {
        border-bottom: none;
    }
    .status
    {
    	padding: 1vh;
		border-radius: 30px;
    }

    </style>
    <%@ page import = "com.bank.peopleshorizon.entities.User" %>
</head>
<body>

        <%@ include file = "../Sidebar.jsp" %>	
    <%
    	JSONObject user = (JSONObject) request.getAttribute("profile");
    	String status = Status.values()[(Integer) user.get("Status")].toString();
    	boolean active = status.equals("ACTIVE");
    	String style = (active ? "color: #2ac0af; background-color: #69f0ae40;" : "color: #f06292; background-color: #f8bbd040;"); 

    %>
    
    			<style>
					.Profile
					{
						background-color: #ddd1fd;
						color: #8b5cf6;
					}
				</style>

    <div class="wrapper">
        <div class="profile-card js-profile-card">
            <div class="profile-card__img">
            <img src="https://i.stack.imgur.com/l60Hf.png" alt="profile card">
            </div>

            <div class="profile-card__cnt js-profile-cnt">
                <div class="profile-card__name">${user.getFirstName()} ${user.getLastName()}</div>
                <div class="profile-card__txt"><strong>${user.getEmail()}</strong></div>
                <div class="profile-card-loc">
                    <span class="profile-card-loc__icon">
                    <svg class="icon"><use xlink:href="#icon-location"></use></svg>
                    </span>
                </div>
            
                <div class="zp-card">
                    <div class="zp-card-body">
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">User ID</div>
                            <div class="zp-right-label"><%= user.get("User ID") %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Name</div>
                            <div class="zp-right-label"><%= user.get("First Name") %> <%= user.get("Last Name") %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Email ID</div>
                            <div class="zp-right-label"><%= user.get("Email") %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Phone Number</div>
                            <div class="zp-left-label"><%= user.get("Phone Number") %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Address</div>
                            <div class="zp-right-label"><%= user.get("address") %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Role</div>
                            <div class="zp-right-label status" style = ""><%= Role.values()[(Integer) user.get("User Type")] %></div>
                        </div>
                        <div class="zp-lst-wrapper">
                            <div class="zp-left-label">Status</div>
                            <div class="zp-right-label status" style = ""><%= status %></div>
                        </div>
                    </div>
                </div>
            <!-- 
                <div class="profile-card-ctr">
                    <button class="profile-card__button button--blue js-message-btn">Edit</button>
                </div>
            -->
            </div>

        </div>

    </div>

</body>
</html>
