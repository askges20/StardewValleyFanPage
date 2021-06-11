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
<script type="text/javascript">
	function check(){
		var form = document.Review;
		var content = form.review_content.value;
		if(content.length<2){
			alert("내용을 작성해주세요!")
			return false;
		}
		form.submit();
	}
</script>
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
			<h2><fmt:message key="menu_site_rate"/></h2>
			<hr>			
			<div class="col-md-12">
			<%
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				
				try{
					String sql = "select * from review";
					pstmt = conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						String user_id = rs.getString("user_id");
						String content = rs.getString("content");
			%>
				<div style="text-align:left; margin:30px; padding:0px 20px">
					<h4><fmt:message key="writer"/> : <%=user_id%></h4>
					<h5><fmt:message key="content"/> : <%=content %></h5>
				</div>
				<hr>
			<%
					}
				} catch(SQLException ex){
					out.println("review 테이블 호출에 실패했습니다.");
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
			<p align="right" style="padding:0px 20px">
			<form action="isReadyToAccess.jsp?type=3" name="Review" method="post">
				<textarea rows=2 style="width:90%; margin-top:40px" name="review_content"></textarea>
				<input type="button" class="btn btn btn-lg btn-danger" onClick="check()"
				value="<fmt:message key="button_add"/>" style="margin-bottom:40px"/>
				</p>
			</form>
		</div>
		<hr>
	</main>
	<%@ include file="footer.jsp" %>
	<%@ include file="junimo.jsp" %>
	</fmt:bundle>
</body>
</html>