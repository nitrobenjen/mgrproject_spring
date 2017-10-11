			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>성적 관리 > 과목별</h3>

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
<%-- 					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td>5</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin501-sub'">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
					</tr> --%>
					
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
								<td><button type="button" class="btn btn-default btn-sm subbtn" ${a.subcount == 0? "disabled":""} value="${a.open_course_id}" >
								<span class="badge" id="Count">${a.subcount}</span> 확인 </button></td>
								</tr>
							
					</c:forEach>
			
					
					</c:if>
					
				</tbody>
			</table>
			
			
			<form action="admin501-sub" method="POST" id="subnext">
			<input type="hidden" name="open_course_id" id="open_course_id2">
			<input type="hidden" name="course_name" id="course_name2">
			<input type="hidden" name="course_start_day" id="course_start_day2">
			<input type="hidden" name="course_end_day" id="course_end_day2">			
			</form>

			<form class="form-inline" method="post" style="text-align: center;">
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="open_course_id">개설과정ID</option>
						<option value="course_name">과정명</option>
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
	var key="";
	var value="";
	
	
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"admingradecoursesearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);					
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
						var stu;
						var sub;
						if(item[i].subcount == 0 ){
							sub = "disabled";
						}
						if(item[i].studentcount == 0 ){
							stu = "disabled";
						}
						
						txt += "<tr>";
						txt += "<td>"+item[i].open_course_id+"</td>";
						txt += "<td>"+item[i].course_name+"</td>";
						txt += "<td>"+item[i].class_name+"</td>";
						txt += "<td>"+item[i].jungwon+"</td>";
						txt += "<td>"+item[i].studentcount+"</td>";
						txt += "<td>"+item[i].course_start_day+"</td>";
						txt += "<td>"+item[i].course_end_day+"</td>";
						if(item[i].subcount == 0){
							txt += "<td><button type='button' class='btn btn-default btn-sm subbtn' disabled value='"+item[i].open_course_id+"'> <span class='badge' id='Count'>"+item[i].subcount+"</span>확인</button></td>";
							
						}else{
							txt += "<td><button type='button' class='btn btn-default btn-sm subbtn' value='"+item[i].open_course_id+"'> <span class='badge' id='Count'>"+item[i].subcount+"</span> 확인	</button></td>";
							
						}
											
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"8\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
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