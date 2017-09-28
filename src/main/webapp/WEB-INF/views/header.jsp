<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="title">
			<img src="${pageContext.request.contextPath}/img/sist_logo.png" width="300px">
			<div class="login">관리자 님 │ 로그아웃</div>
		</div>
		<div id="menu">
		<div class="menu">
			<ul class="nav nav-pills nav-justified">
				<li><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">기초 정보 관리</a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/admin/admin101.do">과정명</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin102.do">과목명</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin103.do">교재명</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin104.do">강의실명</a></li>
					</ul>
				</li>
				<li class="active"><a href="${pageContext.request.contextPath}/admin201.do">강사 계정 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/adminOpenCourseList.do">개설 과정/과목 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/admin401.do">수강생 관리</a></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">성적
							관리</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/admin501.do">과목별</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/admin502.do">수강생별</a></li>
						</ul>
					</li>			
			</ul>
		</div>
		</div>