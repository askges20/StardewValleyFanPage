<%@ page contentType="text/html; charset=utf-8" %>
<style type="text/css">
	.navbar-brand{
		margin: 0 20px;
	}
	
	.menubar{
		height:25px;
	}
	
	@media screen and (max-width:760px){
		.menubar{
			height:50px;
		}
	}
</style>

<nav class="navbar navbar-expand  navbar-dark bg-dark"
style="background-image:url('./resources/images/long.jpg'); background-size:100% 1000%">
	<div class="container menubar">
		<div class="navbar-header normalText" style="text-shadow: black 0 0 0.2em;">
			<a class="navbar-brand" href="./welcome.jsp"><fmt:message key="menu_home"/></a>
			<a class="navbar-brand" href="./npcInfo.jsp"><fmt:message key="menu_intro_character"/></a>
			<a class="navbar-brand" href="./community.jsp?type=1"><fmt:message key="menu_community"/></a>
			<a class="navbar-brand" href="./isReadyToAccess.jsp?type=2"><fmt:message key="menu_mypage"/></a>
			<a class="navbar-brand" href="./reviewPage.jsp"><fmt:message key="menu_site_rate"/></a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
		<%
			if(session.getAttribute("userID")!=null){	//로그인 후 세션이 생성된 상태에서만 로그아웃 메뉴가 나타남
		%>
				<li class="nav-item" style="color:white; text-shadow: black 0 0 0.2em; font-family: 'Do Hyeon', sans-serif; padding-right:20px">
				<fmt:message key="hello"/><%=" "%><%=session.getAttribute("userNN") %><fmt:message key="hello2"/></li>
				<li class="nav-item"><a href="./logout.jsp" style="color:white; text-shadow: black 0 0 0.2em; font-family: 'Do Hyeon', sans-serif;">
				<fmt:message key="menu_logout"/></a></li>
		<%} else {%>
				<li class="nav-item" style="padding:0px 10px">
				<a href="./loginPage.jsp" style="text-decoration:none; color:white; font-size:20px;
					text-shadow: black 0 0 0.2em; font-family: 'Do Hyeon', sans-serif;">
					<fmt:message key="menu_login"/></a></li>
				<li class="nav-item" style="padding:0px 10px">
				<a href="./join.jsp" style="text-decoration:none; color:white; font-size:20px;
					text-shadow: black 0 0 0.2em; font-family: 'Do Hyeon', sans-serif;">
					<fmt:message key="menu_join"/></a></li>
		<%} %>
			</ul>
		</div>
	</div>
</nav>