<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ include file ="dbconn.jsp" %>

<%	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String userID = (String)session.getAttribute("userID");
	String content = (String)session.getAttribute("review_content");
	
	try{
		String sql = "insert into review values(null,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		pstmt.setString(2,content);
		pstmt.executeUpdate();
		response.sendRedirect("reviewPage.jsp");	//평가 등록 성공 시 이동
		
	} catch(SQLException ex){
		out.println(userID);
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