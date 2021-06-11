<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	int type = 1;
%>
<script type="text/javascript">
	function check(){
		var form = document.Posting;
		var title = form.post_title.value;
		var content = form.post_content.value;
		var fileName = form.post_image.value;
		
		if(title==""){
			alert("제목을 작성해주세요");
			form.post_title.select();
			return false;
		} else if(content==""){
			alert("내용을 작성해주세요");
			form.post_content.select();
			return false;
		} else if(fileName==""){
			alert("파일을 입력해주세요");
			form.post_image.select();
			return false;
		} else if(title.length<5){
			alert("제목은 5글자 이상으로 작성해주세요");
			form.post_title.select();
			return false;
		}
		
		form.submit();
	}

</script>
<form action="writePost_process.jsp" class="form-horizontal" enctype="multipart/form-data" method="post" name="Posting">
	<div class="form-group">
		<div class="col-sm-12">
			<input type="text" class="form-control" name="post_title" placeholder="<fmt:message key="input_title"/>">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-12">
			<textarea name="post_content" class="form-control" placeholder="<fmt:message key="input_content"/>" rows="10"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-5">
			<input type="file" name="post_image" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-12">
			<input type="button" class="btn btn-lg btn-primary" value="<fmt:message key="button_add"/>" onClick="check()">
		</div>
	</div>
</form>
</body>
</html>