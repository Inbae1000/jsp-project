<%@page import="java.util.List"%>
<%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>

<%@ include file = "menu2.jsp" %>
<body>
	<div style="margin-top : 60px;">
		
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="text-align:center;">ID</th>
						<th style="text-align:center;">비밀번호</th>
						<th style="text-align:center;">권한</th>
						<th style="text-align:center;">관리자 권한 부여</th>
					</tr>
				</thead>
				
				
					
					
				<%
					UserDAO userDao = new UserDAO();
					List<UserDTO> list = userDao.userList();
					int count = userDao.countEmail().getCountEmail();
					String[] aa = new String[count];
					String bb = null;
					int i = 0;
					for(UserDTO a : list){
						aa[i] = a.getU_email();
						i = i+1;
				%>
				<form method = "post" name = "user<%=i %>" action = "adminAction.do">
				<tbody>
					<tr>
						<td style="text-align:center;"><%=a.getU_email() %></td>
						<td style="text-align:center;"><%=a.getU_pass() %></td>
						<td style="text-align:center;"><%=a.getU_admin() %></td>
						<td>
						<input type = "hidden" name = "userId" value = <%=a.getU_email() %>>
						<input type = "submit" name = "1" value = "권한부여"/>
						<input type = "submit" name = "1" value = "권한삭제"/>
						<input type = "submit" name = "1" value = "회원탈퇴"/>
						</td>
					</tr>
					</tbody>
				</form>
				<%
				
					}
				%>
					
				 
			</table>
		
	</div>
</body>
<script>

</script>

</html>