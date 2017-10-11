			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
		<h3>성적조회</h3>
		
		<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>과정시작</th>
						<th>과정종료</th>
						<th>강의실</th>
						<th>과목수</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>2016-09-01</td>
						<td>제2강의실</td>
						<td><button type="button" class="btn btn-default btn-sm subviewbtn">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
					</tr> -->
					
					<c:if test="${fn:length(courselist) > 0}">
				
					<c:forEach var="a" items="${courselist}">
							
							<tr>
								<td>${a.open_course_id}</td>
								<td>${a.course_name}</td>
								<td>${a.course_start_day}</td>
								<td>${a.course_end_day}</td>
								<td>${a.class_name}</td>
								<td><button type="button" class="btn btn-default btn-sm subviewbtn" ${a.count_ == 0 ? "disabled":""} value="${a.open_course_id}">
								<span class="badge" id="Count">${a.count_}</span> 보기	</button></td>
								
							</tr>							
					
							</c:forEach>
				
				
				</c:if>
					
				</tbody>
			</table>
			
			<form action="student002" id="subviewnext">
			<input type="hidden" name="open_course_id" id="open_course_id">
			<input type="hidden" name="course_name" id="course_name">
			<input type="hidden" name="course_start_day" id="course_start_day">
			<input type="hidden" name="course_end_day" id="course_end_day">
			<input type="hidden" name="class_name" id="class_name">
			
			</form>

<script>
$(document).ready(function() {
	$(document).on("click", ".subviewbtn", function(){
		var open_course_id = $(this).val();
		var course_name = $(this).parent().prev().prev().prev().prev().text();
		var course_start_day = $(this).parent().prev().prev().prev().text();
		var course_end_day = $(this).parent().prev().prev().text();
		var class_name = $(this).parent().prev().text();
		
		
		$("#open_course_id").val(open_course_id);
		$("#course_name").val(course_name);
		$("#course_start_day").val(course_start_day);
		$("#course_end_day").val(course_end_day);
		$("#class_name").val(class_name);
		
		
		$("#subviewnext").submit();
	});
	
});

</script>
	