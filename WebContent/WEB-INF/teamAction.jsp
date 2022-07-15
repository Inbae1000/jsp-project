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
	String [] a = request.getParameterValues("code");
	String [] b = request.getParameterValues("employment_rate");
	String [][] c = new String[11][3];
	String year = request.getParameter("year");
	
	for(int i = 0; i<a.length; i++){
		c[i][0] = year;
		c[i][1] = a[i];
		c[i][2] = b[i];

		
	}

	for(int j = 0; j<a.length; j++){
		for(int jj = 0; jj <3; jj++){
			
		
	
%>
	<%=c[j][jj] %>

<%
		 }
	 }
%>	


</body>
</html>