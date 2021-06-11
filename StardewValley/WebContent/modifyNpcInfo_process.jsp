<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale, java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("c_name");
	String birthday = request.getParameter("c_birthday");
	String description = request.getParameter("c_description");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "update npc set birthday=?, description=? where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, birthday);
		pstmt.setString(2, description);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		response.sendRedirect("modifyNpcInfo_success.jsp");	//캐릭터 정보 수정 성공 시 이동
	} catch(SQLException ex){
		out.println("npc 테이블 호출에 실패했습니다.");
		out.println("SQLException: "+ex.getMessage());
	} finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>