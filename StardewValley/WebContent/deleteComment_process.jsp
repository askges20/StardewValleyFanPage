<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>
<%
	String commentNum = request.getParameter("comment_num");
	String postNum = request.getParameter("postNum");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	request.setCharacterEncoding("utf-8");
	
	try{
		String sql = "delete from comment where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,commentNum);
		pstmt.executeUpdate();
		String url = "community.jsp?type=2&postNum="+postNum;
		response.sendRedirect(url);	//로그인 성공 페이지로 이동
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