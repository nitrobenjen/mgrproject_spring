			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
			<h3>기초 정보 관리 > 과정명</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과정ID</th>
						<th>과정명</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>CU001</td>
						<td>웹기반 빅데이터 분석 응용SW개발자</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#cu-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#cu-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>CU002</td>
						<td>애플리케이션 성능 최적화 구현 양성과정</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CU003</td>
						<td>Java&Python 기반 응용SW 개발자 양성</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CU004</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CU005</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CU006</td>
						<td>UI/UX 개발자 양성과정</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>CU007</td>
						<td>Java 보안 개발자 양성과정</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default"
					data-toggle="modal" data-target="#cu-insert-Modal">등록</button>
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




	<!-- 과정 입력 Modal -->
	<div class="modal fade" id="cu-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">과정명 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 과정명을 입력해 주세요.</h4>

					<hr>
				
					
						<div class="form-group">
							<label class="control-label col-sm-2">과정명</label>
							<div class="col-sm-10">
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





	<!-- 과정 수정 Modal -->
	<div class="modal fade" id="cu-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">CU001 과정명 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">웹기반 빅데이터 분석 응용SW개발자</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">과정명</label>
							<div class="col-sm-10">
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
	<div class="modal fade" id="cu-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">CU001 과정명 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">웹기반 빅데이터 분석 응용SW개발자</h4>
					
					<h4 style="text-align:center;">과정을 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

