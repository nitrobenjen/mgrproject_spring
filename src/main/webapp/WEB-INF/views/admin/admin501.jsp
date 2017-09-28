			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

			<h3>성적 관리 > 과목별</h3>

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
						<td><button type="button" class="btn btn-default btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/admin501-sub'">
								<span class="badge" id="Count">2</span> 보기
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
								<span class="badge" id="Count">0</span> 보기
							</button></td>
					</tr>
				</tbody>
			</table>
			
			<div style="position:absolute;">
			<button type="button" class="btn btn-default btn-sm">
						TotalCount <span class="badge" id="totalCount">25</span></button>	
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



</body>
</html>