<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Stardew Valley Fan Page</title>
</head>

<body style="background-image:url('./resources/images/main2.png'); background-width:100%" class="normalText">
	<style type="text/css">
		.jumbotron{
			background-color: rgba( 255, 255, 255, 0.0 );
			background-size : 100%;
			height: 230px;
			text-shadow: black 0.2em 0.2em 0.2em;
		}
	</style>

	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	
	<%@ include file="menu.jsp" %>
	<div class="jumbotron" style="color:white;">
		<div class="container">
			<h3 class="display-5">
					<%="       " %>
			</h3>
			<a href="welcome.jsp" style="text-decoration:none; color:white">
			<h1 class="display-2 title"><fmt:message key="title"/></h1>
			<h3 class="display-5"><fmt:message key="subtitle"/></h3></a>
		</div>
	</div>
	
	<main role="main">
		<div class="container"
		style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:40px 20px">
		<p style="font-size:30px; margin-bottom:30px">
			<img src="./resources/images/junimo1.png" width="50px"/>
			<fmt:message key="modify_npc"/>
			<img src="./resources/images/junimo2.png" width="50px"/>
		</p>
		<%@ include file="modifyNpcInfoForm.jsp" %>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
	</fmt:bundle>
</body>
</html>