<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String userID = null;
	int loginAdd = Integer.parseInt(request.getParameter("loginAdd"));
	if(session.getAttribute("u_email") != null){
		userID = (String) session.getAttribute("u_email");
	}
	
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.do'");
		script.println("</script>");
	}

%>
</body>
</html>