<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



			<h3>강사 계정 관리</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>강사ID</th>
						<th>강사명</th>
						<th>주민번호 뒷자리</th>
						<th>전화번호</th>
						<td>등록일</td>
						<th>강의 가능 과목</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>TCH001</td>
						<td>지재환</td>
						<td>1687988</td>
						<td>010-8888-7474</td>
						<td>15/05/28</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#tlist-Modal">
								<span class="badge" id="Count">5</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#t-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#t-del-Modal">삭제</button></td>
					</tr> -->
					
				 	<c:forEach var="a" items="${teacherlist}">
					<tr>
						<td>${a.teacher_id}</td>
						<td>${a.teacher_name}</td>
						<td>${a.teacher_ssn}</td>
						<td>${a.teacher_phone}</td>
						<td>${a.teacher_hiredate}</td>
						<td><button type="button" class="btn btn-default btn-sm subcountbtn"  ${a.count_==0?"disabled":"" } value="${a.teacher_id}">
								<span class="badge" id="Count" >${a.count_}</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default modifybtn" value="${a.teacher_id}">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn" ${a.check} value="${a.teacher_id}">삭제</button></td>
					</tr>
							
					</c:forEach>
						
				</tbody>
			</table>
			
			<div style="text-align: center;">

							<ul class="pagination" style="margin: 0px 0px 20px 0px;">
							<c:forEach begin="1" end="${totalpage}" varStatus="status">
							
							<c:choose>
							<c:when test="${status.count==1}">
							<li class="active"><a href="#" class="pagenum" id="${status.count}">${status.count}</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="#" class="pagenum" id="${status.count}">${status.count}</a></li>
							
							</c:otherwise>
							
							</c:choose>
							
								
								</c:forEach>
							</ul>
			</div>


			<form class="form-inline" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn">등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="teacher_id">강사ID</option>
						<option value="teacher_name">강사명</option>
						<option value="teacher_phone">강사전화번호</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
			</form>





	<!-- 강의 가능 과목 Modal -->
	<div class="modal fade" id="tlist-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강의 가능 과목</h5>
				</div>
				<div class="modal-body ">
				
					<h4 style="text-align:center;" class="countbody">TCH001 지재환 / 010-8888-7474</h4>

					<hr>
					
					<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
					</tr>
				</thead>
				<tbody class="teachsub">
					<tr>
						<td>SUB001</td>
						<td>자바 네트워트 프로그래밍</td>
					</tr>
					
				</tbody>
			</table>
				
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>



	<!-- 강사 계정 등록 Modal -->
	<div class="modal fade" id="t-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강사 계정 등록</h5>
				</div>
				<form class="form-horizontal" action="adminteachadd" method="POST">
				<div class="modal-body">
				
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" name="teacher_name" type="text">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" name="teacher_phone" type="text">
							</div>
							<label class="control-label col-sm-3 m10">주민번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" name="teacher_ssn" type="text">
							</div>
							<label class="control-label col-sm-3 m10">강의 가능 과목</label>
							<div class="col-sm-9 m10">
								<div class="checkbox addcheckbox">
								<!-- <label><input type="checkbox" value="SUB001">자바 네트워트 프로그래밍</label> -->
								
								
								
								</div>							
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


	<!-- 강사 계정 수정 Modal -->
	<div class="modal fade" id="t-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강사 계정 수정</h5>
				</div>
				<form class="form-horizontal" method="POST" action="adminteachmodify">
				<div class="modal-body">
				
					
						<div class="form-group">
							<label class="control-label col-sm-3">아이디</label>
							<div class="col-sm-9">
								<input class="form-control" id="teacher_id" name="teacher_id" type="text" value="TCH001" readonly>
							</div>
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="teacher_name" name="teacher_name" type="text" value="지재환">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="teacher_phone" name="teacher_phone" type="text" value="010-8888-7474">
							</div>
							<label class="control-label col-sm-3 m10">주민번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="teacher_ssn" name="teacher_ssn" type="text" value="1687988">
							</div>
							<label class="control-label col-sm-3 m10">강의 가능 과목</label>
							<div class="col-sm-9 m10">
								<div class="checkbox modifycheckbox">
								<!-- <label><input type="checkbox" value="SUB001" checked>자바 네트워트 프로그래밍</label> -->
						<%-- 		<c:forEach var="a" items="${adminBasicsublist}">
								<label><input type="checkbox" value="${a.subject_id}" checked>${a.subject_name}</label>
								
								</c:forEach> --%>
								
								</div>
								
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




	<!-- 강사 삭제 Modal -->
	<div class="modal fade" id="t-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title deltitle">TCH001 강사 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;" class="delbody">지재환 / 010-8888-7474</h4>
					
					<h4 style="text-align:center;">강사를 삭제하시겠습니까?</h4>
				</div>
				<form class="form-horizontal" method="POST" action="adminteachdel">
				<input type="hidden" name="teacher_id" class="delinput">
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
	var key= "";
	var value = "";
	

	
	
	$(document).on("click",".modifybtn", function(){
		
		var teacher_id = $(this).val();
		var teacher_name = $(this).parents("tbody tr").children().eq(1).text();
		var teacher_ssn = $(this).parents("tbody tr").children().eq(2).text();
		var teacher_phone = $(this).parents("tbody tr").children().eq(3).text();						
		$("#teacher_id").val(teacher_id);
		$("#teacher_name").val(teacher_name);
		$("#teacher_ssn").val(teacher_ssn);
		$("#teacher_phone").val(teacher_phone);	
		
		var txt="";
		$.ajax({
			
			url :"adminteachsublist",
			data : {"teacher_id":teacher_id},
			success : function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					txt += "<label><input type='checkbox' name='sub' "+item[i].check2+"  "+item[i].check+" value='"+item[i].subject_id+"'>"+item[i].subject_name+"</label><br>";
				
				} 
				
				$(".modifycheckbox").html(txt);
				$("#t-mod-Modal").modal("show");
				

			}});
	});
	
	



	$(document).on("click",".delbtn", function(){
		
		var teacher_id = $(this).val();
		var teacher_name = $(this).parents("tbody tr").children().eq(1).text();
		var teacher_phone = $(this).parents("tbody tr").children().eq(3).text();
		var deltitle = ""+teacher_name+" / "+teacher_phone+"";
		$(".deltitle").text(deltitle);
		$(".delbody").text(deltitle);
		$(".delinput").val(teacher_id);
		
		$("#t-del-Modal").modal("show");
		
	});
	
	
	$(document).on("click", ".searchbtn", function(){
		
		key= $("#key").val();
		value = $("#value").val();		
		$(this).parents().find("li").removeClass("active");		
		var txt="";
		var page="";
		$(this).parents().find(".pagination").find("li").eq(0).addClass("active");
		$.ajax({
			url:"adminteachsearch",
			data:{"key":key, "value":value},
			success:function(data){
				console.log(data);
				var item = JSON.parse(data);
				if(item.length != 0){
					for(var i=0; i<item.length; i++){
						txt += "<tr>";
						txt += "<td>"+item[i].teacher_id+"";
						txt += "<td>"+item[i].teacher_name+"</td>";
						txt += "<td>"+item[i].teacher_ssn+"</td>";
						txt += "<td>"+item[i].teacher_phone+"</td>";
						txt += "<td>"+item[i].teacher_hiredate+"</td>";
						

						var disabled ="";
						if(item[i].count_ == 0){
							disabled = "disabled";
						}else{
						}
						txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm subcountbtn\" "+disabled+" value=\""+item[i].teacher_id+"\"> <span class=\"badge\" id=\"Count\" >"+item[i].count_+"</span> 보기 </button></td>"
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].teacher_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+" value=\""+item[i].teacher_id+"\">삭제</button></td>";
						txt += "</tr>";	
						
						
						
					}
					
					for(var i=0; i<item[0].totalpage; i++){
						var count = i+1;
						if(i == 0){
							page += "<li class=\"active\"><a href=\"#\" class=\"pagenum\" id=\""+count+"\">"+count+"</a></li>";
						}else{
							page += "<li><a href=\"#\" class=\"pagenum\" id=\""+count+"\">"+count+"</a></li>";
						}
					}
				}else{
					txt += "<tr><td colspan=\"8\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";
					page += "";
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
		var txt="";
		$.ajax({			
			url :"adminbasicsublist",
			success : function(data){
				var item = JSON.parse(data);
				for(var i=0; i<item.length; i++){
					txt += "<label><input type='checkbox' name='sub' value='"+item[i].subject_id+"'>"+item[i].subject_name+"</label><br>";
				
				} 
				
				$(".addcheckbox").html(txt);
				$("#t-insert-Modal").modal("show");				

			}});
	});
	

	$(document).on("click",".pagenum", function(){
		$(this).parents().find("li").removeClass("active");		
		var txt="";
		key= $("#key").val();
		value = $("#value").val();		
		var currentpage = $(this).text();
		$(this).parent().addClass("active");
		$.ajax({
			url:"adminteachpage",
			data:{"currentpage2":currentpage, "key":key,"value":value},
			success:function(data){
				var item = JSON.parse(data);
				console.log(data);
				for(var i=0; i<item.length; i++){
					txt += "<tr>";
					txt += "<td>"+item[i].teacher_id+"</td>";
					txt += "<td>"+item[i].teacher_name+"</td>";
					txt += "<td>"+item[i].teacher_ssn+"</td>";
					txt += "<td>"+item[i].teacher_phone+"</td>";
					txt += "<td>"+item[i].teacher_hiredate+"</td>";
					

					var disabled ="";
					if(item[i].count_ == 0){
						disabled = "disabled";
					}else{
					}
					txt += "<td><button type=\"button\" class=\"btn btn-default btn-sm subcountbtn\" "+disabled+" value=\""+item[i].teacher_id+"\"> <span class=\"badge\" id=\"Count\" >"+item[i].count_+"</span> 보기 </button></td>"
					
					
					txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" value=\""+item[i].teacher_id+"\">수정</button></td>";
					txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+" value=\""+item[i].teacher_id+"\">삭제</button></td>";
					txt += "</tr>";	
				} 
						
			$(".tbody").html(txt);
			}});
		
	});
 
});




</script>

</body>
</html>