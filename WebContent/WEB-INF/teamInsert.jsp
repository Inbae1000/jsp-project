<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="java.io.PrintWriter" %>
<%@page import="subject.*" %>
<%@page import="member.*" %>
<%@page import="company.*" %>
<%@page import="consequence.*" %>
<%@page import="java.util.*" %>
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>팀별실적 정보입력</title>
<%@ include file = "menu2.jsp" %>
<style>

	th {border-right : 1px solid #dddddd;
		text-align:center;
	 }
	td {border-right : 1px solid #dddddd;
		text-align:center;
	}

</style>

</head>
<body>

<%!
	int a = 0;		//모집정원
	int a2 = 0;		//1팀 모집정원
	int a3 = 0;		//2팀 모집정원
	int a4 = 0;		//3팀 모집정원
	int a5 = 0;		//total 모집정원
	int b = 0;		//모집인원
	int b2 = 0;		//모집인원 계산값
	int b3 = 0;		//1팀 모집인원
	int b4 = 0;		//2팀 모집인원
	int b5 = 0;		//3팀 모집인원
	int b6 = 0;		//total 모집인원
	int co = 0;		//수료인원
	int co2 = 0;	//1팀 수료인원
	int co3 = 0;	//2팀 수료인원
	int co4 = 0;	//3팀 수료인원
	int co5 = 0;	//total 수료인원
	int re1 = 0;	//중도탈락
	int re1_1 = 0;	//1팀 중도탈락
	int re1_2 = 0;	//2팀 중도탈락
	int re1_3 = 0;	//3팀 중도탈락
	int re1_4 = 0;	//total 중도탈락
	int re2 = 0;	//이수취업
	int re3 = 0;	//수료취업
	int re4 = 0;	//이수취업+수료취업 (일반취업)
	int re4_1 = 0;	//1팀 일반취업
	int re4_2 = 0;	//2팀 일반취업
	int re4_3 = 0;	//3팀 일반취업
	int re4_4 = 0;	//total 일반취업
	int re5 = 0;	//중탈인원
	int re6 = 0;	//산정제외
	int re7 = 0;	//최종수료
	int re7_1 = 0;	//1팀 최종수료
	int re7_2 = 0;	//2팀 최종수료
	int re7_3 = 0;	//3팀 최종수료
	int re7_4 = 0;	//total 최종수료
	int re8	= 0;	//산정제외 ->수료전
	int re9	= 0;	//산정제외 ->수료전
	double doubleAsse = 0;	//sum(asse) 가중치 취업
	double doubleAsse2 = 0;	//sum(asse) 가중치 취업
	double doubleAsse3 = 0;	//가중치 취업
	double doubleAsse4 = 0;	//가중치 취업
	double doubleAsse2_1 = 0; //1팀 가중치 취업
	double doubleAsse2_2 = 0; //2팀 가중치 취업
	double doubleAsse2_3 = 0; //3팀 가중치 취업
	double doubleAsse2_4 = 0; //total 가중치 취업


%>

<%
	DecimalFormat format = new DecimalFormat("0.0");
	LocalDate now = LocalDate.now();
	SubjectDAO subjectDao = SubjectDAO.getInstance();
	List<SubjectDTO> end = subjectDao.endDate();
	
	int year = now.getYear();
	List<String> aList = new ArrayList<String>();
	LinkedHashSet<String> linkedHashSet = new LinkedHashSet<>();
	for(SubjectDTO en : end){
		String end_1 = en.getS_end();
		end_1 =end_1.substring(0, 4);
		aList.add(end_1);
	}
	for(String aaList : aList){
		linkedHashSet.add(aaList);
	}

	String endsp = request.getParameter("s_end");
	if(endsp == null){
		endsp = Integer.toString(year);
	}
%>

<!-- 첫번째 테이블  -->
	<div style ="font-size: 11px; margin-top: 60px; width:1000px;" >

	

	<div style ="font-size: 11px; margin-top: 50px; width:1000px;">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<form method="post" name = "emp" action = "teamAction.so">
				<thead>
					<tr>
						<th rowspan = "2" style=" text-align: center;">구분</th>
						<th rowspan = "2" colspan = "2" style="text-align: center;">직종</th>
						<th rowspan = "2" style="text-align: center;"><input type ="text" name = "year" placeholder="숫자만 입력 ex)2022">년 적용<br>전국평균 취업률</th>
						<th colspan = "5"><%=endsp %>년 종료과정 中 관리기간 종료과정 (25개/51개 과정)</th>
						
					</tr>
					
					<tr>						
						<th>종료과정수/미종료과정수</th>
						<th>수료인원</th>
						<th>취업인원</th>
						<th>취업률</th>
						<th>평균대비</th>
					</tr>
					
						<%	
							String ra = "";				//직종이름	
							String a = "전기공사";			//직종 190107
							String b = "용접";			//직종 160105
							String c = "조경";			//직종 140501
							String d = "디자인";			//직종 080201
							String e = "기계설계";         //직종 150102
							String f = "냉동공조";         //직종150502
							String g = "음식조리";         //직종 130101
							String h = "구매조달";         //직종 020401
							String iii = "정보기술개발";   //직종 200102
							String j ="공예";            //직종 220201
							String k = "패션제품기획";      //직종 180201
							
							double rb = 0;            //전국 취업률
							double a_a =71.9;         //취업률 190107    전기공사
							double a_b =75.3;         //취업률 160105   용접
							double a_c =61.2;         //취업률 140501   조경
							double a_d =67.4;         //취업률 080201   디자인
							double a_e = 75.8;         //취업률 150102   기계설계
							double a_f = 72.8;         //취업률 150502   냉동공조
							double a_g = 50.7;         //취업률 130101   음식조리
							double a_h = 69.4;         //취업률 020401   구매조달
							double a_i = 72.8;         //취업률 200102   정보기술개발
							double a_j = 71.6;         //취업률 220201   공예
							double a_k = 62.4;         //취업률 180201   패션제품기획
							double re12 = 0;							
							int re10=0;						
							int re11=0;					//수료인원
							int re88=0;					//취업인원
							String re88_di_re11 = null;	//취업률
							double re99 = 0;			//평균대비
							
							String name = null;
							String code = null;
							
							
							Date date = new Date();
							int re17 = 0;
							int re18 = 0;
							
						
							
							String [] a1 = {"150102","150502","160105","190107","140501","130101","020401","080201","200102","220201","180201"};
							for(int i = 0; i<a1.length; i++){
								ra = "";
								rb = 0;
								name = null;
								code = null;
								MemberDAO memberDao = MemberDAO.getInstance();
								List<SubjectDTO> list7 = subjectDao.subjectList7(a1[i]);
								
								if(a1[i] == a1[0]){
									name = "1팀";
									ra = ra + e;
									rb = rb + a_e;
								}
								if(a1[i] == a1[1]){
									name = "1팀";
									ra = ra + f;
									rb = rb + a_f;
								}
								if(a1[i] == a1[2]){
									name = "1팀";
									ra = ra + b;
									rb = rb + a_b;
								}
								if(a1[i] == a1[3]){
									name = "1팀";
									ra = ra + a;
									rb = rb + a_a;
								}
								if(a1[i] == a1[4]){
									name = "2팀";
									ra = ra + c;
									rb = rb + a_c;
								}
								if(a1[i] == a1[5]){
									name = "2팀";
									ra = ra + g;
									rb = rb + a_g;
								}
								if(a1[i] == a1[6]){
									name = "2팀";
									ra = ra + h;
									rb = rb + a_h;
								}
								if(a1[i] == a1[7]){
									name = "2팀/3팀";
									ra = ra + d;
									rb = rb + a_d;
								}
								if(a1[i] == a1[8]){
									name = "3팀";
									ra = ra + iii;
									rb = rb + a_i;
								}
								if(a1[i] == a1[9]){
									name = "3팀";
									ra = ra + j;
									rb = rb + a_j;
								}
								if(a1[i] == a1[10]){
									name = "3팀";
									ra = ra + k;
									rb = rb + a_k;
								}
								
								
								
								
								
									
									re12 =0;
									re3 =0;
									re4 =0;
									re9=0;
									re10=0;
									co=0;
									re11 =0;
									re88 = 0;
									re17 = 0;
									re18 = 0;
									List<SubjectDTO> list2 = subjectDao.subjectTeamSelect(a1[i],endsp);
									for(SubjectDTO aaa : list2){							
										List<MemberJoin> list11 = memberDao.selectList(aaa.getS_id());
										
										SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy-MM-dd");
										String pss = aaa.getS_manage();
										Date date2 = simpleDate2.parse(pss);
										long dm = (long)date.getTime();  //현재시간
										long dm2 = (long)date2.getTime(); // 관리종료
										long dm3 = (dm2-dm)/(1000*60*60*24)+1; // 계산

										
										if(dm3 < 0){
											re17 = re17 + 1;
										}
										if(dm3 >= 0){
											re18 = re18 + 1;
										}
										
										for (MemberJoin bbb : list11){
											if(bbb.getCo_comple().equals("O")){
												co = co+1;	//수료인원
											}
											if(bbb.getCo_result().equals("이수취업")){
												re3 = re3+1;
											}
											if(bbb.getC_except().equals("산정제외") && bbb.getCo_comple().equals("O") && 
													bbb.getM_option1().equals("실업자일반")){
												re9 = re9+1;
											}
											if(/* bbb.getC_except().equals("산정제외") && */ bbb.getCo_comple().equals("O") && 
													bbb.getM_option1().equals("근로자개인")){
												re10 = re10+1;
											}
											if(bbb.getCo_result().equals("수료취업")){
												re4 = re4+1;
											}
										
									}
								}
								re11 = (int)co+re3-re9-re10;
								re88 = re4+re3;
								re88_di_re11 = format.format(((double)re88/(double)re11)*100);
								double doubleRe88 = Double.parseDouble(re88_di_re11);
								re99 = (doubleRe88-rb);
								
						%>
						
							<tr>
								<th><%=name %></th>					
								<th><%=a1[i] %>
									<input type = "hidden" name = "code" value = <%=a1[i] %>>
								</th>
								<th><%=ra %></th>
								<th><input type ="text" name = "employment_rate" id=emId<%=i %>  placeholder="숫자만 입력 ex)50.7"></th>										
								<th><%=re17 %>/<%=re18 %></th>
								<th><%=re11 %></th>
								<th><%=re88 %></th>
								<th><%=re88_di_re11 %>%</th>
								<th><%=format.format(re99) %>%</th>		
							</tr>

					
						<%						
							}
						%>
				</thead>
				<input type = "button" name = "1"class="btn btn-primary pull-right" value = "등록" onclick = "check()"/>	
			</form>
				
			</table>
			<form method = "post" action = "emDelete.so" >
				<input type ="text" name = "year" placeholder="삭제 년도 ex)2021">
				<input type = "submit" class="btn btn-primary pull-right" value="삭제" onclick = "return confirm('해당 년도 전부 삭제 하시겠습니까?')"/>
			</form>
				

		</div>
	<script>
	function endYear(){
		endSelect = document.getElementById("endId").value;
		
		insert.s_end.value = endSelect;	
	}
	function Inputbtn(){
		document.insert.submit();
	}
	function test(){
		document.emp.submit();
	}
	function check(){  // 유효성 검사
		emId0 = document.getElementById("emId0").value;
		emId1 = document.getElementById("emId1").value;
		emId2 = document.getElementById("emId2").value;
		emId3 = document.getElementById("emId3").value;
		emId4 = document.getElementById("emId4").value;
		emId5 = document.getElementById("emId5").value;
		emId6 = document.getElementById("emId6").value;
		emId7 = document.getElementById("emId7").value;
		emId8 = document.getElementById("emId8").value;
		emId9 = document.getElementById("emId9").value;
		emId10 = document.getElementById("emId10").value;

		var form = document.emp;
		if	(form.year.value == ""){
			alert("년도를 입력해 주세요");
			form.year.focus();
			return false;
		} else if(emId0 == ""){
			alert("출석률을 입력해 주세요")
			form.emId0.focus();
			return false;
		}else if(emId1 == ""){
			alert("출석률을 입력해 주세요")
			form.emId1.focus();
			return false;
		}else if(emId2 == ""){
			alert("출석률을 입력해 주세요")
			form.emId2.focus();
			return false;
		}else if(emId3 == ""){
			alert("출석률을 입력해 주세요")
			form.emId3.focus();
			return false;
		}else if(emId4 == ""){
			alert("출석률을 입력해 주세요")
			form.emId4.focus();
			return false;
		}else if(emId5 == ""){
			alert("출석률을 입력해 주세요")
			form.emId5.focus();
			return false;
		}else if(emId6 == ""){
			alert("출석률을 입력해 주세요")
			form.emId6.focus();
			return false;
		}else if(emId7 == ""){
			alert("출석률을 입력해 주세요")
			form.emId7.focus();
			return false;
		}else if(emId8 == ""){
			alert("출석률을 입력해 주세요")
			form.emId8.focus();
			return false;
		}else if(emId9 == ""){
			alert("출석률을 입력해 주세요")
			form.emId9.focus();
			return false;
		}else if(emId10 == ""){
			alert("출석률을 입력해 주세요")
			form.emId10.focus();
			return false;
		}
		form.submit();
	}

	</script>
</body>
</html>