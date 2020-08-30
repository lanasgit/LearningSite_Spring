<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	String seq = (String)request.getAttribute("seq");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('댓글이 수정되었습니다.');"); 
		out.println("location.href='./view.do?seq="+seq+"';");
	} else {
		out.println("alert('<오류>댓글이 수정되지 않았습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>