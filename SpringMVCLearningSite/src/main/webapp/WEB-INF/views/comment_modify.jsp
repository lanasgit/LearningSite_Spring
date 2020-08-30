<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String seq = (String)request.getAttribute("seq");
	String cseq = (String)request.getAttribute("cseq");
	String content = (String)request.getAttribute("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>

<form action="./comment_modify_ok.do" method="post" >
<input type="hidden" name="seq" value="<%=seq %>"/>
<input type="hidden" name="cseq" value="<%=cseq %>"/>
	※댓글 수정<hr>
	수정할 내용을 입력하세요<br>
	<textarea name="content" class="coment_input_text" cols="100" rows="5" required><%=content %></textarea><br><br>
	<div style="padding: 0px 0px 0px 680px;">
	<input type="submit" value="수정" style="cursor: pointer;"/>
	</div>
</form>

</body>
</html>