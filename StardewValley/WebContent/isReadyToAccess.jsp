<%@ page contentType="text/html; charset=utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
	String type = request.getParameter("type");
	String userId = (String)session.getAttribute("userID");
	if(userId==null)	//로그인 안된 상태
		response.sendRedirect("loginPage.jsp?error=2");	//로그인 화면으로 이동
	else{
		if(type.equals("1")){
			response.sendRedirect("writePosting.jsp");	//글 작성 페이지로 이동
		} else if (type.equals("2")){
			response.sendRedirect("myPage.jsp");	//마이페이지로 이동
		} else if (type.equals("3")){	//평가 작성 페이지로 이동
			String content = request.getParameter("review_content");
			session.setAttribute("review_content", content);
			response.sendRedirect("writeReview_process.jsp");	
		}
	}
%>