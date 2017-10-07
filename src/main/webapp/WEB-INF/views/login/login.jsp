<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
div.panel {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

div#login {
	margin: 130px auto;
	max-width: 400px;
	height: 500px;
	padding: 40px;
	text-align: center;
}

.form-control {
	height: 40px;
}
</style>

<script>
	$(document).ready(function() {

	});
</script>

</head>

<body>

<%-- 
	<h3>아이디와 비밀번호를 입력해주세요.</h3>
	<c:url value="/login" var="loginUrl" />
	<form:form name="f" action="${loginUrl}" method="POST">
		<c:if test="${param.error != null}">
			<p>아이디와 비밀번호가 잘못되었습니다.</p>
		</c:if>
		<c:if test="${param.logout != null}">
			<p>로그아웃 하였습니다.</p>
		</c:if>
		<p>
			<label for="username">아이디</label> <input type="text" id="id"
				name="id" />
		</p>
		<p>
			<label for="password">비밀번호</label> <input type="password"
				id="password" name="password" />
		</p>
		<button type="submit" class="btn">로그인</button>
	</form:form> --%>


	<div id="login" class="panel">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="80%"> 
		

		<form style="margin-top: 30px;"	action="loginstart" method="POST">
		
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="id_" type="text"
					class="form-control" name="id_" placeholder="id_" required>
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input id="pw"
					type="password" class="form-control" name="pw" placeholder="pw" required>
			</div>
			<button type="submit" style="margin-top: 30px;"
				class="btn btn-default btn-block">LOGIN</button>
		</form>
	</div> 

</body>
</html>