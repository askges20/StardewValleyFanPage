<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Stardew Valley Fan Page</title>
<link rel="shortcut icon" href="./resources/images/icon.png" type="image/x-icon">
</head>
<style type="text/css">
	.jumbotron{
		background-color: rgba( 255, 255, 255, 0.0 );
		background-size : 100%;
		height: 230px;
		text-shadow: black 0.2em 0.2em 0.2em;
	}
</style>
	
<body style="background-image:url('./resources/images/chicken.png'); background-width:100%" class="normalText">

	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	
	<div class="jumbotron" style="color:white;">
		<div class="container">
			<h3 class="display-5">
					<%="       " %>
			</h3>
		</div>
	</div>

	<main role="main">
		<div class="container"
		style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:40px 40px">
			<h2>500 오류 : NullPointerException</h2>
			<hr>
			<p><br><img src="./resources/images/icon.png" width="70px"/></p>
			<h5><%=exception.toString() %><fmt:message key="error_occurred"/></h5>
			<p><input type="button" class="btn btn btn-lg btn-danger" onClick="location.href='welcome.jsp'" value="<fmt:message key="menu_home"/>"/></p>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
	<%@ include file="junimo.jsp" %>
	</fmt:bundle>
</body>
</html>