<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String contextRoot = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextRoot%>/style.css">


<!-- jQuery UI 사용 환경 설정 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery UI 사용 환경 설정 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<style>
</style>

<script>
	$(document).ready(function() {
		$("#testdate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
	});
</script>
</head>
<body>


	<div id="main">
		<div class="title">
			<img src="<%=contextRoot%>/img/sist_logo.png" width="300px">
			<div class="login">
				<a href="<%=contextRoot%>/teacher/info.jsp">[강사]김정은</a> 님 │ 로그아웃
			</div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">강의스케쥴</a>
						<ul class="dropdown-menu">
							<li><a href="<%=contextRoot%>/teacher/teacher101.jsp">강의
									예정</a></li>
							<li><a href="<%=contextRoot%>/teacher/teacher102.jsp">강의
									중</a></li>
							<li><a href="<%=contextRoot%>/teacher/teacher103.jsp">강의
									종료</a></li>
						</ul></li>
					<li><a
						href="<%=contextRoot%>/teacher/teacher201.jsp">배점관리</a></li>
					<li><a href="<%=contextRoot%>/teacher/teacher301.jsp">성적관리</a></li>
				</ul>
			</div>
		</div>
		
		<form class="form-horizontal">
		<div class="content">
		
		<div style="max-width:500px;margin:auto;">

				<h3 style="text-align:center;margin-bottom:30px;">개인 정보</h3>


				<div class="form-group">
					<label class="control-label col-sm-3">아이디</label>
					<div class="col-sm-9">
						<input class="form-control" id="focusedInput" type="text" value="jung" readonly>
					</div>
					<label class="control-label col-sm-3 m10">비밀번호</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="focusedInput" type="text" style="max-width:309px; display: inline;">
						<button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#pw-mod-Modal">변경</button>
					</div>
					<label class="control-label col-sm-3 m10">이름</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="focusedInput" type="text" value="김정은" readonly>
					</div>
					<label class="control-label col-sm-3 m10">주민번호 뒷자리</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="focusedInput" type="text" value="2134567" readonly>
					</div>
					<label class="control-label col-sm-3 m10">전화번호</label>
					<div class="col-sm-9 m10">
						<input class="form-control" id="focusedInput" type="text" value="010-0000-0000">
					</div>
				</div>

			</div>
			<div class="modal-footer" style="border-top:none;">
				<button type="submit" class="btn btn-default">수정</button>
			</div>
			
			<div style="max-width:400px;margin:50px auto 30px;">
			<h3 style="text-align:center;margin-bottom:30px;">강의 가능 과목</h3>
			
			<ul>
			<li style="line-height:30px;">자바 네트워트 프로그래밍</li>
			<li style="line-height:30px;">자바 웹 프로그래밍</li>
			<li style="line-height:30px;">JDBC 프로그래밍</li>
			<li style="line-height:30px;">HTML5/CSS3/JavaScript</li>
			<li style="line-height:30px;">jQuery & Ajax</li>
			</ul>
			</div>
		</div>
		</form>	

		
	</div>




	<!-- 비밀 번호 변경 Modal -->
	<div class="modal fade" id="pw-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">비밀 번호 변경</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-sm-3">현재 비밀 번호</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">새 비밀 번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">새 비밀 번호 확인</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
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