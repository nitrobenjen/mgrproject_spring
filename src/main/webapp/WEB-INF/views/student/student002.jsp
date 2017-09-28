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
			<img src="<%=contextRoot%>/img/sist_logo.png" width="300px">
			<div class="login"><a href="<%=contextRoot%>/student/info.jsp">[수강생]김정은</a> 님 │ 로그아웃</div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a href="<%=contextRoot%>/student/student001.jsp">성적조회</a></li>
				</ul>
			</div>
		</div>
		
		<div class="content">
		
		<h3>성적조회 > Framework을 활용한 빅데이터 개발자 과정</h3>
		
		<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>과정기간</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>2016-09-01</td>
						<td>제2강의실</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>출결/배점</th>
						<th>필기/배점</th>
						<th>실기/배점</th>
						<th>총점</th>
						<th>시험날짜</th>
						<th>시험문제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OUB001</td>
						<td>UI디자인</td>
						<td>2017-02-16 ~ 2017-02-28</td>
						<td>UI / UX 디자인 이론과 실습</td>
						<td>김정은</td>
						<td>30 / 30</td>
						<td>35 / 35</td>
						<td>35 / 35</td>
						<td>100 / 100</td>
						<td>2017-05-31</td>
						<td><button type="button" class="btn btn-default">다운</button></td>
					</tr>
					<tr>
						<td>OUB006</td>
						<td>맨VS수령</td>
						<td>2016-09-01 ~ 2016-09-30</td>
						<td>교재없음</td>
						<td>조소연</td>
						<td>- / 30</td>
						<td>- / 40</td>
						<td>- / 30</td>
						<td>- / 100</td>
						<td>-</td>
						<td><button type="button" class="btn btn-default" disabled>다운</button></td>
					</tr>
				</tbody>
			</table>


		</div>
	</div>


</body>
</html>