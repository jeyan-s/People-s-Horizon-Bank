<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form with Labels on Top Left of Input Boxes</title>
    <style>
        /* CSS for labels */
        label {
            display: block; /* Display labels as block to stack them vertically */
            text-align: left; /* Align labels to the left */
            margin-bottom: 5px; /* Add some spacing between labels */
        }

        /* CSS for input boxes */
        input[type="text"],
        input[type="number"] {
            width: calc(100% - 10px); /* Calculate input width to fit the container */
            padding: 5px; /* Add padding to input boxes */
            box-sizing: border-box; /* Include padding and border in the input's total width */
        }
    </style>
</head>
<body>
    <% String holder = "Hello"; %>
    <div class="input-group">
        <label for="<%= holder %>HouseNumber">House Number</label>
        <input type="text" id="houseNumber" name="<%= holder %>HouseNumber" placeholder="Enter house number">
    </div>
    <div class="input-group">
        <label for="<%= holder %>Street">Street</label>
        <input type="text" id="street" name="<%= holder %>Street" placeholder="Enter street">
    </div>
    <div class="input-group">
        <label for="<%= holder %>City">City</label>
        <input type="text" id="city" name="<%= holder %>City" placeholder="Enter city">
    </div>
    <div class="input-group">
        <label for="<%= holder %>District">District</label>
        <input type="text" id="district" name="<%= holder %>District" placeholder="Enter district">
    </div>
    <div class="input-group">
        <label for="<%= holder %>State">State</label>
        <input type="text" id="state" name="<%= holder %>State" placeholder="Enter state">
    </div>
    <div class="input-group">
        <label for="<%= holder %>PinCode">Pin Code</label>
        <input type="number" id="pinCode" name="<%= holder %>PinCode" placeholder="Enter pin code">
    </div>
    <div class="input-group">
        <label for="<%= holder %>CountryCode">Country Code</label>
        <input type="number" id="countryCode" name="<%= holder %>CountryCode" placeholder="Enter country code">
    </div>
    <div class="input-group">
        <label for="<%= holder %>PhoneNumber">Phone Number</label>
        <input type="number" id="phoneNumber" name="<%= holder %>PhoneNumber" placeholder="Enter phone number">
    </div>
</body>
</html>
