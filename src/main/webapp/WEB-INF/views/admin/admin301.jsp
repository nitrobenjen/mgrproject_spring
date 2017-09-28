			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


			<h3>개설 과정 관리</h3>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실</th>
						<th>정원</th>
						<th>수강인원</th>
						<th>과정 시작일</th>
						<th>과정 종료일</th>
						<th>개설 과목</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin303'">
								<span class="badge" id="Count">8</span> 확인
							</button></td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin302'">
								<span class="badge" id="Count">2</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#ocu-del-Modal">삭제</button></td>
					</tr>
					<tr>
						<td>OCU002</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td>제4강의실</td>
						<td>40</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled><span class="badge" id="totalCount">0</span> 확인</button>
						</td>
						<td>17-01-17</td>
						<td>17-04-17</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#oub-count-Modal" disabled>
								<span class="badge" id="Count">0</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal" disabled>삭제</button></td>
					</tr>
					<tr>
						<td>OCU003</td>
						<td>Java 보안 개발자 양성과정</td>
						<td>제3강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default btn-sm"><span class="badge" id="totalCount">25</span> 확인</button>
						</td>
						<td>17-05-20</td>
						<td>17-10-27</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#oub-count-Modal">
								<span class="badge" id="Count">1</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">삭제</button></td>
					</tr>
					<tr>
						<td>OCU004</td>
						<td>Java&Python 기반 응용SW 개발자 양성</td>
						<td>제5강의실</td>
						<td>25</td>
						<td><button type="button" class="btn btn-default btn-sm"><span class="badge" id="totalCount">25</span> 확인</button>
						</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#oub-count-Modal">
								<span class="badge" id="Count">1</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">삭제</button></td>
					</tr>
					<tr>
						<td>OCU005</td>
						<td>UI/UX 개발자 양성과정</td>
						<td>제2강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default btn-sm"><span class="badge" id="totalCount">25</span> 확인</button>
						</td>
						<td>17-07-01</td>
						<td>17-12-23</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#oub-count-Modal">
								<span class="badge" id="Count">1</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">삭제</button></td>
					</tr>
					<tr>
						<td>OCU006</td>
						<td>웹기반 빅데이터 분석 응용SW개발자</td>
						<td>제2강의실</td>
						<td>30</td>
						<td><button type="button" class="btn btn-default btn-sm"><span class="badge" id="totalCount">1</span> 확인</button>
						</td>
						<td>17-07-01</td>
						<td>17-12-23</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#oub-count-Modal">
								<span class="badge" id="Count">1</span> 확인
							</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#Modal">삭제</button></td>
					</tr>
				</tbody>
			</table>

			<button type="button" style="float: left;position: absolute;" class="btn btn-default"
					data-toggle="modal" data-target="#ocu-insert-Modal">개설 과정 등록</button>

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





	<!-- 수강생 명단 Modal -->
	<div class="modal fade" id="ocu-count-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">수강생 명단</h5>
				</div>
				<div class="modal-body">

					<h4 style="text-align: center;">OCU001 / Framework을 활용한 빅데이터 개발자 과정</h4>
					<h5 style="text-align: center;">2016/09/01 ~ 2017/02/01</h5>

					<hr>

					<table class="table table-striped table-bordered ocu">
						<thead>
							<tr>
								<th>수강생 ID</th>
								<th>이름</th>
								<th>주민번호 뒷자리</th>
								<th>전화번호</th>
								<th>등록일</th>
								<th>수강횟수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>STU001</td>
								<td>홍길동</td>
								<td>1022432</td>
								<td>010-1234-1234</td>
								<td>17/03/21</td>
								<td>6</td>
							</tr>
							<tr>
								<td>STU002</td>
								<td>이순신</td>
								<td>1544236</td>
								<td>010-4758-6532</td>
								<td>17/03/21</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU003</td>
								<td>이순애</td>
								<td>2312547</td>
								<td>010-4231-1236</td>
								<td>16/12/29</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU004</td>
								<td>김정훈</td>
								<td>1788896</td>
								<td>010-5236-4221</td>
								<td>17/10/20</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU005</td>
								<td>한석봉</td>
								<td>1566789</td>
								<td>010-5211-3542</td>
								<td>17/10/27</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU006</td>
								<td>이기자</td>
								<td>2978541</td>
								<td>010-3214-5357</td>
								<td>17/10/09</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU007</td>
								<td>장인철</td>
								<td>1625148</td>
								<td>010-2345-2525</td>
								<td>17/04/15</td>
								<td>5</td>
							</tr>
							<tr>
								<td>STU008</td>
								<td>김영년</td>
								<td>2362514</td>
								<td>010-2222-4444</td>
								<td>17/11/24</td>
								<td>5</td>
							</tr>
						</tbody>
					</table>


				</div>
				<div style="text-align:center;">
					<ul class="pagination">
					  <li class="active"><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>



	<!-- 개설 과정 등록 Modal -->
	<div class="modal fade" id="ocu-insert-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 등록</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">과정 ID</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>CU001 / 웹기반 빅데이터 분석 응용SW개발자</option>
							        <option>CU002 / 애플리케이션 성능 최적화 구현 양성과정</option>
							        <option>CU003 / Java&Python 기반 응용SW 개발자 양성</option>
							        <option>CU004 / JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</option>
							        <option>CU005 / Framework을 활용한 빅데이터 개발자 과정</option>
							        <option>CU006 / UI/UX 개발자 양성과정</option>
							        <option>CU007 / Java 보안 개발자 양성과정</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">강의실</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>CA001 / 제1강의실 / 30</option>
							        <option>CA002 / 제2강의실 / 25</option>
							        <option>CA003 / 제3강의실 / 30</option>
							        <option>CA004 / 제4강의실 / 40</option>
							        <option>CA005 / 제5강의실 / 25</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과정 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocustartdate"
									name="ocustartdate" placeholder="과정 시작일(YYYY-MM-DD)"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과정 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocuenddate"
									name="ocuenddate" placeholder="과정 종료일(YYYY-MM-DD)"
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
	<div class="modal fade" id="ocu-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 수정</h5>
				</div>
				<form class="form-horizontal">
				<div class="modal-body">
				
				<h4 style="text-align: center;">OCU001 / Framework을 활용한 빅데이터 개발자 과정</h4>
				<h5 style="text-align: center;">2016/09/01 ~ 2017/02/01</h5>
				
				<hr>
					
						<div class="form-group">
							<label class="control-label col-sm-3 m10">강의실</label>
							<div class="col-sm-9 m10">
								<select class="form-control" id="sel1">
							        <option>CA001 / 제1강의실 / 30</option>
							        <option>CA002 / 제2강의실 / 25</option>
							        <option>CA003 / 제3강의실 / 30</option>
							        <option>CA004 / 제4강의실 / 40</option>
							        <option>CA005 / 제5강의실 / 25</option>
							    </select>
							</div>
							<label class="control-label col-sm-3 m10">과정 시작일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocustartmoddate"
									name="ocustartdate" placeholder="과정 시작일(YYYY-MM-DD)" value="2016/09/01"
									required="required">
							</div>
							<label class="control-label col-sm-3 m10">과정 종료일</label>
							<div class="col-sm-9 m10">
								<input type="text" class="form-control" id="ocuendmoddate"
									name="ocuenddate" placeholder="과정 종료일(YYYY-MM-DD)" value="2017/02/01"
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
	<div class="modal fade" id="ocu-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과정 삭제</h5>
				</div>
				<div class="modal-body">
					
					<h4 style="text-align: center;">OCU001 / 웹기반 빅데이터 분석 응용SW개발자</h4>
					<h5 style="text-align: center;">2016/09/01 ~ 2017/02/01</h5>
					<br>
					<h4 style="text-align: center;">개설 과정을 삭제하시겠습니까?</h4>
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