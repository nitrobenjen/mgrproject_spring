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
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/style.css">
	
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
			<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" width="300px">
			<div class="login"><a href="${pageContext.request.contextPath}/student/studentinfo">[수강생]${student_name}</a> 님 │ <a href="${pageContext.request.contextPath}/login/logout">로그아웃</a></div>
		</div>
		<div id="menu">
			<div class="menu">
				<ul class="nav nav-pills nav-justified">
					<li><a href="${pageContext.request.contextPath}/student/student001">성적조회</a></li>
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
