<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="Login.css"> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
	<div style = "background-color: #b1f5fe; height: 8vh; box-shadow: 0 0 5px rgba(0, 0, 100, 0.1);">
	</div>
	
    <div class="container" style = "height:72vh;">
    	<div class = "moveUp">
        <center> 
				<svg class = "commonSvg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="256" height="256" viewBox="0 0 256 256" xml:space="preserve">

				<defs>
				</defs>
				<g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)" >
					<rect x="19.65" y="29.55" rx="0" ry="0" width="50.71" height="48.86" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(103,115,108); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
					<path d="M 29.894 47.031 c 0.976 0 1.767 -0.791 1.767 -1.767 v -8.427 H 15.63 v 8.427 c 0 0.976 0.791 1.767 1.767 1.767 h 1.142 V 66.62 h -1.142 c -0.976 0 -1.767 0.791 -1.767 1.767 v 8.427 h 16.031 v -8.427 c 0 -0.976 -0.791 -1.767 -1.767 -1.767 h -1.142 V 47.031 H 29.894 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(91,101,95); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 55.249 47.031 c 0.976 0 1.767 -0.791 1.767 -1.767 v -8.427 H 40.985 v 8.427 c 0 0.976 0.791 1.767 1.767 1.767 h 1.142 V 66.62 h -1.142 c -0.976 0 -1.767 0.791 -1.767 1.767 v 8.427 h 16.031 v -8.427 c 0 -0.976 -0.791 -1.767 -1.767 -1.767 h -1.142 V 47.031 H 55.249 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(91,101,95); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 76.603 13.694 H 13.397 c -0.976 0 -1.767 0.791 -1.767 1.767 v 14.674 c 0 0.976 0.791 1.767 1.767 1.767 h 63.205 c 0.976 0 1.767 -0.791 1.767 -1.767 V 15.461 C 78.37 14.485 77.579 13.694 76.603 13.694 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(151,166,157); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<polygon points="78.37,27.98 78.37,21.36 70.86,15.58 60.59,15.58 60.59,27.98 " style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(131,146,137); fill-rule: nonzero; opacity: 1;" transform="  matrix(1 0 0 1 0 0) "/>
					<path d="M 81.264 15.584 H 8.736 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -3.059 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 72.529 c 0.976 0 1.767 0.791 1.767 1.767 v 3.059 C 83.031 14.793 82.24 15.584 81.264 15.584 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<polygon points="37.71,8.99 29.14,15.58 70.86,15.58 62.29,8.99 " style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(103,115,108); fill-rule: nonzero; opacity: 1;" transform="  matrix(1 0 0 1 0 0) "/>
					<path d="M 45 36.837 h 36.264 c 0.976 0 1.767 -0.791 1.767 -1.767 v -5.403 c 0 -0.549 -0.255 -1.066 -0.689 -1.4 l -36.264 -27.9 c -0.635 -0.489 -1.52 -0.489 -2.155 0 l -36.264 27.9 c -0.435 0.334 -0.689 0.852 -0.689 1.4 v 5.403 c 0 0.976 0.791 1.767 1.767 1.767 H 45 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(182,195,187); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 53.015 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 38.751 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 53.015 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 78.37 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 64.106 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 78.37 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<rect x="14.54" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
					<path d="M 27.661 36.837 v 8.427 c 0 0.976 -0.791 1.767 -1.767 1.767 H 13.397 c -0.976 0 -1.767 -0.791 -1.767 -1.767 v -8.427 H 27.661 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 36.985 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 36.985 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 62.339 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 62.339 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 11.63 76.814 v -8.427 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 12.497 c 0.976 0 1.767 0.791 1.767 1.767 v 8.427 H 11.63 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(141,154,146); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<rect x="39.89" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
					<rect x="65.25" y="47.03" rx="0" ry="0" width="10.21" height="19.59" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(128,142,134); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
					<path d="M 83.031 83.407 H 6.969 v -4.826 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 72.529 c 0.976 0 1.767 0.791 1.767 1.767 V 83.407 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(151,166,157); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 88.883 90 H 1.117 v -4.826 c 0 -0.976 0.791 -1.767 1.767 -1.767 h 84.233 c 0.976 0 1.767 0.791 1.767 1.767 V 90 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(182,195,187); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 45 13 c 5.36 0 9.706 4.345 9.706 9.706 S 50.36 32.412 45 32.412 s -9.706 -4.345 -9.706 -9.706 S 39.64 13 45 13 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 42.738 13.276 c -2.714 2.243 -4.443 5.634 -4.443 9.43 c 0 3.796 1.73 7.187 4.443 9.43 c -4.267 -1.021 -7.443 -4.85 -7.443 -9.43 C 35.294 18.126 38.47 14.297 42.738 13.276 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(72,80,75); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 50.476 23.671 c -0.572 -1.196 -1.987 -1.749 -3.155 -2.098 c -1.403 -0.419 -1.705 -0.779 -1.77 -0.915 c -0.042 -0.088 -0.023 -0.232 0.044 -0.396 c 0.209 -0.467 0.821 -0.794 1.488 -0.794 c 0.479 0 0.93 0.169 1.224 0.437 c 0.217 0.198 0.535 0.236 0.803 0.116 l 0.702 -0.315 c 0.464 -0.208 0.61 -0.812 0.273 -1.193 c -0.513 -0.58 -1.23 -0.992 -2.042 -1.177 v -0.829 c 0 -0.421 -0.342 -0.763 -0.763 -0.763 h -0.72 c -0.421 0 -0.763 0.342 -0.763 0.763 v 0.918 c -1.011 0.32 -1.843 1.008 -2.265 1.951 c -0.412 1.006 -0.231 1.779 -0.005 2.249 c 0.572 1.196 1.986 1.75 3.155 2.098 c 1.404 0.418 1.706 0.779 1.771 0.915 c 0.042 0.088 0.023 0.233 -0.044 0.396 c -0.209 0.467 -0.821 0.793 -1.488 0.793 c -0.479 0 -0.93 -0.168 -1.223 -0.437 c -0.217 -0.198 -0.534 -0.236 -0.802 -0.116 l -0.702 0.314 c -0.469 0.21 -0.607 0.819 -0.266 1.203 c 0.477 0.539 1.129 0.933 1.87 1.133 v 0.863 c 0 0.421 0.342 0.763 0.763 0.763 h 0.72 c 0.421 0 0.763 -0.342 0.763 -0.763 v -0.863 c 1.087 -0.294 1.984 -1.011 2.429 -2.006 C 50.882 24.914 50.701 24.142 50.476 23.671 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(72,80,75); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
					<path d="M 48.476 23.671 c -0.572 -1.196 -1.987 -1.749 -3.155 -2.098 c -1.403 -0.419 -1.705 -0.779 -1.77 -0.915 c -0.042 -0.088 -0.023 -0.232 0.044 -0.396 c 0.209 -0.467 0.821 -0.794 1.488 -0.794 c 0.479 0 0.93 0.169 1.224 0.437 c 0.217 0.198 0.535 0.236 0.803 0.116 l 0.702 -0.315 c 0.464 -0.208 0.61 -0.812 0.273 -1.193 c -0.513 -0.58 -1.23 -0.992 -2.042 -1.177 v -0.829 c 0 -0.421 -0.342 -0.763 -0.763 -0.763 h -0.72 c -0.421 0 -0.763 0.342 -0.763 0.763 v 0.918 c -1.011 0.32 -1.843 1.008 -2.265 1.951 c -0.412 1.006 -0.231 1.779 -0.005 2.249 c 0.572 1.196 1.986 1.75 3.155 2.098 c 1.404 0.418 1.706 0.779 1.771 0.915 c 0.042 0.088 0.023 0.233 -0.044 0.396 c -0.209 0.467 -0.821 0.793 -1.488 0.793 c -0.479 0 -0.93 -0.168 -1.223 -0.437 c -0.217 -0.198 -0.534 -0.236 -0.802 -0.116 l -0.702 0.314 c -0.469 0.21 -0.607 0.819 -0.266 1.203 c 0.477 0.539 1.129 0.933 1.87 1.133 v 0.863 c 0 0.421 0.342 0.763 0.763 0.763 h 0.72 c 0.421 0 0.763 -0.342 0.763 -0.763 v -0.863 c 1.087 -0.294 1.984 -1.011 2.429 -2.006 C 48.882 24.914 48.701 24.142 48.476 23.671 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(151,166,157); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
				</g>
			</svg>
        	<h2 style = " ">People's Horizon</h2>
        </center>
        </div> 
        
        
         
				<%@ include file = "../Popup.jsp" %>
        
        <form class = "commonForm" id="loginForm">
            <input type="number" id="userId" name="userId" required placeholder = "UserId">
            <input type="hidden" id="userId" name="type" value = "" placeholder = "UserId">
            <input autocomplete="off" type="password" id="password" name="password" required placeholder = "Password"><br>
			
			<div class="message" id="addCustomerMessage"><p id="errorMessage"></p></div>

			<input type="submit" value="Login">
		</form>	
		
        <%-- <% String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { %>
                window.alert("<%= errorMessage %>");
        <%
			}
        %> --%>
    </div>
    
    
    
    
    
    
    
    
    	<%@ include file = "../Popup.jsp" %>	
	<!--
			<script>
				$("#submit").submit(function(event) 
			    {
			        event.preventDefault(); 
			        var formData = $(this).serialize(); 
			        var typeValue = "login";
			        $.ajax(
			        {
			            type: "POST",
			            url: "/Peoples_Horizon/api/" + typeValue,
			            data: formData,
			            success: function(response) 
			            {
			                var url = "/Peoples_Horizon/Dummy.jsp?user=" + response.role;
			                console.log(response.role, url);
			                displayPopup(response.message, true, response.url);
			            },
			            error: function(xhr, textStatus, error) 
			            {
			            	//console.log(xhr, textStatus, error);
			            	//displayPopup(xhr.responseJSON.error, false, null);
							var errorMessage;
							if (xhr.responseJSON && xhr.responseJSON.error) {
								errorMessage = xhr.responseJSON.error;
							} else {
								errorMessage = "Unknown error occurred.";
							}
							displayPopup(errorMessage, false, null);
			            }
			        });
			    });
			</script>
	-->
    <script>
    $("#loginForm").submit(function(event) {
        event.preventDefault(); 
        var formData = $(this).serialize(); 
        var typeValue = "login";
        $.ajax({
            type: "POST",
            url: "/Peoples_Horizon/api/" + typeValue,
            data: formData,
            success: function(response) {
				var form = $('<form action="' + "/Peoples_Horizon/api/Home" + '" method="post"></form>');
				$('body').append(form);
        		form.submit();
            }, // Add a comma here
            error: function(xhr, textStatus, error) {
                console.log(xhr.responseJSON);
                var errorMessage;
                if (xhr.responseJSON && xhr.responseJSON.error) {
                    errorMessage = xhr.responseJSON.error;
                } else {
                    errorMessage = "Invalid User ID or Password";
                }
                displayPopup(errorMessage, false, null);
            }
        });
    });
</script>

</body>
</html>
