<!DOCTYPE html>
<html>	
	<head>
	    <title>Address Input</title>
	    <link rel="stylesheet" type="text/css" href="Login.css">
	</head>
	
	
	<style>
	    #FirstHalfa
		{
			text-align: left;
			margin-left: -23vw;
			margin-bottom: -20vh;
			display: inline;
			width: 10vw;	
		}
		
		#LastHalfa
		{
			margin-left: 2vw;
		}
	</style>
	
	
	<body>
	
	<%
	    String holder = request.getParameter("user");
	    String houseNumberValue = request.getParameter("House Number");
	    String streetValue = request.getParameter("Street");
	    String cityValue = request.getParameter("City");
	    String districtValue = request.getParameter("District");
	    String stateValue = request.getParameter("State");
	    String pinCodeValue = request.getParameter("Pin Code");
	    String countryCodeValue = request.getParameter("Country Code");
	    String phoneNumberValue = request.getParameter("Phone Number");
	%>
	
       <label id="FirstHalfa" for="<%= holder %>HouseNumber">House Number:</label>
<label id="LastHalfa" for="<%= holder %>Street">Street:</label><br>
<input type="text" id="houseNumber" name="HouseNumber" value="<%= (houseNumberValue != null) ? houseNumberValue : "" %>" placeholder="House Number" style="width: 10vw; display: inline-block;">
<input required type="text" id="street" name="Street" value="<%= (streetValue != null) ? streetValue : "" %>" placeholder="Street" style="width: 20vw; display: inline-block;">

<label for="<%= holder %>City">City:</label>
<input required type="text" id="city" name="City" value="<%= (cityValue != null) ? cityValue : "" %>" placeholder="City" style="width: 31.4vw; display: block;">

<label for="<%= holder %>District">District:</label>
<input required type="text" id="district" name="District" value="<%= (districtValue != null) ? districtValue : "" %>" placeholder="District" style="width: 31.4vw; display: inline-block;"><br>

<label id="FirstHalfa" for="<%= holder %>State">State:</label>
<label id="LastHalfa" style="margin-left: 22vw" for="<%= holder %>PinCode">Pin Code:</label>
<input required type="text" id="state" name="State" value="<%= (stateValue != null) ? stateValue : "" %>" placeholder="State" style="width: 20vw; display: inline-block;">
<input required type="number" id="pinCode" min = "100000" max = "999999" name="Pin Code" value="<%= (pinCodeValue != null) ? pinCodeValue : "" %>" placeholder="Pin Code" style="width: 10vw; display: inline-block; -moz-appearance: textfield; appearance: textfield;"><br>

<label id="FirstHalfa" for="<%= holder %>Country Code">Country Code:</label>
<label id="LastHalfa" for="<%= holder %>PhoneNumber">Phone Number:</label>
<input required type="number" max = "999999" id="countryCode" name="Country Code" value="<%= (countryCodeValue != null) ? countryCodeValue : "" %>" placeholder="Country Code" style="width: 10vw; display: inline-block;">
<input required type="number" max = "9999999999" id="phoneNumber" name="Phone Number" value="<%= (phoneNumberValue != null) ? phoneNumberValue : "" %>" placeholder="Phone Number" style="width: 20vw; display: inline-block;">

</body>

</html>
