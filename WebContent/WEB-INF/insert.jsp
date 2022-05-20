<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "menu2.jsp" %>
	<div class = "container">
		<div class = "row">
			<form method = "post" name ="insert" action="insert2.do">
			
			
<!-- 수강인원 기본정보 테이블  -->

				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
						</tr>
					</thead>
					</tbody>
						<tr>
							<th style = "text-align:center">
								<label for="cars" >이름</label>
								<input type = "text" class="form-control"placeholder="이름" name="m_name" maxlength="10">
							</th>
							<th style = "text-align:center">
								<label for="cars">생년월일</label>
								<input type = "date" id = "birthId" class="form-control"name="m_birth" value = "1900-01-01" min="0000-00-00" max="3000-12-31" maxlength="20" onchange = addage(); >
							</th>
							<th style = "text-align:center">
								<label for="cars">전화번호</label>
								<input type = "text" class="form-control"placeholder="전화번호" name="m_number" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">지역</label>
								<input type = "text" class="form-control"placeholder="지역" name="m_area" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">나이</label>
								<input type = "text" class="form-control"placeholder="나이" name="m_age1" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">성별</label>
								<input type = "text" class="form-control"placeholder="성별" name="m_sex" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">유형</label>
								<input type = "text" class="form-control"placeholder="유형" name="m_option1" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">구분</label>
								<select name ="m_option2" id = "m_option2Id" oninput = Attendance4(),Attendance5();>
									<option value = ""> </option>
									<option value = "40세이상">40세이상</option>
									<option value = "취성패1">취성패1</option>
									<option value = "취성패2">취성패2</option>
								</select>
							</th>
							<th style = "text-align:center">
								<label for="cars">대상구분</label>
								<input type = "text" class="form-control"placeholder="대상구분" name="m_option3" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">비고</label>
								<input type = "text" class="form-control"placeholder="비고" name="m_note" maxlength="20">
							</th>
							
						</tr>
					</tbody>					
				</table
				>
<!-- 수강인원 결과 관리 테이블  -->

				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
						</tr>
					</thead>
					</tbody>
						<tr>
							<th style = "text-align:center">
								<label for="cars">결과</label>
								<input type = "text" class="form-control"placeholder="결과" id = "co_resultId" name="co_result" maxlength="10">
							</th>
							<th style = "text-align:center">
								<label for="cars">출석률</label>
								<input type = "text" class="form-control"placeholder="출석률" id = "co_attendId" name="co_attend" maxlength="20" oninput= Attendance1(),Attendance3(),Attendance5()>
							</th>
							<th style = "text-align:center">
								<label for="cars">수료</label>
								<input type = "text" class="form-control"placeholder="수료" id = "co_compleId" name="co_comple" maxlength="20" oninput= Attendance3(); readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">취업</label>
								<select name ="co_employ" id = "item1Id" oninput= Attendance1(),Attendance3(),Attendance5()>
									<option value = ""> </option>
									<option value = "O">O</option>
									<option value = "X">X</option>
									<option value = "예정">예정</option>
									<option value = "가능">가능</option>
								</select>
							</th>
							<th style = "text-align:center">
								<label for="cars">동일</label>
								<select name ="co_same" id = "item2Id">
									<option value = ""> </option>
									<option value = "O">O</option>
									<option value = "X">X</option>
									<option value = "예정">예정</option>
								</select>
							
							</th>
							<th style = "text-align:center">
								<label for="cars">고용보험</label>
								<select name ="co_insurance" id= "item3Id" onchange= Attendance2(),Attendance5();>
									<option value = ""> </option>
									<option value = "O">O</option>
									<option value = "X">X</option>
									<option value = "창업">창업</option>
									<option value = "예정">예정</option>
								</select>
							</th>
							<th style = "text-align:center">
								<label for="cars">취업가중치</label>
								<input type = "text" class="form-control" id = "co_option1Id" name="co_option1" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">직종가종치</label>
								<input type = "text" class="form-control" id = "co_option2Id" name="co_option2" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">취업가중치</label>
								<input type = "text" class="form-control" id = "co_option3Id" name="co_option3" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">직종가중치</label>
								<input type = "text" class="form-control" id = "co_option4Id" name="co_option4" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">취업가중치</label>
								<input type = "text" class="form-control" value ="1" id = "co_option5Id" name="co_option5" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">직종가중치</label>
								<input type = "text" class="form-control" value ="1" id = "co_option6Id" name="co_option6" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">평가기준</label>
								<input type = "text" class="form-control"placeholder="평가기준" name= "co_asse" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
								<label for="cars">직종기준</label>
								<input type = "text" class="form-control"placeholder="직종기준" name= "co_porf" maxlength="20" readonly>
							</th>
							<th style = "text-align:center">
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
<!-- 수강인원 업체 현황  -->				
					
				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="18" style="backgroud-color:#eeeeee; text-align:center;">수강인원 등록</th>			<!-- colspan에는 밑에 input 수 만큼(셀 합병) -->			
						</tr>
					</thead>
					</tbody>
						<tr>
							<th style = "text-align:center">
								<label for="cars">입사일</label>
								<input type = "date" class="form-control"placeholder="입사일" name="c_start" maxlength="10" value = "1900-01-01" min="0000-00-00" max="3000-12-31">
							</th>
							<th style = "text-align:center">
								<label for="cars">고용유지</label>
								<input type = "date" class="form-control"placeholder="고용유지" name="c_maintain" maxlength="20" value = "1900-01-01" min="0000-00-00" max="3000-12-31">
							</th>
							<th style = "text-align:center">
								<label for="cars">퇴사여부</label>
								<input type = "text" class="form-control"placeholder="퇴사여부" name="c_end" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">업체명</label>
								<input type = "text" class="form-control"placeholder="업체명" name="c_name" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">주소</label>
								<input type = "text" class="form-control"placeholder="주소" name="c_address" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">전화번호</label>
								<input type = "text" class="form-control"placeholder="전화번호" name="c_number" maxlength="20">
							</th>
							<th style = "text-align:center">
								<label for="cars">취업전담제</label>
								<select id="cars" name="c_manager"> <!-- 값 수정 다해야함 -->
									<option value=""></option>
									<option value="팀장">팀장</option>
									<option value="교수">교수</option> 
									<option value="과장">과장</option>
									<option value="정T">정T</option>
								</select>
							</th>
							<th style = "text-align:center">
								<label for="cars">산정제외</label>
								<input type = "text" class="form-control"placeholder="산정제외" name="c_except" maxlength="20">
							</th>
						</tr>
					</tbody>					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="등록"/> <!-- 수강인원추가버튼부분 -->								
			</form>			
		</div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     
<script>


	function addage(){
		
		
		birth = document.getElementById("birthId").value;
		var now = new Date();
		var age = birth.substring(0,4);
		var year = now.getFullYear();
		
		insert.m_age1.value = (year-age)+1;
	}
	
	function Attendance1(){
		birth = document.getElementById("birthId").value;
		att = document.getElementById("co_attendId").value;
		item1 = document.getElementById("item1Id").value;

		
		if(birth != ""){
			if(att == "" && item1 == ""){
				insert.co_resultId.value = "훈련중";
			} else if(att < 80 && item1 == "" ){
				insert.co_resultId.value = "중도탈락";
			} else if(att < 70 && item1 == "O"){
				insert.co_resultId.value = "조기취업";
			} else if(att >= 80 && item1 == "O"){
				insert.co_resultId.value = "수료취업";
			} else if(att >= 70 && att < 80 && item1 == "O"){
				insert.co_resultId.value = "이수취업";
			} else if(att >=80 && item1 == ""){
				insert.co_resultId.value = "수료미취업";
			}
		};
		
		result = document.getElementById("co_resultId").value;
		
		if(att >= 80){
			insert.co_comple.value = "O";
		} else if(result == "중도탈락"){
			insert.co_comple.value = "1";
		} else if(att >= 70 && att <= 79){
			insert.co_comple.value = "이수";
		} else {
			insert.co_comple.value = "";
		}
		
	}
	function Attendance2(){
		item3 = document.getElementById("item3Id").value;
		
		if(item3 == ""){
			insert.co_option1.value = "";
			insert.co_option2.value = "";
		} else if (item3 == "O" || item3 == "창업" || item3 == "예정"){
			insert.co_option1.value = 1;
			insert.co_option2.value = 1;
		} else if (item3 == "X"){
			insert.co_option1.value = 0.5;
			insert.co_option2.value = 1;
		} else {
			insert.co_option1.value = 0;
			insert.co_option2.value = 0;
		}
	}
	
	function Attendance3(){
		completion = document.getElementById("co_compleId").value;
		item1 = document.getElementById("item1Id").value;
		
		if(item1 == ""){
			insert.co_option3.value = "";
			insert.co_option4.value = "";
		} else if(completion == "O" || completion == "이수"){
			insert.co_option3.value = 1;
			insert.co_option4.value = 1;
		} else {
			insert.co_option3.value = 0;
			insert.co_option4.value = 0;
		}
	}
	
	function Attendance4(){
		type2 = document.getElementById("m_option2Id").value;
		
		if(type2 == "취성패1"){
			insert.co_option5.value = 1.5;
			insert.co_option6.value = 1.5;
		} else if (type2 == "40세이상"){
			insert.co_option5.value = 1.3;
			insert.co_option6.value = 1.5;
		} else {
			insert.co_option5.value = 1;
			insert.co_option6.value = 1;
		}
	}
	
	function Attendance5(){
		item1 = document.getElementById("item1Id").value;
		co_option1 = document.getElementById("co_option1Id").value;
		co_option3 = document.getElementById("co_option3Id").value;
		co_option4 = document.getElementById("co_option4Id").value;
		co_option5 = document.getElementById("co_option5Id").value;
		co_option6 = document.getElementById("co_option6Id").value;
		
		var a1 = co_option1*co_option3*co_option5;
		var a2 = co_option1*co_option4*co_option6;
		
		if(item1 == "O"){
			insert.co_asse.value = a1;
			insert.co_porf.value = a2;
		} else {
			insert.co_asse.value = "";
			insert.co_porf.value = "";
		}
		
	}
	
</script>
     
     
</body>
</html>