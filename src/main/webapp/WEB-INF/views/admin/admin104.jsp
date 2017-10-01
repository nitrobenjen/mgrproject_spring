			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>기초 정보 관리 > 강의실</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>강의실ID</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>CA001</td>
						<td>제1강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default modifybtn">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn">삭제</button></td>
					</tr>	 -->
					<c:forEach var="a" items="${classlist}">
					<tr>
						<td>${a.class_id}</td>
						<td>${a.class_name}</td>
						<td>${a.jungwon}</td>
						<td><button type="button" class="btn btn-default modifybtn" ${a.check} value="${a.class_id}">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn" ${a.check} value="${a.class_id}">삭제</button></td>
					</tr>	
					
					
					</c:forEach>				
				</tbody>
			</table>


			<form class="form-inline" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn">등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="class_id">강의실ID</option>
						<option value="class_name">강의실명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>



	<!-- 교재 입력 Modal -->
	<div class="modal fade" id="ca-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강의실 등록</h5>
				</div>
				<form class="form-horizontal" action="adminbasicclassadd" method="post">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 강의실을 입력해 주세요.</h4>

					<hr>				
					
						<div class="form-group">
							<label class="control-label col-sm-2">강의실명</label>
							<div class="col-sm-10">
								<input class="form-control" name="class_name" type="text">
							</div>
							<label class="control-label col-sm-2" style="margin-top: 10px;">정원</label>
							<div class="col-sm-10" style="margin-top: 10px;">
								<input class="form-control" name="jungwon" type="number">
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
	<div class="modal fade" id="ca-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">CA001 강의실 수정</h5>
				</div>
				<form class="form-horizontal" action="adminbasicclassmodify" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">제1강의실</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">강의실명</label>
							<div class="col-sm-10">
								<input class="form-control modalinput1" name="class_name" type="text">
							</div>
							<label class="control-label col-sm-2" style="margin-top: 10px;">정원</label>
							<div class="col-sm-10" style="margin-top: 10px;">
								<input class="form-control modalinput2" name="jungwon" type="number">
								<input type="hidden" class="class_id" name="class_id">
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



	<!-- 강의실 삭제 Modal -->
	<div class="modal fade" id="ca-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">CA001 강의실 삭제</h5>
				</div>
				<form class="form-horizontal" action="adminbasicclassdel" method="post">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">제1강의실</h4>
					
					<h4 style="text-align:center;">강의실을 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
				<input type="hidden" class="class_id" name="class_id">
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
				
		$("#ca-insert-Modal").modal("show");
	});
	
	$(document).on("click",".modifybtn",function() {
		
		var class_id = $(this).val();
		var class_name = $(this).parents("tr").find("td").eq(1).text();
		var jungwon = $(this).parents("tr").find("td").eq(2).text();
		$(".modaltitle").text(class_id+" 강의실 수정");
		$(".modalbody").text(class_name);
		$(".modalinput1").attr("placeholder", class_name);
		$(".modalinput2").attr("placeholder", jungwon);
		$(".class_id").val(class_id);
		
		$("#ca-mod-Modal").modal("show");
	});
	
	$(document).on("click",".delbtn",function() {
		
		var class_id = $(this).val();
		var class_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(class_id+" 강의실 삭제");
		$(".modalbody").text(class_name);
		$(".class_id").val(class_id);
		
		
		$("#ca-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"adminbasicclasssearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);					
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].class_id+"</td>";
						txt += "<td>"+item[i].class_name+"</td>";
						txt += "<td>"+item[i].jungwon+"</td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].class_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+"  value=\""+item[i].class_id+"\">삭제</button></td>";
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"5\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	
});


</script>