<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Stardew Valley Fan Page</title>
<link rel="shortcut icon" href="./resources/images/icon.png" type="image/x-icon">
</head>
<script type="text/javascript">
	function check(){
		var regExpIdPw = /^[a-zA-Z0-9]*$/;
		var regExpNickname = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/;
		
		var form = document.Join;
		var id = form.join_id.value;
		var pw = form.join_password.value;
		var nickname = form.join_nickname.value;
		
		if(id.length<5||id.length>13){
			alert("아이디는 5~13자 이내로 입력 가능합니다");
			form.join_id.select();
			return false;
		} else if(pw.length<6||pw.length>20){
			alert("비밀번호는 6~20자 이내로 입력 가능합니다");
			form.join_password.select();
			return false;
		} else if(nickname==""){
			alert("닉네임을 입력해주세요!");
			form.join_nickname.select();
			return false;
		} else if(!regExpIdPw.test(id)){
			alert("아이디는 영어와 숫자만 사용할 수 있습니다");
			form.join_id.select();
			return false;
		} else if(!regExpIdPw.test(pw)){
			alert("비밀번호는 영어와 숫자만 사용할 수 있습니다");
			form.join_password.select();
			return false;
		} else if(!regExpNickname.test(nickname)){
			alert("닉네임은 문자로만 입력해주세요");
			form.join_nickname.select();
			return false;
		}
		
		form.submit();
	}
</script>

<body style="background-image:url('./resources/images/main2.png'); background-width:100%" class="normalText">
	<style type="text/css">
		.jumbotron{
			background-color: rgba( 255, 255, 255, 0.0 );
			background-size : 100%;
			height: 230px;
			text-shadow: black 0.2em 0.2em 0.2em;
		}
	</style>

	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	
	<%@ include file="menu.jsp" %>
	<div class="jumbotron" style="color:white;">
		<div class="container">
			<h3 class="display-5">
					<%="       " %>
			</h3>
			<a href="welcome.jsp" style="text-decoration:none; color:white"><h1 class="display-2 title"><fmt:message key="title"/></h1>
			<h3 class="display-5"><fmt:message key="subtitle"/></h3></a>
		</div>
	</div>

	<main role="main">
	<div class="container" style="background-color:white; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding:40px 40px" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading"><fmt:message key="account"/></h3>
			<%
				String error=request.getParameter("error");
				if(error!=null){
					out.println("<div class='alert alert-danger'>");
					out.println("이미 존재하는 아이디입니다.");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="join_process.jsp" method="post" name="Join">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ID" name="join_id" required autofocus>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="Password" name="join_password" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Nickname" name="join_nickname" required>
				</div>
				<input type="button" class="btn btn btn-lg btn-success btn-block" value="<fmt:message key="submit"/>" onClick="check()"/>
			</form>
		</div>
	</div>
	</main>
	<%@ include file="footer.jsp" %>
	<%@ include file="junimo.jsp" %>
	</fmt:bundle>
</body>
</html>