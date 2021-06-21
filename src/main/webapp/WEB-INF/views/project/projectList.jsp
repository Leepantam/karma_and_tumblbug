<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<style type="text/css">

a {
	color: black;
}

img {
	height: 200px;
	width: 100%;
	object-fit: contain;
}
h3{
  font-family: 'MapoGoldenPier';  text-align: center;
  border-bottom: 5px dotted gray;
  padding-top:30px;
  padding-bottom:30px;
}

@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h3>프로젝트 둘러보기</h3>
		<form action="./projectList" id="frm" class="form-inline" >
			<div class="input-group">
				<select id="category" name="category">
					<option value="default">카테고리 선택</option>
					<option>유기 동물 구조</option>
					<option>야생 동물 구조</option>
					<option>임시 보호</option>
				</select> <a type="button" id="setCategory" class="btn btn-primary">선택
					카테고리의 프로젝트만 보기</a>
			</div>
		</form>
		
		<div class="input-group">
			<c:forEach items="${projectList}" var="project">
				<c:if test="${project.state eq 'accept'}">

					<div class="card" style="width: 18rem; margin: 1rem;">
						<div id="test" title="${project.mediaFiles}">
							<c:forEach items="${project.mediaFiles}" var="media">
								<c:if test="${media.division eq 'photo'}">
									<img
										src="../resources/images/project/f/${project.num}/${media.fileName}">
								</c:if>

							</c:forEach>
						</div>
						<div class="card-body">
							<h5 class="card-title">${project.title}</h5>
							<div class="input-group">
								<p class="card-text">${project.category}</p>
								<p class="card-text">&nbsp | &nbsp</p>
								<p class="card-text">${project.makerName}</p>
							</div>

							<div class="input-group">
								<p class="card-text">${project.pushAmount}</p>
								<p class="card-text">&nbsp / &nbsp</p>
								<p class="card-text">${project.targetAmount}</p>
							</div>
							<a href="./projectSelect?num=${project.num}"
								class="btn btn-primary">자세히 보기</a>
						</div>
					</div>


				</c:if>
			</c:forEach>
		</div>

	</div>
	<script type="text/javascript" src="../resources/jquery/projectList.js"></script>
</body>
</html>