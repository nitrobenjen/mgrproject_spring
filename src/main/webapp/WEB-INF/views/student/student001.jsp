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
		
		<h3>성적조회</h3>
		
		<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>과정기간</th>
						<th>강의실</th>
						<th>과목수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>2016-09-01</td>
						<td>제2강의실</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='student002.jsp'">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
					</tr>
					<tr>
						<td>OCU002</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td>2017-01-17</td>
						<td>제4강의실</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
					</tr>
					<tr>
						<td>OCU003</td>
						<td>Java 보안 개발자 양성과정</td>
						<td>2017-05-20</td>
						<td>제3강의실</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
					</tr>
					<tr>
						<td>OCU004</td>
						<td>Java&Python 기반 응용SW 개발자 양성</td>
						<td>2017-05-20</td>
						<td>제5강의실</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>	

</body>
</html>