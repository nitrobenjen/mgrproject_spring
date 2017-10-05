			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>수강생 관리 > 수강 이력</h3>
			
			<h4 style="text-align: center; font-weight: bold;" class="main1">${stulist.student_id}/${stulist.student_name}/${stulist.student_phone}</h4>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>과정시작일</th>
						<th>과정종료일</th>
						<th>수료여부</th>
					</tr>
				</thead>
				<tbody class="tbody">
				<!-- 	<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td>수료예정 <button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-end-Modal">입력</button></td>
					</tr> -->
					<c:if test="${fn:length(courselist) > 0}">
						
						<c:forEach var="a" items="${courselist}">
							<tr>
								<td>${a.open_course_id}</td>
								<td>${a.course_name}</td>
								<td>${a.class_name}</td>
								<td>${a.jungwon}</td>
								<td>${a.course_start_day}</td>
								<td>${a.course_end_day}</td>
								
								<c:if test="${empty a.finish_day}">
								<td>수료예정(수료)<button type="button" class="btn btn-default addbtn">입력</button></td>
								</c:if>
								<c:if test="${a.finish_day != null}">
								<td>${a.finish_day} 중도탈락 <button type="button" class="btn btn-default addbtn" disabled>입력</button></td>
								</c:if>
								
							</tr>
					
					</c:forEach>
					
					</c:if>

					
				</tbody>
			</table>

			<form class="form-inline" style="text-align: center;">
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="course_name">과정명</option>
						<option value="open_course_id">개설과정ID</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>


	<!-- 수료 여부 입력 Modal -->
	<div class="modal fade" id="ocu-end-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수료 여부 입력(날짜 입력시 중도탈락)</h5>
				</div>
				<form class="form-horizontal" action="adminstufailadd">
				<div class="modal-body">
					
					<h4 style="text-align: center;font-weight:bold;" class="modalbody1">OCU001 / Framework을 활용한 빅데이터 개발자 과정</h4>
					<h5 style="text-align: center;" class="modalbody2">16-09-01 ~ 17-02-01</h5>
					<br>
					<h4 style="text-align: center;" class="modalbody3">STU002 / 이순신 / 010-4758-6532</h4>
					
					<hr>
					
					<div class="form-group">
						<label class="control-label col-sm-3 m10">중도탈락일 입력</label>
							<div class="col-sm-9 m10">
							<input type="text" class="form-control" id="ocustartdate"
									name="finish_day" placeholder="중도탈락일(YYYY-MM-DD)"
									required="required">
							</div>
					</div>
					
				</div>
				<input type="hidden" name="student_id" class="failstudent">
				<input type="hidden" name="student_name" class="failname">
				<input type="hidden" name="student_phone" class="failphone">
				<input type="hidden" name="open_course_id" class="failcourse">
				
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>



<script>
$(document).ready(function() {
	var key="";
	var value="";
	
	
	$(document).on("click",".addbtn",function() {
		
		var open_course_id = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var course_name = $(this).parent().prev().prev().prev().prev().prev().text();
		var course_start_day = $(this).parent().prev().prev().text();
		var course_end_day= $(this).parent().prev().text();
		var student_id = $(this).parents().find(".main1").text().split("/")[0];
		var student_name = $(this).parents().find(".main1").text().split("/")[1];
		var student_phone = $(this).parents().find(".main1").text().split("/")[2];
		
		$(".failstudent").val(student_id);
		$(".failcourse").val(open_course_id);
		$(".failname").val(student_name);
		$(".failphone").val(student_phone);
		
		$("#ocustartdate").datepicker("option", "minDate", course_start_day);	 			
		$("#ocustartdate").datepicker("option", "maxDate", course_end_day);	 			
		$(".modalbody1").text(open_course_id+"/"+course_name);
		$(".modalbody2").text(course_start_day+"~"+course_end_day);
		$(".modalbody3").text(student_id+"/"+student_name+"/"+student_phone);
		$("#ocu-end-Modal").modal("show");
	});
	
	
	  $('#ocustartdate').datepicker({		
	    	dateFormat: "yy-mm-dd"
	    });
	    
	
	
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var student_id = $(this).parents().find(".main1").text().split("/")[0];
		var txt="";
		$.ajax({			
			url:"adminstufailsearch",
			data:{"key":key, "value":value, "student_id":student_id},
			success:function(data){
				var item = JSON.parse(data);
					
				if(item.length != 0){
					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].open_course_id+"</td>";
						txt += "<td>"+item[i].course_name+"</td>";
						txt += "<td>"+item[i].class_name+"</td>";
						txt += "<td>"+item[i].jungwon+"</td>";
						txt += "<td>"+item[i].course_start_day+"</td>";
						txt += "<td>"+item[i].course_end_day+"</td>";
						
						if(item[i].finish_day == null || item[i].finish_day == ""){
							txt += "<td>수료예정(수료)<button type=\"button\" class=\"btn btn-default addbtn\">입력</button></td>";
						}else{
							txt += "<td>"+item[i].finish_day+" 중도탈락 <button type=\"button\" class=\"btn btn-default addbtn\" disabled>입력</button></td>";
						}
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"7\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	
});


</script>


