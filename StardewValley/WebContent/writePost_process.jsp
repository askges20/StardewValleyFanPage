<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale, java.util.Date" %>
<%@ include file ="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	String realFolder = "C://Users//askge//eclipse-workspace//StardewValley//WebContent//resources//images/posting/";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("post_title");	//제목
	String content = multi.getParameter("post_content");	//내용
	String id = (String)session.getAttribute("userID");	//작성자 아이디
	Locale locale = request.getLocale();
	String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale).format(new Date());
	//작성일자
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);	//파일 이름
	
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into posting values(null,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setString(3, id);
		pstmt.setString(4, date);
		pstmt.setString(5, fileName);
		pstmt.executeUpdate();
		response.sendRedirect("writePost_success.jsp");	//게시물 등록 성공 시 이동
		
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