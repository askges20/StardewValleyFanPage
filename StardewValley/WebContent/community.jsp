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
	<%
		String type=request.getParameter("type");
	%>

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
		style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:60px 20px">
		<%
			if(type.equals("1")){
		%>
		<h2 style="margin-bottom:20px"><fmt:message key="post_list"/></h2>
		<hr>
		<%@ include file="postingList.jsp" %>
		<p align="right" style="padding:0px 20px">
			<input type="button" class="btn btn btn-lg btn-danger" onClick="location.href='isReadyToAccess.jsp?type=1'" value="<fmt:message key="button_write" />"/>
		</p>
		<%
			} else if(type.equals("2")){
		%>
		<%@ include file="posting.jsp" %>
		<%	} %>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
	
	<script>
		function showBubble(x){
			x.style.opacity="1.0";
		}
		function hideBubble(x){
			x.style.opacity="0.0";
		}
	</script>

	<%
		if(type.equals("1")){
	%>
	<a href="?language=ko&type=1"><img src='./resources/images/junimo1.png';
		onmouseover="showBubble(korean_bubble)"; onmouseout="hideBubble(korean_bubble)"
		style="position:fixed; left:2%; top:83%; width:100px; height:100px;"></a>
	<img src='./resources/images/korean.png' id="korean_bubble"
		style="position:fixed; left:2%; top:78%; width:100px; height:50px; opacity:0.0">
	<a href="?language=en&type=1"><img src='./resources/images/junimo2.png';
		onmouseover="showBubble(english_bubble)"; onmouseout="hideBubble(english_bubble)"
		style="position:fixed; right:2%; top:83%; width:100px; height:100px"></a>
	<img src='./resources/images/english.png' id="english_bubble"
		style="position:fixed; right:2%; top:78%; width:100px; height:50px; opacity:0.0">
	<%
		}
	%>
	</fmt:bundle>
</body>
</html>