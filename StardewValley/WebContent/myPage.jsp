<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file ="dbconn.jsp" %>
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
			<h2><fmt:message key="menu_mypage"/></h2>
			<hr>
			<h3 style="text-align:left; margin:30px"><fmt:message key="my_post"/></h3>
			
			<div class="col-md-12">
			<table class="table table-striped" width="100%" style="font-size:17px; margin-bottom:30px">
				<tr>
					<td width="10%"><fmt:message key="num"/></td>
					<td width="50%"><fmt:message key="post_title"/></td>
					<td width="35%"><fmt:message key="date"/></td>
				</tr>
			<%
				String user_id = (String)session.getAttribute("userID");
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				
				try{
					String sql = "select * from posting where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user_id);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						int numInt = rs.getInt("num");
						String num = numInt+"";
						String title = rs.getString("title");
						String date = rs.getString("date");
			%>
				<tr>
					<td><a href="community.jsp?type=2&postNum=<%=num%>" style="text-decoration:none; color:black"><%=num%></a></td>
					<td><a href="community.jsp?type=2&postNum=<%=num%>" style="text-decoration:none; color:black"><%=title%></a></td>
					<td><%=date%></td>
				</tr>
			<%
					}
				} catch(SQLException ex){
					out.println("posting 테이블 호출에 실패했습니다.");
					out.println("SQLException: "+ex.getMessage());
				}
			%>
			</table></div>
			
			<hr>
			<h3 style="text-align:left; margin:30px"><fmt:message key="my_comment"/></h3>
			<div class="col-md-12">
			<table class="table table-striped" width="100%" style="font-size:17px; margin-bottom:30px">
				<tr>
					<td width="10%"><fmt:message key="num"/></td>
					<td width="10%"><fmt:message key="post_num"/></td>
					<td width="40%"><fmt:message key="content"/></td>
					<td width="35%"><fmt:message key="date"/></td>
				</tr>
			<%
				try{
					String sql = "select * from comment where user_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user_id);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						int numInt = rs.getInt("num");
						String num = numInt+"";
						int postNumInt = rs.getInt("post_num");
						String postNum = postNumInt + "";
						String content = rs.getString("content");
						String date = rs.getString("date");
			%>
				<tr>
					<td><a href="community.jsp?type=2&postNum=<%=postNum%>" style="text-decoration:none; color:black"><%=num%></a></td>
					<td><a href="community.jsp?type=2&postNum=<%=postNum%>" style="text-decoration:none; color:black"><%=postNum%></a></td>
					<td><a href="community.jsp?type=2&postNum=<%=postNum%>" style="text-decoration:none; color:black"><%=content%></a></td>
					<td><%=date%></td>
				</tr>
			<%
					}
				} catch(SQLException ex){
					out.println("comment 테이블 호출에 실패했습니다.");
					out.println("SQLException: "+ex.getMessage());
				} finally{
					if(rs!=null)
						rs.close();
					if(pstmt!=null)
						pstmt.close();
					if(conn!=null)
						conn.close();
				}
			%>
			</table></div>
		</div>
		<hr>
	</main>
	<%@ include file="footer.jsp" %>
	<%@ include file="junimo.jsp" %>
	</fmt:bundle>
</body>
</html>