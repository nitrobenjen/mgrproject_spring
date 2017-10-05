<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

			<h3>배점관리</h3>

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
						<th>등록</th>
						<th>수정</th>
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
						<td><button type="button" class="btn btn-default">등록</button></td>
						<td><button type="button" class="btn btn-default">수정</button></td>
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
						
							<td><button type="button" class="btn btn-default addbtn" value="${a.open_sub_id}" ${a.chulsuk_total_grade!=0 && a.test_date != null&& a.test_munje!=null ?"disabled":""}>등록</button></td>
							
							<td><button type="button" class="btn btn-default modifybtn" value="${a.open_sub_id}" ${a.chulsuk_total_grade!=0 && a.test_date != null&& a.test_munje!=null ?"":"disabled"}>수정</button></td>
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
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>





	<!-- 배점 등록 Modal -->
	<div class="modal fade" id="b-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">배점관리 > 등록</h5>
				</div>
				<form class="form-horizontal" action="teachbaejumadd" method="post" enctype="multipart/form-data">
					<div class="modal-body">

						<h4 class="modalbody">JDBC 프로그래밍(17/09/01 ~ 17/09/30)</h4>
						<h5 style="margin-left: 15px;">ㆍ출결, 필기, 실기의 총 배점은 100점입니다.
							100점보다 적거나 많을 수 없습니다.</h5>
						<h5 style="margin-left: 15px;">ㆍ시험일은 과목기간을 벗어날 수 없습니다.</h5>
						<h5 style="margin-left: 15px;">ㆍ시험문제 파일은 .zip 확장자만 등록할 수
							있습니다.</h5>

						<hr>
			
		
						<div class="form-group">
							<label class="control-label col-sm-3">과목ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="open_sub_id" type="text" name="open_sub_id" readonly>
							</div>
							<div class="col-sm-12 m10" style="margin-left: 63px;">
									<label style="padding-right: 15px;">출결배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-left:15px;margin-right:15px;" type="text" id="chulsuk_total_grade" name="chulsuk_total_grade">
									<label style="padding-right: 15px;">필기배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-right:15px;"  type="text" id="filki_total_grade" name="filki_total_grade">
									<label style="padding-right: 15px;">실기배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-right:15px;" type="text" type="text" id="silki_total_grade" name="silki_total_grade">
							</div>
							<label class="control-label col-sm-3 m10">시험일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="test_date"
									name="test_date" placeholder="시험일(YYYY-MM-DD)"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">시험문제</label>
							<div class="col-sm-9 m10">
								<input type="file" class="form-control" id="test_munje"
								name="test_munje" required="required"> <span
								class="help-block">(only .zip)</span>
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
	




	<!-- 배점 수정 Modal -->
	<div class="modal fade" id="b-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">배점관리 > 수정</h5>
				</div>
				<form class="form-horizontal"  action="teachbaejummodify" method="post" enctype="multipart/form-data">
					<div class="modal-body">

						<h4 class="modalbody2">자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</h4>
						<h5 style="margin-left: 15px;">ㆍ출결, 필기, 실기의 총 배점은 100점입니다.
							100점보다 적거나 많을 수 없습니다.</h5>
						<h5 style="margin-left: 15px;">ㆍ시험일은 과목기간을 벗어날 수 없습니다.</h5>
						<h5 style="margin-left: 15px;">ㆍ시험문제 파일은 .zip 확장자만 등록할 수
							있습니다.</h5>

						<hr>

						<div class="form-group">
							<label class="control-label col-sm-3">과목ID</label>
							<div class="col-sm-9">
								<input class="form-control" id=open_sub_id2 type="text" value="OUB001" name="open_sub_id" readonly>
							</div>
								<div class="col-sm-12 m10" style="margin-left: 63px;">
									<label style="padding-right: 15px;">출결배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-left:15px;margin-right:15px;" type="text" id="chulsuk_total_grade2" name="chulsuk_total_grade">
									<label style="padding-right: 15px;">필기배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-right:15px;"  type="text" id="filki_total_grade2" name="filki_total_grade">
									<label style="padding-right: 15px;">실기배점</label><input class="form-control"
										style="width:70px;display:inline-block;margin-right:15px;" type="text" type="text" id="silki_total_grade2" name="silki_total_grade">
							</div>
							<label class="control-label col-sm-3 m10">시험일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="test_date2"
									name="test_date" placeholder="시험일(YYYY-MM-DD)"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">시험문제</label>
							<div class="col-sm-9 m10">
								<input type="file" class="form-control" id="test_munje2"
								name="test_munje" required="required"> <span
								class="help-block">(only .zip)</span>
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
	
	<script>
$(document).ready(function() {
	var key="";
	var value="";
	
	  $('#test_date').datepicker({
	    	dateFormat: "yy-mm-dd",
	    	
	    });
	
	
	$(document).on("click",".addbtn",function() {
		
/* 		JDBC 프로그래밍(17/09/01 ~ 17/09/30) */
		var open_sub_id = $(this).val();
		var subject_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var sub_start_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[0];
		var sub_end_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[1];
		var chulsuk_total_grade =  $(this).parent().prev().prev().prev().prev().prev().text();
		var filki_total_grade =  $(this).parent().prev().prev().prev().prev().text();
		var silki_total_grade =  $(this).parent().prev().prev().prev().text();
		var test_date=  $(this).parent().prev().prev().text();
		var test_munje =  $(this).parent().prev().text();
		$("#open_sub_id").val(open_sub_id);		
		$(".modalbody").text(subject_name+"("+sub_start_day+"~"+sub_end_day+")");
		$("#chulsuk_total_grade").attr("placeholder", chulsuk_total_grade);
		$("#filki_total_grade").attr("placeholder", filki_total_grade);
		$("#silki_total_grade").attr("placeholder", silki_total_grade);
		$("#test_date").attr("placeholder", test_date);
		
		
		$("#b-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		
		var open_sub_id = $(this).val();
		var subject_name = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		var sub_start_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[0];
		var sub_end_day =  $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text().split("~")[1];
		var chulsuk_total_grade =  $(this).parent().prev().prev().prev().prev().prev().prev().text();
		var filki_total_grade =  $(this).parent().prev().prev().prev().prev().prev().text();
		var silki_total_grade =  $(this).parent().prev().prev().prev().prev().text();
		var test_date=  $(this).parent().prev().prev().prev().text();
		var test_munje =  $(this).parent().prev().prev().text();
		$("#open_sub_id2").val(open_sub_id);		
		$(".modalbody2").text(subject_name+"("+sub_start_day+"~"+sub_end_day+")");
		$("#chulsuk_total_grade2").attr("placeholder", chulsuk_total_grade);
		$("#filki_total_grade2").attr("placeholder", filki_total_grade);
		$("#silki_total_grade2").attr("placeholder", silki_total_grade);
		$("#test_date2").attr("placeholder", test_date);
		
		$("#b-mod-Modal").modal("show");
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
						var adddisabled ="";
						var modifydabiled="";
						if(item[i].chulsuk_total_grade != 0 && item[i].test_date != null && item[i].test_munje != null){
							adddisabled = "disabled";
						}else{
							modifydabiled = "disabled";
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
						
						
						txt += "<td><button type=\"button\" class=\"btn btn-default addbtn\" value=\""+item[i].open_sub_id+"\" "+adddisabled+">등록</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].open_sub_id+"\" "+modifydabiled+">수정</button></td>";
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
