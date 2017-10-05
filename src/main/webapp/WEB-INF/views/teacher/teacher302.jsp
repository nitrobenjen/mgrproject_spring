<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${course.open_sub_id}</td>
						<td>${course.subject_name}</td>
						<td>${course.sub_start_day} ~ ${course.sub_end_day}</td>
						<td>${course.course_name}</td>
						<td>${course.course_start_day} ~ ${course.course_end_day}</td>
						<td>${course.class_name}</td>
						<td>${course.book_name}</td>
						<td>${course.chulsuk_total_grade}</td>
						<td>${course.filki_total_grade}</td>
						<td>${course.silki_total_grade}</td>
						<td>${course.test_date}</td>
						<td>${course.test_munje}</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>수료여부</th>
						<th>출석점수</th>
						<th>필기점수</th>
						<th>실기점수</th>
						<th>등록</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>STU089</td>
						<td>한성규</td>
						<td>010-4810-1424</td>
						<td>16/10/29</td>
						<td>수료(17/10/01)</td>
						<td>15</td>
						<td>15</td>
						<td>40</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#grade-mod-Modal">수정</button></td>
					</tr> -->
					
					<c:forEach var="a" items="${studentlist}">
					
					<tr>
						<td>${a.student_id}</td>
						<td>${a.student_name}</td>
						<td>${a.student_phone}</td>
						<td>${a.student_regdate}</td>
						<td>${empty a.finish_day?"수료예정(수료)":a.finish_day}</td>
						<td>${a.chulsuk_grade}</td>
						<td>${a.filki_grade}</td>
						<td>${a.silki_grade}</td>
						<td><button type="button" class="btn btn-default addbtn" value="${a.open_sub_id}">등록</button></td>						
						<td><button type="button" class="btn btn-default modifybtn" value="${a.open_sub_id}" ${a.chulsuk_grade == 0?"disabled":"" }>수정</button></td>
						
					</tr>
					
					</c:forEach>
					
				</tbody>
			</table>

			<div style="float:left;position:absolute">
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
						
<input type="hidden" value="${open_course_id}" class="open_course_id">
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


	<!-- 성적 등록 Modal -->
	<div class="modal fade" id="grade-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적관리 > 등록</h5>
				</div>
				<form class="form-horizontal" method="post" action="teachgradeadd">
					<div class="modal-body">

						<h4 class="modalbody">자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</h4>

						<hr>

						<div class="form-group">
							<label class="control-label col-sm-3">수강생ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="student_id" type="text" value="STU090" name="student_id" readonly>
							</div>
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="student_name" type="text" value="채지호" readonly name="student_name">
							</div>
							<label class="control-label col-sm-3 m10">출결점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="chulsuk_grade" name="chulsuk_grade">
							</div>
							<label class="control-label col-sm-3 m10">필기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="filki_grade" name="filki_grade">
							</div>
							<label class="control-label col-sm-3 m10">실기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="silki_grade" name="silki_grade">
							</div>
						</div>

					</div>
					<div class="modal-footer">
					<input type="hidden" class="open_sub_id" name="open_sub_id">
						<button type="submit" class="btn btn-default">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>

		</div>
	</div>


	<!-- 성적 수정 Modal -->
	<div class="modal fade" id="grade-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적관리 > 수정</h5>
				</div>
				<form class="form-horizontal" method="post" action="teachgrademodify">
					<div class="modal-body">

						<h4 class="modalbody2">자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</h4>

						<hr>
													<div class="form-group">
							<label class="control-label col-sm-3">수강생ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="student_id2" type="text" value="STU090" name="student_id" readonly>
							</div>
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="student_name2" type="text" value="채지호" readonly name="student_name">
							</div>
							<label class="control-label col-sm-3 m10">출결점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="chulsuk_grade2" name="chulsuk_grade">
							</div>
							<label class="control-label col-sm-3 m10">필기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="filki_grade2" name="filki_grade">
							</div>
							<label class="control-label col-sm-3 m10">실기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="number" id="silki_grade2" name="silki_grade">
							</div>
						</div>

					</div>
						<input type="hidden" class="open_sub_id2" name="open_sub_id">
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">수정</button>
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
	
	
	
	
	
	
	$(document).on("click",".modifybtn", function(){
		
		var open_sub_id = "${course.open_sub_id}";
		var subject_name = "${course.subject_name}";
		var sub_start_day = "${course.sub_start_day}";
		var sub_end_day = "${course.sub_end_day}";
		var chulsuk_total_grade = "${course.chulsuk_total_grade}";
		var filki_total_grade = "${course.filki_total_grade}";
		var silki_total_grade = "${course.silki_total_grade}";
		
		
		$(".modalbody2").text(subject_name+"("+sub_start_day+"~"+sub_end_day+")");
		var student_id = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var student_name =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		
		$(".open_sub_id2").val(open_sub_id);
		$("#student_id2").val(student_id);
		$("#student_name2").val(student_name);
		$("#chulsuk_grade2").attr("max", chulsuk_total_grade);
		$("#chulsuk_grade2").attr("placeholder", "max"+chulsuk_total_grade);
		$("#filki_grade2").attr("max", filki_total_grade);
		$("#filki_grade2").attr("placeholder", "max"+filki_total_grade);
		$("#silki_grade2").attr("max", silki_total_grade);
		$("#silki_grade2").attr("placeholder","max"+silki_total_grade);
		
		$("#grade-mod-Modal").modal("show");
		
	});
	
	
	$(document).on("click", ".addbtn",function(){
		//자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)
		var open_sub_id = "${course.open_sub_id}";
		var subject_name = "${course.subject_name}";
		var sub_start_day = "${course.sub_start_day}";
		var sub_end_day = "${course.sub_end_day}";
		var chulsuk_total_grade = "${course.chulsuk_total_grade}";
		var filki_total_grade = "${course.filki_total_grade}";
		var silki_total_grade = "${course.silki_total_grade}";
		
		
		$(".modalbody").text(subject_name+"("+sub_start_day+"~"+sub_end_day+")");
		var student_id = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var student_name =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
	
		$(".open_sub_id").val(open_sub_id);
		$("#student_id").val(student_id);
		$("#student_name").val(student_name);
		$("#chulsuk_grade").attr("max", chulsuk_total_grade);
		$("#chulsuk_grade").attr("placeholder", "max"+chulsuk_total_grade);
		$("#filki_grade").attr("max", filki_total_grade);
		$("#filki_grade").attr("placeholder", "max"+filki_total_grade);
		$("#silki_grade").attr("max", silki_total_grade);
		$("#silki_grade").attr("placeholder","max"+silki_total_grade);
		
		$("#grade-insert-Modal").modal("show");	

});

	
	

	
	$(document).on("click", ".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var open_course_id = $(".open_course_id").val();
		var open_sub_id = "${course.open_sub_id}";
		$(this).parents().find("li").removeClass("active");	
		var txt="";	
		var currentpage = 1;
		
		$(".currentpage").text(currentpage);
		$(this).parent().addClass("active");
		$.ajax({
			url:"teachgradesearch",
			data:{"key":key,"value":value, "open_course_id":open_course_id, "open_sub_id":open_sub_id},
			success:function(data){				
				var item = JSON.parse(data);
				
				if(item.length != 0){
					
					
					var totalpage = item[0].totalpage
					for(var i=0; i<item.length; i++){
						var modifydisabled = "";
						if(item[i].chulsuk_grade == 0 ){
							modifydisabled = "disabled";
						}
						
						txt += "<tr>";
						txt += "<td>"+item[i].student_id+"</td>";
						txt += "<td>"+item[i].student_name+"</td>";
						txt += "<td>"+item[i].student_phone+"</td>";
						txt += "<td>"+item[i].student_regdate+"</td>";
						if(item[i].finish_day == null){
							txt += "<td>수료예정(수료)</td>";
						}else{
							txt += "<td>"+item[i].finish_day+"</td>";
						}
						txt += "<td>"+item[i].chulsuk_grade+"</td>";
						txt += "<td>"+item[i].filki_grade+"</td>";
						txt += "<td>"+item[i].silki_grade+"</td>";
						
						var disabled ="";
						if(item[i].count_ == 0){
							disabled = "disabled";
						}else{
						}
						txt += "<td><button type=\"button\" class=\"btn btn-default addbtn\" value=\""+item[i].open_sub_id+"\">등록</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" "+modifydisabled+" value=\""+item[i].open_sub_id+"\">수정</button></td>";
						txt += "</tr>";	
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
					}
				
				}else{
					txt += "<tr><td colspan=\"9\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";
					page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagenum\"  >1</li>";
				}
				
				$(".pagination").html(page);
				$(".tbody").html(txt);
				
			}});
	
	
	});

	


	
	
	$(document).on("click", ".pagenum", function(){
		$(this).parents().find("li").removeClass("active");	
		var txt="";
		key= $("#key").val();
		value = $("#value").val();		
		var open_course_id = $(".open_course_id").val();
		var open_sub_id = "${course.open_sub_id}";
		var currentpage = $(this).text();
		$(".currentpage").text(currentpage);
		$(this).parent().addClass("active");
		$.ajax({
			url:"teachgradesearch",
			data:{"currentpage2":currentpage, "key":key,"value":value, "open_course_id":open_course_id, "open_sub_id":open_sub_id},
			success:function(data){
				var modifydisabled = "";
				var item = JSON.parse(data);
				var totalpage = item[0].totalpage
				for(var i=0; i<item.length; i++){
					
					
					txt += "<tr>";
					txt += "<td>"+item[i].student_id+"</td>";
					txt += "<td>"+item[i].student_name+"</td>";
					txt += "<td>"+item[i].student_phone+"</td>";
					txt += "<td>"+item[i].student_regdate+"</td>";
					if(item[i].finish_day == null){
						txt += "<td>수료예정(수료)</td>";
					}else{
						txt += "<td>"+item[i].finish_day+"</td>";
					}
					txt += "<td>"+item[i].chulsuk_grade+"</td>";
					txt += "<td>"+item[i].filki_grade+"</td>";
					txt += "<td>"+item[i].silki_grade+"</td>";
					
					var disabled ="";
					if(item[i].count_ == 0){
						disabled = "disabled";
					}else{
					}
					txt += "<td><button type=\"button\" class=\"btn btn-default addbtn\" value=\""+item[i].open_sub_id+"\">등록</button></td>";
					txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" "+modifydisabled+"   value=\""+item[i].open_sub_id+"\">수정</button></td>";
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
