<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery UI 사용 환경 설정 -->
 <!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- sweetalert2 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.9.1/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.9.1/sweetalert2.min.css">



<style>




@charset "utf-8";


body  {
overflow-y:scroll;
}


div.panel {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}


div#main{ margin:50px 0px; width:100%; }

div#menu{ width:100%; background-color:#000; }

div.title {
	max-width: 1200px;
	margin:auto;
}

div.login {
	display: inline-block;
	margin-top: 20px;
	float: right;
}

div.menu {
	max-width: 1200px;
	margin:auto;
	margin-top: 20px;
	color:#fff;
}

div.menu>ul.nav-pills>li>a {
	color:#fff;
    border-radius:0px;
    padding:13px 15px;
}

div.menu>.nav>li>a:focus, .nav>li>a:hover{
	background-color:#337ab7;
	color:#fff;
}

div.menu>.nav .open>a, .nav .open>a:focus, .nav .open>a:hover{
	background-color:#337ab7;
	color:#fff;
}

div.menu>.nav>li>.dropdown-menu>li>a {
	line-height:30px;
}

div.content {
	max-width: 1200px;
	margin:30px auto;
	padding:20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

table { background-color:#fff; }

table.ocu>tbody>tr>td {
	vertical-align: middle;
}

table.ocu>thead>tr>th {
	vertical-align: middle;
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal {
	text-align: center;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal-footer {
	text-align: center;
}

.modal-header {
    background-color: #337ab7;
    color: #fff;
}

.m10 { margin-top: 10px; }




</style>

<script>
	$(document).ready(function() {
		
		 $('#value').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('.searchbtn').click();
		         return false;
		     }
		}); 
		
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
	

	});
</script>
<decorator:head />
</head>

<body>


<div id="main">
		<div class="title">
			<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
				width="300px">
			<div class="login">관리자 님 │ <a href="${pageContext.request.contextPath}/login/logout">로그아웃</a></div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">기초 정보 관리</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/admin/admin101">과정명</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/admin102">과목명</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/admin103">교재명</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/admin104">강의실명</a></li>
						</ul></li>
						<li class=""><a href="${pageContext.request.contextPath}/admin/admin201">강사 계정 관리</a></li>
					<li class=""><a href="${pageContext.request.contextPath}/admin/admin301">개설 과정/과목
							관리</a></li>
					<li class=""><a
						href="${pageContext.request.contextPath}/admin/admin401">수강생 관리</a></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">성적
							관리</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/admin501">과목별</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/admin502">수강생별</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="content">
	
	<!-- content -->
	<decorator:body></decorator:body>



	<!-- FOOTER -->
</div>
</div>

</body>
</html>
