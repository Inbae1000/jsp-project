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
<title>팀별실적</title>
<%@ include file = "menu2.jsp" %>
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
	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" >
	<form method = "post" name = "insert" action = "team.so" >		
		<div>
			<select id = "endId" onchange=endYear();Inputbtn();>
			<option hidden selected><%=endsp %></option>
			<%
				for(String i : linkedHashSet){
			%>
				<option value =<%=i %> ><%=i %></option>
			<%
				}
			%>
			</select>
			년도 국가기간산업전략직종 훈련실적현황(종료과정)
		</div>
		<input type = "hidden" class="form-control" name ="s_end" >
	</form>
	
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>팀별</th>
					<th>모집정원</th>
					<th>모집인원</th>
					<th>수료인원</th>
					<th>중탈인원</th>
					<th>일반취업</th>
					<th>최종수료</th>
					<th>가중치취업</th>
				</tr>
				
				<%
					List<SubjectDTO> list = subjectDao.subjectList3(endsp);
					
					a = 0;		//모집정원
					b2 = 0;		//모집인원 계산값
					re4 = 0;	//일반취업
					re7 = 0;	//최종수료
					doubleAsse2 = 0;	//가중치 취업
					doubleAsse2_1 = 0; 	//1팀 가중치 취업
					doubleAsse4 = 0;	//1팀 가중치 취업 합계
					a2 = 0;		//1팀 모집정원
					b3 = 0;		//1팀 모집인원
					co2 = 0;	//1팀 수료인원
					re1_1 = 0;	//1팀 중도탈락 
					re4_1 = 0;	//1팀 일반취업
					re7_1 = 0;	//1팀 최종수료
					co = 0;		//수료인원
					re1 = 0;	//중도탈락
					re2 = 0;	//이수취업
					re3 = 0;	//수료취업
					re5 = 0;	//중도탈락 계산
					re6 = 0;	//산정제외
					re8 = 0;	//산정제외 -> 수료전
					re9 = 0;	//산정제외 -> 수료전
					for(SubjectDTO sb : list){
						int member = Integer.parseInt(sb.getS_member());
						a = a+member;
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberJoin> list2 = memberDao.selectList(sb.getS_id());
						
						String asse = memberDao.selectAsse(sb.getS_id()).getAsse();
						if(asse == null){	//이거 없으면 값 없을때 null로 보임
							asse = "0";
						}
						if(asse != null){	// 이거 없으면 값 없을때 오류남
							doubleAsse = Double.parseDouble(asse);
							doubleAsse3 = Math.round(doubleAsse);
						}
						doubleAsse2 = doubleAsse2+doubleAsse;
						doubleAsse4 = doubleAsse4+doubleAsse3;		//
						
						b = 0;


						
						for(MemberJoin mj : list2){
							b = b+1;
							if(mj.getCo_comple().equals("O")){
								co = co+1;	//수료인원
							}
							if(mj.getCo_result().equals("중도탈락")){
								re1 = re1+1;	//중도탈락
							}
							if(mj.getCo_result().equals("이수취업")){
								re2 = re2+1;	//이수취업
							}
							if(mj.getCo_result().equals("수료취업")){
								re3 = re3+1;	//수료취업
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("실업자일반")){
								re5 = re5+1;
							}
							if(/* mj.getC_except().equals("산정제외") && */ mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("근로자개인")){
								re6 = re6+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("실업자일반")){
								re8 = re8+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("근로자개인")){
								re9 = re9+1;
							}
							
						}
						b2 = b2+b;				//모집인원 계산값
						re4=re2+re3;			//이수취업+수료취업(일반취업)
						re7 = co+re2-re5-re6;	//최종수료
						
					}
					a2 = a2+a;			//1팀 모집정원
					b3 = b3+b2;			//1팀 모집인원
					co2 = co2+co;		//1팀 수료인원
					re5 = re8+re9;		//중탈인원
					re1 = re1-re5;		//중도탈락
					re1_1 = re1_1+re1;	//1팀 중도탈락
					re4_1 = re4_1+re4;	//1팀 일반취업
					re7_1 = re7_1+re7;	//1팀 최종수료
					doubleAsse2_1 = doubleAsse2_1 + doubleAsse2;	//1팀 가중치 취업
				%>
				<tr>
					<th>교무1팀</th>
					<th><%=a %></th>
					<th><%=b2 %></th>
					<th><%=co %></th>
					<th><%=re1 %></th>
					<th><%=re4 %></th>
					<th><%=re7 %></th>
					<th><%=(int)doubleAsse4 %></th>
				</tr>
				
			<%
					List<SubjectDTO> list3 = subjectDao.subjectList4(endsp);
					
					a = 0;		//모집정원
					b2 = 0;		//모집인원 계산값
					re4 = 0;	//일반취업
					re7 = 0;	//최종수료
					doubleAsse2 = 0;	//가중치 취업
					doubleAsse2_2 = 0; 	//2팀 가중치 취업
					doubleAsse4 = 0;	//1팀 가중치 취업 합계
					a3 = 0;		//2팀 모집정원
					b4 = 0;		//2팀 모집인원
					co3 = 0;	//2팀 수료인원
					re1_2 = 0;	//2팀 중도탈락
					re4_2 = 0;	//2팀 일반취업
					re7_2 = 0;	//2팀 최종수료
					co = 0;		//수료인원
					re1 = 0;	//중도탈락
					re2 = 0;	//이수취업
					re3 = 0;	//수료취업
					re5 = 0;	//중도탈락 계산
					re6 = 0;	//산정제외
					re8 = 0;	//산정제외 -> 수료전
					re9 = 0;	//산정제외 -> 수료전
					for(SubjectDTO sb : list3){
						int member = Integer.parseInt(sb.getS_member());
						a = a+member;
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberJoin> list4 = memberDao.selectList(sb.getS_id());
						
						String asse = memberDao.selectAsse(sb.getS_id()).getAsse();
						if(asse == null){	//이거 없으면 값 없을때 null로 보임
							asse = "0";
						}
						if(asse != null){	// 이거 없으면 값 없을때 오류남
							doubleAsse = Double.parseDouble(asse);
							doubleAsse3 = Math.round(doubleAsse);
						}
						doubleAsse2 = doubleAsse2+doubleAsse;
						doubleAsse4 = doubleAsse4+doubleAsse3;
						
						b=0;		//모집인원

						for(MemberJoin mj : list4){
							b = b+1;
							if(mj.getCo_comple().equals("O")){
								co = co+1;	//수료인원
							}
							if(mj.getCo_result().equals("중도탈락")){
								re1 = re1+1;	//중도탈락
							}
							if(mj.getCo_result().equals("이수취업")){
								re2 = re2+1;	//이수취업
							}
							if(mj.getCo_result().equals("수료취업")){
								re3 = re3+1;	//수료취업
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("실업자일반")){
								re5 = re5+1;
							}
							if(/* mj.getC_except().equals("산정제외") && */ mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("근로자개인")){
								re6 = re6+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("실업자일반")){
								re8 = re8+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("근로자개인")){
								re9 = re9+1;
							}
							
						}
						b2 = b2+b;				//모집인원 계산값
						re4= re2+re3;			//이수취업+수료취업(일반취업)
						re7 = co+re2-re5-re6;	//최종수료
						
					}
					a3 = a3+a;			//2팀 모집정원
					b4 = b4+b2;			//2팀 모집인원
					co3 = co3+co;		//2팀 수료인원
					re5 = re8+re9;		//중탈인원
					re1 = re1-re5;		//중도탈락
					re1_2 = re1_2+re1;	//2팀 중도탈락
					re4_2 = re4_2+re4;	//2팀 일반취업
					re7_2 = re7_2+re7;	//2팀 최종수료
					doubleAsse2_2 = doubleAsse2_2+doubleAsse2;	//2팀 가중치 취업
				%>
				
				<tr>
					<th>교무2팀</th>
					<th><%=a %></th>
					<th><%=b2 %></th>
					<th><%=co %></th>
					<th><%=re1 %></th>
					<th><%=re4 %></th>
					<th><%=re7 %></th>
					<th><%=(int)doubleAsse4 %></th>
				</tr>
				<%
					List<SubjectDTO> list5 = subjectDao.subjectList5(endsp);
					
					a = 0;		//모집정원
					b2 = 0;		//모집인원 계산값
					re4 = 0;	//일반취업
					re7 = 0;	//최종수료
					a4 = 0;		//3팀 모집정원
					doubleAsse2 = 0;	//가중치 취업
					doubleAsse2_3 = 0; //3팀 가중치 취업
					doubleAsse4 = 0;	//1팀 가중치 취업 합계
					b5 = 0;		//3팀 모집인원
					co4 = 0;	//3팀 수료인원
					re1_3 = 0;	//3팀 중도탈락
					re4_3 = 0;	//3팀 일반취업
					re7_3 = 0;	//3팀 최종수료
					co = 0;		// 수료인원
					re1 = 0;	//중도탈락
					re2 = 0;	//이수취업
					re3 = 0;	//수료취업
					re5 = 0;	//중도탈락 계산
					re6 = 0;	//산정제외
					re8 = 0;	//산정제외 -> 수료전
					re9 = 0;	//산정제외 -> 수료전
					for(SubjectDTO sb : list5){
						int member = Integer.parseInt(sb.getS_member());
						a = a+member;
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberJoin> list6 = memberDao.selectList(sb.getS_id());
						
						String asse = memberDao.selectAsse(sb.getS_id()).getAsse();
						if(asse == null){	//이거 없으면 값 없을때 null로 보임
							asse = "0";
						}
						if(asse != null){	// 이거 없으면 값 없을때 오류남
							doubleAsse = Double.parseDouble(asse);
							doubleAsse3 = Math.round(doubleAsse);
						}
						doubleAsse2 = doubleAsse2+doubleAsse;
						doubleAsse4 = doubleAsse4+doubleAsse3;
						
						
						b=0;
	
						
						for(MemberJoin mj : list6){
							b = b+1;
							if(mj.getCo_comple().equals("O")){
								co = co+1;	//수료인원
							}
							if(mj.getCo_result().equals("중도탈락")){
								re1 = re1+1;	//중도탈락
							}
							if(mj.getCo_result().equals("이수취업")){
								re2 = re2+1;	//이수취업
							}
							if(mj.getCo_result().equals("수료취업")){
								re3 = re3+1;	//수료취업
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("실업자일반")){
								re5 = re5+1;
							}
							if(/* mj.getC_except().equals("산정제외") && */ mj.getCo_comple().equals("O") && 
									mj.getM_option1().equals("근로자개인")){
								re6 = re6+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("실업자일반")){
								re8 = re8+1;
							}
							if(mj.getC_except().equals("산정제외") && mj.getCo_comple().equals("") && 
									mj.getM_option1().equals("근로자개인")){
								re9 = re9+1;
							}
							
						}
						b2 = b2+b;				//모집인원 계산값
						re4= re2+re3;			//이수취업+수료취업(일반취업)
						re7 = co+re2-re5-re6;	//최종수료
						
						
					}
					a4 = a4+a;				//3팀 모집정원
					a5 = a2+a3+a4;			//total 모집정원
					b5 = b5+b2;				//3팀 모집인원
					b6 = b3+b4+b5;			//total 모집인원
					co4 = co4+co;			//3팀 수료인원
					co5 = co2+co3+co4;		//total 수료인원
					re5 = re8+re9;			//중탈인원
					re1 = re1-re5;			//중도탈락
					re1_3 = re1_3+re1;		//3팀 중도탈락
					re1_4 = re1_1+re1_2+re1_3;	//total 중도탈락
					re4_3 = re4_3+re4;		//3팀 일반취업
					re4_4 = re4_1+re4_2+re4_3;	//total 일반취업
					re7_3 = re7_3+re7;		//3팀 최종수료
					re7_4 = re7_1+re7_2+re7_3;	//total 최종수료
					doubleAsse2_3 = doubleAsse2_3+doubleAsse2;	//3팀 가중치 취업
					doubleAsse2_4 = doubleAsse2_1+doubleAsse2_2+doubleAsse2_3;	//total 가중치 취업
				%>
				<tr>
					<th>교무3팀</th>
					<th><%=a %></th>
					<th><%=b2 %></th>
					<th><%=co %></th>
					<th><%=re1 %></th>
					<th><%=re4 %></th>
					<th><%=re7 %></th>
					<th><%=(int)doubleAsse4 %></th>
				</tr>
				
				<tr>
					<th>전체현황</th>
					<th><%=a5 %></th>
					<th><%=b6 %></th>
					<th><%=co5 %></th>
					<th><%=re1_4 %></th>
					<th><%=re4_4 %></th>
					<th><%=re7_4 %></th>
					<th><%=Math.round(doubleAsse2_4) %></th>
				</tr>
			</thead>
		</table>
	</div>
	
<!-- 2번쨰 테이블  -->

	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th>팀별</th>
						<th>정원비중</th>
						<th>모집률</th>
						<th>수료율</th>
						<th>중탈률</th>
						<th>일반취업률</th>
						<th>수료자비중</th>
						<th>가중치취업률</th>
					</tr>
					<%
					DecimalFormat format = new DecimalFormat("0.0");
					double f1 = ((double)a2/a5)*100;	//1팀 정원비중
					double f2 = ((double)a3/a5)*100;	//2팀 정원비중
					double f3 = ((double)a4/a5)*100;	//3팀 정원비중
					double f4 = (f1+f2+f3);				//total 정원비중
					double g1 = ((double)b3/(double)a2)*100;	//1팀 모집률
					double g2 = ((double)b4/(double)a3)*100;	//2팀 모집률
					double g3 = ((double)b5/(double)a4)*100;	//3팀 모집률
					double g4 = ((double)b6/(double)a5)*100;	//total 모집률
					double h1 = ((double)co2/(double)b3)*100;	//1팀 수료율
					double h2 = ((double)co3/(double)b4)*100;	//2팀 수료율
					double h3 = ((double)co4/(double)b5)*100;	//3팀 수료율
					double h4 = ((double)co5/(double)b6)*100;	//total 수료율
					double i1 = ((double)re1_1/(double)b3)*100;	//1팀 중탈률
					double i2 = ((double)re1_2/(double)b4)*100;	//2팀 중탈률
					double i3 = ((double)re1_3/(double)b5)*100;	//3팀 중탈률
					double i4 = ((double)re1_4/(double)b6)*100;	//totla 중탈률
					double j1 = ((double)re4_1/(double)re7_1)*100;	//1팀 일반취업률
					double j2 = ((double)re4_2/(double)re7_2)*100;	//2팀 일반취업률
					double j3 = ((double)re4_3/(double)re7_3)*100;	//3팀 일반취업률
					double j4 = ((double)re4_4/(double)re7_4)*100;	//total 일반취업률
					double k1 = ((double)re7_1/(double)re7_4)*100;	//1팀 수료자비중
					double k2 = ((double)re7_2/(double)re7_4)*100;	//2팀 수료자비중
					double k3 = ((double)re7_3/(double)re7_4)*100;	//3팀 수료자비중
					double k4 = (k1+k2+k3);							//total 수료자비중
					double l1 = (doubleAsse2_1/(double)re7_1)*100;	//1팀 가중치취업
					double l2 = (doubleAsse2_2/(double)re7_2)*100;	//2팀 가중치취업
					double l3 = (doubleAsse2_3/(double)re7_3)*100;	//3팀 가중치취업
					double l4 = (doubleAsse2_4/(double)re7_4)*100;	//total 가중치취업
					
					
					%>
					<tr>
						<th>교무1팀</th>
						<th><%=format.format(f1)%>%</th>
						<th><%=format.format(g1)%>%</th>
						<th><%=format.format(h1)%>%</th>
						<th><%=format.format(i1)%>%</th>
						<th><%=format.format(j1)%>%</th>
						<th><%=format.format(k1)%>%</th>
						<th><%=format.format(l1)%>%</th>
					</tr>
					
					<tr>
						<th>교무2팀</th>
						<th><%=format.format(f2)%>%</th>
						<th><%=format.format(g2)%>%</th>
						<th><%=format.format(h2)%>%</th>
						<th><%=format.format(i2)%>%</th>
						<th><%=format.format(j2)%>%</th>
						<th><%=format.format(k2)%>%</th>
						<th><%=format.format(l2)%>%</th>
					</tr>
					
					<tr>
						<th>교무3팀</th>
						<th><%=format.format(f3)%>%</th>
						<th><%=format.format(g3)%>%</th>
						<th><%=format.format(h3)%>%</th>
						<th><%=format.format(i3)%>%</th>
						<th><%=format.format(j3)%>%</th>
						<th><%=format.format(k3)%>%</th>
						<th><%=format.format(l3)%>%</th>
					</tr>
					
					<tr>
						<th>전체현황</th>
						<th><%=format.format(f4)%>%</th>
						<th><%=format.format(g4)%>%</th>
						<th><%=format.format(h4)%>%</th>
						<th><%=format.format(i4)%>%</th>
						<th><%=format.format(j4)%>%</th>
						<th><%=format.format(k4)%>%</th>
						<th><%=format.format(l4)%>%</th>
					</tr>
				</thead>
			</table>
		</div>
		
		
		
<!-- 3번째 테이블  -->

	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" name="insert" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th rowspan = "2" style=" text-align: center;">구분</th>
						<th rowspan = "2" colspan = "2" style="text-align: center;">직종</th>
						<th rowspan = "2" style="text-align: center;">2022년 적용<br>전국평균 취업률</th>
						<th colspan = "5">2021년 종료과정 中 관리기간 종료과정 (25개/51개 과정)</th>
						
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
						<th><%=a1[i] %></th>
						<th><%=ra %></th>
						<th><%=rb %>%</th>										
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
			</table>
		</div>
	<script>
	function endYear(){
		endSelect = document.getElementById("endId").value;
		
		insert.s_end.value = endSelect;
	}
	function Inputbtn(){
		document.insert.submit();
	}
	</script>
</body>
</html>