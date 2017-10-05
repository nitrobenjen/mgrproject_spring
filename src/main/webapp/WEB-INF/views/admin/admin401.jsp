			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>수강생 관리 > 수강생 정보</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생ID</th>
						<th>이름</th>
						<th>주민번호</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>과정등록</th>
						<th>수강이력</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
			<!-- 		<tr>
						<td>STU001</td>
						<td>홍길동</td>
						<td>1022432</td>
						<td>010-1234-1234</td>
						<td>17/03/21</td>
						<td><button type="button" class="btn btn-default addbtncourse">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="countview">0</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default modifybtn">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn">삭제</button></td>
					</tr> -->
					<c:forEach var="a" items="${studentlist}">
					<tr>
						<td>${a.student_id}</td>
						<td>${a.student_name}</td>
						<td>${a.student_ssn}</td>
						<td>${a.student_phone}</td>
						<td>${a.student_regdate}</td>
						<td><button type="button" class="btn btn-default addbtncourse" value="${a.student_id}">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm courselistbtn" value="${a.student_id}"  ${a.count_==0?"disabled":""}>
								<span class="badge" id="countview">${a.count_}</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default modifybtn" value="${a.student_id}">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn"  value="${a.student_id}"  ${a.delcheck}>삭제</button></td>
					</tr>
					
					</c:forEach>
					
				</tbody>
			</table>
			
			<div style="position:absolute;">
			<button type="button" class="btn btn-default addbtn">수강생 등록</button>
			<button type="button" class="btn btn-primary " >현재페이지<span class="badge currentpage">1</span></button>
			</div>
			<div style="text-align: center;">			
				<ul class="pagination" style="margin:0px 0px 20px 0px;">
				<c:if test="${totalpage > 0}">				
						<li class="active"><a href="#" class="pagenum" id="1">1</a></li>
									<c:if test="${totalpage >= 3}">
										<li class="disabled"><a href="#" class="number pagenum"  >...</a></li>
												<c:forEach begin="2" end="${totalpage}" varStatus="status">
													<c:if test="${status.count <5}">
														<li><a href="#" class="pagenum" id="${status.count+1}">${status.count+1}</a></li>
													</c:if>													
												</c:forEach>									 
							 </c:if>											
							<c:if test="${totalpage >= 2}">
									<li class="disabled"><a href="#" class="number pagenum"  >...</a></li>
									<li><a href="#" class="pagenum" id="${totalpage}">${totalpage}</a></li>							
							</c:if>
				</c:if>
								</ul>
			</div>
						

			<form class="form-inline" style="text-align: center;">
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="student_name">이름</option>
						<option value="student_phone">전화번호</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>
			

			
			<!-- 수강이력 -->
			<form class="form-inline" id="courselist" action="admin402" method="POST">
				<input type="hidden" name="student_id" class="student_id402">
				<input type="hidden" name="student_name" class="student_name402">
				<input type="hidden" name="student_phone" class="student_phone402">			
			</form>




	<!-- 수강생 등록 Modal -->
	<div class="modal fade" id="student-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수강생 등록</h5>
				</div>
				<form class="form-horizontal" method="post" action="adminstuinfoadd">
				<div class="modal-body">

					
						<div class="form-group">
							<label class="control-label col-sm-3">수강생 이름</label>
							<div class="col-sm-9">
								<input class="form-control" name="student_name" type="text">
							</div>
							<label class="control-label col-sm-3 m10">주민등록번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" name="student_ssn" type="text">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" name="student_phone" type="text">
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


	<!-- 수강 과정 등록 Modal -->
	<div class="modal fade" id="student-ocu-Modal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수강 과정 등록</h5>
				</div>
				
				<div class="modal-body">
				
				<h3 style="text-align: center;" class="modalbody2"></h3>
				
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
						<th>과목수</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody class="tbody2">
					<!-- <tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>1/25</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td>2</td>
						<td><input type="radio" name="optradio"></td>
					</tr> -->
					
				</tbody>
			</table>
			
				</div>
				<form action="adminStuCourseAdd">
				<input type="hidden" class="stucourseaddstu" name="student_id">
				<input type="hidden" class="stucourseaddcourse" name="open_course_id">
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>




	<!-- 수강생 수정 Modal -->
	<div class="modal fade" id="student-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 삭제</h5>
				</div>
				<form class="form-horizontal" action="adminstumodify">
				<div class="modal-body">

					
						<div class="form-group">
							<label class="control-label col-sm-3">수강생 ID</label>
							<div class="col-sm-9">
								<input class="form-control idmodify" name="student_id"  readonly placeholder="">
							</div>
							<label class="control-label col-sm-3 m10">수강생 이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control namemodify" name="student_name"  >
							</div>
							<label class="control-label col-sm-3 m10">주민등록번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control ssnmodify" name="student_ssn"  >
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control phonemodify" name="student_phone"  >
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>


	<!-- 수강생 삭제 Modal -->
	<div class="modal fade" id="student-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">개설 과정 삭제</h3>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;font-weight:bold;" class="modalbody">STU001 / 홍길동 / 010-1234-1234</h4>
					<h4 style="text-align: center;">수강생을 삭제하시겠습니까?</h4>
				</div>
				<form action="adminstudel">
				
				
				<div class="modal-footer">
				<input type="hidden" class="student_id" name="student_id">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>


<script>
$(document).ready(function() {
	var key= "";
	var value = "";
	

	
	$(document).on("click", ".open_course_id", function(){
		
		var student_id = $(this).parents().find(".modalbody2").text().split("/")[0];
		var opent_course_id = $(this).val();
	
		$(".stucourseaddstu").val(student_id);
		$(".stucourseaddcourse").val(opent_course_id);
		
		
		
	});
	
	
	$(document).on("click", ".addbtncourse", function(){	
		
		var student_id = $(this).val();
	    var student_name = $(this).parent().prev().prev().prev().prev().text();
	    var student_phone = $(this).parent().prev().prev().text();
	    $(".modalbody2").text(student_id+"/"+student_name+"/"+student_phone);
	    var txt="";
	    
	    $.ajax({
	    
	    	url:"adminstucourseaddlist",
	    	data:{"student_id":student_id},
	    	success:function(data){
	    		
				var item = JSON.parse(data);				
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
						var disabled="";
						if(item[i].studentcount >= item[i].jungwon){
							disabled="disabled";
						}
						
						txt +="<tr>";
			    		txt +="<td>"+item[i].open_course_id+"</td>";
			    		txt +="<td>"+item[i].course_name+"</td>";
			    		txt +="<td>"+item[i].class_name+"</td>";
			    		txt +="<td>"+item[i].studentcount+"/"+item[i].jungwon+"</td>";
			    		txt +="<td>"+item[i].course_start_day+"</td>";
			    		txt +="<td>"+item[i].course_end_day+"</td>";
			    		txt +="<td>"+item[i].subcount+"</td>";
			    		txt +="<td><input type=\"radio\" name=\"open_course_id\" "+disabled+" "+item[i].addcheck+" "+item[i].delcheck+" class='open_course_id' value=\""+item[i].open_course_id+"\"></td>";
			    		txt +="</tr>";
						
					}
					
				}else{
					txt += "<tr><td colspan=\"8\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";
					
				}
	    		
				   $(".tbody2").html(txt);
				    
					$("#student-ocu-Modal").modal("show");
	    		
	    	}});
	    
	 
		
	});
	
	$(document).on("click", ".courselistbtn", function(){
		
		var student_id = $(this).val();
	    var student_name = $(this).parent().prev().prev().prev().prev().prev().text();
	    var student_phone = $(this).parent().prev().prev().prev().prev().text();
	    
	    $(".student_id402").val(student_id);
	    $(".student_name402").val(student_name);
	    $(".student_phone402").val(student_phone);
	    
		$("#courselist").submit();
		
	});
	
	
	$(document).on("click",".modifybtn", function(){
		
		var student_id = $(this).val();
		var student_name = $(this).parents("tbody tr").children().eq(1).text();
		var student_ssn = $(this).parents("tbody tr").children().eq(2).text();
		var student_phone = $(this).parents("tbody tr").children().eq(3).text();
		
		$(".idmodify").val(student_id);
		
		$(".namemodify").val(student_name);
		$(".ssnmodify").val(student_ssn);
		$(".phonemodify").val(student_phone);
		
		$(".idmodify").attr("placeholder", student_id);
		$(".namemodify").attr("placeholder", student_name);
		$(".ssnmodify").attr("placeholder", student_ssn);
		$(".phonemodify").attr("placeholder", student_phone);
		
		$("#student-mod-Modal").modal("show");
		
	});
	
	



	$(document).on("click",".delbtn", function(){
		
		var student_id = $(this).val();
		var student_name = $(this).parents("tbody tr").children().eq(1).text();
		var student_ssn = $(this).parents("tbody tr").children().eq(2).text();
		var student_phone = $(this).parents("tbody tr").children().eq(3).text();	
		
		$(".modalbody").text(student_id+"/"+student_name+"/"+student_phone);
		$(".student_id").val(student_id);
		
		$("#student-del-Modal").modal("show");
		
	});
	
	
	$(document).on("click", ".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		$(this).parents().find("li").removeClass("active");	
		var txt="";	
		var currentpage = 1;
		
		$(".currentpage").text(currentpage);
		$(this).parent().addClass("active");
		$.ajax({
			url:"adminstupagesearch",
			data:{"key":key,"value":value},
			success:function(data){				
				var item = JSON.parse(data);
				
				if(item.length != 0){
					
					
					var totalpage = item[0].totalpage
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].student_id+"</td>";
						txt += "<td>"+item[i].student_name+"</td>";
						txt += "<td>"+item[i].student_ssn+"</td>";
						txt += "<td>"+item[i].student_phone+"</td>";
						txt += "<td>"+item[i].student_regdate+"</td>";
						
						var disabled ="";
						if(item[i].count_ == 0){
							disabled = "disabled";
						}else{
						}
						txt += "<td><button type=\"button\" class=\"btn btn-default addbtncourse\" value=\""+item[i].student_id+"\">등록</button></td>";				
					
						txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm courselistbtn\" "+disabled+" value=\""+item[i].student_id+"\"> <span class=\"badge\" id=\"countview\" >"+item[i].count_+"</span> 보기 </button></td>"
						
						
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].student_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].delcheck+" value=\""+item[i].student_id+"\">삭제</button></td>";
						txt += "</tr>";	
					}
					var page="";

					console.log(totalpage);
					
					//페이지 그리기
					if(totalpage > 0){
						page += "<li><a href=\"#\" class=\"number pagenum\" value=\"1\">1</li>";
						
						var group=0;
						var number = Number(currentpage);
						var countpage = 5; 
						var start = (Math.floor(number / 5))+1;
						var end = start*countpage ;
						
						if(totalpage >= 3){
							page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\" >...</li>";
								for(var i=start*countpage-countpage-1; i<=end; i++){
									
									if(i == -1 || i == 0){
										
									}else{										
											if(end >= totalpage){
												end==totalpage;
											}
											if(i == totalpage){
												break;
											}										
											if(number == i){
												page+="<li class='active'><a href=\"#\" class=\"number pagenum\" >"+i+"</li>";
											}else{
												page+="<li><a href=\"#\" class=\"number pagenum\" >"+i+"</li>";
											}
												
									}
							}
							
					}
						if(totalpage >=2 ){
							page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\"  >...</li>";
							page += "<li><a href=\"#\" class=\"number pagenum\" value=\""+totalpage+"\">"+totalpage+"</li>";
						}
						
					}
					
					
				}else{
					txt += "<tr><td colspan=\"9\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";
					page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\"  >1</li>";
				}
				
				$(".pagination").html(page);
				$(".tbody").html(txt);
				
			}});
	
	
	});

	$(document).on("click",".subcountbtn", function(){
		
		var teacher_id = $(this).val();
		var teacher_name = $(this).parents("tbody tr").children().eq(1).text();
		var teacher_phone = $(this).parents("tbody tr").children().eq(3).text();
		var countbody = ""+teacher_id+" "+teacher_name+"/"+teacher_phone+"";
		
		$(".countbody").text(countbody);
		
		var txt="";
		$.ajax({			
			url :"adminteachsub",
			data : {"teacher_id":teacher_id},
			success : function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){					
					txt += "<tr><td>"+item[i].subject_id+"</td><td>"+item[i].subject_name+"</td></tr>";				
				} 
				
				$(".teachsub").html(txt);
				$("#tlist-Modal").modal("show");

			}});
		
	});

	$(".addbtn").on("click", function(){
		
				$("#student-insert-Modal").modal("show");	
		
	});
	
	
	
	$(document).on("click", ".pagenum", function(){
		$(this).parents().find("li").removeClass("active");	
		var txt="";
		key= $("#key").val();
		value = $("#value").val();		
		var currentpage = $(this).text();
		$(".currentpage").text(currentpage);
		$(this).parent().addClass("active");
		$.ajax({
			url:"adminstupage",
			data:{"currentpage2":currentpage, "key":key,"value":value},
			success:function(data){
				
				var item = JSON.parse(data);
				var totalpage = item[0].totalpage
				for(var i=0; i<item.length; i++){
					
					txt += "<tr>";
					txt += "<td>"+item[i].student_id+"</td>";
					txt += "<td>"+item[i].student_name+"</td>";
					txt += "<td>"+item[i].student_ssn+"</td>";
					txt += "<td>"+item[i].student_phone+"</td>";
					txt += "<td>"+item[i].student_regdate+"</td>";
					
					var disabled ="";
					if(item[i].count_ == 0){
						disabled = "disabled";
					}else{
					}
					txt += "<td><button type=\"button\" class=\"btn btn-default addbtncourse\" value=\""+item[i].student_id+"\">등록</button></td>";				
				
					txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm courselistbtn\" "+disabled+" value=\""+item[i].student_id+"\"> <span class=\"badge\" id=\"countview\" >"+item[i].count_+"</span> 보기 </button></td>"
					
					
					txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].student_id+"\">수정</button></td>";
					txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].delcheck+" value=\""+item[i].student_id+"\">삭제</button></td>";
					txt += "</tr>";	
				}
				var page="";
					
				
				//페이지 그리기
				if(totalpage != 0){
					page += "<li><a href=\"#\" class=\"number pagenum\" value=\"1\">1</li>";
					var group=0;
					var number = Number(currentpage);
					var countpage = 5; 
					var start = (Math.floor(number / 5))+1;
					var end = start*countpage ;
					
					if(totalpage >= 3){
						page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\" >...</li>";
				
						
							for(var i=start*countpage-countpage-1; i<=end; i++){
								
								if(i == -1 || i == 0){
									
								}else{
									
									if(end >= totalpage){
										end==totalpage;
									}
									if(i == totalpage){
										break;
									}
									
									if(number == i){
										page+="<li class='active'><a href=\"#\" class=\"number pagenum\" >"+i+"</li>";
									}else{
										page+="<li><a href=\"#\" class=\"number pagenum\" >"+i+"</li>";
									}
											
								
									
								}
									
							
						}
						
						
				}
						
						
					
					
					if(totalpage >=2 ){
						page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\"  >...</li>";
						page += "<li><a href=\"#\" class=\"number pagenum\" value=\""+totalpage+"\">"+totalpage+"</li>";
					}
					
				}
				$(".pagination").html(page);
				$(".tbody").html(txt);
				
			}});
	
	
	});
		
		
});



</script>