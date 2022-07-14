<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "subject.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>영진직업전문학교 인원관리</title>
</head>
<body>
	<%@ include file ="menu2.jsp" %>
		<div style="width:auto; margin-top : 70px;" class = "container">
			<div style="width: 1000px; margin: auto;">
				<div style="text-align:center;">
					<form method="post" name="search" action="search.so">
						<table class="pull-right" style="margin-bottom: 20px">
							<tr>
								<td><select class="form-control" name="searchField">								
										<option value="s_name" selected>과정명</option>
										<option value="s_code">과정코드</option>
										<option value="s_professor">담당교수</option>								
								</select></td>
								<td><input type="text" class="form-control"
									placeholder="검색" name="searchText" maxlength="100"></td>
								<td><input type="submit" class="btn btn-info" value = "검색"></td>
								
								<%
								
									if(userID != null && admin != 0){
										PrintWriter script = response.getWriter();
								
								%>
								
									<a href ="insert.so" class="btn btn-info pull-left">과정등록</a>
								
								<%
								}
								%>
							</tr>
						</table>
					</form>
				</div>
				
				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd;">
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">과목이름</th>
						<th style="background-color:#eeeeee; text-align:center;">과목코드</th>
						<th style="background-color:#eeeeee; text-align:center;">훈련시작</th>
						<th style="background-color:#eeeeee; text-align:center;">훈련종료</th>
						<th style="background-color:#eeeeee; text-align:center;">관리</th>
						<th style="background-color:#eeeeee; text-align:center;">담당교수</th>					
					</tr>
					<%
						SubjectDAO subjectDao = SubjectDAO.getInstance();
						List<SubjectDTO> list = subjectDao.subjectList();
						int a = 0;
						for(SubjectDTO b : list){
							a=a+1;					
					%>
					<tr>
						<td><%=a %></td> 
						<th style="background-color:#FFFFFF; text-align:center;"><a href="select.so?s_id=<%=b.getS_id()%>"><%=b.getS_name() %></a></th>
						<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_code() %></th>
						<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_start() %></th>
						<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_end() %></th>
						<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_manage() %></th>
						<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_professor() %></th>
					</tr>
					<%
						}
					%>
				</table>	
			</div>
		</div>	 
</body>
</html>