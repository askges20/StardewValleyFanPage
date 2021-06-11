<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file ="dbconn.jsp" %>
<script type="text/javascript">
	function check(){
		var form = document.ModifyNpcInfo;
		var birthday = form.c_birthday.value;
		var description = form.c_description.value;
		
		if(birthday==""){
			alert("생일을 입력해주세요");
			form.birthday.select();
			return false;
		} else if(description==""){
			alert("캐릭터 설명을 입력해주세요");
			form.description.select();
			return false;
		}
		
		form.submit();
	}
</script>
<%
	String npc_name=request.getParameter("name");
	String npc_birthday = null;
	String npc_description = null;

	ResultSet rs = null;
	PreparedStatement pstmt = null;

	try{
		String sql = "select * from npc where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, npc_name);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			npc_birthday = rs.getString("birthday");
			npc_description = rs.getString("description");
		}
	} catch(SQLException ex){
		out.println("npc 테이블 호출에 실패했습니다.");
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

<form action="modifyNpcInfo_process.jsp" class="form-horizontal" method="post" name="ModifyNpcInfo" style="font-size:20px">
		<p><label style="width:100px; text-align:left"><fmt:message key="name"/></label>
			<input type="text" name="c_name" value=<%=npc_name%> readonly/></p>
		<p><label style="width:100px; text-align:left"><fmt:message key="birthday"/></label>
			<input type="text" name="c_birthday" value=<%=npc_birthday%>></p>
	<div class="form-group">
		<textarea name="c_description" class="form-control" placeholder="<fmt:message key="desc_npc"/>" rows="10" style="font-size:20px"><%=npc_description %></textarea>
	</div>
	<input type="button" class="btn btn btn-lg btn-success btn-block" value="<fmt:message key="button_modify"/>" onClick="check()"/>
</form>
<p style="margin-top:20px">*<fmt:message key="warn_npc"/></p>

<script>
	function showBubble(x){
		x.style.opacity="1.0";
	}
	function hideBubble(x){
		x.style.opacity="0.0";
	}
</script>

<a href="?language=ko&name=<%=request.getParameter("name")%>"><img src='./resources/images/junimo1.png';
	onmouseover="showBubble(korean_bubble)"; onmouseout="hideBubble(korean_bubble)"
	style="position:fixed; left:2%; top:83%; width:100px; height:100px;"></a>
<img src='./resources/images/korean.png' id="korean_bubble"
	style="position:fixed; left:2%; top:78%; width:100px; height:50px; opacity:0.0">
<a href="?language=en&name=<%=request.getParameter("name")%>"><img src='./resources/images/junimo2.png';
	onmouseover="showBubble(english_bubble)"; onmouseout="hideBubble(english_bubble)"
	style="position:fixed; right:2%; top:83%; width:100px; height:100px"></a>
<img src='./resources/images/english.png' id="english_bubble"
	style="position:fixed; right:2%; top:78%; width:100px; height:50px; opacity:0.0">

</body>
</html>