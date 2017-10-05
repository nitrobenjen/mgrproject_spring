<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
		<h3>성적조회 > ${courselist.course_name}</h3>
		
		<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>과정시작</th>
						<th>과정종료</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${courselist.open_course_id}</td>
						<td>${courselist.course_name}</td>
						<td>${courselist.course_start_day}</td>
						<td>${courselist.course_end_day}</td>
						<td>${courselist.class_name}</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>출결/배점</th>
						<th>필기/배점</th>
						<th>실기/배점</th>
						<th>총점</th>
						<th>시험날짜</th>
						<th>시험문제</th>
					</tr>
				</thead>
				<tbody>
<!-- 					<tr>
						<td>OUB001</td>
						<td>UI디자인</td>
						<td>2017-02-16 ~ 2017-02-28</td>
						<td>UI / UX 디자인 이론과 실습</td>
						<td>김정은</td>
						<td>30 / 30</td>
						<td>35 / 35</td>
						<td>35 / 35</td>
						<td>100 / 100</td>
						<td>2017-05-31</td>
						<td><button type="button" class="btn btn-default">다운</button></td>
					</tr> -->
					
					<c:if test="${fn:length(sublist) > 0}">
				
					<c:forEach var="a" items="${sublist}">
										
								<tr>
									<td>${a.open_sub_id}</td>
									<td>${a.subject_name}</td>
									<td>${a.sub_start_day} ~ ${a.sub_end_day}</td>
									<td>${empty a.book_name?"교재없음":a.book_name}</td>
									<td>${a.teacher_name}</td>
									<td>${empty a.chulsuk_total_grade ? "X" : a.chulsuk_total_grade} / ${a.chulsuk_grade==0?"X":a.chulsuk_grade}</td>
									<td>${a.filki_total_grade==0?"X":a.filki_total_grade} / ${a.filki_grade==0?"X":a.filki_grade}</td>
									<td>${a.silki_total_grade==0?"X":a.silki_total_grade} / ${a.silki_grade==0?"X":a.silki_grade}</td>
									<td>${a.chulsuk_total_grade +  a.silki_total_grade + a.filki_total_grade} / ${a.chulsuk_grade+a.filki_grade+a.silki_grade}</td>
									<td>${empty a.test_date?"시험보지 않음":a.test_date}</td>
									<td><button type="button" class="btn btn-default" ${empty a.test_munje?"disabled":""} value="${a.test_munje}">다운</button></td>
								</tr>
					
							</c:forEach>
				</c:if>
					
					
					
				</tbody>
			</table>

<script>
$(document).ready(function() {
	
	
});

</script>
	