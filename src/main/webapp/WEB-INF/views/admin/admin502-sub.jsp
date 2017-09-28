			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>성적 관리 > 수강생별 > 수강 내역</h3>
			
			<h4 style="text-align: center;font-weight:bold;">STU003 / 이순애 / 2312547 / 010-4231-1236</h4>

			<hr>

			<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과정ID</th>
						<th>과정명</th>
						<th>강의실명</th>
						<th>정원</th>
						<th>수강인원</th>
						<th>과정시작일</th>
						<th>과정종료일</th>
						<th>개설과목수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OCU001</td>
						<td>Framework을 활용한 빅데이터 개발자 과정</td>
						<td>제2강의실</td>
						<td>25</td>
						<td>5</td>
						<td>16-09-01</td>
						<td>17-02-01</td>
						<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#grade-Modal">
								<span class="badge" id="Count">3</span> 보기
							</button></td>
					</tr>
					<tr>
						<td>OCU002</td>
						<td>JAVA를 활용한 사물인터넷(IOT) 응용SW 개발자</td>
						<td>제4강의실</td>
						<td>40</td>
						<td>10</td>
						<td>17-01-17</td>
						<td>17-04-17</td>
						<td><button type="button" class="btn btn-default btn-sm" disabled>
								<span class="badge" id="Count">2</span> 보기
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



	<!-- 과목별 점수 확인 Modal -->
	<div class="modal fade" id="grade-Modal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">개설 과목별 확인</h5>
				</div>
				<div class="modal-body">
				
				<h4 style="text-align: center;font-weight:bold;">OCU001 / Framework을 활용한 빅데이터 개발자 과정 / 16-09-01 ~ 17-02-01</h4>
				<h4 style="text-align: center;">STU003 / 이순애 / 2312547 / 010-4231-1236</h4>
				
				<hr>
				
				<table class="table table-striped table-bordered ocu">
				<thead>
					<tr>
						<th>개설과목<br>ID</th>
						<th>과목명</th>
						<th>출결<br>배점</th>
						<th>필기<br>배점</th>
						<th>실기<br>배점</th>
						<th>출결<br>점수</th>
						<th>필기<br>점수</th>
						<th>실기<br>점수</th>
						<th>실험일</th>
						<th>시험과목파일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OUB001</td>
						<td>자바 네트워트 프로그래밍</td>
						<td>30</td>
						<td>30</td>
						<td>40</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>17/01/01</td>
						<td>java_simsim_161290.zip</td>
					</tr>
					<tr>
						<td>OUB002</td>
						<td>관계형 데이터베이스</td>
						<td>30</td>
						<td>30</td>
						<td>40</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>17/01/01</td>
						<td>java_simsim_161290.zip</td>
					</tr>
					<tr>
						<td>OUB003</td>
						<td>JDBC 프로그래밍</td>
						<td>30</td>
						<td>30</td>
						<td>40</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>17/01/01</td>
						<td>java_simsim_161290.zip</td>
					</tr>
				</tbody>
			</table>

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