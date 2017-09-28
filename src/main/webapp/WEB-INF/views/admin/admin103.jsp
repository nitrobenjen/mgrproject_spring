			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


			<h3>기초 정보 관리 > 교재명</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>교재ID</th>
						<th>교재명</th>
						<th>출판사</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>B001</td>
						<td>이것이 자바다</td>
						<td>한빛출판사</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#b-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#b-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>B002</td>
						<td>쉽게 배우는 오라클</td>
						<td>생능출판사</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B003</td>
						<td>속깊은 jQuery</td>
						<td>루비페이퍼</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B004</td>
						<td>html 웹 프로그래밍 입문</td>
						<td>생능출판사</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B005</td>
						<td>프런트엔드 웹 디자인 입문</td>
						<td>이지스퍼블리싱</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B006</td>
						<td>UI / UX 디자인 이론과 실습</td>
						<td>한빛아카데미</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B007</td>
						<td>자바 네트워크 프로그래밍</td>
						<td>제이펍</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B008</td>
						<td>TCP/IP 쉽게, 더 쉽게</td>
						<td>제이펍</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B009</td>
						<td>파이썬 라이브러리를 활용한 데이터 분석</td>
						<td>한빛미디어</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
					<tr>
						<td>B010</td>
						<td>논쟁적 UX</td>
						<td>제이펍</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default">삭제</button></td>
					</tr>
				</tbody>
			</table>


			<form class="form-inline" method="post" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default"
					data-toggle="modal" data-target="#b-insert-Modal">등록</button>
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
	<div class="modal fade" id="b-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">교재명 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 교재명을 입력해 주세요.</h4>

					<hr>
									
						<div class="form-group">
							<label class="control-label col-sm-2">교재명</label>
							<div class="col-sm-10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2 m10">출판사</label>
							<div class="col-sm-10 m10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2 m10">사진</label>
							<div class="col-sm-10 m10">
								<input type="file" class="form-control" id="pic_filename"
								name="pic_filename" required="required"> <span
								class="help-block">(only .jpg or .png, 1M byte 이내)</span>
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
	<div class="modal fade" id="b-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">B001 교재명 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">이것이 자바다</h4>

					<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-2">교재명</label>
							<div class="col-sm-10">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2 m10">출판사</label>
							<div class="col-sm-10 m10"">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<label class="control-label col-sm-2 m10">사진</label>
							<div class="col-sm-10 m10">
								<input type="file" class="form-control" id="pic_filename"
								name="pic_filename" required="required"> <span
								class="help-block">(only .jpg or .png, 1M byte 이내)</span>
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
	<div class="modal fade" id="b-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">B001 교재 삭제</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align:center;font-weight:bold;">이것이 자바다</h4>
					
					<h4 style="text-align:center;">교재를 삭제하시겠습니까?</h4>
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