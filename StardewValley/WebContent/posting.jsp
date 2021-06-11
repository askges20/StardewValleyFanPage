<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>

<%
	String postNum = request.getParameter("postNum");
	session.setAttribute("current_post_num", postNum);
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String num = null;
	String title = null;
	String content = null;
	String id = null;
	String date = null;
	String imageName = null;
	String filePath = null;
	String nickname = null;

	try{
		String sql = "select * from posting where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,postNum);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			num = rs.getString("num");
			title = rs.getString("title");
			content = rs.getString("content");
			id = rs.getString("id");
			date = rs.getString("date");
			imageName = rs.getString("image");
			filePath = "./resources/images/posting/" + imageName;
			
			String sql2 = null;
			ResultSet rs2 = null;
			PreparedStatement pstmt2 = null;
			
			try{
				sql2 = "select * from user where id=?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, id);
				rs2 = pstmt2.executeQuery();
				while(rs2.next())
					nickname = rs2.getString("nickname");
			}catch(SQLException ex){
				out.println("user 테이블 호출에 실패했습니다.");
				out.println("SQLException: "+ex.getMessage());
			}finally{
				if(rs2!=null)
					rs2.close();
				if(pstmt2!=null)
					pstmt2.close();
			}
		}
	} catch(SQLException ex){
		out.println("posting 테이블 호출에 실패했습니다.");
		out.println("SQLException: "+ex.getMessage());
	} finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
	}
%>
<h2><%=title%></h2>
<p><fmt:message key="writer"/> : <%=nickname%>(<%=id %>) | <fmt:message key="date"/> : <%=date %></p>
<hr>
<h5 style="margin:40px 60px 0px 60px"><%=content%></h5>
<img src='<%=filePath%>' width="95%" style="margin:40px 0px"/>
<p align=left>
<input type="button" class="btn btn btn-info" onClick="location.href='community.jsp?type=1'" value="&laquo; <fmt:message key="list"/>" style="margin-left:30px"/>
<input type="button" class="btn btn btn-danger" onClick="location.href='deletePost_process.jsp?postNum=<%=postNum%>'" value="<fmt:message key="button_delete"/>"/>
</p>
<p align=left style="padding:0px 10%"><text style="font-size:30px;"><fmt:message key="comment"/></text></p>
<p><form name="comment_form" method="post" action="writeComment_process.jsp">
<%
	if(request.getParameter("error")!=null){
		%>
	<h5 class="alert alert-danger"><fmt:message key="log_req"/></h5>
	<%
	}
%>
<textarea name="comment_content" rows="1" style="width:80%; margin-top:15px"></textarea>
<input type="button" class="btn btn btn-warning" value="<fmt:message key="button_add"/>" style="margin-bottom:20px"
	onClick="submit()"></form></p>

<%
	ResultSet rs2 = null;
	PreparedStatement pstmt2 = null;

	try{
		String sql = "select * from comment where post_num=?";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setString(1,postNum);
		rs2=pstmt2.executeQuery();
		
		String comment_num = null;
		String comment_id = null;
		String comment_content = null;
		String comment_date = null;
		
		while(rs2.next()){
			int comment_num_int = rs2.getInt("num");
			comment_num = comment_num_int+"";
			comment_id = rs2.getString("user_id");
			comment_content = rs2.getString("content");
			comment_date = rs2.getString("date");
			
			String sql3 = null;
			ResultSet rs3 = null;
			PreparedStatement pstmt3 = null;
			String comment_nickname = null;
			
			try{
				sql3 = "select * from user where id=?";
				pstmt3 = conn.prepareStatement(sql3);
				pstmt3.setString(1, comment_id);
				rs3 = pstmt3.executeQuery();
				while(rs3.next())
					comment_nickname = rs3.getString("nickname");
				}catch(SQLException ex){
					out.println("user 테이블 호출에 실패했습니다.");
					out.println("SQLException: "+ex.getMessage());
				}finally{
					if(rs3!=null)
						rs3.close();
					if(pstmt3!=null)
						pstmt3.close();
				}
			%>
			<div style="margin:0px 60px; padding:20px 40px; text-align:left">
				<text style="font-size:20px;"><%=comment_nickname%>(<%=comment_id %>)</text> | <%=comment_date %>
				<%
					if(comment_id.equals(session.getAttribute("userID"))){	//본인 댓글에는 삭제 버튼이 있음
						%>
							<input type="button" class="btn btn-danger" style="padding:0px 10px"
							onClick="location.href='deleteComment_process.jsp?comment_num=<%=comment_num %>&postNum=<%=num%>'" value="X"/>
						<%
					}
				%>
				<br><text style="font-size:20px;"><%=comment_content %></text>
			</div>
			<hr width="80%">
			<%
		}
	} catch(SQLException ex){
		out.println("posting 테이블 호출에 실패했습니다.");
		out.println("SQLException: "+ex.getMessage());
	} finally{
		if(rs2!=null)
			rs2.close();
		if(pstmt2!=null)
			pstmt2.close();
		if(conn!=null)
			conn.close();
	}
%>
	<a href="?language=ko&type=2&postNum=<%=num%>"><img src='./resources/images/junimo1.png';
	onmouseover="showBubble(korean_bubble)"; onmouseout="hideBubble(korean_bubble)"
	style="position:fixed; left:2%; top:83%; width:100px; height:100px;"></a>
	<img src='./resources/images/korean.png' id="korean_bubble"
		style="position:fixed; left:2%; top:78%; width:100px; height:50px; opacity:0.0">
	<a href="?language=en&type=2&postNum=<%=num%>"><img src='./resources/images/junimo2.png';
		onmouseover="showBubble(english_bubble)"; onmouseout="hideBubble(english_bubble)"
		style="position:fixed; right:2%; top:83%; width:100px; height:100px"></a>
	<img src='./resources/images/english.png' id="english_bubble"
		style="position:fixed; right:2%; top:78%; width:100px; height:50px; opacity:0.0">