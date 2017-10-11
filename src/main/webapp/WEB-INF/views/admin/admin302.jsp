			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>개설 과목 관리</h3>
			
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
						<th>수정</th>
						<th>삭제</th>
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
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#oub-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#oub-del-Modal">삭제</button></td>
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
								<td><button type="button" class="btn btn-default modifybtn" ${a.delcheck} value="${a.open_sub_id}">수정</button></td>
								<td><button type="button" class="btn btn-default delbtn" ${a.delcheck} value="${a.subject_id}">삭제</button></td>
								
							</tr>							
					
							</c:forEach>
				
				
				</c:if>
							
				
					
					
					
									
				</tbody>
			</table>

				<button type="button" style="float: left;position: absolute;" class="btn btn-default addbtn" ${addcheck}>개설 과목 등록</button>

			<form class="form-inline" style="text-align: center;">

				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="open_sub_id">개설과목ID</option>
						<option value="subject_name">과목명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>

	<!-- 개설 과정 등록 Modal -->
	<div class="modal fade" id="oub-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 등록</h5>
				</div>
				<form class="form-horizontal" method="POST" action="adminopensubadd">
				<div class="modal-body">
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">과목 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="basicsub" name="subject_id" required>
							        <option>SUB001 / 자바 네트워트 프로그래밍</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">교재 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="basicbook" name="book_id" required>
							        <option>B001 / 이것이 자바다 / 한빛출판사</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강사 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="teach" name="teacher_id" disabled required>
								<!--<option>TCH001 / 지재환 / 1687988 / 010-8888-7474</option>  -->
							        <option>과목을 선택하세요.</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과목 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubstartdate"
									name="sub_start_day" placeholder="클릭시 과목시작일 자동설정"
									required="required" readonly>
							</div>
							<label class="control-label col-sm-3 m10">과목 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubenddate"
									name="sub_end_day" placeholder="과목 시작일을 먼저 설정해주세요."
									required="required" disabled>
							</div>
						</div>
						<input type="hidden" value="${open_course.open_course_id}" name="open_course_id">
					
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
	<div class="modal fade" id="oub-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 수정</h5>
				</div>
				<form class="form-horizontal" method="POST" action="adminopensubmodify">
				<div class="modal-body">
				
				<h4 style="text-align: center;" class="modaltitle">OUB001 / 자바 네트워트 프로그래밍</h4>
				<h5 style="text-align: center;" class="modalbody">2017/07/01 ~ 2017/07/31 / html 웹 프로그래밍 입문 / 심심해</h5>
				
				<hr>
						<div class="form-group">
						<label class="control-label col-sm-3 m10">과목 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="basicsub2" name="subject_id" required>
							        <option>SUB001 / 자바 네트워트 프로그래밍</option>
							    </select>
							</div>
						
							<label class="control-label col-sm-3 m10">교재 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="basicbook2" name="book_id" >
							        <option>B001 / 이것이 자바다 / 한빛출판사</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강사 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="teach2" name="teacher_id" required disabled>
							        <option>과목 선택</option>
							    </select>
							</div>
								<label class="control-label col-sm-3 m10">과목 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubstartmodedate"
									name="sub_start_day" placeholder="클릭시 과목시작일 자동설정"
									required="required" disabled>
							</div>
							<label class="control-label col-sm-3 m10">과목 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubendmodedate"
									name="sub_end_day" placeholder="과목 시작일을 먼저 설정해주세요."
									required="required" disabled>
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<input type="hidden" class="open_sub_id" name="open_sub_id">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>




	<!-- 개설 과정 삭제 Modal -->
	<div class="modal fade" id="oub-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 삭제</h5>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;" class="modaltitle">OUB001 / 자바 네트워트 프로그래밍</h4>
					<h5 style="text-align: center;" class="modalbody">2017/07/01 ~ 2017/07/31 / html 웹 프로그래밍 입문 / 심심해</h5>
					<br>
					<h4 style="text-align: center;">개설 과목을 삭제하시겠습니까?</h4>
				</div>
				
				<div class="modal-footer">
				<form action="adminsubdel" method="post">
				
				<input type="hidden" class="open_sub_id" name="open_sub_id">				
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></form>
				</div>
			</div>

		</div>
	</div>



<script>
$(document).ready(function() {
	var key="";
	var value="";
	

	     
	     $(document).on("click", "#oubstartdate", function(){
	    	 var open_course_id = $(this).parents().find(".main").text().split("/")[0];
	    	 var corse_start_day = $(this).parents().find(".main2").text().split("~")[0];
	    	 var corse_end_day = $(this).parents().find(".main2").text().split("~")[1];
	    	 console.log(corse_end_day);
	    	 
	    	 $.ajax({
	 			url:"adminsubdaysearch",
	 			data:{"open_course_id":open_course_id},
	 			success:function(data){
	 				var item = JSON.parse(data);
	 				console.log(item);
	 				var max="";
	 				var startday="";
	 				if(item.length != 0){
	 					for(var i=0; i<item.length; i++){						
							max = item[i].sub_end_day;
	 						for(var j=0; j<item.length; j++){
	 							if(max < item[j].sub_end_day){
	 								max = item[j].sub_end_day;
	 							}
	 						}
							
						}	 					
	 					$("#oubstartdate").val(max);
	 					$("#oubenddate").datepicker("option", "minDate", max);	 					
	 					$("#oubenddate").removeAttr("disabled");
	 				}else{
	 					$("#oubstartdate").val(corse_start_day);
	 					$("#oubenddate").datepicker("option", "minDate", corse_start_day)
	 					$("#oubenddate").removeAttr("disabled");
	 				}
	 				
	 				$("#oubenddate").datepicker("option", "maxDate", corse_end_day)
	 			}});
	    	 
	     });
	     
	    
	    $('#oubenddate').datepicker({	    	
	    	dateFormat: "yy-mm-dd",
	    	onClose: function(selectedDate){
	    		$("#oubstartdate").datepicker("option", "maxDate", selectedDate)	  
	    	}
	    });
	    
	    
	    
	    
	    $(document).on("click", "#oubstartmoddate", function(){
	    	 var open_course_id = $(this).parents().find(".main").text().split("/")[0];
	    	 var corse_start_day = $(this).parents().find(".main2").text().split("~")[0];
	    	 var corse_end_day = $(this).parents().find(".main2").text().split("~")[1];
	    	 
	    	 
	    	 
	    	 $.ajax({
	 			url:"adminsubdaysearch",
	 			data:{"open_course_id":open_course_id},
	 			success:function(data){
	 				var item = JSON.parse(data);
	 				console.log(item);
	 				var max="";
	 				var startday="";
	 				if(item.length != 0){
	 					for(var i=0; i<item.length; i++){						
							max = item[i].sub_end_day;
	 						for(var j=0; j<item.length; j++){
	 							if(max < item[j].sub_end_day){
	 								max = item[j].sub_end_day;
	 							}
	 						}
							
						}	 					
	 					$("#oubstartmoddate").val(max);
	 					$("#oubendmoddate").datepicker("option", "minDate", max);	 					
	 					$("#oubendmoddate").removeAttr("disabled");
	 				}else{
	 					$("#oubstartmoddate").val(corse_start_day);
	 					$("#oubendmoddate").datepicker("option", "minDate", corse_start_day)
	 					$("#oubendmoddate").removeAttr("disabled");
	 				}
	 				
	 				$("#oubendmoddate").datepicker("option", "maxDate", corse_end_day)
	 			}});
	    	 
	     });
	    
	    
	
	    
	    $('#oubendmoddate').datepicker({
	    	dateFormat: "yy-mm-dd",
	    	onClose: function(selectedDate){
	    		$("#oubstartmoddate").datepicker("option", "maxDate", selectedDate)	  
	    	}
	    });
	    
	
	
	$(document).on("click",".addbtn",function() {
		var open_course_id = $(this).parents().find(".main").text().split("/")[0];
		var sub="";
		var book="";
		
		$.ajax({
			url:"adminsubaddlist",
			data:{"open_course_id":open_course_id},
			success:function(data){				
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					if(item[i].subject_id != null){
						sub += "<option value=\""+item[i].subject_id+"\">"+item[i].subject_id+" / "+item[i].subject_name+"</option>";
					}
					
					if(item[i].book_id != null){
						book += "<option value=\""+item[i].book_id+"\">"+item[i].book_id+" / "+item[i].book_name+" / "+item[i].publisher+"</option>";
					}
				}	
				
				$("#basicsub").html(sub);
				$("#basicbook").html(book);				
				
			}});
		
		
		$(document).on("change", "#basicsub", function(){
			
			var subject_id = $(this).val();
			var teach = "";
			$.ajax({
				url:"adminsubaddlistteach",
				data:{"subject_id":subject_id},
				success:function(data){
					var item = JSON.parse(data);
				
					if(item.length !=0 ){
						$("#teach").removeAttr("disabled");
						for(var i=0; i<item.length; i++){
							if(item[i].subject_id != null){
								teach += "<option value=\""+item[i].teacher_id+"\">"+item[i].teacher_id+" / "+item[i].teacher_name+" / "+item[i].teacher_phone+"</option>";
							}
							
						}	
						
					}else{
						teach += "<option >해당과목이 가능한 강사가 존재하지 않습니다. 다른 과목을 선택해주세요.</option>";
					}
					
					
					$("#teach").html(teach);
					
				}});
			
			
		});
		
				
		$("#oub-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		var open_sub_id = $(this).parents("tr").find("td").eq(0).text();
		var subject_id = $(this).val();
		var subject_name = $(this).parents("tr").find("td").eq(1).text();
		var sub_start_day =  $(this).parents("tr").find("td").eq(2).text();
		var sub_end_day =  $(this).parents("tr").find("td").eq(3).text();
		var book_name =  $(this).parents("tr").find("td").eq(4).text();
		var teacher_name =  $(this).parents("tr").find("td").eq(5).text();
		
		
		$(".modaltitle").text(open_sub_id+"/"+subject_name);
		$(".modalbody").text(sub_start_day+"~"+sub_end_day+"/"+book_name+"/"+teacher_name);
		$(".open_sub_id").val(open_sub_id);
		$("#oubstartmodedate").val(sub_start_day);
		$("#oubendmodedate").val(sub_end_day);
		var book ="";
		var sub="";
		
		$.ajax({
			url:"adminsubaddlist",
			success:function(data){
				
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					if(item[i].subject_id != null){
						sub += "<option value=\""+item[i].subject_id+"\">"+item[i].subject_id+" / "+item[i].subject_name+"</option>";
					}
					
					if(item[i].book_id != null){
						book += "<option value=\""+item[i].book_id+"\">"+item[i].book_id+" / "+item[i].book_name+" / "+item[i].publisher+"</option>";
					}
				}	
				
				$("#basicsub2").html(sub);	
				$("#basicbook2").html(book);		
				
			}});
		
		
		
		$("#oub-mod-Modal").modal("show");
	});
	
	
	
	$(document).on("change", "#basicsub2", function(){
		
		var subject_id = $(this).val();
		var teach = "";
		$.ajax({
			url:"adminsubaddlistteach",
			data:{"subject_id":subject_id},
			success:function(data){
				var item = JSON.parse(data);
			
				if(item.length !=0 ){
					$("#teach2").removeAttr("disabled");
					for(var i=0; i<item.length; i++){
						if(item[i].subject_id != null){
							teach += "<option value=\""+item[i].teacher_id+"\">"+item[i].teacher_id+" / "+item[i].teacher_name+" / "+item[i].teacher_phone+"</option>";
						}
						
					}	
					
				}else{
					teach += "<option >해당과목이 가능한 강사가 존재하지 않습니다. 다른 과목을 선택해주세요.</option>";
				}
				
				
				$("#teach2").html(teach);
				
			}});
		
		
	});
	
	
	$(document).on("click",".delbtn",function() {
		
		var open_sub_id = $(this).val();
		var subject_name = $(this).parents("tr").find("td").eq(1).text();
		var sub_start_day =  $(this).parents("tr").find("td").eq(2).text();
		var sub_end_day =  $(this).parents("tr").find("td").eq(3).text();
		var book_name =  $(this).parents("tr").find("td").eq(4).text();
		var teacher_name =  $(this).parents("tr").find("td").eq(5).text();
		$(".modaltitle").text(open_sub_id+"/"+subject_name);
		$(".modalbody").text(sub_start_day+"~"+sub_end_day+"/"+book_name+"/"+teacher_name);
		$(".open_sub_id").val(open_sub_id);
		
		
		
		$("#oub-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var open_course_id = $(this).parents().find(".main").text().split("/")[0];

		console.log(open_course_id);
		var txt="";
		$.ajax({			
			url:"adminsubsearch",
			data:{"key":key, "value":value, "open_course_id":open_course_id},
			success:function(data){
				console.log(data);
				var item = JSON.parse(data);
					
				if(item.length != 0){
					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].open_sub_id+"</td>";
						txt += "<td>"+item[i].subject_name+"</td>";
						txt += "<td>"+item[i].sub_start_day+"</td>";
						txt += "<td>"+item[i].sub_end_day+"</td>";
						if(item[i].book_name == null || item[i].book_name == ""){
							txt += "<td>교재없음</td>";
						}else{
							txt += "<td>"+item[i].book_name+"</td>";
						}
						txt += "<td>"+item[i].teacher_name+"</td>";
						txt += "<td><button type='button' class='btn btn-default modifybtn' "+item[i].delcheck+" value=\""+item[i].open_sub_id+"\">수정</button></td>";
						txt += "<td><button type='button' class='btn btn-default delbtn' "+item[i].delcheck+" value=\""+item[i].open_sub_id+"\">삭제</button></td>";
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"8\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	
});


</script>