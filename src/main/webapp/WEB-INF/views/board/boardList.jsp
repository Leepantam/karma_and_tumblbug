<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>

<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">


		<c:if test="${sort eq 'notice'}">
			<h1>공지사항</h1>
		</c:if>

		<c:if test="${sort eq 'news_letter'}">
			<h1>보호소 이야기</h1>
		</c:if>

		<c:if test="${sort eq 'press'}">
			<h1>보도자료</h1>
		</c:if>

		<c:if test="${sort eq 'review'}">
			<h1>입양후기</h1>
		</c:if>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><a href="./boardSelect?num=${dto.num}"> <c:catch>
								</c:catch> ${dto.title}
						</a></td>
						<td>${dto.writer}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hit}</td>
					</tr>
				</c:forEach>

				<tr>
					<td><c:if test="${not empty membership}">
							<c:if test="${sort eq 'review'}">
								<a href="./boardInsert?boardSort=${sort}" type="button"
									class="btn btn-outline-primary">WRITE</a>
							</c:if>
							<c:if test="${sort ne 'review'}">
								<c:if test="${membership.id eq 'admin' }">
									<a href="./boardInsert?boardSort=${sort}" type="button"
										class="btn btn-outline-primary">WRITE</a>
								</c:if>
							</c:if>
						</c:if></td>
				</tr>
			</tbody>


		</table>
	</div>


	<div class="container">
		<ul class="pagination">
			<c:if test="${pager.pre}">
				<li class="page-item"><a class="page-link p" href="#"
					title="${pager.startNum-1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link p" href="#"
					title="${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.next}">
				<li class="page-item"><a class="page-link p" href="#"
					title="${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>
		<div class="input-group mt-3 mb-3">
			<form id="frm" action="./boardList" class="form-inline">
				<input type="hidden" name="boardSort" value="${sort}"> <input
					type="hidden" name="curPage" value="1" id="curPage">
				<div class="input-group-prepend">
					<select class="form-control" id="kind" name="kind">
						<option class="sel">Title</option>
						<option class="sel">Contents</option>
						<option class="sel">Writer</option>
					</select>
				</div>
				<input type="text" class="form-control" placeholder="Username"
					name="search" id="search" value="${pager.search}">
				<div class="input-group-append">
					<button class="btn btn-success" type="submit">Search</button>
				</div>
			</form>
		</div>






	</div>
	<script type="text/javascript">
		let kind = '${pager.kind}';
		$(".sel").each(function() {
			let t = $(this).text();
			if (t == kind) {
				$(this).prop("selected", true);
			}
		});
		$('.p').click(function() {
			let curPage = $(this).attr("title");
			let search = '${pager.search}';

			$("#curPage").val(curPage);
			/* 
			$("kind").val(kind);
			$("search").val(search);
			 */
			$('#frm').submit();
		})
	</script>

</body>
</html>