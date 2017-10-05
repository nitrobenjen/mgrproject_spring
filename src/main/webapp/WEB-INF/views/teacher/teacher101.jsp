<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


			<h3>강의스케쥴 > 강의 예정</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th style="width: 100px;">과목기간</th>
						<th>과정명</th>
						<th style="width: 100px;">과정기간</th>
						<th>강의실</th>
						<th>교재명</th>
						<th>수강생인원</th>
						<th>수강생</th>
					</tr>
				</thead>
				<tbody class="tbody">
						<!-- <tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>17/07/01 ~ 17/07/31</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>17/03/01 ~ 17/10/01</td>
						<td>제2강의실</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>24/40</td>
						<td><button type="button" class="btn btn-default stulist">명단</button></td>
					</tr>
					 -->
					<c:if test="${fn:length(sublist) > 0}">
					
							<c:forEach var="a" items="${sublist}">
									
							<tr>
								<td>${a.open_sub_id}</td>
								<td>${a.subject_name}</td>
								<td>${a.sub_start_day}~${a.sub_end_day}</td>
								<td>${a.course_name}</td>
								<td>${a.course_start_day}~${a.course_end_day}</td>
								<td>${a.class_name}</td>
								<td>${a.book_name}<button type="button" class="btn btn-default imgview" value="${a.book_imgname}" ${empty a.book_imgname?"disabled":""}>이미지</button></td>
								<td>${a.student_count}/${a.jungwon}</td>
								<td><button type="button" class="btn btn-default stulist" ${a.student_count ==0 ?"disabled":"" } value="${a.open_course_id}">명단</button></td>
							</tr>	
									
									
							</c:forEach>
					</c:if>
					<c:if test="${fn:length(sublist) == 0}">
					<tr><td colspan=9 style="text-align: center;">검색된 결과가 없습니다.</td></tr>
					
					</c:if>
				
								
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
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



	<!-- 수강생 명단 Modal -->
	<div class="modal fade" id="pre-list-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강의스케쥴 > 강의 예정 > 수강생 정보</h5>
				</div>
				<form class="form-horizontal">
					<div class="modal-body">

						<h4 class="modalbody">자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</h4>

						<hr>
						<table class="table table-striped table-bordered ocu">
							<thead>
								<tr>
									<th>수강생 ID</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>등록일</th>
									<th>수료여부</th>
								</tr>
							</thead>
							<tbody class="tbody2">
				<!-- 			<tr>
									<td>STU001</td>
									<td>홍길동</td>
									<td>010-1234-1234</td>
									<td>17/03/21</td>
									<td>중도탈락(17-06-29)</td>
								</tr> -->
						
								
								
							</tbody>
						</table>
						

						<div style="text-align: center;">

							<ul class="pagination pagenum" style="margin: 0px 0px 20px 0px;">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
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
	
	
	$(document).on("click", ".imgview", function(){

		 // text: '교재설명.',

		swal({
			  title: $(this).parent().text(),
			  imageUrl: $(this).val(),
			  imageWidth: 200,
			  imageHeight: 200,
			  imageAlt: 'Custom image',
			  animation: false
			});
		
	});
	
	
	$(document).on("click", ".stulist", function(){
		
		var subject_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var sub_start_day = $(this).parent().prev().prev().prev().prev().prev().prev().text().split("~")[0];
		var sub_end_day = $(this).parent().prev().prev().prev().prev().prev().prev().text().split("~")[1];
		$(".modalbody").text(subject_name+"("+sub_start_day+"~"+sub_end_day+")");
		var open_course_id = $(this).val();
		var pagenum = "";
		var txt = "";
		var pagecount=1;
		
		$.ajax({
			
			
			url:"teachschedulestulist",
			data:{"open_course_id":open_course_id},
			success: function(data){
				var item = JSON.parse(data);
				var totalpage = item[0].totalpage;
				
					if(item.length >0 ){
						for(var i=0; i<item.length; i++){
							txt += "<tr>";
							txt +="<td>"+item[i].student_id+"</td>";
							txt +="<td>"+item[i].student_name+"</td>";
							txt +="<td>"+item[i].student_phone+"</td>";
							txt +="<td>"+item[i].student_regdate+"</td>";
							
							if(item[i].finish_day == null || item[i].finish_day == ""){
								txt +="<td>수료예정(수료)</td>";
							}else{
								txt +="<td>"+item[i].finish_day+"중도탈락</td>";
							}
							
							
							txt +="</tr>";
						}
						
						
						
						//페이징 번호
						for(var i=1; i<totalpage+1; i++){
							
							if(pagecount == 1){
								pagenum+= "<li class=\"active\"><a href=\"#\" class=\"pagebtn\">"+pagecount+"</a></li>";
							}else{
								pagenum+= "<li><a href=\"#\" class=\"pagebtn\">"+pagecount+"</a></li>";
							}						
							pagecount++;
							
						}
					
				}
				
				
				$(".pagenum").html(pagenum);
				$(".tbody2").html(txt);
				$("#pre-list-Modal").modal("show");
			}
			
		});
		
	});
	
	
	//수강생 목록 페이징 처리 버튼
	$(document).on("click",".pagebtn", function(){	
		
		$(this).parents().find("li").removeClass("active");	
		var txt="";
		var pagenum="";
		key= $("#key").val();
		value = $("#value").val();
		var open_course_id = $(".stulist").val();
		
		var currentpage = $(this).text();
		console.log(currentpage);
		$(".currentpage").text(currentpage);
		$(this).parent().addClass("active");
		$.ajax({
			url:"teachschedulestulist",
			data:{"currentpage2":currentpage, "open_course_id":open_course_id},
			success:function(data){
				
				var item = JSON.parse(data);
				var totalpage = item[0].totalpage
				if(item.length >0 ){
					for(var i=0; i<item.length; i++){
						txt += "<tr>";
						txt +="<td>"+item[i].student_id+"</td>";
						txt +="<td>"+item[i].student_name+"</td>";
						txt +="<td>"+item[i].student_phone+"</td>";
						txt +="<td>"+item[i].student_regdate+"</td>";
						
						if(item[i].finish_day == null || item[i].finish_day == ""){
							txt +="<td>수료예정(수료)</td>";
						}else{
							txt +="<td>"+item[i].finish_day+"중도탈락</td>";
						}
						
						
						txt +="</tr>";
					}
					
					
					
					//페이징 번호
					for(var i=1; i<totalpage+1; i++){
					
						if(currentpage == i){
							pagenum+= "<li class=\"active\"><a href=\"#\" class=\"pagebtn\">"+i+"</a></li>";
						}else{
							pagenum+= "<li><a href=\"#\" class=\"pagebtn\">"+i+"</a></li>";
						}
							
									
						
					}
				
			}
				$(".pagenum").html(pagenum);
				$(".tbody2").html(txt);
				$("#pre-list-Modal").modal("show");
				
			}});
			
		});
		
		
	});


	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"teachcoursesearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
					
						txt += "<tr>";
						txt += "<td>"+item[i].open_sub_id+"</td>";
						txt += "<td>"+item[i].subject_name+"</td>";
						txt += "<td>"+item[i].sub_start_day+"~"+item[i].sub_end_day+"</td>";
						txt += "<td>"+item[i].course_name+"</td>";
						txt += "<td>"+item[i].course_start_day+"~"+item[i].course_end_day+"</td>";
						txt += "<td>"+item[i].class_name+"</td>";
						if(item[i].book_imgname ==null || item[i].book_imgname ==""){
							txt += "<td>"+item[i].book_name+"<button type=\"button\" class=\"btn btn-default imgview\" value=\""+item[i].book_imgname+"\" disabled>이미지</button></td>";
						}else{
							txt += "<td>"+item[i].book_name+"<button type=\"button\" class=\"btn btn-default imgview\" value=\""+item[i].book_imgname+"\">이미지</button></td>";
						}
						txt += "<td>"+item[i].student_count+"/"+item[i].jungwon+"</td>";
							if(item[i].student_count == 0){
								txt +="<td><button type=\"button\" class=\"btn btn-default stulist\" disabled value=\""+item[i].open_course_id+"\">명단</button></td>";
							}else{
									txt+="<td><button type=\"button\" class=\"btn btn-default stulist\" value=\""+item[i].open_course_id+"\">명단</button></td>";	
							}
						
						txt += "</tr>";
						
					}
					
				}else{
					txt += "<tr><td colspan=\"9\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});



</script>