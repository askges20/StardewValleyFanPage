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
			<a href="welcome.jsp" style="text-decoration:none; color:white"><h1 class="display-2 title"><fmt:message key="title"/></h1>
			<h3 class="display-5"><fmt:message key="subtitle"/></h3></a>
		</div>
	</div>

	<main role="main">
	<div class="container" style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:80px 40px" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading"><fmt:message key="admin_login"/></h3>
			<%
				String error=request.getParameter("error");
				if(error!=null){
					%>
					<div class='alert alert-danger'>
						<fmt:message key="fail_admin"/>
					</div>
					<%
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="Password" name="j_password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit"><fmt:message key="menu_login"/></button>
			</form>
		</div>
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
		String name = request.getParameter("name");
	%>
	<a href="?language=ko&name=<%=name%>"><img src='./resources/images/junimo1.png';
		onmouseover="showBubble(korean_bubble)"; onmouseout="hideBubble(korean_bubble)"
		style="position:fixed; left:2%; top:83%; width:100px; height:100px;"></a>
	<img src='./resources/images/korean.png' id="korean_bubble"
		style="position:fixed; left:2%; top:78%; width:100px; height:50px; opacity:0.0">
	<a href="?language=en&name=<%=name%>"><img src='./resources/images/junimo2.png';
		onmouseover="showBubble(english_bubble)"; onmouseout="hideBubble(english_bubble)"
		style="position:fixed; right:2%; top:83%; width:100px; height:100px"></a>
	<img src='./resources/images/english.png' id="english_bubble"
		style="position:fixed; right:2%; top:78%; width:100px; height:50px; opacity:0.0">
		
	</fmt:bundle>
</body>
</html>