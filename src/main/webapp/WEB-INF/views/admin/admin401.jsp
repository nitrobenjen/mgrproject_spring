			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>수강생 관리 > 수강생 정보</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>수강생ID</th>
						<th>이름</th>
						<th>주민번호</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>과정등록</th>
						<th>수강이력</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>STU001</td>
						<td>홍길동</td>
						<td>1022432</td>
						<td>010-1234-1234</td>
						<td>17/03/21</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#student-ocu-Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">0</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#student-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#student-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>STU002</td>
						<td>이순신</td>
						<td>1544236</td>
						<td>010-4758-6532</td>
						<td>17/03/21</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm"  onclick="location.href='${pageContext.request.contextPath}/admin/admin402'">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU003</td>
						<td>이순애</td>
						<td>2312547</td>
						<td>010-4231-1236</td>
						<td>16/12/29</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU004</td>
						<td>김정훈</td>
						<td>1788896</td>
						<td>010-5236-4221</td>
						<td>17/10/20</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU005</td>
						<td>한석봉</td>
						<td>1566789</td>
						<td>010-5211-3542</td>
						<td>17/10/27</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU006</td>
						<td>이기자</td>
						<td>2978541</td>
						<td>010-3214-5357</td>
						<td>17/10/09</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU007</td>
						<td>장인철</td>
						<td>1625148</td>
						<td>010-2345-2525</td>
						<td>17/04/15</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>STU008</td>
						<td>김영년</td>
						<td>2362514</td>
						<td>010-2222-4444</td>
						<td>17/11/24</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">등록</button></td>
						<td><button type="button" class="btn btn-default btn-sm">
								<span class="badge" id="Count">2</span> 보기
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
				</tbody>
			</table>
			
			<div style="position:absolute;">
			<button type="button" class="btn btn-default"
					data-toggle="modal" data-target="#student-insert-Modal">수강생 등록</button>
			<button type="button" class="btn btn-default btn-sm">
						TotalCount <span class="badge" id="totalCount">8</span></button>	
			</div>
			<div style="text-align: center;">
			
				<ul class="pagination" style="margin:0px 0px 20px 0px;">
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
						

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




	<!-- 수강생 등록 Modal -->
	<div class="modal fade" id="student-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수강생 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					
						<div class="form-group">
							<label class="control-label col-sm-3">수강생 이름</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">주민등록번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
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


	<!-- 수강 과정 등록 Modal -->
	<div class="modal fade" id="student-ocu-Modal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수강 과정 등록</h5>
				</div>
				<form>
				<div class="modal-body">
				
				<h3 style="text-align: center;">STU001 / 홍길동 / 010-1234-1234</h3>
				
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
						<th>과목수</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>1/25</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td>2</td>
						<td><input type="radio" name="optradio"></td>
					</tr>
					<tr>
						<td>OCU002</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td>제4강의실</td>
						<td>1/40</td>
						<td>17-01-17</td>
						<td>17-04-17</td>
						<td>2</td>
						<td><input type="radio" name="optradio"></td>
					</tr>
				</tbody>
			</table>
			
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>




	<!-- 수강생 수정 Modal -->
	<div class="modal fade" id="student-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 삭제</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					
						<div class="form-group">
							<label class="control-label col-sm-3">수강생 ID</label>
							<div class="col-sm-9">
								<input class="form-control" id="focusedInput" type="text" value="STU001" readonly>
							</div>
							<label class="control-label col-sm-3 m10">수강생 이름</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text"  value="홍길동">
							</div>
							<label class="control-label col-sm-3 m10">주민등록번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text" value="1022432">
							</div>
							<label class="control-label col-sm-3 m10">전화번호</label>
							<div class="col-sm-9 m10">
								<input class="form-control" id="focusedInput" type="text" value="010-1234-1234">
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


	<!-- 수강생 삭제 Modal -->
	<div class="modal fade" id="student-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">개설 과정 삭제</h3>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;font-weight:bold;">STU001 / 홍길동 / 010-1234-1234</h4>
					<h4 style="text-align: center;">수강생을 삭제하시겠습니까?</h4>
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