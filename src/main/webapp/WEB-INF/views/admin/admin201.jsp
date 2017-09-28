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
				<tbody>
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
						<td><button type="button" class="btn btn-default delbtn" ${teacherdelcheck[a.teacher_id]} value="${a.teacher_id}">삭제</button></td>
					</tr>
							
					</c:forEach>
						
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn">등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="name">Name</option>
						<option value="phone">Phone</option>
						<option value="email">Email</option>
						<option value="regDate">RegDate</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="submit" class="btn btn-default">Search</button>
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
				<div class="modal-body">
				
					<h4 style="text-align:center;">TCH001 지재환 / 010-8888-7474</h4>

					<hr>
					
					<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>SUB001</td>
						<td>자바 네트워트 프로그래밍</td>
					</tr>
					<tr>
						<td>SUB002</td>
						<td>자바 웹 프로그래밍</td>
					</tr>
					<tr>
						<td>SUB003</td>
						<td>JDBC 프로그래밍</td>
					</tr>
					<tr>
						<td>SUB004</td>
						<td>HTML5/CSS3/JavaScript</td>
					</tr>
					<tr>
						<td>SUB005</td>
						<td>jQuery & Ajax</td>
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
				<form class="form-horizontal">
				<div class="modal-body">
				
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">주민번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">강의 가능 과목</label>
							<div class="col-sm-9 m10">
								<div class="checkbox">
								<label><input type="checkbox" value="SUB001">자바 네트워트 프로그래밍</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB002">자바 웹 프로그래밍</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB003">JDBC 프로그래밍</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB004">HTML5/CSS3/JavaScript</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB005">jQuery & Ajax</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB006">UI디자인</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB007">UI/UX가이드 제작</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB008">플랫폼별 UI디자인</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB009">Framework</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB010">Oracle DBMS</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB011">Front-end 개발</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB012">빅데이터 분석 및 시각화</label>
								</div>
								<div class="checkbox">
								<label><input type="checkbox" value="SUB013">실무 프로젝트 통합구현</label>
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
					<h5 class="modal-title">TCH001 강사 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">지재환 / 010-8888-7474</h4>
					
					<h4 style="text-align:center;">강사를 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

<script>

$(".modifybtn").on("click", function(){
	
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
		}
	});
	
	$("#t-mod-Modal").modal("show");
	
});

$(".delbtn").on("click", function(){
	
	$("#t-del-Modal").modal("show");
	
});

$(".subcountbtn").on("click", function(){
	$("#tlist-Modal").modal("show");
});

$(".addbtn").on("click", function(){
	$("#t-insert-Modal").modal("show");
});




</script>

</body>
</html>