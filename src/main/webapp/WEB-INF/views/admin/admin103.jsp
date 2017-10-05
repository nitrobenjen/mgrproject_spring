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
						<th>교재이미지</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="tbody">
<!-- 					<tr>
						<td>B001</td>
						<td>이것이 자바다</td>
						<td>한빛출판사</td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#b-mod-Modal">수정</button></td>
						<td><button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#b-del-Modal">삭제</button></td>
					</tr>	 -->		
					<c:forEach var="a" items="${booklist}">
					<tr>
						<td>${a.book_id}</td>
						<td>${a.book_name}</td>
						<td>${a.publisher}</td>
						<td><button type="button" class="imgview btn btn-default" value="${a.book_imgname}" ${empty a.book_imgname?'disabled':''}>이미지보기</button></td>
						<td><button type="button" class="btn btn-default modifybtn" ${a.check} value="${a.book_id}">수정</button></td>
						<td><button type="button" class="btn btn-default delbtn" ${a.check} value="${a.book_id}">삭제</button></td>
					</tr>
					
					</c:forEach>
							
				</tbody>
			</table>


			<form class="form-inline" style="text-align: center;">
				<button type="button" style="float: left;" class="btn btn-default addbtn">등록</button>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="book_id">교재ID</option>
						<option value="book_name">교재명</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="value" name="value"
						required>
				</div>
				<button type="button" class="btn btn-default searchbtn">Search</button>
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
				
				<div class="modal-body">
				
					<h4 style="text-align:center;">새로운 교재를 검색 합니다.</h4>

					<hr>
					
					<table class="table table-striped table-bordered">
					
					<thead>
								<tr>
									<th>선택</th>
									<th>교재명</th>
									<th>출판사</th>
									<th>교재이미지</th>
								</tr>
							</thead>
							
							<tbody class="searchlist">
				<!-- 				<tr >
									<td><input type="radio" style="vertical-align:middle;" name="gender"  value="female"></td>
									<td>홍길동</td>
									<td>010-1234-1234</td>
									<td><button type="button" class="imgview btn-xs btn-default">이미지보기</button></td>
								</tr> -->
								
							</tbody>					
					</table>
						<div class="form-group">
							<label class="control-label col-sm-2">검색</label>
							<div class="col-sm-7">
								<input class="form-control book_name" id="" type="text" name="book_name">								
							</div>
							<div class="col-sm-3">
								<button class="btn btn-default book_search" type="button" id="book_search">검색</button>
							</div>	
						</div>
						
						<div style="text-align: center;">
						<input type="hidden" class="booknamesearch" value="">
							<ul class="pagination pagenum" style="margin: 0px 0px 20px 0px;">
							<!-- 	<li class="active"><a href="#">1</a></li> -->
				
							</ul>
						</div>
					
						
				
				</div>
				<form class="form-horizontal" action="adminBaisicBookAdd">	
				<input type="hidden" name="book_name" id="book_name">
				<input type="hidden" name="publisher" id="publisher">
				<input type="hidden" name="book_imgname" id="book_imgname">
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" >현재페이지<span class="badge currentpage">0</span></button>
					<button type="submit" class="btn btn-default addsubmit" disabled>등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>





	<!-- 교재 수정 Modal -->
	<div class="modal fade" id="b-mod-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">B001 교재 수정</h5>
				</div>
				
				<div class="modal-body">
				
					<h4 style="text-align:center;" class="modalbody">선택된 교재명/출판사</h4>

					<hr>
					
					<table class="table table-striped table-bordered">
					
					<thead>
								<tr>
									<th>선택</th>
									<th>교재명</th>
									<th>출판사</th>
									<th>교재이미지</th>
								</tr>
							</thead>
							
							<tbody class="searchlist">
				<!-- 				<tr >
									<td><input type="radio" style="vertical-align:middle;" name="gender"  value="female"></td>
									<td>홍길동</td>
									<td>010-1234-1234</td>
									<td><button type="button" class="imgview btn-xs btn-default">이미지보기</button></td>
								</tr> -->
								
							</tbody>					
					</table>
						<div class="form-group">
							<label class="control-label col-sm-2">검색</label>
							<div class="col-sm-7">
								<input class="form-control book_name2" id="" type="text" name="book_name">								
							</div>
							<div class="col-sm-3">
								<button class="btn btn-default book_search2" type="button">검색</button>
							</div>	
						</div>
						
						<div style="text-align: center;">
						<input type="hidden" class="booknamesearch" value="">
							<ul class="pagination pagenum" style="margin: 0px 0px 20px 0px;">
							<!-- 	<li class="active"><a href="#">1</a></li> -->
				
							</ul>
						</div>
					
						
				
				</div>
				<form class="form-horizontal" action="adminbasicbookmodify">	
				<input type="hidden" name="book_name" class="book_name">
				<input type="hidden" name="publisher" class="publisher">
				<input type="hidden" name="book_imgname" class="book_imgname">
				<input type="hidden" name="book_id" class="book_id">
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" >현재페이지<span class="badge currentpage">0</span></button>
					<button type="submit" class="btn btn-default modifysubmit" disabled>수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>




	<!-- 교재 삭제 Modal -->
	<div class="modal fade" id="b-del-Modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title modaltitle">B001 교재 삭제</h5>
				</div>
				<div class="modal-body ">

					<h4 style="text-align:center;font-weight:bold;" class="modalbody">이것이 자바다</h4>
					
					<h4 style="text-align:center;">교재를 삭제하시겠습니까?</h4>
				</div>
				<form action="adminbasicbookdel" method="post">
				<input type="hidden" class="book_id" name="book_id">
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>

		</div>
	</div>


<script>
$(document).ready(function() {
	
	var key="";
	var value="";
	
	var startpage = 4; //표시할 번호 그룹
	
	
	$(document).on("click", ".book_num", function(){
		var book_name = $(this).parent().next().text();
		var publisher = $(this).parent().next().next().text();
		var book_imgname = $(this).parent().next().next().next().find("button").val();
		$(".addsubmit").removeAttr("disabled");
		
		$("#book_name").val(book_name);
		$("#publisher").val(publisher);
		$("#book_imgname").val(book_imgname);
	});
	
	
	$(document).on("click", ".book_num2", function(){
		var book_name = $(this).parent().next().text();
		var publisher = $(this).parent().next().next().text();
		var book_imgname = $(this).parent().next().next().next().find("button").val();
		$(".modifysubmit").removeAttr("disabled");
		
		$(".book_name").val(book_name);
		$(".publisher").val(publisher);
		$(".book_imgname").val(book_imgname);
	});
	

	
	$(document).on("click",".addbtn",function() {
				
		$("#b-insert-Modal").modal("show");
	});
	
	$(document).on("click", ".book_search", function(){
		
		$(".currentpage").text(1);
		var book_name = $(".book_name").val();
		$(".booknamesearch").val(book_name);
		
		var max = 10; // 한페이지에 나올 수
		var txt="";
		var image="";
		var publisher="";
		var page=""; //
		var start=1; //현재 페이지
		$.ajax({
			url:"adminbasicbookapi",
			data:{"book_name":book_name},
			success:function(data){
				
				var item2 = JSON.parse(data);				
				var item = JSON.parse(item2);
				console.log(item);
				if(item.totalResults != 0){
					
				if(item.totalResults % max != 0){
					var totalpage = Math.ceil(item.totalResults/max);
				}else{
					var totalpage = item.totalResults/max;
				}
				
				//테이블 내용 그리기
				
					for(var i=start*max-max; i<start*max; i++ ){
						if(i==item.totalResults){
							break;
						}
						
						txt += "<tr>";
						txt +="<td><input type=\"radio\" style=\"vertical-align:middle;\" name=\"book_num\" class=\"book_num\" value=\""+i+"\"></td>";
						txt += "<td>"+item.item[i].title+"</td>";
						txt += "<td>"+item.item[i].publisher+"</td>";
						txt += "<td><button type=\"button\" class=\"imgview btn-xs btn-default\" value=\""+item.item[i].coverLargeUrl+"\">이미지보기</button></td>";
						txt += "</tr>";
						
					}
					
					
				}else{
					txt += "<tr><td colspan=\"4\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";		
					
				}
				
				//페이지넘버 그리기
				if(totalpage != 0){
					page += "<li><a href=\"#\" class=\"number pagination\" value=\"1\">1</li>";
					
					var group=0;
					if(totalpage >= 3){
						page += "<li><a href=\"#\" class=\"number pagination\" >...</li>";
						for(var i=item.startIndex; i<totalpage; i++){							
							if(i+1==totalpage || group==4){
								break;
							}
							group = group+1;					
							var a = i+1;
							if(item.startIndex == i){
								page+="<li class='active'><a href=\"#\" class=\"number pagination\" >"+a+"</li>";
							}else{
								page+="<li><a href=\"#\" class=\"number pagination\" >"+a+"</li>";
							}
							
							
						}
					}
					
					if(totalpage >=2 ){
						page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagination\"  >...</li>";
						page += "<li><a href=\"#\" class=\"number pagination\" value=\""+totalpage+"\">"+totalpage+"</li>";
					}
					
					
				}else{
					
				}
				$(".searchlist").html(txt);
				$(".pagenum").html(page);

				
	
			}
					
		});		
	});
	
	
	$(document).on("click", ".imgview", function(){

		 // text: '교재설명.',

		swal({
			  title: $(this).parent().prev().prev().text(),
			  imageUrl: $(this).val(),
			  imageWidth: 200,
			  imageHeight: 200,
			  imageAlt: 'Custom image',
			  animation: false
			});
		
	});
	
	
	$(document).on("click",".modifybtn",function() {
		
		var book_id = $(this).val();
		var book_name = $(this).parents("tr").find("td").eq(1).text();
		$(".book_id").val(book_id);
		$(".modaltitle").text(book_id+" 교재정보 수정");
		$(".modalbody").text("선택된 교재 > "+book_name);
		
		$("#b-mod-Modal").modal("show");
	});
	
	$(document).on("click",".delbtn",function() {
		
		var book_id = $(this).val();
		console.log(book_id);
		var book_name = $(this).parents("tr").find("td").eq(1).text();
		$(".modaltitle").text(book_id+" 교재 삭제");
		$(".modalbody").text(book_name);
		$(".book_id").val(book_id);
		
		
		$("#b-del-Modal").modal("show");
	});
	
	$(document).on("click",".searchbtn", function(){
		key= $("#key").val();
		value = $("#value").val();
		var txt="";
		$.ajax({			
			url:"adminbasicbooksearch",
			data:{"key":key, "value":value},
			success:function(data){
				var item = JSON.parse(data);					
				if(item.length != 0){					
					for(var i=0; i<item.length; i++){
						
						txt += "<tr>";
						txt += "<td>"+item[i].book_id+"</td>";
						txt += "<td>"+item[i].book_name+"</td>";
						txt += "<td>"+item[i].publisher+"</td>";
						
						if(item[i].book_imgname == null || item[i].book_imgname == ""){
							txt += "<td><button type=\"button\" class=\"imgview btn btn-default\" value=\""+item[i].book_imgname+"\" disabled>이미지보기</button></td>";
						}else{
							txt += "<td><button type=\"button\" class=\"imgview btn btn-default\" value=\""+item[i].book_imgname+"\">이미지보기</button></td>";
							
						}
						txt += "<td><button type=\"button\" class=\"btn btn-default modifybtn\" "+item[i].check+" value=\""+item[i].book_id+"\">수정</button></td>";
						txt += "<td><button type=\"button\" class=\"btn btn-default delbtn\" "+item[i].check+"  value=\""+item[i].book_id+"\">삭제</button></td>";
						txt += "</tr>";
						
					}
				}else{
					txt += "<tr><td colspan=\"6\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";					
				}
			
				$(".tbody").html(txt); 
			}});
		
	});
	
	
});


</script>

<script>

$(document).on("click", ".number", function(){
	
	
	
	//$(this).parent().find("li").removeClass("active");	
	$(".currentpage").text($(this).text());
	var start = $(this).text();
	var book_name = $(this).parents("ul").prev().val();
	
	
	

	$.ajax({
		url:"adminbasicbookapi",
		data:{"book_name":book_name, "start":start},
		success:function(data){
			$(this).parents("ul").find("li").eq(0).addClass("active");
			var item2 = JSON.parse(data);
			var item = JSON.parse(item2);
			console.log(item);
			var max=10;
			var page ="";
			var txt = "";
			
			if(item.totalResults % max != 0){
				var totalpage = Math.ceil(item.totalResults/max);
			}else{
				var totalpage = item.totalResults/max;
			}
			
			var start1 = item.startIndex * item.maxResults - item.maxResults;
			var start2  = item.totalResults; //
		
			
			//테이블 내용 그리기
			if(item.totalResults != 0){
				for(var i=0; i<item.item.length; i++ ){					
						if(start1==start2){
						break;
					}	
					start1 = start1+1;
					txt += "<tr>";
					txt +="<td><input type=\"radio\" style=\"vertical-align:middle;\" name=\"book_num\" class=\"book_num\" value=\""+i+"\"></td>";
					txt += "<td>"+item.item[i].title+"</td>";
					txt += "<td>"+item.item[i].publisher+"</td>";
					txt += "<td><button type=\"button\" class=\"imgview btn-xs btn-default\" value=\""+item.item[i].coverLargeUrl+"\">이미지보기</button></td>";
					txt += "</tr>";
					
				}
				
				
			}else{
				txt += "<tr><td colspan=\"4\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";		
				
			}
			
			
			//페이지넘버 그리기
			if(totalpage != 0){
				page += "<li><a href=\"#\" class=\"number pagination\" value=\"1\">1</li>";
			
				var group=0;
				var startpage = 4;
				if(totalpage > 4){			
					
				page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagination\"  >...</li>";
					for(var i=start-1; i<totalpage; i++){							
						if(i-1==totalpage || group==4){
							break;	
						}
						group = group+1;		
					
						
						if(i <= 1 ){
							
						}else{
							page+="<li><a href=\"#\" class=\"number pagination\" >"+i+"</li>";
						}
						
						
					}
				}
				
				
				if(totalpage >=2 || totalpage == 2){
					page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagination\"  >...</li>";
					page += "<li><a href=\"#\" class=\"number pagination\" value=\""+totalpage+"\">"+totalpage+"</li>";
				}
				
			}else{
				
			}
			$(".searchlist").html(txt);
			$(".pagenum").html(page);
			

		}
			
	});		
	
});







$(document).on("click", ".book_search2", function(){
	
	$(".currentpage").text(1);
	var book_name = $(".book_name2").val();
	$(".booknamesearch").val(book_name);
	var max = 10; // 한페이지에 나올 수
	var txt="";
	var image="";
	var publisher="";
	var page=""; //
	var start=1; //현재 페이지
	$.ajax({
		url:"adminbasicbookapimodify",
		data:{"book_name":book_name},
		success:function(data){
			
			var item2 = JSON.parse(data);				
			var item = JSON.parse(item2);
			console.log(item);
			if(item.totalResults != 0){
				
			if(item.totalResults % max != 0){
				var totalpage = Math.ceil(item.totalResults/max);
			}else{
				var totalpage = item.totalResults/max;
			}
			
			//테이블 내용 그리기
			
				for(var i=start*max-max; i<start*max; i++ ){
					if(i==item.totalResults){
						break;
					}
					
					txt += "<tr>";
					txt +="<td><input type=\"radio\" style=\"vertical-align:middle;\" name=\"book_num\" class=\"book_num2\" value=\""+i+"\"></td>";
					txt += "<td>"+item.item[i].title+"</td>";
					txt += "<td>"+item.item[i].publisher+"</td>";
					txt += "<td><button type=\"button\" class=\"imgview btn-xs btn-default\" value=\""+item.item[i].coverLargeUrl+"\">이미지보기</button></td>";
					txt += "</tr>";
					
				}
				
				
			}else{
				txt += "<tr><td colspan=\"4\" style=\"text-align: center;\">검색된 결과가 없습니다.</td></tr>";		
				
			}
			
			//페이지넘버 그리기
			if(totalpage != 0){
				page += "<li><a href=\"#\" class=\"number pagination\" value=\"1\">1</li>";
				
				var group=0;
				if(totalpage >= 3){
					page += "<li><a href=\"#\" class=\"number pagination\" >...</li>";
					for(var i=item.startIndex; i<totalpage; i++){							
						if(i+1==totalpage || group==4){
							break;
						}
						group = group+1;					
						var a = i+1;
						
						if(item.startIndex == i){
							page+="<li class='active'><a href=\"#\" class=\"number pagination\" >"+a+"</li>";
						}else{
							page+="<li><a href=\"#\" class=\"number pagination\" >"+a+"</li>";
						}
						
					}
				}
				
				if(totalpage >=2 ){
					page += "<li class=\"disabled\"><a href=\"#\" class=\"number pagination\"  >...</li>";
					page += "<li><a href=\"#\" class=\"number pagination\" value=\""+totalpage+"\">"+totalpage+"</li>";
				}
				
				
			}else{
				
			}
			$(".searchlist").html(txt);
			$(".pagenum").html(page);

			

		}
				
	});		
});


</script>