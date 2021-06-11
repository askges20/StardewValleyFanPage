<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<title>Stardew Valley Fan Page</title>
<link rel="shortcut icon" href="./resources/images/icon.png"
	type="image/x-icon">
</head>

<style type="text/css">
.jumbotron {
	background-color: rgba(255, 255, 255, 0.0);
	background-size: 100%;
	height: 230px;
	text-shadow: black 0.2em 0.2em 0.2em;
}
</style>

<body
	style="background-image: url('./resources/images/main2.png'); background-width: 100%"
	class="normalText">
	<%
		String type = request.getParameter("type");
	%>

	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">

		<%@ include file="menu.jsp"%>
		<div class="jumbotron" style="color: white;">
			<div class="container">
				<h3 class="display-5">
					<%="       "%>
				</h3>
				<a href="welcome.jsp" style="text-decoration: none; color: white"><h1 class="display-2 title">
						<fmt:message key="title" />
					</h1>
					<h3 class="display-5">
						<fmt:message key="subtitle" />
					</h3></a>
			</div>
		</div>

		<main role="main">
			<div class="container"
				style="background-color: white; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); padding: 60px 20px">
				<h2><fmt:message key="character_info" /></h2>
				<hr>
				<p style="font-size:25px; margin-top:30px">
					<img src="./resources/images/junimo1.png" width="50px"/>
					<fmt:message key="woman" />
					<img src="./resources/images/junimo2.png" width="50px"/>
				</p>
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;

					try {
						String sql = "select * from npc where gender=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "여");
						rs = pstmt.executeQuery();

						while (rs.next()) {
							String name = rs.getString("name");
							String en_name = rs.getString("en_name");
							String gender = rs.getString("gender");
							String birthday = rs.getString("birthday");
							String description = rs.getString("description");
							%>
							<div style="margin:40px 0px">
							<center>
							<table width="70%" style="text-align:left; font-size:18px">
								<tr><th colspan="2"></th></tr>
								<tr>
									<th rowspan="5" width="50%">
										<center><img src='<%="./resources/images/portrait/"+en_name+".png"%>' width="40%"/></center>
									</th>
									<td><fmt:message key="name" /> : <%=name %> (<%=en_name%>)</td>
								</tr>
								<tr><td><fmt:message key="gender" /> : <%=gender%></td></tr>
								<tr><td><fmt:message key="birthday" /> : <%=birthday %></td></tr>
								<tr><td><fmt:message key="desc" /> : <%=description %></td></tr>
								<tr><td style="text-align:right; padding:0px">
									<input type="button" class="btn btn-primary" style="padding:5px"
									onClick="location.href='modifyNpcInfo.jsp?name=<%=name%>'" value="<fmt:message key="button_modify"/>"/>
								</td></tr>
							</table>
							</center>
							</div>
							<%
						}
					}catch (SQLException ex) {
						out.println("npc 테이블 호출을 실패했습니다.");
						out.println("SQLException: " + ex.getMessage());
					}%>
					
					<p style="font-size:25px; margin-top:30px">
						<img src="./resources/images/junimo1.png" width="50px"/>
						<fmt:message key="man" />
						<img src="./resources/images/junimo2.png" width="50px"/>
					</p>
					<%
					try {
						String sql = "select * from npc where gender=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "남");
						rs = pstmt.executeQuery();

						while (rs.next()) {
							String name = rs.getString("name");
							String en_name = rs.getString("en_name");
							String gender = rs.getString("gender");
							String birthday = rs.getString("birthday");
							String description = rs.getString("description");
							%>
							<div style="margin:40px 0px">
							<center>
							<table width="70%" style="text-align:left; font-size:18px">
								<tr><th colspan="2"></th></tr>
								<tr>
									<th rowspan="5" width="50%">
										<center><img src='<%="./resources/images/portrait/"+en_name+".png"%>' width="40%"/></center>
									</th>
									<td><fmt:message key="name" /> : <%=name %> (<%=en_name%>)</td>
								</tr>
								<tr><td><fmt:message key="gender" /> : <%=gender%></td></tr>
								<tr><td><fmt:message key="birthday" /> : <%=birthday %></td></tr>
								<tr><td><fmt:message key="desc" /> : <%=description %></td></tr>
								<tr><td style="text-align:right; padding:0px">
									<input type="button" class="btn btn-primary" style="padding:5px"
									onClick="location.href='modifyNpcInfo.jsp?name=<%=name%>'" value="<fmt:message key="button_modify"/>"/>
								</td></tr>
							</table>
							</center>
							</div>
							<%
						}
					}catch (SQLException ex) {
						out.println("npc 테이블 호출을 실패했습니다.");
						out.println("SQLException: " + ex.getMessage());
					} finally {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					}
				%>
			</div>
		</main>
		<%@ include file="footer.jsp"%>
		<%@ include file="junimo.jsp"%>
	</fmt:bundle>
</body>
</html>