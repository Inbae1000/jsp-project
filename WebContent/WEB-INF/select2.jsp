<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ page import = "java.sql.*" %>
<%@ page import = "member.*" %>
<%@ page import = "java.util.List" %>
<meta charset="UTF-8">
<title>Database SQL</title>
<link rel = "stylesheet" href = ./tablestyle.css>
</head>
<body>

	<table id ="member">
		<thead>
			<tr>
				<th>NO</th>
				<th>성명</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>나이</th>
				<th>만나이</th>
				<th>성별</th>
				<th>유형</th>
				<th>구분</th>
				<th>구분2</th>
				<th>비고</th>
				
				<th>NO</th>
				<th>결과</th>
				<th>출석률</th>
				<th>수료</th>
				<th>취업</th>
				<th>동일</th>
				<th>고용보험</th>
				<th>취업률가중치</th>
				<th>직종가중치</th>
				<th>취업률가중치</th>
				<th>직종가중치</th>
				<th>취업률가중치</th>
				<th>직종가중치</th>
				<th>평가기준률</th>
				<th>직종기준률</th>
				<th>자격증</th>
				
				<th>NO</th>
				<th>입사일</th>
				<th>고용유지기간</th>
				<th>퇴사여부</th>
				<th>업체명</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>취업전담제</th>
				<th>산정제외</th>

			</tr>
		</thead>

		<tbody>
			<tr>
				<td>${selectOne.m_id}</td>
				<td>${selectOne.m_name}</td>
				<td>${selectOne.m_birth}</td>
				<td>${selectOne.m_number}</td>
				<td>${selectOne.m_area}</td>
				<td>${selectOne.m_age1}</td>
				<td>${selectOne.m_age2}</td>
				<td>${selectOne.m_sex}</td>
				<td>${selectOne.m_option1}</td>
				<td>${selectOne.m_option2}</td>
				<td>${selectOne.m_option3}</td>
				<td>${selectOne.m_note}</td>
				
				<td>${coSelectOne.m_id}</td>
				<td>${coSelectOne.co_result}</td>
				<td>${coSelectOne.co_comple}</td>
				<td>${coSelectOne.co_employ}</td>
				<td>${coSelectOne.co_same}</td>
				<td>${coSelectOne.co_insurance}</td>
				<td>${coSelectOne.co_option1}</td>
				<td>${coSelectOne.co_option2}</td>
				<td>${coSelectOne.co_option3}</td>
				<td>${coSelectOne.co_option4}</td>
				<td>${coSelectOne.co_option5}</td>
				<td>${coSelectOne.co_option6}</td>
				<td>${coSelectOne.co_asse}</td>
				<td>${coSelectOne.co_porf}</td>
				<td>${coSelectOne.co_certificate}</td>
				
				<td>${cSelectOne.m_id}</td>
				<td>${cSelectOne.c_start}</td>
				<td>${cSelectOne.c_maintain}</td>
				<td>${cSelectOne.c_end}</td>
				<td>${cSelectOne.c_number}</td>
				<td>${cSelectOne.c_name}</td>
				<td>${cSelectOne.c_address}</td>
				<td>${cSelectOne.c_number}</td>
				<td>${cSelectOne.c_except}</td>
				


		
			</tr>
		</tbody>
	
	
	


	</table>
</body>
</html>