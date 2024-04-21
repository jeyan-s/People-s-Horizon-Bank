<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
    	<link rel="stylesheet" href="/Peoples_Horizon/Login.css"> 
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    	<style>
    		.body
    		{
    			margin-left: 17vw;
    			height: 80vh;
    			align-items: center;
    		}
    		.container
    		{
    			margin-left: 20vw;
    		}
    	</style>
	</head>
	
	<body class = "body">
	
        <%@ include file = "../Sidebar.jsp" %>	
		<%
				int height = 65;
				String type = request.getParameter("type");
				boolean withdrawl = type.equals("WithdrawlAmount");
				boolean deposit = type.equals("DepositAmount");
				boolean transfer = type.equals("TransferAmount");
				boolean password = type.equals("changePassword");
				if (password || transfer) height = 80;
				String message = "";
		%>
		
				<style>
					.<%= type %>
					{
						background-color: #ddd1fd;
						color: #8b5cf6;
					}
				</style>
	
		
		<div class = "container" style = "height:<%= height %>vh; padding-top:0vh; margin-top: 10vh;">
		<div class = "moveUp">
			<center>
			
				<%
					if (withdrawl)
					{
						message = "Withdrawl Amount";
				%>
				<svg class = "commonSvg" width="12vw" height="18vh" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#6dd0fc;}.cls-2{fill:#a4ecff;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#cbecf9;}.cls-5{fill:#ffffff;}.cls-6{fill:#ffc444;}.cls-7{fill:#ffe76e;}.cls-8{fill:#52e355;}.cls-9{fill:#90fc95;}.cls-10{fill:#d4ffd4;}.cls-11{fill:#ffbdbd;}.cls-12{fill:#bbf1ff;}.cls-13{fill:#fff4c5;}</style></defs><title>business economic finance interprise company get money</title><g id="Layer_2" data-name="Layer 2"><rect class="cls-1" x="-8" y="174.07" width="64" height="40" transform="translate(218.07 170.07) rotate(90)"/><rect class="cls-2" x="-6.83" y="172.9" width="55.94" height="34.28" transform="translate(211.18 168.9) rotate(90)"/><path class="cls-3" d="M44,228.07H4a2,2,0,0,1-2-2v-64a2,2,0,0,1,2-2H44a2,2,0,0,1,2,2v64A2,2,0,0,1,44,228.07Zm-38-4H42v-60H6Z"/><rect class="cls-4" x="26.8" y="183.28" width="56" height="21.59" transform="translate(248.87 139.28) rotate(90)"/><rect class="cls-5" x="30.19" y="185.7" width="49.53" height="10.28" transform="translate(245.8 135.88) rotate(90)"/><path class="cls-3" d="M65.59,224.07H44a2,2,0,0,1-2-2v-56a2,2,0,0,1,2-2H65.59a2,2,0,0,1,2,2v56A2,2,0,0,1,65.59,224.07Zm-19.59-4H63.59v-52H46Z"/><path class="cls-6" d="M74.87,170.07H65.59v48h7.7A40.55,40.55,0,0,1,96,225h0a40.55,40.55,0,0,0,22.72,7h0a54.88,54.88,0,0,0,26.19-6.65l28.87-15.68a9.68,9.68,0,0,0,3.42-13.9h0A9.68,9.68,0,0,0,165,192.46l-24.81,12.05a32.63,32.63,0,0,1-18.67,3h0a32.63,32.63,0,0,1-19.73-10.38l-3-3.28a9.68,9.68,0,0,1,2-14.67l9.59-6.1a9.68,9.68,0,0,0,2.39-14.17l-.12-.15A9.68,9.68,0,0,0,100,156.47l-20.11,12.2A9.68,9.68,0,0,1,74.87,170.07Z"/><path class="cls-7" d="M177.22,195.77A9.68,9.68,0,0,0,165,192.46l-24.81,12.05a32.63,32.63,0,0,1-18.67,3c-7.59-1-18.63-8.77-23.78-14.43l-3-3.28a9.68,9.68,0,0,1,2-14.67l9.59-6.1c4.84-3.08,10-5.62,6.45-10.12l-.12-.15A9.68,9.68,0,0,0,100,156.47l-20.11,12.2a9.68,9.68,0,0,1-5,1.4H72v40.07H73.3a40.55,40.55,0,0,1,22.72,7h0a40.55,40.55,0,0,0,22.72,7,54.87,54.87,0,0,0,26.19-6.65l28.87-15.68C178.82,199,177.22,195.77,177.22,195.77Z"/><path class="cls-3" d="M118.74,234a42.4,42.4,0,0,1-23.85-7.31,38.42,38.42,0,0,0-21.6-6.62h-7.7a2,2,0,0,1-2-2v-48a2,2,0,0,1,2-2h9.27a7.66,7.66,0,0,0,4-1.11L99,154.76a11.69,11.69,0,0,1,15.21,2.74l.12.15a11.68,11.68,0,0,1-2.89,17.09l-9.59,6.1a7.68,7.68,0,0,0-1.56,11.64l3,3.28a30.63,30.63,0,0,0,36,7l24.81-12.05a11.68,11.68,0,0,1,10.67,20.76L145.89,227.1A57,57,0,0,1,118.74,234ZM67.59,216.07h5.7a42.4,42.4,0,0,1,23.85,7.31,38.42,38.42,0,0,0,21.6,6.62A53,53,0,0,0,144,223.59l28.87-15.68a7.68,7.68,0,0,0,2.71-11,7.71,7.71,0,0,0-9.73-2.63L141,206.31a34.63,34.63,0,0,1-40.75-7.86l-3-3.28a11.68,11.68,0,0,1,2.37-17.7l9.59-6.1a7.69,7.69,0,0,0,3.45-5.2,7.59,7.59,0,0,0-1.55-6L111,160a7.69,7.69,0,0,0-10-1.8l-20.11,12.2a11.67,11.67,0,0,1-6.06,1.69H67.59Z"/><circle class="cls-3" cx="24" cy="208.83" r="6"/><circle class="cls-8" cx="182" cy="137.18" r="30"/><circle class="cls-9" cx="182" cy="133.63" r="26.44"/><path class="cls-3" d="M182,169.18a32,32,0,1,1,32-32A32,32,0,0,1,182,169.18Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,182,109.18Z"/><path class="cls-6" d="M182,159.18a22,22,0,1,1,22-22A22,22,0,0,1,182,159.18Z"/><path class="cls-7" d="M182,159.18A19.15,19.15,0,1,1,201.15,140,19.17,19.17,0,0,1,182,159.18Z"/><path class="cls-3" d="M182,161.18a24,24,0,1,1,24-24A24,24,0,0,1,182,161.18Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,182,117.18Z"/><path class="cls-3" d="M184.25,134.68h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,1,0,0-5h-3.6v-1.36a2.5,2.5,0,1,0-5,0V127a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,0,1,0,2.71H175.9a2.5,2.5,0,0,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0v-1.37a6.35,6.35,0,0,0-.25-12.7Z"/><circle class="cls-8" cx="134" cy="74" r="30"/><circle class="cls-9" cx="134" cy="70.44" r="26.44"/><path class="cls-3" d="M134,106a32,32,0,1,1,32-32A32,32,0,0,1,134,106Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,134,46Z"/><path class="cls-6" d="M134,96a22,22,0,1,1,22-22A22,22,0,0,1,134,96Z"/><path class="cls-7" d="M134,96a19.15,19.15,0,1,1,19.15-19.15A19.17,19.17,0,0,1,134,96Z"/><path class="cls-3" d="M134,98a24,24,0,1,1,24-24A24,24,0,0,1,134,98Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,134,54Z"/><path class="cls-3" d="M136.25,71.5h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,0,0,0-5h-3.6V62.43a2.5,2.5,0,0,0-5,0V63.8a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,1,1,0,2.71H127.9a2.5,2.5,0,0,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0V84.2a6.35,6.35,0,0,0-.25-12.7Z"/><circle class="cls-8" cx="222" cy="54" r="30"/><circle class="cls-9" cx="222" cy="50.44" r="26.44"/><path class="cls-3" d="M222,86a32,32,0,1,1,32-32A32,32,0,0,1,222,86Zm0-60a28,28,0,1,0,28,28A28,28,0,0,0,222,26Z"/><path class="cls-6" d="M222,76a22,22,0,1,1,22-22A22,22,0,0,1,222,76Z"/><path class="cls-7" d="M222,76a19.15,19.15,0,1,1,19.15-19.15A19.17,19.17,0,0,1,222,76Z"/><path class="cls-3" d="M222,78a24,24,0,1,1,24-24A24,24,0,0,1,222,78Zm0-44a20,20,0,1,0,20,20A20,20,0,0,0,222,34Z"/><path class="cls-3" d="M224.25,51.5h-4.5a1.35,1.35,0,0,1,0-2.71h8.35a2.5,2.5,0,0,0,0-5h-3.6V42.43a2.5,2.5,0,0,0-5,0V43.8a6.35,6.35,0,0,0,.25,12.7h4.5a1.35,1.35,0,1,1,0,2.71H215.9a2.5,2.5,0,1,0,0,5h3.6v1.36a2.5,2.5,0,0,0,5,0V64.2a6.35,6.35,0,0,0-.25-12.7Z"/><circle class="cls-10" cx="93.5" cy="123" r="5"/><circle class="cls-10" cx="60.5" cy="84" r="4"/><circle class="cls-10" cx="173.5" cy="43" r="3"/><circle class="cls-10" cx="88" cy="235.5" r="2"/><circle class="cls-10" cx="46" cy="57.5" r="1"/><circle class="cls-11" cx="11" cy="129.5" r="5"/><circle class="cls-11" cx="124" cy="249.5" r="4"/><circle class="cls-11" cx="100" cy="21.5" r="3"/><circle class="cls-11" cx="244.5" cy="170" r="2"/><circle class="cls-11" cx="69" cy="23.5" r="1"/><circle class="cls-12" cx="130" cy="7.5" r="5"/><circle class="cls-12" cx="128.5" cy="129" r="4"/><circle class="cls-12" cx="227.5" cy="235" r="3"/><circle class="cls-12" cx="221.5" cy="104" r="2"/><circle class="cls-12" cx="83" cy="47.5" r="1"/><circle class="cls-13" cx="245" cy="117.5" r="5"/><circle class="cls-13" cx="128.5" cy="181" r="4"/><circle class="cls-13" cx="70.5" cy="67" r="3"/><circle class="cls-13" cx="44.5" cy="132" r="2"/><circle class="cls-13" cx="60.5" cy="233" r="1"/></g></svg>
				<%
					}
					else if (deposit)
					{
						message = "Deposit Amount";
				%>
				<svg class = "commonSvg" width="12vw" height="18vh" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#90fc95;}.cls-2{fill:#52e355;}.cls-3{fill:#2fb1ea;}.cls-4{fill:#ffe76e;}.cls-5{fill:#ffc444;}.cls-6{fill:#cbecf9;}.cls-7{fill:#ffffff;}.cls-8{fill:#a4ecff;}.cls-9{fill:#6dd0fc;}.cls-10{fill:#d4ffd4;}.cls-11{fill:#ffbdbd;}.cls-12{fill:#bbf1ff;}.cls-13{fill:#fff4c5;}</style></defs><title>business economic finance interprise company wallet</title><g id="Layer_2" data-name="Layer 2"><rect class="cls-1" x="32.22" y="62.88" width="106.05" height="58.82" transform="translate(90.23 -33.24) rotate(45)"/><path class="cls-2" d="M143.53,109,116.21,81.67H36a22.08,22.08,0,0,0-2.79.18l68.73,68.73Z"/><path class="cls-3" d="M101.94,152.58a2,2,0,0,1-1.41-.59l-75-75a2,2,0,0,1,0-2.83L67.13,32.59a2.06,2.06,0,0,1,2.83,0l75,75a2,2,0,0,1,0,2.83L103.35,152A2,2,0,0,1,101.94,152.58Zm-72.16-77,72.16,72.16L140.7,109,68.54,36.83Z"/><path class="cls-4" d="M120.68,116.6l-11.13,11.13a10.77,10.77,0,0,0-15.23,0L49.8,83.21A10.77,10.77,0,0,0,49.8,68L60.93,56.85a10.77,10.77,0,0,0,15.23,0l44.52,44.52A10.77,10.77,0,0,0,120.68,116.6Z"/><path class="cls-5" d="M94.32,127.73a10.77,10.77,0,0,1,15.23,0l11.13-11.13a10.77,10.77,0,0,1,0-15.23L101,81.67H51.07a10.8,10.8,0,0,1-1.27,1.54Z"/><path class="cls-3" d="M109.55,129.73h0a2,2,0,0,1-1.41-.59,8.77,8.77,0,0,0-12.4,0,2.06,2.06,0,0,1-2.83,0L48.38,84.62a2,2,0,0,1,0-2.83,8.77,8.77,0,0,0,0-12.4,2,2,0,0,1,0-2.83L59.52,55.43a2,2,0,0,1,2.83,0,8.78,8.78,0,0,0,12.4,0,2,2,0,0,1,2.83,0L122.1,100a2,2,0,0,1,0,2.83,8.77,8.77,0,0,0,0,12.4,2,2,0,0,1,0,2.83L111,129.15A2,2,0,0,1,109.55,129.73Zm-7.62-7.16a12.67,12.67,0,0,1,7.51,2.44l8.52-8.52a12.79,12.79,0,0,1,0-15L76,59.57a12.8,12.8,0,0,1-15,0l-8.52,8.52a12.79,12.79,0,0,1,0,15L94.43,125A12.67,12.67,0,0,1,101.94,122.58Z"/><circle class="cls-6" cx="85.24" cy="92.29" r="10.94" transform="translate(-40.29 87.31) rotate(-45)"/><path class="cls-3" d="M85.24,105.22a12.93,12.93,0,1,1,9.15-3.78h0A12.9,12.9,0,0,1,85.24,105.22Zm0-21.88a8.94,8.94,0,1,0,6.32,15.26h0a8.94,8.94,0,0,0-6.32-15.26ZM93,100h0Z"/><rect class="cls-1" x="97.74" y="62.88" width="106.05" height="58.82" transform="translate(322.62 50.95) rotate(135)"/><path class="cls-2" d="M134.06,150.58l68.73-68.73a22.08,22.08,0,0,0-2.79-.18H119.79L92.47,109Z"/><path class="cls-3" d="M134.06,152.58a2,2,0,0,1-1.41-.59L91.06,110.4a2,2,0,0,1,0-2.83l75-75a2.06,2.06,0,0,1,2.83,0l41.59,41.59a2,2,0,0,1,0,2.83l-75,75A2,2,0,0,1,134.06,152.58ZM95.3,109l38.77,38.77,72.16-72.16L167.46,36.83Z"/><path class="cls-4" d="M115.32,116.6l11.13,11.13a10.77,10.77,0,0,1,15.23,0L186.2,83.21a10.77,10.77,0,0,1,0-15.23L175.07,56.85a10.77,10.77,0,0,1-15.23,0l-44.52,44.52A10.77,10.77,0,0,1,115.32,116.6Z"/><path class="cls-5" d="M115.32,116.6l11.13,11.13a10.77,10.77,0,0,1,15.23,0L186.2,83.21a10.8,10.8,0,0,1-1.27-1.54H135l-19.7,19.7A10.77,10.77,0,0,1,115.32,116.6Z"/><path class="cls-3" d="M141.68,129.73h0a2,2,0,0,1-1.41-.59,8.77,8.77,0,0,0-12.4,0,2.06,2.06,0,0,1-2.83,0L113.9,118a2,2,0,0,1,0-2.83,8.77,8.77,0,0,0,0-12.4,2,2,0,0,1,0-2.83l44.52-44.52a2,2,0,0,1,2.83,0,8.78,8.78,0,0,0,12.4,0,2,2,0,0,1,2.83,0l11.13,11.13a2,2,0,0,1,0,2.83,8.77,8.77,0,0,0,0,12.4,2,2,0,0,1,0,2.83l-44.52,44.52A2,2,0,0,1,141.68,129.73Zm-13.9-4H124a12.8,12.8,0,0,1,10.61-10.61V57.38A12.8,12.8,0,0,1,124,46.77H112a12.8,12.8,0,0,1-10.61,10.61v59.28A12.8,12.8,0,0,1,112,127.28Z"/><circle class="cls-7" cx="118" cy="87.02" r="10.94"/><path class="cls-6" d="M118,98a10.93,10.93,0,0,0,9.53-16.3H108.47A10.93,10.93,0,0,0,118,98Z"/><path class="cls-3" d="M118,100A12.94,12.94,0,1,1,130.94,87,13,13,0,0,1,118,100Zm0-21.88A8.94,8.94,0,1,0,126.94,87,9,9,0,0,0,118,78.08Z"/><rect class="cls-8" x="24" y="91.67" width="188" height="130.33" rx="12" ry="12"/><rect class="cls-9" x="24" y="107.28" width="188" height="99.11"/><path class="cls-3" d="M200,224H36a14,14,0,0,1-14-14V103.67a14,14,0,0,1,14-14H200a14,14,0,0,1,14,14V210A14,14,0,0,1,200,224ZM36,93.67a10,10,0,0,0-10,10V210a10,10,0,0,0,10,10H200a10,10,0,0,0,10-10V103.67a10,10,0,0,0-10-10Z"/><rect class="cls-6" x="24" y="114" width="188" height="85.67"/><rect class="cls-7" x="24" y="121.05" width="188" height="71.56"/><path class="cls-3" d="M212,201.67H24a2,2,0,0,1-2-2V114a2,2,0,0,1,2-2H212a2,2,0,0,1,2,2v85.67A2,2,0,0,1,212,201.67Zm-186-4H210V116H26Z"/><rect class="cls-2" x="182.04" y="139.71" width="49.96" height="34.25" rx="6" ry="6"/><rect class="cls-1" x="182.04" y="139.71" width="49.96" height="27.94" rx="5.42" ry="5.42"/><path class="cls-3" d="M226,176H188a8,8,0,0,1-8-8V145.71a8,8,0,0,1,8-8h38a8,8,0,0,1,8,8V168A8,8,0,0,1,226,176Zm-38-34.25a4,4,0,0,0-4,4V168a4,4,0,0,0,4,4h38a4,4,0,0,0,4-4V145.71a4,4,0,0,0-4-4Z"/><circle class="cls-10" cx="133" cy="7" r="5"/><circle class="cls-10" cx="8" cy="128" r="4"/><circle class="cls-10" cx="115" cy="248" r="3"/><circle class="cls-10" cx="250" cy="189" r="2"/><circle class="cls-10" cx="206" cy="240" r="1"/><circle class="cls-11" cx="151" cy="239" r="5"/><circle class="cls-11" cx="246" cy="223" r="4"/><circle class="cls-11" cx="107" cy="19" r="3"/><circle class="cls-11" cx="197" cy="24" r="2"/><circle class="cls-11" cx="240" cy="85" r="1"/><circle class="cls-12" cx="22" cy="45" r="5"/><circle class="cls-12" cx="66" cy="233" r="4"/><circle class="cls-12" cx="224" cy="29" r="3"/><circle class="cls-12" cx="18" cy="225" r="2"/><circle class="cls-12" cx="29" cy="208" r="1"/><circle class="cls-13" cx="219" cy="76" r="5"/><circle class="cls-13" cx="177" cy="250" r="4"/><circle class="cls-13" cx="13" cy="175" r="3"/><circle class="cls-13" cx="49" cy="42" r="2"/><circle class="cls-13" cx="238" cy="131" r="1"/></g></svg>
				<%
					}
					else if (password)
					{
						message = "Change Password";
				%>
					<svg class = "commonSvg" height="200px" width="200px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <polygon style="fill:#B9B9B9;" points="512,479.367 512,372.466 478.242,372.466 444.484,425.917 478.242,479.367 "></polygon> <polygon style="fill:#DCDCDC;" points="478.242,479.367 478.242,372.466 298.198,372.466 256,271.191 213.802,372.466 0,372.466 0,479.367 "></polygon> <g> <circle style="fill:#737373;" cx="74.08" cy="425.917" r="16.879"></circle> <circle style="fill:#737373;" cx="165.044" cy="425.917" r="16.879"></circle> <circle style="fill:#737373;" cx="256" cy="425.917" r="16.879"></circle> <circle style="fill:#737373;" cx="346.956" cy="425.917" r="16.879"></circle> <circle style="fill:#737373;" cx="437.923" cy="425.917" r="16.879"></circle> </g> <polygon style="fill:#90fc95;" points="298.191,180.041 298.191,237.431 331.956,237.431 331.956,214.925 365.714,214.925 365.714,237.431 399.477,237.431 399.477,214.924 444.477,214.924 444.477,157.535 382.587,157.535 "></polygon> <g> <polygon style="fill:#52e355;" points="298.198,146.282 298.198,180.041 433.224,180.041 433.235,237.431 466.982,237.431 466.989,146.282 "></polygon> <path style="fill:#52e355;" d="M489.495,112.527h-33.758v45.011h33.758c12.434,0,22.505-10.082,22.505-22.505 C512,122.599,501.929,112.527,489.495,112.527z"></path> </g> <path style="fill:#90fc95;" d="M455.736,112.527H202.313c-10.251-45.731-51.087-79.895-99.913-79.895 C45.844,32.633,0,78.477,0,135.033s45.844,102.4,102.4,102.4c48.826,0,89.662-34.175,99.913-79.895h253.423 c12.434,0,22.505-10.082,22.505-22.505C478.242,122.599,468.171,112.527,455.736,112.527z M102.4,192.422 c-31.643,0-57.389-25.746-57.389-57.389S70.757,77.644,102.4,77.644s57.389,25.746,57.389,57.389S134.043,192.422,102.4,192.422z"></path> </g></svg>
				<%
					}
					else if (transfer)
					{
						message = "Transfer Amount";
				%>
					<svg class = "commonSvg" width="12vw" height="18vh" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#f88;}.cls-2{fill:#f97171;}.cls-3{fill:#90fc95;}.cls-4{fill:#52e355;}.cls-5{fill:#cbecf9;}.cls-6{fill:#ffffff;}.cls-7{fill:#2fb1ea;}.cls-8{fill:#e5f5fc;}.cls-9{fill:#d4ffd4;}.cls-10{fill:#ffbdbd;}.cls-11{fill:#bbf1ff;}.cls-12{fill:#fff4c5;}</style></defs><title>business economic finance interprise company transfer</title><g id="Layer_2" data-name="Layer 2"><path class="cls-1" d="M191,52H124.74V48.72a5,5,0,0,0-7.5-4.33l-16.09,9.29a5,5,0,0,0,0,8.66l16.09,9.29a5,5,0,0,0,7.5-4.33V64H191a2,2,0,0,1,2,2v86h12V66A14,14,0,0,0,191,52Z"/><rect class="cls-2" x="192.99" y="141.59" width="12" height="10"/><path class="cls-3" d="M154.85,193.84l-16.09-9.29a5,5,0,0,0-7.5,4.33v3.29H66.83a2,2,0,0,1-2-2V104h-12v86.16a14,14,0,0,0,14,14h64.44v3.29a5,5,0,0,0,7.5,4.33l16.09-9.29A5,5,0,0,0,154.85,193.84Z"/><rect class="cls-4" x="52.83" y="104.01" width="12" height="10"/><path class="cls-5" d="M76.24,43.37H88.65V97a7,7,0,0,1-7,7H31a7,7,0,0,1-7-7V31a7,7,0,0,1,7-7H69.24V36.37A7,7,0,0,0,76.24,43.37Z"/><path class="cls-6" d="M76.24,43.37H88.65V90a7,7,0,0,1-7,7H31a7,7,0,0,1-7-7V31a7,7,0,0,1,7-7H69.24V36.37A7,7,0,0,0,76.24,43.37Z"/><path class="cls-5" d="M88.65,49.17H76.24a7,7,0,0,1-7-7V29.75L88.31,42.11Z"/><path class="cls-7" d="M81.65,106H31a9,9,0,0,1-9-9V31a9,9,0,0,1,9-9H69.24a2,2,0,0,1,2,2V36.37a5,5,0,0,0,5,5H88.65a2,2,0,0,1,2,2V97A9,9,0,0,1,81.65,106ZM31,26a5,5,0,0,0-5,5V97a5,5,0,0,0,5,5H81.65a5,5,0,0,0,5-5V45.37H76.24a9,9,0,0,1-9-9V26Z"/><path class="cls-8" d="M88.65,43.37H76.24a7,7,0,0,1-7-7V24Z"/><path class="cls-7" d="M88.65,45.37H76.24a9,9,0,0,1-9-9V24a2,2,0,0,1,3.41-1.41L90.06,42a2,2,0,0,1-1.41,3.41ZM71.24,28.79v7.58a5,5,0,0,0,5,5h7.58Z"/><path class="cls-5" d="M219.6,171.4H232V225a7,7,0,0,1-7,7H174.35a7,7,0,0,1-7-7V159a7,7,0,0,1,7-7H212.6V164.4A7,7,0,0,0,219.6,171.4Z"/><path class="cls-6" d="M219.6,171.4H232V218a7,7,0,0,1-7,7H174.35a7,7,0,0,1-7-7V159a7,7,0,0,1,7-7H212.6V164.4A7,7,0,0,0,219.6,171.4Z"/><path class="cls-5" d="M232,177.19H219.6a7,7,0,0,1-7-7V157.78l19.07,12.36Z"/><path class="cls-7" d="M225,234H174.35a9,9,0,0,1-9-9V159a9,9,0,0,1,9-9H212.6a2,2,0,0,1,2,2V164.4a5,5,0,0,0,5,5H232a2,2,0,0,1,2,2V225A9,9,0,0,1,225,234Zm-50.66-80a5,5,0,0,0-5,5v66a5,5,0,0,0,5,5H225a5,5,0,0,0,5-5V173.4H219.6a9,9,0,0,1-9-9V154Z"/><path class="cls-8" d="M232,171.4H219.6a7,7,0,0,1-7-7V152Z"/><path class="cls-7" d="M232,173.4H219.6a9,9,0,0,1-9-9V152a2,2,0,0,1,3.41-1.41L233.42,170A2,2,0,0,1,232,173.4ZM214.6,156.82v7.58a5,5,0,0,0,5,5h7.58Z"/><circle class="cls-9" cx="151.25" cy="115" r="5"/><circle class="cls-9" cx="213" cy="126" r="4"/><circle class="cls-9" cx="131.25" cy="177" r="3"/><circle class="cls-9" cx="163.25" cy="76" r="2"/><circle class="cls-9" cx="162.25" cy="30" r="1"/><circle class="cls-10" cx="154.25" cy="249" r="5"/><circle class="cls-10" cx="146.25" cy="86" r="4"/><circle class="cls-10" cx="181.25" cy="48" r="3"/><circle class="cls-10" cx="158" cy="171" r="2"/><circle class="cls-10" cx="121" cy="239.5" r="1"/><circle class="cls-11" cx="99.25" cy="142" r="5"/><circle class="cls-11" cx="77" cy="222" r="4"/><circle class="cls-11" cx="78.25" cy="5" r="3"/><circle class="cls-11" cx="116.25" cy="40" r="2"/><circle class="cls-11" cx="115.25" cy="87" r="1"/><circle class="cls-12" cx="109.25" cy="220" r="5"/><circle class="cls-12" cx="134.25" cy="25" r="4"/><circle class="cls-12" cx="130.25" cy="112" r="3"/><circle class="cls-12" cx="40" cy="135" r="2"/><circle class="cls-12" cx="167.25" cy="135" r="1"/></g></svg>
				<%
					}
				%>
					
					
				<h2><%= message %></h2>
			</center>
		</div>
			<form class = "commonForm" autocomplete="off" id = "submit">
			
				<%@ include file = "../Script.jsp" %>
				<%
					if (transfer)
					{
				%>
				
			            <input type="number" id="toAccount" min = "0" max = "10000000000" name="toAccount" placeholder = "To Account Number" required  style="-moz-appearance: textfield; appearance: textfield;">
			            <input type="text" id="toIFSC" name="toIFSC" placeholder = "IFSC Code" required>
			    <%
					}
					if (transfer || withdrawl || deposit)
					{
			    %>
						<input style="margin-top: 3vh;" type="number" min="1" max="100000" name="amount" placeholder="Amount" required 
       pattern="\d*\.?\d{0,2}" 
       oninput="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter only up to two digits after the decimal point' : '');"
        style="-moz-appearance: textfield; appearance: textfield;">

	<%
					}
					if (password)
					{
				%>
					<input type="password" id="currentPassword" name="currentPassword" placeholder = "Current Password" required>

		            <input type="password" id="newPassword" name="newPassword" placeholder = "New Password" required>
		
		            <input type="password" id="confirmPassword" name="confirmPassword" placeholder = "Re-Enter New Password" required><br>
		        <%
					}
					if (!password)
					{
		        %>
						<input type="number" id="mPin" name="mPin"  min="0" max="999999" placeholder="Mobile PIN" required style="-moz-appearance: textfield; appearance: textfield;"><br>
		        <%
					}
		        %>
		        	
		        	<div class="message" id="addCustomerMessage"><p id="errorMessage"></p></div>
					
					<input style = "margin-top: 2vh;" type="submit" value="<%= message %>">
			</form>
			
			
			
			
			
			</div>
			
			
			
			
			
			
			<%@ include file = "../Popup.jsp" %>	

			<script>
				$("#submit").submit(function(event) 
			    {
			        event.preventDefault(); 
			        var formData = $(this).serialize(); 
			        var typeValue = "<%= type %>";
			        console.log(type);
			        $.ajax(
			        {
			            type: "POST",
			            url: "/Peoples_Horizon/api/" + typeValue,
			            data: formData,
			        	console.log(url);
			            success: function(response) 
			            {
			                console.log(response);
			                var url = "/Peoples_Horizon/api/Home";
			                displayPopup(response.message, true, url);
			            },
			            error: function(xhr, textStatus, error) 
			            {
			            	console.log(xhr, textStatus, error);
			            	displayPopup(xhr.responseJSON.error, false, null);
			            }
			        });
			    });
			</script>
			
			
			
			
			
			
			
			
			
		
	</body>
</html>





