<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery UI 사용 환경 설정 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- sweetalert2 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.9.1/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.9.1/sweetalert2.min.css">


<style>
</style>

<script>
	$(document).ready(function() {
		
		if("${code}"==100){
			 swal({
				    type: 'success',
				    title: '성공'
				  });
		}
		
		if("${code}"==200){
			 swal({
				    type: 'error',
				    title: '실패'
				  });
		}
		
		if("${code}"==201){
			 swal({
				    type: 'error',
				    title: '암호가 틀렸습니다.'
				  });
		}
		
		if("${code}"==202){
			 swal({
				    type: 'error',
				    title: '새 비밀번호와 새 비밀번호 확인이 다릅니다.'
				  });
		}
		
		$(".pwmodifybtn").on("click", function(){
			
			var pw = $(this).prev().val();
			var student_id = "${info.student_id}";
			
			$.ajax({
				url:"stupwcheck",
				data:{"student_id":student_id, "pw":pw},
				success:function(data){
					
					if(data == 0){
						
						swal({
						    type: 'error',
						    title: '암호가 틀렸습니다.'
						  });
						
					}else{
						$("#pw-mod-Modal").modal("show");
					}
					
				}});
			
			
			
			
			
		});

	});
</script>
</head>
<body>


	<div id="main">
		<div class="title">
			<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" width="300px">
			<div class="login"><a href="${pageContext.request.contextPath}/student/studentinfo">[수강생]${info.student_name}</a> 님 │ <a href="${pageContext.request.contextPath}/login/logout">로그아웃</a></div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a href="${pageContext.request.contextPath}/student/student001">성적조회</a></li>
				</ul>
			</div>
		</div>
		
		<form class="form-horizontal" action="stumodify" method="post">
		<div class="content">
		
		<div style="max-width:500px;margin:auto;">

				<h3 style="text-align:center;margin-bottom:30px;">개인 정보</h3>


				<div class="form-group">
					<label class="control-label col-sm-3">아이디</label>
					<div class="col-sm-9">
						<input class="form-control" id="student_id" type="text" value="${info.student_id}" readonly name="student_id">
					</div>
					<label class="control-label col-sm-3 m10">비밀번호</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="pw" type="text" style="max-width:309px; display: inline;" name="pw">
						<button type="button" class="btn btn-default pwmodifybtn">변경</button>
					</div>
					<label class="control-label col-sm-3 m10">이름</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="student_name" type="text" value="${info.student_name}" readonly name="student_name">
					</div>
					<label class="control-label col-sm-3 m10">주민번호 뒷자리</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="student_ssn" type="text" value="${info.student_ssn}" readonly name="student_ssn">
					</div>
					<label class="control-label col-sm-3 m10">전화번호</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="student_phone" type="text" value="${info.student_phone}" name="student_phone">
					</div>
					<label class="control-label col-sm-3 m10">과정 수강 횟수</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="count_" type="text" value="${info.count_}" readonly>
					</div>
				</div>

			</div>
			<div class="modal-footer" style="border-top:none;">
				<button type="submit" class="btn btn-default modifybtn">수정</button>
			</div>
		
		</div>
		</form>	

		
	</div>




	<!-- 수강생 비밀번호 변경 Modal -->
	<div class="modal fade" id="pw-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">비밀 번호 변경</h5>
				</div>
				<form class="form-horizontal" action="stupwmodify">
				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-sm-3">현재 비밀 번호</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text" name="pw">
							</div>
							<label class="control-label col-sm-3 m10">새 비밀 번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text" name="newpw">
							</div>
							<label class="control-label col-sm-3 m10">새 비밀 번호 확인</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text"  name="newpw2">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">변경</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>



</body>
</html>