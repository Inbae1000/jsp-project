<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action="insert2.do">
<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
		</tr>
	</thead>
	</tbody>
		<tr>
			<th><input type = "text" class="form-control"placeholder="이름" name="m_name" maxlength="10"></th>
			<th><label for="cars">생년월일</label><input type = "date" id = "birthId" class="form-control"name="m_birth" value = "1900-01-01" min="0000-00-00" max="3000-12-31" maxlength="20" onchange = addage();></th>
			<th><input type = "text" class="form-control"placeholder="전화번호" name="m_number" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="지역" name="m_area" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="나이" name="m_age1" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="성별" name="m_sex" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="유형" name="m_option1" maxlength="20"></th>
			<th>
				<label for="cars">구분</label>
				<select name ="m_option2" id = "">
					<option value = ""> </option>
					<option value = "40세이상">40세이상</option>
					<option value = "취성패1">취성패1</option>
					<option value = "취성패2">취성패2</option>
				</select>
			</th>
			<th><input type = "text" class="form-control"placeholder="대상구분" name="m_option3" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="비고" name="m_note" maxlength="20"></th>
			
		</tr>
		</tbody>					
</table>
<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>	
		</tr>
	</thead>
	</tbody>
		<tr>
			<th><input type = "text" class="form-control"placeholder="결과" id = "co_resultId" name="co_result" maxlength="10"></th>
			<th><input type = "text" class="form-control"placeholder="출석률" id = "co_attendId" name="co_attend" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="수료" id = "co_compleId" name="co_comple" maxlength="20"></th>
			<th>
				<label for="cars">취업</label>
				<select name ="co_employ" id = "item1Id" >
					<option value = ""> </option>
					<option value = "O">O</option>
					<option value = "X">X</option>
					<option value = "예정">예정</option>
					<option value = "가능">가능</option>
				</select>
			</th>
			<th>
				<label for="cars">동일</label>
				<select name ="co_same" id = "item2Id">
					<option value = ""> </option>
					<option value = "O">O</option>
					<option value = "X">X</option>
					<option value = "예정">예정</option>
				</select>
			
			</th>
			<th>
				<label for="cars">고용보험</label>
				<select name ="co_insurance" id= "item3Id">
					<option value = ""> </option>
					<option value = "O">O</option>
					<option value = "X">X</option>
					<option value = "창업">창업</option>
					<option value = "예정">예정</option>
				</select>
			</th>
			<th><input type = "text" class="form-control"placeholder="취업가중치" id = "co_option1Id" name="co_option1" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="직종가중치" id = "co_option2Id" name="co_option2" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="취업가중치" id = "co_option3Id" name="co_option3" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="직종가중치" id = "co_option4Id" name="co_option4" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="취업가중치" id = "co_option5Id" name="co_option5" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="직종가중치" id = "co_option6Id" name="co_option6" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="평가기준" name="co_asse" maxlength="20"></th>
			<th><input type = "text" class="form-control"placeholder="직종기준" name="co_porf" maxlength="20"></th>
			<th>
				<label for="cars">자격증</label>
				<select name ="co_certificate">
					<option value = ""> </option>
					<option value = "O">O</option>
					<option value = "X">X</option>
					<option value = "예정">예정</option>
				</select>
				
			
			</th>
		</tr>
	</tbody>					
</table>




<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
			</tr>
		</thead>
		</tbody>
			<tr>
				<th><input type = "date" class="form-control"placeholder="입사일" name="c_start" maxlength="10" value = "1900-01-01" min="0000-00-00" max="3000-12-31" maxlength="20"></th>
				<th><input type = "date" class="form-control"placeholder="고용유지" name="c_maintain" maxlength="20" value = "1900-01-01" min="0000-00-00" max="3000-12-31" maxlength="20"></th>
				<th><input type = "text" class="form-control"placeholder="퇴사여부" name="c_end" maxlength="20"></th>
				<th><input type = "text" class="form-control"placeholder="업체명" name="c_name" maxlength="20"></th>
				<th><input type = "text" class="form-control"placeholder="주소" name="c_address" maxlength="20"></th>
				<th><input type = "text" class="form-control"placeholder="전화번호" name="c_number" maxlength="20"></th>
				<th>
					<label for="cars">취업전담제</label>
					<select id="cars" name="c_manager"> <!-- 값 수정 다해야함 -->
						<option value="volvo"selected>팀장</option>
						<option value="saab">교수</option> 
						<option value="fiat">과장</option>
						<option value="audi">정T</option>
					</select>
				</th>
				<th><input type = "text" class="form-control"placeholder="산정제외" name="c_excep" maxlength="20"></th>
			</tr>
		</tbody>					
</table>
		
		
	
<input type="submit" class="btn btn-primary pull-right" value="등록"/>
</form>
</body>
</html>