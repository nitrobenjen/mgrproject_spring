			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

			<h3>성적 관리 > 과목별</h3>

			<h4 style="text-align: center; font-weight: bold;" class="main">${open_course.open_course_id}/ ${open_course.course_name}</h4>
			<h5 style="text-align: center;" class="main2">${open_course.course_start_day}~${open_course.course_end_day}</h5>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과목ID</th>
						<th>개설 과목명</th>
						<th>과목 시작일</th>
						<th>과목 종료일</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>성적 등록 인원수</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>17/07/01</td>
						<td>17/07/31</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>심심해</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#grade-insert-Modal">
								<span class="badge" id="Count">5</span> 보기
							</button></td>
					</tr> -->
					
					
			<c:if test="${fn:length(open_sub) > 0}">
				
					<c:forEach var="a" items="${open_sub}">
							
							<tr>
								<td>${a.open_sub_id}</td>
								<td>${a.subject_name}</td>
								<td>${a.sub_start_day}</td>
								<td>${a.sub_end_day}</td>
								<td>${empty a.book_name?"교재없음":a.book_name}</td>
								<td>${a.teacher_name}</td>
								<td><button type="button" class="btn btn-default btn-sm gradeview" value="${a.open_sub_id}" ${a.count_==0?"disabled":""} ><span class="badge" id="Count">${a.count_}</span> 보기
							</button></td>
								
							</tr>							
					
							</c:forEach>
				
				
				</c:if>
					
				</tbody>
			</table>	

		


	<!-- 성적 확인 Modal -->
	<div class="modal fade" id="grade-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적 확인</h5>
				</div>
				<div class="modal-body">
				
				<h4 style="text-align: center;" class="modalbody1">OUB001 / 자바 네트워트 프로그래밍 / 2016/07/01 ~ 2017/07/31</h4>
				<h5 style="text-align: center;" class="modalbody2">출결배점 : 124124/ 필기배점 : 12412/ 실기배점 :12412412</h5>
				<p style="text-align: right;" class="modalbody3">시험일 : 20124124/01</p>
				<hr>
				
				<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생 ID</th>
						<th>이름</th>
						<th>출결점수</th>
						<th>필기점수</th>
						<th>실기점수</th>
					</tr>
				</thead>
				<tbody class="tbody2">
					<tr>
						<td>STU001</td>
						<td>홍길동</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>


<script>
$(document).ready(function() {
	var key="";
	var value="";
	
	
	$(document).on("click", ".gradeview", function(){
		
		var open_sub_id = $(this).val();
		var subject_name = $(this).parent().prev().prev().prev().prev().prev().text();
		var sub_start_day = $(this).parent().prev().prev().prev().prev().text();
		var sub_end_day = $(this).parent().prev().prev().prev().text();
		
		$(".modalbody1").html(open_sub_id+"/"+subject_name+"/"+sub_start_day+"~"+sub_end_day);
		
		$.ajax({
			url:"adminsubgradeview",		
			data:{"open_sub_id":open_sub_id},
			success:function(data){
				var item = JSON.parse(data);
				console.log(item);
				var txt="";
				if(item.length != 0){		
					var testdate= item[0].test_date;
					var cbaejum = item[0].chulsuk_total_grade;
					var fbaejum = item[0].filki_total_grade;
					var sbaejum = item[0].silki_total_grade;
					
					for(var i=0; i<item.length; i++){
						txt += "<tr>";
						txt += "<td>"+item[i].student_id+"</td>";
						txt += "<td>"+item[i].student_name+"</td>";
						txt += "<td>"+item[i].chulsuk_grade+"</td>";
						txt += "<td>"+item[i].filki_grade+"</td>";
						txt += "<td>"+item[i].silki_grade+"</td>";					
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"5\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody2").html(txt);
				$(".modalbody2").html("출결배점 : "+cbaejum+"/필기배점 : "+fbaejum+" / 실기배점 :"+sbaejum); 
				$(".modalbody3").html(testdate);
			}});
		 
		
		$("#grade-insert-Modal").modal("show");
		
	});
	

	
	$(document).on("click", ".subbtn", function(){
		var open_course_id = $(this).val();
		var course_name = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var course_start_day = $(this).parent().prev().prev().text();
		var course_end_day = $(this).parent().prev().text();
		$("#open_course_id2").val(open_course_id);
		$("#course_name2").val(course_name);
		$("#course_start_day2").val(course_start_day);
		$("#course_end_day2").val(course_end_day);		
		$("#subnext").submit();
	});
	
	
});


</script>