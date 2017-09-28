			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>개설 과목 관리</h3>
			
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
						<th>수정</th>
						<th>삭제</th>
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
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#oub-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#oub-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>OUB002</td>
						<td>관계형 데이터베이스</td>
						<td>17/07/01</td>
						<td>17/07/31</td>
						<td>html 웹 프로그래밍 기초</td>
						<td>심심해</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
				</tbody>
			</table>

				<button type="button" style="float: left;position: absolute;" class="btn btn-default"
					data-toggle="modal" data-target="#oub-insert-Modal">개설 과목 등록</button>

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

	<!-- 개설 과정 등록 Modal -->
	<div class="modal fade" id="oub-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">과목 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>SUB001 / 자바 네트워트 프로그래밍</option>
							        <option>SUB002 / 자바 웹 프로그래밍</option>
							        <option>SUB003 / JDBC 프로그래밍</option>
							        <option>SUB004 / HTML5/CSS3/JavaScript</option>
							        <option>SUB005 / jQuery & Ajax</option>
							        <option>SUB006 / UI디자인</option>
							        <option>SUB007 / UI/UX가이드 제작</option>
							        <option>SUB008 / 플랫폼별 UI디자인</option>
							        <option>SUB009 / Framework</option>
							        <option>SUB010 / Oracle DBMS</option>
							        <option>SUB011 / Front-end 개발</option>
							        <option>SUB012 / 빅데이터 분석 및 시각화</option>
							        <option>SUB013 / 실무 프로젝트 통합구현</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">교재 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>B001 / 이것이 자바다 / 한빛출판사</option>
							        <option>B002 / 쉽게 배우는 오라클 / 생능출판사</option>
							        <option>B003 / 속깊은 jQuery / 루비페이퍼</option>
							        <option>B004 / html 웹 프로그래밍 입문 / 생능출판사</option>
							        <option>B005 / 프런트엔드 웹 디자인 입문 / 이지스퍼블리싱</option>
							        <option>B006 / UI / UX 디자인 이론과 실습 / 한빛아카데미</option>
							        <option>B007 / 자바 네트워크 프로그래밍 / 제이펍</option>
							        <option>B008 / TCP/IP 쉽게, 더 쉽게 / 제이펍</option>
							        <option>B009 / 파이썬 라이브러리를 활용한 데이터 분석 / 한빛미디어</option>
							        <option>B010 / 논쟁적 UX / 제이펍</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강사 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>TCH001 / 지재환 / 1687988 / 010-8888-7474</option>
							        <option>TCH002 / 심심해 / 2222222 / 010-2444-4444</option>
							        <option>TCH003 / 김미나 / 2999999 / 010-3697-7412</option>
							        <option>TCH004 / 이정석 / 1325468 / 010-9999-9999</option>
							        <option>TCH005 / 정영희 / 2153252 / 010-7777-7777</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과목 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubstartdate"
									name="oubstartdate" placeholder="과목 시작일(YYYY-MM-DD)"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과목 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubenddate"
									name="oubenddate" placeholder="과목 종료일(YYYY-MM-DD)"
									required="required">
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


	<!-- 개설 과정 수정 Modal -->
	<div class="modal fade" id="oub-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
				<h4 style="text-align: center;">OUB001 / 자바 네트워트 프로그래밍</h4>
				<h5 style="text-align: center;">2017/07/01 ~ 2017/07/31 / html 웹 프로그래밍 입문 / 심심해</h5>
				
				<hr>

						<div class="form-group">
							<label class="control-label col-sm-3 m10">교재 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>B001 / 이것이 자바다 / 한빛출판사</option>
							        <option>B002 / 쉽게 배우는 오라클 / 생능출판사</option>
							        <option>B003 / 속깊은 jQuery / 루비페이퍼</option>
							        <option selected>B004 / html 웹 프로그래밍 입문 / 생능출판사</option>
							        <option>B005 / 프런트엔드 웹 디자인 입문 / 이지스퍼블리싱</option>
							        <option>B006 / UI / UX 디자인 이론과 실습 / 한빛아카데미</option>
							        <option>B007 / 자바 네트워크 프로그래밍 / 제이펍</option>
							        <option>B008 / TCP/IP 쉽게, 더 쉽게 / 제이펍</option>
							        <option>B009 / 파이썬 라이브러리를 활용한 데이터 분석 / 한빛미디어</option>
							        <option>B010 / 논쟁적 UX / 제이펍</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강사 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>TCH001 / 지재환 / 1687988 / 010-8888-7474</option>
							        <option selected>TCH002 / 심심해 / 2222222 / 010-2444-4444</option>
							        <option>TCH003 / 김미나 / 2999999 / 010-3697-7412</option>
							        <option>TCH004 / 이정석 / 1325468 / 010-9999-9999</option>
							        <option>TCH005 / 정영희 / 2153252 / 010-7777-7777</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과목 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubstartmoddate"
									name="oubstartdate" placeholder="과목 시작일(YYYY-MM-DD)" value="2017/07/01"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과목 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="oubendmoddate"
									name="oubenddate" placeholder="과목 종료일(YYYY-MM-DD)" value="2017/07/31"
									required="required">
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




	<!-- 개설 과정 삭제 Modal -->
	<div class="modal fade" id="oub-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목 삭제</h5>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;">OUB001 / 자바 네트워트 프로그래밍</h4>
					<h5 style="text-align: center;">2017/07/01 ~ 2017/07/31 / html 웹 프로그래밍 입문 / 심심해</h5>
					<br>
					<h4 style="text-align: center;">개설 과목을 삭제하시겠습니까?</h4>
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