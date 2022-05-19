<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.*" %>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="member.MemberDTO" scope="page"/>
<jsp:setProperty name="member" property="m_name" />
<jsp:setProperty name="member" property="m_birth" />
<jsp:setProperty name="member" property="m_number" />
<jsp:setProperty name="member" property="m_area" />
<jsp:setProperty name="member" property="m_age1" />
<jsp:setProperty name="member" property="m_age2" />
<jsp:setProperty name="member" property="m_sex" />
<jsp:setProperty name="member" property="m_option1" />
<jsp:setProperty name="member" property="m_option2" />
<jsp:setProperty name="member" property="m_option3" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인원추가</title>
</head>
<body>
	<%
	 String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		if(member.getM_name() == null || member.getM_birth() == null || member.getM_number() == null || member.getM_area() == null
				|| member.getM_option1() == null || member.getM_option2() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수강인원 입력에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력 완료')");
				script.println("location.href = 'insert2.do'");
				script.println("</script>");
				
			}
				
		}
		}
	
		
	%>


</body>
</html> --%>