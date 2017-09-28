			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>기초 정보 관리 > 강의실</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>강의실ID</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>CA001</td>
						<td>제1강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ca-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ca-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>CA002</td>
						<td>제2강의실</td>
						<td>25</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CA003</td>
						<td>제3강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CA004</td>
						<td>제4강의실</td>
						<td>40</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CA005</td>
						<td>제5강의실</td>
						<td>25</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default"
					data-toggle="modal" data-target="#ca-insert-Modal">등록</button>
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



	<!-- 교재 입력 Modal -->
	<div class="modal fade" id="ca-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">강의실 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 강의실을 입력해 주세요.</h4>

					<hr>				
					
						<div class="form-group">
							<label class="control-label col-sm-2">강의실명</label>
							<div class="col-sm-10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2" style="margin-top: 10px;">정원</label>
							<div class="col-sm-10" style="margin-top: 10px;">
								<input class="form-control" id="focusedInput" type="text">
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>





	<!-- 과목 수정 Modal -->
	<div class="modal fade" id="ca-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">CA001 강의실 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">제1강의실</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">강의실명</label>
							<div class="col-sm-10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2" style="margin-top: 10px;">정원</label>
							<div class="col-sm-10" style="margin-top: 10px;">
								<input class="form-control" id="focusedInput" type="text">
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>



	<!-- 과정 삭제 Modal -->
	<div class="modal fade" id="ca-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">CA001 강의실 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">제1강의실</h4>
					
					<h4 style="text-align:center;">강의실을 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>



</body>
</html>