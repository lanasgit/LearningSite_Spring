<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO" %>
<%@ page import="model.CommentTO" %>
<%@ page import="java.util.ArrayList" %>
<%
	BoardTO to = (BoardTO)request.getAttribute("to");
	ArrayList<CommentTO> cLists = (ArrayList<CommentTO>)request.getAttribute("cLists");

	String seq = to.getSeq();
	String subject = to.getSubject();
	String title = to.getTitle();
	String link = to.getLink();
	String content = to.getContent().replace("\r\n", "<br>");
	String wdate = to.getWdate();
	
	StringBuffer strHtml = new StringBuffer();

	for (CommentTO cto : cLists) {  
		String Cseq = cto.getCseq();
     	String Cwriter = cto.getWriter();
     	String Ccontent = cto.getContent();
     	String Cdate = cto.getCdate();
      
		strHtml.append("<tr>");
	    strHtml.append("<td class='coment_re' width='20%'>");
	    strHtml.append("<strong style='padding: 0px 0px 0px 418px;'>"+Cwriter+"</strong> ("+Cdate+")");
	    strHtml.append("<div class='coment_re_txt' style='padding: 0px 300px 0px 418px;'>");
	    strHtml.append("<div style='padding: 0px 0px 2px 0px;'>");
	    strHtml.append(Ccontent);
	    strHtml.append("</div>");
	    strHtml.append("<br />");
	    strHtml.append("<div style='padding: 0px 0px 0px 897px;'>");
	    strHtml.append("<button class='align_right'> "); 
	    strHtml.append("<a href='javascript:void(0)'; onclick=\"location.href='./comment_modify.do?cseq="+Cseq+"&seq="+seq+"&content="+Ccontent+"'\">수정</a>&nbsp;");
	    strHtml.append("</button>");
	    strHtml.append("<button class='align_right'> ");  
	    strHtml.append("<a href='javascript:void(0)'; onclick=\"location.href='./comment_delete_ok.do?cseq="+Cseq+"&seq="+seq+"'\">삭제</a>&nbsp;");
	    strHtml.append("</button>");
	    strHtml.append("</div>");
	    strHtml.append("</div>");
	    strHtml.append("</td>");
	    strHtml.append("</tr>");
	    strHtml.append("<br />");
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>윤명철의 역사대학</title>
<link rel="stylesheet" type="text/css" href="./css/board_view.css">
</head>
<body>

<div class="head">
	<p class="title"><a href="index.jsp">윤명철 교수의 역사대학</a></p>
	<p class="subtitle">University of history</p>
</div>
<div class="subject"><%=subject %></div>
<br>
<div class="title" style="font-size:45px;"><%=title %></div>
<div class="btn_area">
	<form class="align_left" style="text-align:left; padding: 0px 0px 0px 30px;	">			
		<input type="button" value="홈으로" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='index.jsp'" />
	</form>
</div>
<div class="wdate">등록일 :<%=wdate %></div>
<hr>
<div class="link"><%=link %></div>
<br>
<div class="content"><%=content %></div>

<hr>

<form class="align_right" style="text-align: right; padding: 0px 0px 0px 200px;">
		<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%=seq %>'" />
		<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%=seq %>'" />
</form>

<form action="./comment_write_ok.do" method="post">
	<input type="hidden" name="seq" value=<%=seq %> />
	<table>
		<tr>
			<td width="94%" style="padding: 0px 200px 5px 418px;">닉네임 <input type="text" name="writer" maxlength="15" required/></td>
		</tr>
		<tr>
			<td style="padding: 0px 300px 0px 418px;">내용 &nbsp;&nbsp; <textarea name="content" cols="130" rows="5" required></textarea></td>
		</tr>
	</table>
	<div align="center" style="padding: 0px 0px 0px 860px;">
		<input type="submit" value="댓글등록" />
	</div>
</form>
<br /><hr /><br />
<!-- comment -->
<%=strHtml %>
</body>
</html>