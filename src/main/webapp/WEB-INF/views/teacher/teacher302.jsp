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
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">


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

	});
</script>
</head>
<body>


	<div id="main">
		<div class="title">
			<img src="${pageContext.request.contextPath}/img/sist_logo.png" width="300px">
			<div class="login">
				<a href="${pageContext.request.contextPath}/teacher/info.jsp">[강사]김정은</a> 님 │ 로그아웃
			</div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">강의스케쥴</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/teacher/teacher101.jsp">강의
									예정</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/teacher102.jsp">강의
									중</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/teacher103.jsp">강의
									종료</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath}/teacher/teacher201.jsp">배점관리</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/teacher/teacher301.jsp">성적관리</a></li>
				</ul>
			</div>
		</div>

		<div class="content">


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
				<tbody>
					<tr>
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
					</tr>
					<tr>
						<td>STU090</td>
						<td>채지호</td>
						<td>010-3131-5212</td>
						<td>17/11/15</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#grade-insert-Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU091</td>
						<td>장선호</td>
						<td>010-1111-2223</td>
						<td>15/05/16</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU092</td>
						<td>임승리</td>
						<td>010-4101-6232</td>
						<td>16/08/28</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU093</td>
						<td>장수빈</td>
						<td>010-8162-6273</td>
						<td>16/01/25</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU094</td>
						<td>천이지</td>
						<td>010-1118-2630</td>
						<td>15/05/17</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU095</td>
						<td>표한빛</td>
						<td>010-1413-1419</td>
						<td>16/02/12</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
					</tr>
					<tr>
						<td>STU096</td>
						<td>전병대</td>
						<td>010-2161-9232</td>
						<td>17/09/07</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU098</td>
						<td>하슬비</td>
						<td>010-1718-1928</td>
						<td>15/07/04</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU099</td>
						<td>표윤주</td>
						<td>010-2112-8303</td>
						<td>16/11/12</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU100</td>
						<td>윤유선</td>
						<td>010-4911-1317</td>
						<td>15/12/09</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU101</td>
						<td>주홍익</td>
						<td>010-2342-7283</td>
						<td>15/06/18</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
					<tr>
						<td>STU103</td>
						<td>표원경</td>
						<td>010-2112-0243</td>
						<td>16/11/23</td>
						<td>수료(17/10/01)</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
					</tr>
				</tbody>
			</table>

			<div style="float:left;position:absolute">
			<button type="button" class="btn btn-default btn-sm">
						TotalCount <span class="badge" id="totalCount">25</span></button>
			</div>

			<div style="text-align: center;">
			
				<ul class="pagination" style="margin:0px 0px 20px 0px;">
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>

			<form class="form-inline" method="post" style="text-align: center;">
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

		</div>
	</div>


	<!-- 성적 등록 Modal -->
	<div class="modal fade" id="grade-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적관리 > 등록</h5>
				</div>
				<form class="form-horizontal">
					<div class="modal-body">

						<h4>자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</td></h4>
						<h5 style="text-align:center;">출결배점 : 20 / 필기배점 : 30 / 실기배점 : 50</h5>

						<hr>

						<div class="form-group">
							<label class="control-label col-sm-3">수강생ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text" value="STU090" readonly>
							</div>
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text" value="채지호" readonly>
							</div>
							<label class="control-label col-sm-3 m10">출결점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" placeholder="MAX 20">
							</div>
							<label class="control-label col-sm-3 m10">필기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" placeholder="MAX 30">
							</div>
							<label class="control-label col-sm-3 m10">실기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" placeholder="MAX 50">
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


	<!-- 성적 수정 Modal -->
	<div class="modal fade" id="grade-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적관리 > 수정</h5>
				</div>
				<form class="form-horizontal">
					<div class="modal-body">

						<h4>자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</td></h4>
						<h5 style="text-align:center;">출결배점 : 20 / 필기배점 : 30 / 실기배점 : 50</h5>

						<hr>

						<div class="form-group">
							<label class="control-label col-sm-3">수강생ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text" value="STU090" readonly>
							</div>
							<label class="control-label col-sm-3 m10">이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text" value="채지호" readonly>
							</div>
							<label class="control-label col-sm-3 m10">출결점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" value="15">
							</div>
							<label class="control-label col-sm-3 m10">필기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" value="15">
							</div>
							<label class="control-label col-sm-3 m10">실기점수</label>
							<div class="col-sm-9 m10">
								<input class="form-control" style="width:100px;" type="text" value="40">
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

</body>
</html>