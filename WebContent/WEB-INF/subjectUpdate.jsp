<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>과정 수정 및 삭제</title>
</head>
<body>

	<%@ include file = "menu2.jsp" %>


	<div class = "container">
		<div class = "row">
			<form method = "post" name ="insert" action="update2.so"  onkeydown="return enterkeydown(event)">
			
			
<!-- 수강인원 기본정보 테이블  -->

				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 수정</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
						</tr>
					</thead>
					</tbody>
						<tr>
						<input type = "text" class="form-control" name="s_id" maxlength="10" value = ${suSelectOne.s_id}>
							<th style = "text-align:center">
								<label for="cars" >과정명</label>
								<input type = "text" class="form-control" name="s_name" value = ${suSelectOne.s_name}>
							</th>
							<th style = "text-align:center">
								<label for="cars">과목코드</label>
								<input type = "text" class="form-control"name="s_code" value = ${suSelectOne.s_code} >
							</th>
							<th style = "text-align:center">
								<label for="cars">과정시작일</label>
								<input type = "date" class="form-control" name="s_start" maxlength="20" value = "1900-01-01" min="0000-00-00" max="3000-12-31" value =${suSelectOne.s_start}>
							</th>
							<th style = "text-align:center">
								<label for="cars">과정종료일</label>
								<input type = "date" class="form-control" id = "dateid" name="s_end" maxlength="20" value = "1900-01-01" min="0000-00-00" max="3000-12-31" value =${suSelectOne.s_end} onchange = adddate();>
							</th>
							<th style = "text-align:center">
								<label for="cars">추후관리</label>
								<input type = "text" class="form-control" name="s_manage" maxlength="20" readonly value =${suSelectOne.s_manage}>
							</th>
							<th style = "text-align:center">
								<label for="cars">담당교수</label>
								<input type = "text" class="form-control" name="s_professor" maxlength="20" value =${suSelectOne.s_professor}>
							</th>
						</tr>
					</tbody>					
				</table>
				<input  onclick = "return confirm('정말 삭제 하시겠습니까?')" type="submit" class="btn btn-primary pull-right" value="삭제" formaction="delete.so"/> 								
				<input type="submit" class="btn btn-primary pull-right" value="수정" style="margin-right : 10px;"/>
			</form>
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