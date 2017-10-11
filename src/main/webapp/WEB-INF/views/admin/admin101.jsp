			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
			<h3>기초 정보 관리 > 과정명</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 				<tr>
						<td>CU001</td>
						<td>웹기반 빅데이터 분석 응용SW개발자</td>
						<td><button type="button" class="btn btn-default modifybtn">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn">삭제</button></td>
					</tr>	 -->		
				
				<c:forEach var="a" items="${courselist}">
				<tr>
				<td>${a.course_id}</td>
				<td>${a.course_name}</td>
				<td><button type="button" class="btn btn-default modifybtn" value="${a.course_id}">수정</button></td>
				<td><button type="button" class="btn btn-default delbtn" ${a.check} value="${a.course_id}">삭제</button></td>				
				</tr>
				</c:forEach>
							
				</tbody>
			</table>


			<form class="form-inline" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn">등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="course_id">과정ID</option>
						<option value="course_name">과정명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>




	<!-- 과정 입력 Modal -->
	<div class="modal fade" id="cu-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">과정명 등록</h5>
				</div>
				<form class="form-horizontal" action="adminbasiccourseadd" method="post">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 과정명을 입력해 주세요.</h4>

					<hr>
						<div class="form-group">
							<label class="control-label col-sm-2">과정명</label>
							<div class="col-sm-10">
								<input class="form-control" name="course_name" type="text">
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





	<!-- 과정 수정 Modal -->
	<div class="modal fade" id="cu-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">CU001 과정명 수정</h5>
				</div>
				<form class="form-horizontal" action="adminbasiccoursemodify" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">웹기반 빅데이터 분석 응용SW개발자</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">과정명</label>
							<div class="col-sm-10">
								<input class="form-control modalinput" id="focusedInput" type="text" name="course_name">
								<input type="hidden" class="course_id" name="course_id">
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



	<!-- 과정 삭제 Modal -->
	<div class="modal fade" id="cu-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">CU001 과정명 삭제</h5>
				</div>
				<form class="form-horizontal" action="adminbasiccoursedel" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">웹기반 빅데이터 분석 응용SW개발자</h4>
					
					<h4 style="text-align:center;">과정을 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
				<input type="hidden" class="course_id" name="course_id">
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
	
	
	$(document).on("click",".addbtn",function() {
				
		$("#cu-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		
		var course_id = $(this).val();
		var course_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(course_id+" 과정명 수정");
		$(".modalbody").text(course_name);
		$(".modalinput").attr("placeholder", course_name);
		$(".course_id").val(course_id);
		
		$("#cu-mod-Modal").modal("show");
	});
	
	$(document).on("click",".delbtn",function() {
		
		var course_id = $(this).val();
		var course_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(course_id+" 과정 삭제");
		$(".modalbody").text(course_name);
		$(".course_id").val(course_id);
		
		
		$("#cu-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"adminbasiccoursesearch",
			data:{"key":key, "value":value},
			success:function(data){
				console.log(data);
				var item = JSON.parse(data);
					
				if(item.length != 0){
					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].course_id+"</td>";
						txt += "<td>"+item[i].course_name+"</td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].course_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+" value=\""+item[i].course_id+"\">삭제</button></td>";
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"4\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	
});


</script>