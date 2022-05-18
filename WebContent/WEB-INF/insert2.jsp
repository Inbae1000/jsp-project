<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action="home.do">
<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
		</tr>
	</thead>
	</tbody>
		<tr>
			<th><input type = "text" class="form-control"placeholder="이름" name="m_name" maxlength="10"></th>
			<th><label for="cars">생년월일</label><input type = "date" id = "birthId" class="form-control"name="m_brith" value = "1900-01-01" min="0000-00-00" max="3000-12-31" maxlength="20" onchange = addage();></th>
			<th><input type = "text" class="form-control"placeholder="전화번호" name="m_number" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="지역" name="m_area" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="나이" name="m_age" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="성별" name="m_sex" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="유형" name="m_option1" maxlength="20"></th>
			<th>
				<label for="cars">구분</label>
				<select name ="m_option2" id = "" oninput = Attendance4(),Attendance5();>
					<option value = ""> </option>
					<option value = "40세이상">40세이상</option>
					<option value = "취성패1">취성패1</option>
					<option value = "취성패2">취성패2</option>
				</select>
			</th>
			<th><input type = "text" class="form-control"placeholder="대상구분" name="m_option3" maxlength="20"></th>
			
		</tr>
	</tbody>					
</table>
<input type="submit" class="btn btn-primary pull-right" value="등록"/>
</form>
</body>
</html>