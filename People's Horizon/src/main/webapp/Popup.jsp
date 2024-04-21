<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Popup Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
   <style>
        :root {
            --background-color: #ffffff;
            --popup-background-color: #ffffff;
            --tick-color: #008080;
            --wrong-color: #FF0000;
            --button-background-color: #008080;
            --button-text-color: #ffffff;
            --button-hover-color: #005959;
        }

        .popup-container 
        {
			margin-top: 25vh;
			margin-left: 5vw;
            display: none;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: var(--popup-background-color);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            width: calc(100% - 17vw);
            height: calc(100% - 8vh);
        }

    .popup-content {
        margin-bottom: 30px;
    }

    .tick-icon path {
        fill: var(--tick-color);
    }

    .wrong-icon path {
        fill: var(--wrong-color);
    }

    #errorMessage {
        color: red;
        font-size: 22px;
    }

    .message {
        text-align: center;
    }

    .PopupButton {
        background-color: var(--button-background-color);
        color: var(--button-text-color);
        border: none;
        border-radius: 8px;
        padding: 15px 60px;
        cursor: pointer;
        font-size: 18px;
    }

    .PopupButton:hover {
        background-color: var(--button-hover-color);
    }
    

    </style>
    
</head>
<body>

    <div class="popup-container" id="popup-container">
        <div class="popup-content" id="content">
        </div>
        <h1 id="popup-message" class="popup-message">hello</h1>
        <form id="popup-link" action="#" method = "post"><button id="button" class="PopupButton">OK</button></form>
    </div>

    <script>
        function displayPopup(response, transactionSuccessful, redirectURL)
        {
            var popupContainer = document.getElementById('popup-container');
            var content = document.getElementById('content');
            var message = document.getElementsByClassName('popup-message')[0];
            var popupLink = document.getElementById('popup-link');
            
            if (transactionSuccessful) 
            {
                content.innerHTML =  `
                    <svg class="tick-icon" xmlns="http://www.w3.org/2000/svg" width="10em" height="100" viewBox="0 0 24 24">
                    <path d="M12 2C6.487 2 2 6.487 2 12s4.487 10 10 10 10-4.487 10-10S17.513 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.706-12.294a.996.996 0 0 0-1.414 0L11 13.586l-1.293-1.293a.996.996 0 1 0-1.414 1.414L11 16.414l4.707-4.707a.996.996 0 0 0 0-1.414z"/>
                </svg>
            `;
                message.innerText = response;
                console.log("Response is ", response);
                if (redirectURL != null)
                {
                    popupLink.setAttribute('action', redirectURL);
                }
                else
                {
                    popupLink.removeAttribute('action'); // Remove href attribute
                    var button = document.getElementById("button");
                    button.onclick = closePopup;
                }

                popupContainer.style.display = 'block';
                document.getElementsByClassName('container')[0].style.display = 'none';
            } 
            else
            {
                /* content.innerHTML = `
                    <svg class="wrong-icon" xmlns="http://www.w3.org/2000/svg" width="10em" height="100" viewBox="0 0 24 24">
                    <path d="M12 2C6.487 2 2 6.487 2 12s4.487 10 10 10 10-4.487 10-10S17.513 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm4.707-11.707a.996.996 0 0 0-1.414 0L12 10.586 9.707 8.293a.996.996 0 0 0-1.414 1.414L10.586 12l-2.293 2.293a.996.996 0 1 0 1.414 1.414L12 13.414l2.293 2.293a.996.996 0 1 0 1.414-1.414L13.414 12l2.293-2.293a.996.996 0 0 0 0-1.414z"/>
                </svg>
                <p style="font-size: 24px;">${response}</p>
            `;
                message.innerText= response;
                popupLink.removeAttribute('action'); 
                var button = document.getElementById("button");
                button.onclick = closePopup; */

                var errorMessage = document.getElementById("errorMessage");
                errorMessage.innerHTML = response;

            }
        }

        function closePopup() 
        {
            var popupContainer = document.getElementById('popup-container');
            popupContainer.style.display = 'none';
        }
    </script>

</body>
</html>
