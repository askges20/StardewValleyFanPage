<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>

<div class="col-md-12">
<table class="table table-striped" width="100%" style="font-size:17px; margin-bottom:30px">
	<tr>
		<td width="10%"><fmt:message key="num"/></td>
		<td width="40%"><fmt:message key="post_title"/></td>
		<td width="10%"><fmt:message key="writer"/></td>
		<td width="35%"><fmt:message key="date"/></td>
	</tr>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "select * from posting";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			int numInt = rs.getInt("num");
			String num = numInt+"";
			String title = rs.getString("title");
			String id = rs.getString("id");
			String date = rs.getString("date");
			
			String sql2 = null;
			ResultSet rs2 = null;
			PreparedStatement pstmt2 = null;
			String nickname = null;
			
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
%>
	<tr>
		<td><a href="community.jsp?type=2&postNum=<%=num%>" style="text-decoration:none; color:black"><%=num%></a></td>
		<td><a href="community.jsp?type=2&postNum=<%=num%>" style="text-decoration:none; color:black"><%=title%></a></td>
		<td><%=nickname%></td>
		<td><%=date%></td>
	</tr>
<%
		}
	} catch(SQLException ex){
		out.println("posting 테이블 호출에 실패했습니다.");
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