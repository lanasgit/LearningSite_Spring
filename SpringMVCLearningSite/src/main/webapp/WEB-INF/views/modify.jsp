<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO" %>
<%
	BoardTO to = (BoardTO)request.getAttribute("to");
	
	String seq = to.getSeq();
	String subject = to.getSubject();
	String title = to.getTitle();
	String link = to.getLink();
	String content = to.getContent();
	String wdate = to.getWdate();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>윤명철의 역사대학</title>
<link rel="stylesheet" type="text/css" href="./css/board_write.css">
</head>
<body>

<div class="head">
	<p class="title">윤명철 교수의 역사대학</p>
	<p class="subtitle">University of history</p>
</div>

<form action="./modify_ok.do" method="post" name="wfrm">
	<input type="hidden" name="seq" value="<%=seq %>" />
		<div class="contents_sub">
		
			<div class="board_write">
				<table>
				<tr>
					<th>분류</th>
					<td colspan="3">
						<select name="subject">
							<option value=<%=subject %>><%=subject %>(기존선택)</option>
					        <option value="일본 역사와 한일 관계">일본 역사와 한일 관계</option>
					        <option value="해양사 시리즈">해양사 시리즈</option>
					        <option value="한민족 시리즈">한민족 시리즈</option>
					        <option value="고구려사 시리즈">고구려사 시리즈</option>
					        <option value="청년과 학자">청년과 학자</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="title" size="150" value=<%=title %> class="board_write_input" /></td>
				</tr>
				<tr>
					<th>유튜브 링크</th>
					<td colspan="3"><input type="text" name="link" size="150" value=<%=link %> class="board_write_input" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="content" id="content" class="board_editor_area"><%=content %></textarea>
					</td>
				</tr>
				</table>
			</div>

			<div class="btn_area">
				<div class="align_left">			
					<input type="button" value="돌아가기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./index.jsp'" />
				</div>
				<div class="align_right">			
					<input type="button" id="wbtn" value="등록" class="btn_write btn_txt01" style="cursor: pointer;" />					
				</div>	
			</div>	
			
		</div>
	</form>

</body>

<script type="text/javascript" src="./smart_editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById('wbtn').onclick = function(){
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			if (document.wfrm.title.value.trim() == '') {
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			if (document.wfrm.content.value.trim() == '<p><br></p>') {
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			document.wfrm.submit();
		};
	};

	var editor_object = []; 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef : editor_object, 
		elPlaceHolder: "content", 
		sSkinURI: "./smart_editor/SmartEditor2Skin.html", 
		fCreator : "createSEditor2",
		htParams : {  
			bUseToolbar : true,  
			bUseVerticalResizer : true,  
			bUseModeChanger : true, 
		} 
	});
</script>
</html>