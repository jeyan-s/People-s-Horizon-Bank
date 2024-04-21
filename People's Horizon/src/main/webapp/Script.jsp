<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<script>
		  window.addEventListener('click', function(event) {
		    var dropdowns = document.getElementsByClassName('dropdown-content');
		    for (var i = 0; i < dropdowns.length; i++) {
		      var dropdown = dropdowns[i];
		      if (!event.target.closest('.dropdown') && dropdown.style.display === 'block') {
		        dropdown.style.display = 'none';
		      }
		    }
		  });
		
		  function toggleDropdown(event, contentId) {
		    event.stopPropagation();
		    var dropdownContent = document.getElementById(contentId);
		    var allDropdowns = document.getElementsByClassName('dropdown-content');
		    for (var i = 0; i < allDropdowns.length; i++) {
		      if (allDropdowns[i].id !== contentId) {
		        allDropdowns[i].style.display = 'none';
		      }
		    }
		    dropdownContent.style.display = dropdownContent.style.display === "block" ? "none" : "block";
		  }
		
		  function selectOption(option, buttonId) {
		    var dropdownButton = document.getElementById(buttonId);
		    dropdownButton.textContent = option;
		  }
	</script>
</body>
</html>