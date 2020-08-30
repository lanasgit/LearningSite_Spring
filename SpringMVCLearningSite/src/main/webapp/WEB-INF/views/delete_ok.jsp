<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글이 삭제되었습니다.');");
		out.println("location.href='./index.jsp';");
	} else {
		out.println("alert('<오류>글이 삭제되지 않았습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>