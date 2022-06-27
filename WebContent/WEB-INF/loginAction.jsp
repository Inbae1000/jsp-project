<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*"  %>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="u_email" />
<jsp:setProperty name="user" property="u_pass" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("u_email") != null){
			userID = (String) session.getAttribute("u_email");
		}
			if(userID != null){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('이미 로그인이 되어있습니다.');");
		outter.println("location.href = 'home.do')");
		outter.println("</script>");
			}
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user.getU_email(), user.getU_pass());
			if(result == 1){
		session.setAttribute("u_email", user.getU_email());
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("location.href = 'home.do'");
		outter.println("</script>");

			}
			else if(result == 0){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('비밀번호가 틀립니다.');");
		outter.println("history.back()");
		outter.println("</script>");

			}
			else if(result == -1){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('존재하지 않는 아이디입니다.');");
		outter.println("history.back()");
		outter.println("</script>");
			}
			else if(result == -2){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('데이터베이스 오류가 발생했습니다.');");
		outter.println("history.back()");
		outter.println("</script>");
			}
	%>


</body>
</html>