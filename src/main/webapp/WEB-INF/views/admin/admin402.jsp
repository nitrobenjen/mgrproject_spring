			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>수강생 관리 > 수강 이력</h3>
			
			<h4 style="text-align: center; font-weight: bold;">STU002 / 이순신 / 010-4758-6532</h4>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>과정시작일</th>
						<th>과정종료일</th>
						<th>수료여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td>수료예정 <button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-end-Modal">입력</button></td>
					</tr>
					<tr>
						<td>OCU002</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td>제4강의실</td>
						<td>40</td>
						<td>17-01-17</td>
						<td>17-04-17</td>
						<td>수료 <button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-end-Modal">입력</button></td>
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


	<!-- 개설 과정 삭제 Modal -->
	<div class="modal fade" id="ocu-end-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수료 여부 입력</h5>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;font-weight:bold;">OCU001 / Framework을 활용한 빅데이터 개발자 과정</h4>
					<h5 style="text-align: center;">16-09-01 ~ 17-02-01</h5>
					<br>
					<h4 style="text-align: center;">STU002 / 이순신 / 010-4758-6532</h4>
					
					<hr>
					<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-3 m10">과정 시작일</label>
							<div class="col-sm-9 m10">
							<input type="text" class="form-control" id="ocustartdate"
									name="ocustartdate" placeholder="과정 시작일(YYYY-MM-DD)"
									required="required">
							</div>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>



</body>
</html>