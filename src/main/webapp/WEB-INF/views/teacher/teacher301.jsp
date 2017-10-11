<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

			<h3>성적관리</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th style="width: 90px;">과목기간</th>
						<th>과정명</th>
						<th style="width: 90px;">과정기간</th>
						<th style="width: 85px;">강의실</th>
						<th>교재명</th>
						<th>출결배점</th>
						<th>필기배점</th>
						<th>실기배점</th>
						<th>시험일</th>
						<th>시험문제</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>17/07/01 ~ 17/07/31</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>17/03/01 ~ 17/10/01</td>
						<td>제2강의실</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>20</td>
						<td>30</td>
						<td>50</td>
						<td>17/07/29</td>
						<td>simsim_170729.zip</td>
						<td><button type="button" class="btn btn-default gradeview" >선택</button></td>
					</tr> -->
					
					<c:if test="${fn:length(sublist) > 0}">
					
						<c:forEach var="a" items="${sublist}">
						
						<tr>
						<td>${a.open_sub_id}</td>
						<td>${a.subject_name}</td>
						<td>${a.sub_start_day}~${a.sub_end_day}</td>
						<td>${a.course_name}</td>
						<td>${a.course_start_day}~${a.course_end_day }</td>
						<td>${a.class_name}</td>
						<td>${empty a.book_name?"교재없음":a.book_name}</td>
						<td>${a.chulsuk_total_grade==0?"X":a.chulsuk_total_grade}</td>
						<td>${a.filki_total_grade==0?"X":a.filki_total_grade}</td>
						<td>${a.silki_total_grade==0?"X":a.silki_total_grade}</td>
						<td>${empty a.test_date?"X":a.test_date}</td>
						<td>${empty a.test_munje?"X":a.test_munje}</td>
						
							<td><input type="hidden" class="open_course_id" value="${a.open_course_id}"><button type="button" class="btn btn-default gradeview" value="${a.open_sub_id}" ${a.chulsuk_total_grade==0 || a.filki_total_grade==0 || a.silki_total_grade==0?"disabled":"" } >선택</button></td>
							</tr>
						</c:forEach>
					
					</c:if>
					
					<c:if test="${fn:length(sublist) == 0}">
					<tr><td colspan=14 style="text-align: center;">검색된 결과가 없습니다.</td></tr>
					
					</c:if>
					
					
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;" >
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="open_sub_id">개설과목ID</option>
						<option value="subject_name">과목명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value" 	required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>
			
			
<form id="gradeviewnext" action="teacher302" method="post">
<input type="hidden" id="open_course_id2" name="open_course_id">
<input type="hidden" id="open_sub_id" name="open_sub_id">
<input type="hidden" id="subject_name" name="subject_name">
<input type="hidden" id="sub_start_day" name="sub_start_day">
<input type="hidden" id="sub_end_day" name="sub_end_day">
<input type="hidden" id="course_name" name="course_name">
<input type="hidden" id="course_start_day" name="course_start_day">
<input type="hidden" id="course_end_day" name="course_end_day">
<input type="hidden" id="class_name" name="class_name">
<input type="hidden" id="book_name" name="book_name">
<input type="hidden" id="chulsuk_total_grade" name="chulsuk_total_grade">
<input type="hidden" id="filki_total_grade" name="filki_total_grade">
<input type="hidden" id="silki_total_grade" name="silki_total_grade">
<input type="hidden" id="test_date" name="test_date">
<input type="hidden" id="test_munje" name="test_munje">
</form>


<script>

$(document).ready(function() {
	$(document).on("click", ".gradeview", function(){	
		var open_sub_id = $(this).val();
		var open_course_id = $(this).prev().val();
		var subject_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var sub_start_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[0];
		var sub_end_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[1];
		var class_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var book_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var course_start_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[0];
		var course_end_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[1];
		
		var chulsuk_total_grade =  $(this).parent().prev().prev().prev().prev().prev().text();
		var filki_total_grade =  $(this).parent().prev().prev().prev().prev().text();
		var silki_total_grade =  $(this).parent().prev().prev().prev().text();
		var test_date=  $(this).parent().prev().prev().text();
		var test_munje =  $(this).parent().prev().text();
		
		$("#open_course_id2").val(open_course_id);
		$("#open_sub_id").val(open_sub_id);	
		$("#subject_name").val(subject_name);	
		$("#sub_start_day").val(sub_start_day);	
		$("#sub_end_day").val(sub_end_day);	
		$("#course_name").val(class_name);	
		$("#course_start_day").val(course_start_day);	
		$("#course_end_day").val(course_end_day);	
		$("#class_name").val(class_name);	
		$("#book_name").val(book_name);
		$("#chulsuk_total_grade").val(chulsuk_total_grade);	
		$("#filki_total_grade").val(filki_total_grade);	
		$("#silki_total_grade").val(silki_total_grade);	
		$("#test_date").val(test_date);	
		$("#test_munje").val(test_munje);	
		$("#open_sub_id").val(open_sub_id);			
		
		$("#gradeviewnext").submit();
		
		
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"teachbaejumsearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);
					
				if(item.length != 0){
				
					for(var i=0; i<item.length; i++){
				var disabled="";
				
					txt+="<input type=\"hidden\" class=\"open_course_id\" value=\""+item[i].open_course_id+"\">";
				if(item[i].chulsuk_total_grade == 0 || item[i].filki_total_grade == 0 || item[i].silki_total_grade == 0){
					disabled = "disabled";
				}
						txt += "<tr>";
						txt += "<td>"+item[i].open_sub_id+"</td>";
						txt += "<td>"+item[i].subject_name+"</td>";
						txt += "<td>"+item[i].sub_start_day+"~"+item[i].sub_end_day+"</td>";
						txt += "<td>"+item[i].course_name+"</td>";
						txt += "<td>"+item[i].course_start_day+"~"+item[i].course_end_day+"</td>";
						txt += "<td>"+item[i].class_name+"</td>";
						if(item[i].book_name == null){
							txt += "<td>교재없음</td>";
						}else{
							txt += "<td>"+item[i].book_name+"</td>";
						}
						
						if(item[i].chulsuk_total_grade == 0){
							txt += "<td>X</td>";
						}else{
							txt += "<td>"+item[i].chulsuk_total_grade+"</td>";
						}
						
						if(item[i].filki_total_grade == 0){
							txt += "<td>X</td>";
						}else{
							txt += "<td>"+item[i].filki_total_grade+"</td>";
						}
						
						
						if(item[i].silki_total_grade == 0){
							txt += "<td>X</td>";
						}else{
							txt += "<td>"+item[i].silki_total_grade+"</td>";
						}
						
						if(item[i].test_date == null){
							txt += "<td>X</td>";
						}else{
							txt += "<td>"+item[i].test_date+"</td>";
						}
						
						if(item[i].test_munje == null){
							txt += "<td>X</td>";
						}else{
							txt += "<td>"+item[i].test_munje+"</td>";
						}
						
						
						txt += "<td><button type=\"button\" class=\"btn btn-default gradeview\" value=\""+item[i].open_sub_id+"\" "+disabled+">선택</button></td>";
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"14\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
});



</script>
