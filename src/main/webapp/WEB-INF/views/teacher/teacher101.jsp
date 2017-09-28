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
					<li class="active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">강의스케쥴</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/teacher/teacher101.jsp">강의
									예정</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/teacher102.jsp">강의 중</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/teacher103.jsp">강의
									종료</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/teacher/teacher201.jsp">배점관리</a></li>
					<li><a href="${pageContext.request.contextPath}/teacher/teacher301.jsp">성적관리</a></li>
				</ul>
			</div>
		</div>

		<div class="content">


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
				<tbody>
					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>17/07/01 ~ 17/07/31</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>17/03/01 ~ 17/10/01</td>
						<td>제2강의실</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>24/40</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#pre-list-Modal">명단</button></td>
					</tr>
					<tr>
						<td>OUB027</td>
						<td>UI/UX가이드 제작</td>
						<td>17/08/01 ~ 17/08/31</td>
						<td>애플리케이션 성능 최적화 구현 양성과정</td>
						<td>17/03/31 ~ 17/10/31</td>
						<td>제4강의실</td>
						<td>UI / UX 디자인 이론과 실습</td>
						<td>30/40</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">명단</button></td>
					</tr>
					<tr>
						<td>OUB030</td>
						<td>JDBC 프로그래밍</td>
						<td>17/09/01 ~ 17/09/30</td>
						<td>Java&Python 기반 응용SW 개발자 양성</td>
						<td>17/06/01 ~ 17/12/29</td>
						<td>제3강의실</td>
						<td>쉽게 배우는 오라클</td>
						<td>30/30</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">명단</button></td>
					</tr>
				</tbody>
			</table>


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

						<h4>자바 네트워트 프로그래밍(17/07/01 ~ 17/07/31)</h4>

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
							<tbody>
								<tr>
									<td>STU001</td>
									<td>홍길동</td>
									<td>010-1234-1234</td>
									<td>17/03/21</td>
									<td>중도탈락(17-06-29)</td>
								</tr>
								<tr>
									<td>STU002</td>
									<td>이순신</td>
									<td>010-4758-6532</td>
									<td>17/03/21</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU003</td>
									<td>이순애</td>
									<td>010-4231-1236</td>
									<td>16/12/29</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU004</td>
									<td>김정훈</td>
									<td>010-5236-4221</td>
									<td>17/10/20</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU005</td>
									<td>한석봉</td>
									<td>010-5211-3542</td>
									<td>17/10/27</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU006</td>
									<td>이기자</td>
									<td>010-3214-5357</td>
									<td>17/10/09</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU007</td>
									<td>장인철</td>
									<td>010-2345-2525</td>
									<td>17/04/15</td>
									<td>수료(2017/10/01)</td>
								</tr>
								<tr>
									<td>STU008</td>
									<td>김영년</td>
									<td>010-2222-4444</td>
									<td>17/11/24</td>
									<td>수료(2017/10/01)</td>
								</tr>
							</tbody>
						</table>
						<div style="float: left; position: absolute">
							<button type="button" class="btn btn-default btn-sm">
								TotalCount <span class="badge" id="totalCount">25</span>
							</button>
						</div>

						<div style="text-align: center;">

							<ul class="pagination" style="margin: 0px 0px 20px 0px;">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
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


</body>
</html>