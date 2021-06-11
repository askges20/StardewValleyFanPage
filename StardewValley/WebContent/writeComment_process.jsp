<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale, java.util.Date" %>
<%@ include file ="dbconn.jsp" %>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("userID");
	String postNum = (String)session.getAttribute("current_post_num");
	String content = request.getParameter("comment_content");
	Locale locale = request.getLocale();
	String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale).format(new Date());
	
	if(user_id==null){
		response.sendRedirect("community.jsp?type=2&error=1&postNum="+postNum);
	}
	
	try{
		String sql = "insert into comment values(null,?,?,?,?)";	//아이디 중복 문제가 없으면 user DB에 추가
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
		pstmt.setString(2,postNum);
		pstmt.setString(3,content);
		pstmt.setString(4,date);
		pstmt.executeUpdate();
		
		session.removeAttribute("current_post_num");
		response.sendRedirect("community.jsp?type=2&postNum="+postNum);	//로그인 성공 페이지로 이동
	} catch(SQLException ex){
		out.println("user 테이블 호출에 실패했습니다.");
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