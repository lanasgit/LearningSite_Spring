<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO" %>
<%
	BoardTO to = (BoardTO)request.getAttribute("to");

	String seq = to.getSeq();
	String subject = to.getSubject();
	String title = to.getTitle();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>윤명철 교수의 역사대학</title>
<link rel="stylesheet" type="text/css" href="./css/board_view.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('dbtn').onclick = function() {
			document.dfrm.submit();
		};
	};
</script>
</head>
<body>

<div class="head">
	<p class="title">윤명철 교수의 역사대학</p>
	<p class="subtitle">University of history</p>
</div>

<form action="./delete_ok.do" method="post" name="dfrm">
	<input type="hidden" name="seq" value="<%=seq %>" />
			
	<div class="subject">
		<%=subject %> 
	</div>
	
	<br>
	<hr>
	
	<div class="title" style="font-size:25px;">
		선택된 게시글 : <%=title %>
	</div>
	
	<div style="text-align:right; font-size:10px; padding:0px 100px;">
		위 글을 삭제 하시려면 아래 삭제 버튼을 눌러주세요
	</div>
	<hr>	
</form>

<form class="align_left" style="text-align:right; padding:0px 100px;">			
	<input type="button" value="돌아가기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%=seq %>'" />
	<input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
</form>	

</body>
</html>
