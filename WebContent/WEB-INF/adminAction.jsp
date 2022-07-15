<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String user = request.getParameter("userId");
		String adminUpdate = request.getParameter("1");
		
		UserDAO userDao = new UserDAO();
		
	if(adminUpdate.equals("권한부여") ){
			int result = userDao.adminUpdate(user);
			script.println("<script>");
			script.println("alert('관리자 권한 부여 완료.');");
			script.println("location.href='admin.do'");
			script.println("</script>");
		}
		if(adminUpdate.equals("권한삭제")){
			int result = userDao.userUpdate(user);
			script.println("<script>");
			script.println("alert('관리자 권한 삭제 완료.');");
			script.println("location.href='admin.do'");
			script.println("</script>");
		}
		if(adminUpdate.equals("회원탈퇴")){
			int result = userDao.userDelete(user);
			script.println("<script>");
			script.println("alert('회원삭제 완료');");
			script.println("location.href='admin.do'");
			script.println("</script>");
		}


	%>

</body>
</html>