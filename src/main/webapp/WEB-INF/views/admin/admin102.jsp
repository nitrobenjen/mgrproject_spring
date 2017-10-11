			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


			<h3>기초 정보 관리 > 과목명</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<!-- <tr>
						<td>SUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td><button type="button" class="btn btn-default modifybtn">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn">삭제</button></td>
					</tr> -->
					<c:forEach var="a" items="${sublist}">
				<tr>
				<td>${a.subject_id}</td>
				<td>${a.subject_name}</td>
				<td><button type="button" class="btn btn-default modifybtn" value="${a.subject_id}">수정</button></td>
				<td><button type="button" class="btn btn-default delbtn" ${a.check} value="${a.subject_id}">삭제</button></td>				
				</tr>
				</c:forEach>
					
				</tbody>
			</table>
			

			<form class="form-inline" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn" >등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="subject_id">과목ID</option>
						<option value="subject_name">과목명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>




	<!-- 과목 입력 Modal -->
	<div class="modal fade" id="sub-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">과목명 등록</h5>
				</div>
				<form class="form-horizontal"  action="adminbasicsubadd" method="post">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 과목명을 입력해 주세요.</h4>

					<hr>
				
					
						<div class="form-group">
							<label class="control-label col-sm-2">과목명</label>
							<div class="col-sm-10">
								<input class="form-control" name="subject_name" type="text">
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





	<!-- 과목 수정 Modal -->
	<div class="modal fade" id="sub-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">SUB001 과목명 수정</h5>
				</div>
				<form class="form-horizontal" action="adminbasicsubmodify" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">자바 네트워트 프로그래밍</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">과목명</label>
							<div class="col-sm-10">
							<input class="form-control modalinput" type="text" name="subject_name">
							<input type="hidden" class="subject_id" name="subject_id">
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
	<div class="modal fade" id="sub-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">SUB001 과목명 삭제</h5>
				</div>
				<form class="form-horizontal" action="adminbasicsubdel" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">자바 네트워트 프로그래밍</h4>
					
					<h4 style="text-align:center;">과목을 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
				<input type="hidden" class="subject_id" name="subject_id">
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
				
		$("#sub-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		
		var subject_id = $(this).val();
		var subject_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(subject_id+" 과목명 수정");
		$(".modalbody").text(subject_name);
		$(".modalinput").attr("placeholder", subject_name);
		$(".subject_id").val(subject_id);
		
		$("#sub-mod-Modal").modal("show");
	});
	
	$(document).on("click",".delbtn",function() {
		
		var subject_id = $(this).val();
		var subject_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(subject_id+" 과목 삭제");
		$(".modalbody").text(subject_name);
		$(".subject_id").val(subject_id);
		
		
		$("#sub-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"adminbasicsubsearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);					
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].subject_id+"</td>";
						txt += "<td>"+item[i].subject_name+"</td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].subject_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+"  value=\""+item[i].subject_id+"\">삭제</button></td>";
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