<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ include file="dbconn.jsp" %>

<%
	String type = request.getParameter("type");

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String input_id = null;
		String input_pw = null;
		
		if(type.equals("1")){	//일반 로그인
			input_id = request.getParameter("id");
			input_pw = request.getParameter("password");
		} else if(type.equals("2")){	//회원가입 후 로그인 화면을 거치지 않고 바로 해당 아이디로 로그인
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(int i=0;i<cookies.length;i++){
					Cookie thisCookie = cookies[i];
					String n = thisCookie.getName();
					if(n.equals("newId"))
						input_id = URLDecoder.decode((thisCookie.getValue()),"utf-8");
					if(n.equals("newPw"))
						input_pw = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
			}
		}
		
		boolean login_success = false;
		
		try{
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String id = rs.getString("id");
				String pw = rs.getString("password");
				
				if(input_id.equals(id)&&input_pw.equals(pw)){	//user 테이블 정보와 일치
					login_success = true;
					session.setAttribute("userID", id);
					session.setAttribute("userPW", pw);
					session.setAttribute("userNN", rs.getString("nickname"));
					
					if(type.equals("2")){	//회원가입 직후 로그인이 끝나면 쿠키 삭제
						Cookie[] cookies = request.getCookies();
						if(cookies!=null){
							for(int i=0;i<cookies.length;i++){
								Cookie thisCookie = cookies[i];
								String n = thisCookie.getName();
								if(n.equals("newId"))
									thisCookie.setMaxAge(0);
								if(n.equals("newPw"))
									thisCookie.setMaxAge(0);
								response.addCookie(thisCookie);
							}
						}
					}
					
					response.sendRedirect("welcome.jsp");
				}
			}
			if (login_success = false)	//일치하는 정보가 없으면 로그인 실패
				response.sendRedirect("loginPage.jsp?error=1");
		}  catch (SQLException ex){
			out.println("user 테이블 호출을 실패했습니다.");
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