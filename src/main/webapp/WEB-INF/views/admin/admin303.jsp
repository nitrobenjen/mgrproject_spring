
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<h3>수강생 명단</h3>

<h4 style="text-align: center; font-weight: bold;" class="main">${open_course.open_course_id}/ ${open_course.course_name}</h4>
<h5 style="text-align: center;">${open_course.course_start_day}~${open_course.course_end_day}</h5>

<hr>

<table class="table table-striped table-bordered ocu">
	<thead>
		<tr>
			<th>수강생 ID</th>
			<th>이름</th>
			<th>주민번호 뒷자리</th>
			<th>전화번호</th>
			<th>등록일</th>
			<th>수료여부</th>
		</tr>
	</thead>
	<tbody class="tbody">
		<!-- <tr>
						<td>STU001</td>
						<td>홍길동</td>
						<td>1022432</td>
						<td>010-1234-1234</td>
						<td>17/03/21</td>
						<td>중도탈락(17-01-01)</td>
					</tr> -->
		<c:forEach var="a" items="${stulist}">

			<tr>
				<td>${a.student_id}</td>
				<td>${a.student_name}</td>
				<td>${a.student_ssn}</td>
				<td>${a.student_phone}</td>
				<td>${a.student_regdate}</td>
				<td>${a.finish_day}${empty a.finish_day ? "수료예정(수료)":"(중도탈락)"}</td>
			</tr>
		</c:forEach>


	</tbody>
</table>

<div style="float: left; position: absolute">
	<button type="button" class="btn btn-default btn-sm">
		전체인원수 <span class="badge" id="totalCount">${total}</span>
	</button>
</div>

<div style="text-align: center;">

	<ul class="pagination" style="margin: 0px 0px 20px 0px;">
		<!-- 	<li class="active"><a href="#">1</a></li> -->
		<c:forEach begin="1" end="${totalpage}" varStatus="status">
			<c:choose>
				<c:when test="${status.count==1}">
					<li class="active "><a href="#" class="pagenum"
						id="${status.count}">${status.count}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#" class="pagenum" id="${status.count}">${status.count}</a></li>

				</c:otherwise>

			</c:choose>
		</c:forEach>





	</ul>
</div>


<form class="form-inline" style="text-align: center;">
	<div class="form-group">
		<select class="form-control" id="key" name="key">
			<option value="student_name">수강생 이름</option>
			<option value="student_phone">전화번호</option>
		</select>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" id="value" name="value"
			required>
	</div>
	<button type="button" class="btn btn-default searchbtn">Search</button>
</form>


<script>
$(document).ready(function() {
	var key= "";
	var value = "";
	
	

	$(document).on("click",".pagenum", function(){
		var open_course_id = $(this).parents().find(".main").text().split("/")[0];
		$(this).parents().find("li").removeClass("active");	
		var txt="";
		key= $("#key").val();
		value = $("#value").val();		
		var currentpage = $(this).text();
		$(this).parent().addClass("active");
		$.ajax({
			url:"admincoursestupage",
			data:{"currentpage2":currentpage, "key":key,"value":value, "open_course_id":open_course_id},
			success:function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					txt += "<tr>";
					txt += "<td>"+item[i].student_id+"</td>";
					txt += "<td>"+item[i].student_name+"</td>";
					txt += "<td>"+item[i].student_ssn+"</td>";
					txt += "<td>"+item[i].student_phone+"</td>";
					txt += "<td>"+item[i].student_regdate+"</td>";
					if(item[i].finish_day == null || item[i].finish_day == ""){
						txt += "<td>수료예정(수료)</td>";
					}else{
						txt += "<td>"+item[i].finish_day+"(중도탈락)</td>";
					}
					

			
					txt += "</tr>";	
				} 
						
			$(".tbody").html(txt);
			}});
		
	});
	
	
	
$(document).on("click", ".searchbtn", function(){
	var open_course_id = $(this).parents().find(".main").text().split("/")[0];
		key= $("#key").val();
		value = $("#value").val();		
		$(this).parents().find("li").removeClass("active");		
		var txt="";
		var page="";
		$(this).parents().find(".pagination").find("li").eq(0).addClass("active");
		
		$.ajax({
			url:"admincoursestusearch",
			data:{"key":key,"value":value, "open_course_id":open_course_id},
			success:function(data){
				var item = JSON.parse(data);
				if(item.length != 0){
					for(var i=0; i<item.length; i++){
						txt += "<tr>";
						txt += "<td>"+item[i].student_id+"</td>";
						txt += "<td>"+item[i].student_name+"</td>";
						txt += "<td>"+item[i].student_ssn+"</td>";
						txt += "<td>"+item[i].student_phone+"</td>";
						txt += "<td>"+item[i].student_regdate+"</td>";
						
						if(item[i].finish_day == null || item[i].finish_day == ""){
							txt += "<td>수료예정(수료)</td>";
						}else{
							txt += "<td>"+item[i].finish_day+"(중도탈락)</td>";
						}
						
						txt += "</tr>";	
						
						
						
					}
					
					for(var i=0; i<item[0].totalpage; i++){
						var count = i+1;
						if(i == 0){
							page += "<li class=\"active\"><a href=\"#\" class=\"pagenum\" id=\""+count+"\">"+count+"</a></li>";
						}else{
							page += "<li><a href=\"#\" class=\"pagenum\" id=\""+count+"\">"+count+"</a></li>";
						}
					}
				}else{
					txt += "<tr><td colspan=\"6\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";
					page += "";
				}

				$(".pagination").html(page);
				$(".tbody").html(txt); 
			}});
		
});

});


</script>