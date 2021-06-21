<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<style type="text/css">
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
img {
	height: 200px;
	width: 100%;
	object-fit: contain;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
	
		<h3>프로젝트 점검</h3>
		<h4>submit</h4>
		<c:forEach items="${adminProject}" var="aProject">
			<c:if test="${aProject.state eq 'submit'}">
				<div class="card" >
					<div class="card-body">
						<div class="input-group">
							<div id="test">
								<c:forEach items="${aProject.mediaFiles}" var="media">
									<c:if test="${media.division eq 'photo' }">
										 <img
											src="../resources/images/project/f/${aProject.num}/${media.fileName}">
									</c:if>
								</c:forEach>
							</div>
							<div>
								<div class="input-group">
									<a class="card-title" href="./projectSelectAdmin?num=${aProject.num}">${aProject.title}</a>
									<p class="card-text r" id="state">&nbsp|&nbsp&nbsp&nbsp&nbsp${aProject.state}</p>
								</div>
								<div>
									<p class="card-text" id="state">${aProject.summary}</p>
								</div>
							</div>

						</div>
						<a type="button" class="btn btn-outline-primary"
							href="./projectAdminUpdate?num=${aProject.num}&state='denied'"
							id="denied">거절</a> <a type="button"
							class="btn btn-outline-primary"
							href="./projectAdminUpdate?num=${aProject.num}&state='accept'">허용</a>

					</div>
				</div>
			</c:if>
		</c:forEach>
		
		<h4>denied</h4>
		<c:forEach items="${adminProject}" var="aProject">
			<c:if test="${aProject.state eq 'denied'}">
				<div class="card">
					<div class="card-body">
						<div class="input-group">
							<div id="test">

								<c:forEach items="${aProject.mediaFiles}" var="media">
									<c:if test="${media.division eq 'photo' }">
									 <img src="../resources/images/project/f/${aProject.num}/${media.fileName}">
									</c:if>

								</c:forEach>
							</div>
							<div>
								<div class="input-group">
									<a class="card-title" href="./projectSelectAdmin?num=${aProject.num}">${aProject.title}</a>
									<p class="card-text r" id="state">&nbsp|&nbsp&nbsp&nbsp&nbsp${aProject.state}</p>
								</div>
								<div>
									<p class="card-text" id="state">${aProject.summary}</p>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<h4>accept</h4>
		<c:forEach items="${adminProject}" var="aProject">
			<c:if test="${aProject.state eq 'accept'}">
				<div class="card">
					<div class="card-body">
						<div class="input-group">
							<div id="test">

								<c:forEach items="${aProject.mediaFiles}" var="media">
									<c:if test="${media.division eq 'photo' }">
									 <img src="../resources/images/project/f/${aProject.num}/${media.fileName}">
									</c:if>

								</c:forEach>
							</div>
							<div>
								<div class="input-group">
									<a class="card-title" href="./projectSelectAdmin?num=${aProject.num}">${aProject.title}</a>
									<p class="card-text r" id="state">&nbsp|&nbsp&nbsp&nbsp&nbsp${aProject.state}</p>
								</div>
								<div>
									<p class="card-text" id="state">${aProject.summary}</p>
								</div>
							</div>

						</div>

					</div>
				</div>
			</c:if>
		</c:forEach>
		
		
		
		
	</div>
</body>
</html>