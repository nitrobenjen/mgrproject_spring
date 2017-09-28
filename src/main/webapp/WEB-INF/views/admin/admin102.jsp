			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


			<h3>기초 정보 관리 > 과목명</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>과목ID</th>
						<th>과목명</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>SUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#sub-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#sub-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>SUB002</td>
						<td>자바 웹 프로그래밍</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB003</td>
						<td>JDBC 프로그래밍</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB004</td>
						<td>HTML5/CSS3/JavaScript</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB005</td>
						<td>jQuery & Ajax</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB006</td>
						<td>UI디자인</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB007</td>
						<td>UI/UX가이드 제작</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB008</td>
						<td>플랫폼별 UI디자인</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB009</td>
						<td>Framework</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB010</td>
						<td>Oracle DBMS</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>															
					<tr>
						<td>SUB011</td>
						<td>Front-end 개발</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB012</td>
						<td>빅데이터 분석 및 시각화</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>SUB013</td>
						<td>실무 프로젝트 통합구현</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default"
					data-toggle="modal" data-target="#sub-insert-Modal">등록</button>
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




	<!-- 과목 입력 Modal -->
	<div class="modal fade" id="sub-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">과목명 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 과목명을 입력해 주세요.</h4>

					<hr>
				
					
						<div class="form-group">
							<label class="control-label col-sm-2">과목명</label>
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





	<!-- 과목 수정 Modal -->
	<div class="modal fade" id="sub-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">SUB001 과목명 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">자바 네트워트 프로그래밍</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">과목명</label>
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
	<div class="modal fade" id="sub-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">SUB001 과목명 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">자바 네트워트 프로그래밍</h4>
					
					<h4 style="text-align:center;">과목을 삭제하시겠습니까?</h4>
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