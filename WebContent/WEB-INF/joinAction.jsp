<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"  %>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="u_email" />
<jsp:setProperty name="user" property="u_pass" />
<jsp:setProperty name="user" property="u_name" />
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		if(user.getU_email() == null || user.getU_pass() == null || user.getU_name() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력해주세요.');");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('중복된 아이디입니다.');");
				script.println("history.back()");
				script.println("</script>");

			}
			else {
				session.setAttribute("u_email", user.getU_email());
				PrintWriter script = response.getWriter();
				script.println("<script>");				
				script.println("location.href='home.do'");
				script.println("</script>");
			}			
		}		
	%>


</body>
</html>