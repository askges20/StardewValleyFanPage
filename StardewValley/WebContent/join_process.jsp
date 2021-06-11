<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file ="dbconn.jsp" %>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("join_id");
	String pw = request.getParameter("join_password");
	String nickname = request.getParameter("join_nickname");
	
	try{
		String sql = "select * from user";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String existId = rs.getString("id");
			if(id.equals(existId)){	//이미 해당 아이디가 존재한다면 가입 불가
				response.sendRedirect("join.jsp?error=1");
			}
		}
		sql = "insert into user values(?,?,?)";	//아이디 중복 문제가 없으면 user DB에 추가
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,nickname);
		pstmt.executeUpdate();
		
		Cookie newId = new Cookie("newId", URLEncoder.encode(id, "utf-8"));
		Cookie newPw = new Cookie("newPw", URLEncoder.encode(pw, "utf-8"));
		newId.setMaxAge(60*30);	//30분
		newPw.setMaxAge(60*30);	//30분
		response.addCookie(newId);
		response.addCookie(newPw);
		
		response.sendRedirect("join_success.jsp");	//로그인 성공 페이지로 이동
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