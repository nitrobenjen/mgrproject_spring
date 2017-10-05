			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


			<h3>개설 과정 관리</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실</th>
						<th>정원</th>
						<th>수강인원</th>
						<th>과정 시작일</th>
						<th>과정 종료일</th>
						<th>개설 과목</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
<%-- 					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin303'">
								<span class="badge" id="Count">8</span> 확인
							</button></td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin302'">
								<span class="badge" id="Count">2</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-del-Modal">삭제</button></td>
					</tr>	 --%>
					
					<c:forEach var="a" items="${courselist}">
					
						<tr>
						<td>${a.open_course_id}</td>
						<td>${a.course_name}</td>
						<td>${a.class_name}</td>
						<td>${a.jungwon}</td>
						<td><button type="button" class="btn btn-default btn-sm stubtn" value="${a.open_course_id}" ${a.studentcount == 0? "disabled":""} >
								<span class="badge" id="Count">${a.studentcount}</span> 확인
							</button></td>
						
						
						<td>${a.course_start_day}</td>
						<td>${a.course_end_day}</td>
						<td><button type="button" class="btn btn-default btn-sm subbtn" value="${a.open_course_id}" >
								<span class="badge" id="Count">${a.subcount}</span> 확인
							</button></td>
						<td><button type="button" value="${a.open_course_id}" class="btn btn-default modifybtn" ${a.studentcount != 0 || a.subcount != 0? "disabled":""}>수정</button></td>
						<td><button type="button" value="${a.open_course_id}" class="btn btn-default delbtn"  ${a.studentcount != 0 || a.subcount != 0? "disabled":""} >삭제</button></td>
						</tr>			
					
					</c:forEach>
							
				</tbody>
			</table>
			
			<form action="admin303" method="POST" id="stunext">
			<input type="hidden" name="open_course_id" id="open_course_id">
			<input type="hidden" name="course_name" id="course_name">
			<input type="hidden" name="course_start_day" id="course_start_day">
			<input type="hidden" name="course_end_day" id="course_end_day">			
			</form>
			
			<form action="admin302" method="POST" id="subnext">
			<input type="hidden" name="open_course_id" id="open_course_id2">
			<input type="hidden" name="course_name" id="course_name2">
			<input type="hidden" name="course_start_day" id="course_start_day2">
			<input type="hidden" name="course_end_day" id="course_end_day2">			
			</form>

			<button type="button" style="float: left;position: absolute;" class="btn btn-default addbtn">개설 과정 등록</button>

			<form class="form-inline"style="text-align: center;">
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




	<!-- 개설 과정 등록 Modal -->
	<div class="modal fade" id="ocu-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 등록</h5>
				</div>
				<form class="form-horizontal" action="admincourseadd" method="POST">
				<div class="modal-body">
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">과정 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control courselist" id="sel1" name="course_id">
								<!-- <option value="CU001">CU001 / 웹기반 빅데이터 분석 응용SW개발자</option> -->
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강의실</label>
							<div class="col-sm-9 m10">
								<select class="form-control classlist" id="sel1" name="class_id">
								<!--  <option value="CA001">CA001 / 제1강의실 / 30</option> -->
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과정 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocustartdate"
									name="course_start_day" placeholder="과정 시작일(YYYY-MM-DD)"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과정 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocuenddate"
									name="course_end_day" placeholder="과정 종료일(YYYY-MM-DD)"
									required="required">
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>


	<!-- 개설 과정 수정 Modal -->
	<div class="modal fade" id="ocu-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 수정</h5>
				</div>
					<form class="form-horizontal" action="admincoursemdify" method="POST">
				<div class="modal-body">
				
				<h4 style="text-align: center;" class="modaltitle"></h4>
				<h5 style="text-align: center;" class="modalbody"></h5>
				
				<hr>
						
						<div class="form-group">
						
						<label class="control-label col-sm-3 m10">과정 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control courselist" id="sel1" name="course_id">
								<!-- <option value="CU001">CU001 / 웹기반 빅데이터 분석 응용SW개발자</option> -->
							    </select>
							</div>
						
							<label class="control-label col-sm-3 m10">강의실</label>
							<div class="col-sm-9 m10">
								<select class="form-control classlist" name="class_id">
							        <option>CA001 / 제1강의실 / 30</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과정 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocustartmoddate"
									name="course_start_day" placeholder="과정 시작일(YYYY-MM-DD)" value=""
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과정 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocuendmoddate"
									name="course_end_day" placeholder="과정 종료일(YYYY-MM-DD)" value=""
									required="required">
							</div>
						</div>
					
				</div>
				<input type="hidden" class="open_course_id" name="open_course_id">
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>




	<!-- 개설 과정 삭제 Modal -->
	<div class="modal fade" id="ocu-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 삭제</h5>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;" class="modaltitle">OCU001 / 웹기반 빅데이터 분석 응용SW개발자</h4>
					<h5 style="text-align: center;" class="modalbody">2016/09/01 ~ 2017/02/01</h5>
					<br>
					<h4 style="text-align: center;">개설 과정을 삭제하시겠습니까?</h4>
				</div>
				<form action="admincoursedel" method="POST">
					<input type="hidden" class="open_course_id" name="open_course_id">
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">삭제</button>
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
	

	    $('#ocustartdate').datepicker({
	       	minDate : 0,
	    	dateFormat: "yy-mm-dd",
	    	onClose: function(selectedDate){
	    		$("#ocuenddate").datepicker("option", "minDate", selectedDate)
	    	}
	    });
	    
	    
	    $('#ocuenddate').datepicker({
	    	dateFormat: "yy-mm-dd",
	    	minDate : 0,
	    	onClose: function(selectedDate){
	    		$("#ocustartdate").datepicker("option", "maxDate", selectedDate)	  
	    	}
	    });
	    
	    
	    $('#ocustartmoddate').datepicker({
	       	minDate : 0,
	    	dateFormat: "yy-mm-dd",
	    	onClose: function(selectedDate){
	    		$("#ocuendmoddate").datepicker("option", "minDate", selectedDate)
	    	}
	    });
	    
	    
	    $('#ocuendmoddate').datepicker({
	    	dateFormat: "yy-mm-dd",
	    	minDate : 0,
	    	onClose: function(selectedDate){
	    		$("#ocustartmoddate").datepicker("option", "maxDate", selectedDate)	  
	    	}
	    });
	    


	
	
	$(document).on("click",".addbtn",function() {
		
		var course="";
		var class_="";
		
		$.ajax({
			url:"admincourseaddlist",
			success:function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					if(item[i].course_id != null){
						course += "<option value=\""+item[i].course_id+"\">"+item[i].course_id+" / "+item[i].course_name+"</option>";
					}
					
					if(item[i].class_id != null){
						class_ += "<option value=\""+item[i].class_id+"\">"+item[i].class_id+" / "+item[i].class_name+" / "+item[i].jungwon+"</option>";
					}
				}	
		
				
				$(".courselist").html(course);
				$(".classlist").html(class_);
				
			}});
		
				
		$("#ocu-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		
		var open_course_id = $(this).val();
		var course_name = $(this).parents("tr").find("td").eq(1).text();
		var startday = $(this).parents("tr").find("td").eq(5).text();
		var endday = $(this).parents("tr").find("td").eq(6).text();
		var course = "";
		var class_ = "";
		$(".modaltitle").text(open_course_id+"/"+course_name+" 개설 과정 수정");
		$(".modalbody").text(startday+"~"+endday);
		$(".open_course_id").val(open_course_id);
		
		$.ajax({
			url:"admincourseaddlist",
			success:function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					if(item[i].course_id != null){
						course += "<option value=\""+item[i].course_id+"\">"+item[i].course_id+" / "+item[i].course_name+"</option>";
					}
					
					if(item[i].class_id != null){
						class_ += "<option value=\""+item[i].class_id+"\">"+item[i].class_id+" / "+item[i].class_name+" / "+item[i].jungwon+"</option>";
					}
				}	
		
				
				$(".courselist").html(course);
				$(".classlist").html(class_);
				
			}});
		
		
		$("#ocu-mod-Modal").modal("show");
	});
	
	$(document).on("click",".delbtn",function() {
		
		var open_course_id = $(this).val();
		var course_name = $(this).parents("tr").find("td").eq(1).text();
		var startday = $(this).parents("tr").find("td").eq(5).text();
		var endday = $(this).parents("tr").find("td").eq(6).text();
	
		$(".modaltitle").text(open_course_id+"/"+course_name+" 개설 과정 삭제");
		$(".modalbody").text(startday+"~"+endday);
		$(".open_course_id").val(open_course_id);
		
		
		$("#ocu-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"admincoursesearch",
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
						txt += "<td><button type='button' class='btn btn-default btn-sm stubtn' value='"+item[i].open_course_id+"'  "+stu+" <span class='badge' id='Count'>"+item[i].studentcount+"</span> 확인</button></td>";
						txt += "<td>"+item[i].course_start_day+"</td>";
						txt += "<td>"+item[i].course_end_day+"</td>";
						txt += "<td><button type='button' class='btn btn-default btn-sm' value='"+item[i].open_course_id+"'  <span class='badge' id='Count'>"+item[i].subcount+"</span> 확인	</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\"  "+sub+" "+stu+"  value=\""+item[i].open_course_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+sub+" "+stu+"  value=\""+item[i].open_course_id+"\">삭제</button></td>";
						
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"10\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	$(document).on("click", ".stubtn", function(){
		var open_course_id = $(this).val();
		var course_name = $(this).parent().prev().prev().prev().text();
		var course_start_day = $(this).parent().next().text();
		var course_end_day = $(this).parent().next().next().text();
		$("#open_course_id").val(open_course_id);
		$("#course_name").val(course_name);
		$("#course_start_day").val(course_start_day);
		$("#course_end_day").val(course_end_day);		
		$("#stunext").submit();
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