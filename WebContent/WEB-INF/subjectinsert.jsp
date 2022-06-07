<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>과정등록</title>
</head>
<body>
	<%@ include file = "menu2.jsp" %>
	<%
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.do'");
			script.println("</script>");
		}
	%>
	<div style = "margin-top : 70px;" class = "container">
		<div class = "row" style="height: 461px;width: 1300px; margin-right:auto;"> 
			<form method = "post" name ="insert" action="insert3.so" onkeydown="return enterkeydown(event)">
			
			
				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="8" style="backgroud-color:#eeeeee; text-align:center;">수강과정등록</th>		
						</tr>
					</thead>
						<tbody>
							<tr>
								<th style = "text-align:center">
									<label for="cars" >과목명</label>
									<input type = "text" class="form-control"placeholder="과목명" name="s_name">
								</th>
								<th style = "text-align:center">
									<label for="cars" >과목코드</label>
									<input type = "text" class="form-control"placeholder="과목코드" name="s_code">
								</th>
								<th style = "text-align:center">
									<label for="cars" >과정시작일</label>
									<input type = "date" class="form-control"placeholder="과정시작일" name="s_start" maxlength="10" value = "1900-01-01" min="0000-00-00" max="3000-12-31">
								</th>
								<th style = "text-align:center">
									<label for="cars" >과정종료일</label>
									<input type = "date" class="form-control" id="dateid" placeholder="과정종료일" name="s_end" maxlength="10" value = "1900-01-01" min="0000-00-00" max="3000-12-31" onchange = adddate(); >
								</th>
								<th style = "text-align:center">
									<label for="cars" >추후관리</label>
									<input type = "text" class="form-control"placeholder="추후관리" name="s_manage" maxlength="10" readonly>
								</th>
								<th style = "text-align:center">
									<label for="cars" >담당교수</label>
									<input type = "text" class="form-control"placeholder="담당교수" name="s_professor" maxlength="10">
								</th>
								<th style = "text-align:center">
									<label for="cars" >수강정원</label>
									<input type = "text" class="form-control"placeholder="수강정원" name="s_member" maxlength="10">
								</th>
								<th style = "text-align:center">
									<label for="cars" >목표취업률</label>
									<input type = "text" class="form-control"placeholder="목표취업률" name="s_empoyee" maxlength="10">
								</th>
							<tr>
						</tbody>
				</table>
				
				<input type="submit" class="btn btn-primary pull-right" value="등록"/>
			</form>
		</div>
	</div>
	>
	<script>
	
	
	function adddate(){
		month = document.getElementById("dateid").value;
		const today = new Date(month);
		const nextDate = new Date( today.getFullYear(), 
									today.getMonth()+6 , 
									today.getDate() -1 );
		
		const formatted_date = nextDate.getFullYear() + "-" + (nextDate.getMonth() + 1) + "-" + nextDate.getDate()
				
		/* const addMonth = new Date(nextDate) */
		insert.s_manage.value=formatted_date;
	}
	
	function enterkeydown(e){
		if(e.keyCode == 13)
			return false;
	}
	
	</script>
</body>
</html>