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
						<th>선택</th>
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
						<td><button type="button" class="btn btn-default" onclick="location.href='<%=contextRoot%>/teacher/teacher302.jsp'">선택</button></td>
					</tr>
					<tr>
						<td>OUB027</td>
						<td>UI/UX가이드 제작</td>
						<td>17/08/01 ~ 17/08/31</td>
						<td>애플리케이션 성능 최적화 구현 양성과정</td>
						<td>17/03/31 ~ 17/10/31</td>
						<td>제4강의실</td>
						<td>UI / UX 디자인 이론과 실습</td>
						<td>15</td>
						<td>35</td>
						<td>50</td>
						<td>17/08/30</td>
						<td>ux_170830.zip</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">선택</button></td>
					</tr>
					<tr>
						<td>OUB030</td>
						<td>JDBC 프로그래밍</td>
						<td>17/09/01 ~ 17/09/30</td>
						<td>Java&Python 기반 응용SW 개발자 양성</td>
						<td>17/06/01 ~ 17/12/29</td>
						<td>제3강의실</td>
						<td>쉽게 배우는 오라클</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>선택</button></td>
					</tr>
					<tr>
						<td>OUB003</td>
						<td>HTML5/CSS3/JavaScript</td>
						<td>17/01/01 ~ 17/01/15</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>16/09/01 ~ 17/02/28</td>
						<td>제2강의실</td>
						<td>html 웹 프로그래밍 입문</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>선택</button></td>
					</tr>
					<tr>
						<td>OUB005</td>
						<td>플랫폼별 UI디자인</td>
						<td>17/11/02 ~ 17/12/23</td>
						<td>UI/UX 개발자 양성과정</td>
						<td>17/07/01 ~ 17/12/23</td>
						<td>제1강의실</td>
						<td>논쟁적 UX</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>선택</button></td>
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


</body>
</html>