			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>성적 관리 > 수강생별 > 수강 내역</h3>
			
			<h4 style="text-align: center;font-weight:bold;">${stulist.student_id}/${stulist.student_name}/${stulist.student_phone}</h4>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>수강인원</th>
						<th>과정시작일</th>
						<th>과정종료일</th>
						<th>개설과목수</th>
					</tr>
				</thead>
				<tbody class="tbody">
			<!-- 		<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td>5</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#grade-Modal">
								<span class="badge" id="Count">3</span> 보기
							</button></td>
					</tr> -->
					
					
					<c:if test="${fn:length(courselist) > 0}">
						
						<c:forEach var="a" items="${courselist}">
							<tr>
								<td>${a.open_course_id}</td>
								<td>${a.course_name}</td>
								<td>${a.class_name}</td>
								<td>${a.jungwon}</td>
								<td>${a.studentcount}</td>
								<td>${a.course_start_day}</td>
								<td>${a.course_end_day}</td>
								<td><button type="button" class="btn btn-default btn-sm subviewbtn" value="${a.open_course_id}" ${a.count_==0?"disabled":"" }>
								<span class="badge" id="Count">${a.count_}</span> 보기
							</button></td>
								
							</tr>
					
					</c:forEach>
					
					</c:if>
					
				</tbody>
			</table>						



	<!-- 과목별 점수 확인 Modal -->
	<div class="modal fade" id="grade-Modal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목별 확인</h5>
				</div>
				<div class="modal-body">
				
				<h4 style="text-align: center;font-weight:bold;" class="modalbody1">OCU001 / Framework을 활용한 빅데이터 개발자 과정 / 16-09-01 ~ 17-02-01</h4>
				<h4 style="text-align: center;" class="modalbody2">STU003 / 이순애 / 2312547 / 010-4231-1236</h4>
				
				<hr>
				
				<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과목<br>ID</th>
						<th>과목명</th>
						<th>출결<br>배점</th>
						<th>필기<br>배점</th>
						<th>실기<br>배점</th>
						<th>출결<br>점수</th>
						<th>필기<br>점수</th>
						<th>실기<br>점수</th>
						<th>시험일</th>
						<th>시험과목파일</th>
					</tr>
				</thead>
				<tbody class="tbody2">
<!-- 					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>30</td>
						<td>30</td>
						<td>40</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>17/01/01</td>
						<td>java_simsim_161290.zip</td>
					</tr>	 -->				
				</tbody>
			</table>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	
<script>
$(document).ready(function() {
	
	
	$(document).on("click", ".subviewbtn", function(){
		
		
		var open_course_id = $(this).val();
		var course_name = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var course_start_day = $(this).parent().prev().prev().text();
		var course_end_day = $(this).parent().prev().text();
		var student_id = "${stulist.student_id}";
		var student_name = "${stulist.student_name}";
		var student_phone = "${stulist.student_phone}";
		
		$(".modalbody1").html(open_course_id+"/"+course_name+"/"+course_start_day+"~"+course_end_day);
		$(".modalbody2").html(student_id+"/"+student_name+"/"+student_phone);
		var txt="";
		
		$.ajax({
			url:"adminstugrade",
			data:{"open_course_id":open_course_id, "student_id":student_id},
			success:function(data){				
				var item = JSON.parse(data);				
				console.log(item);				
				if(item.length != 0){
					
					for(var i=0; i<item.length; i++){
						txt +="<tr>";
						txt +="<td>"+item[i].open_sub_id+"</td>";
						txt +="<td>"+item[i].subject_name+"</td>";
						if(item[i].chulsuk_total_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].chulsuk_total_grade+"</td>";
						}
						
						if(item[i].filki_total_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].filki_total_grade+"</td>";
						}
						
						if(item[i].silki_total_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].silki_total_grade+"</td>";
						}
						
									
						if(item[i].chulsuk_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].chulsuk_grade+"</td>";
						}
						
						if(item[i].filki_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].filki_grade+"</td>";
						}
						
						if(item[i].silki_grade == null){
							txt +="<td>X</td>";
						}else{							
							txt +="<td>"+item[i].silki_grade+"</td>";
						}
						
						if(item[i].test_date == null){
							txt +="<td>보지않음</td>";
						}else{							
							txt +="<td>"+item[i].test_date+"</td>";
						}
						
						
						
						if(item[i].test_munje == null){
							txt +="<td>업로드 되지 않음</td>";
						}else{
							txt +="<td>"+item[i].test_munje+"</td>";
						}
						
						txt +="</tr>";			
					}
					
				}else{
					txt += "<tr><td colspan=\"10\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";				
				}
				
				$(".tbody2").html(txt);
				$("#grade-Modal").modal("show");
				
			}});
		
		
		
	});
	
	
});


</script>