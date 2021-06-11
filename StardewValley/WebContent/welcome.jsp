<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
<body style="background-image:url('./resources/images/main2.png'); background-width:100%" class="normalText">

	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	
	<%@ include file="menu.jsp" %>
	<div class="jumbotron" style="color:white;">
		<div class="container">
			<h3 class="display-5">
					<%="       " %>
			</h3>
			<a href="welcome.jsp" style="text-decoration:none; color:white"><h1 class="display-2 title"><fmt:message key="title"/></h1>
			<h3 class="display-5"><fmt:message key="subtitle"/></h3></a>
		</div>
	</div>

	<main role="main">
		<div class="container"
		style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:40px 40px">
			<h2 style="margin:20px 0px 40px 0px"><fmt:message key="greeting"/></h2>
			<hr>
			<div style="position:relative; height:0; padding-bottom:56.25%; margin:0px;">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/4IYbC5o-a-A?rel=0;amp;autoplay=1"
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			style="position:absolute; width:100%; height:100%; left:0;"></iframe>
			</div>
			<div style="margin:80px">
			<br><img src="./resources/images/icon.png" width="70px"/>
			<h3><br><fmt:message key="intro1"/></h3>
			</div>
			<img src="./resources/images/intro1.png" width="100%">
			<h3 style="margin:120px 0px"><fmt:message key="intro2"/></h3>
			<img src="./resources/images/intro2.png" width="100%">
			<h3 style="margin:120px 0px"><fmt:message key="intro3"/></h3>
			<img src="./resources/images/intro3.png" width="80%">
			<h3 style="margin:120px 0px"><fmt:message key="intro4"/></h3>
			<img src="./resources/images/junimo1.png" width="70px">
			<h5 style="margin:80px 0px"><fmt:message key="intro5"/></h5>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
	<%@ include file="junimo.jsp" %>
	</fmt:bundle>
</body>
</html>