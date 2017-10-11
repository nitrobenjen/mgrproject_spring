			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

			<h3>성적 관리 > 수강생별</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생 ID</th>
						<th>이름</th>
						<th>주민번호 뒷자리</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>수강횟수</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<!-- <tr>
						<td>STU002</td>
						<td>이순신</td>
						<td>1544236</td>
						<td>010-4758-6532</td>
						<td>17/03/21</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
					</tr> -->
					
					<c:forEach var="a" items="${studentlist}">
					<tr>
						<td>${a.student_id}</td>
						<td>${a.student_name}</td>
						<td>${a.student_ssn}</td>
						<td>${a.student_phone}</td>
						<td>${a.student_regdate}</td>
						<td><button type="button" class="btn btn-default btn-sm courselistbtn" value="${a.student_id}"  ${a.count_==0?"disabled":""}>
								<span class="badge" id="countview">${a.count_}</span> 보기
							</button></td>
					</tr>
					
					</c:forEach>
					
				</tbody>
			</table>
			
			<div style="position:absolute;">
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
			<form class="form-inline" id="courselist" action="admin502-sub" method="POST">
				<input type="hidden" name="student_id" class="student_id402">
				<input type="hidden" name="student_name" class="student_name402">
				<input type="hidden" name="student_phone" class="student_phone402">			
			</form>


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
	
	
	
	$(document).on("click", ".courselistbtn", function(){
		
		var student_id = $(this).val();
	    var student_name = $(this).parent().prev().prev().prev().prev().text();
	    var student_phone = $(this).parent().prev().prev().text();
	    
	    $(".student_id402").val(student_id);
	    $(".student_name402").val(student_name);
	    $(".student_phone402").val(student_phone);
	    
		$("#courselist").submit();
		
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
					
						txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm courselistbtn\" "+disabled+" value=\""+item[i].student_id+"\"> <span class=\"badge\" id=\"countview\" >"+item[i].count_+"</span> 보기 </button></td>"
						
												
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
							
				
					txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm courselistbtn\" "+disabled+" value=\""+item[i].student_id+"\"> <span class=\"badge\" id=\"countview\" >"+item[i].count_+"</span> 보기 </button></td>"
					
					
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