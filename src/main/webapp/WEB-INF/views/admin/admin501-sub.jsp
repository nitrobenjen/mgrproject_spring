			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>성적 관리 > 과목별</h3>

			<h4 style="text-align: center;font-weight:bold;">OCU001 / Framework을 활용한 빅데이터 개발자 과정</h4>
			<h5 style="text-align: center;">2016/09/01 ~ 2017/02/01</h5>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과목ID</th>
						<th>개설 과목명</th>
						<th>과목 시작일</th>
						<th>과목 종료일</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>성적 등록 인원수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>17/07/01</td>
						<td>17/07/31</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>심심해</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#grade-insert-Modal">
								<span class="badge" id="Count">5</span> 보기
							</button></td>
					</tr>
					<tr>
						<td>OUB002</td>
						<td>관계형 데이터베이스</td>
						<td>17/07/01</td>
						<td>17/07/31</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>심심해</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
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



	<!-- 성적 확인 Modal -->
	<div class="modal fade" id="grade-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">성적 확인</h5>
				</div>
				<div class="modal-body">
				
				<h4 style="text-align: center;">OUB001 / 자바 네트워트 프로그래밍 / 2016/07/01 ~ 2017/07/31</h4>
				<h5 style="text-align: center;">출결배점 : 30 / 필기배점 : 30 / 실기배점 : 40</h5>
				<p style="text-align: right;">시험일 : 2017/01/01</p>
				<hr>
				
				<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생 ID</th>
						<th>이름</th>
						<th>출결점수</th>
						<th>필기점수</th>
						<th>실기점수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>STU001</td>
						<td>홍길동</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU002</td>
						<td>이순신</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU003</td>
						<td>이순애</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU004</td>
						<td>김정훈</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU005</td>
						<td>한석봉</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU006</td>
						<td>이기자</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU007</td>
						<td>장인철</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>STU008</td>
						<td>김영년</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>


</body>
</html>