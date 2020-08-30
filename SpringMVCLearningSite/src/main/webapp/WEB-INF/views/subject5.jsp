<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO" %>
<%@ page import="java.util.ArrayList" %>   
<%
   ArrayList<BoardTO> lists = (ArrayList<BoardTO>)request.getAttribute("lists");

   StringBuffer strHtml = new StringBuffer();

   for (BoardTO to : lists) {
      if (to.getSubject().equals("청년과 학자")) {
         String seq = to.getSeq();
         String title = to.getTitle();
         
         strHtml.append("<li>");
         strHtml.append("<div class='label'>");
         strHtml.append("<a class='courselink'");
         strHtml.append("href='view.do?seq="+seq+"'>"+title+"</a></div>");
         strHtml.append("</li>");
      }
   };
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>윤명철의 역사대학</title>
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
</head>
<body>

<div class="head">
   <p class="title"><a href="index.jsp">윤명철 교수의 역사대학</a></p>
   <p class="subtitle">University of history</p>
</div>
<div class="con_txt">
   <div class="contents_sub">
      <div class="board">
         <table>
         <tr>
            <th width="3%">&nbsp;</th>
            <th width="7%"><a href="subject1.do">일본 역사와 한일 관계</a></th>
            <th width="7%"><a href="subject2.do">해양사 시리즈</a></th>
            <th width="7%"><a href="subject3.do">한민족 시리즈</a></th>
            <th width="7%"><a href="subject4.do">고구려사 시리즈</a></th>
            <th width="7%" style="background-color:lightGray"><a href="subject5.do">청년과 학자</a></th>
            <th width="3%">&nbsp;</th>
         </tr>
         </table>
      </div>   
   </div>
</div>
<%=strHtml %>
</body>
</html>