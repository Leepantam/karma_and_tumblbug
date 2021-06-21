<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style type="text/css">
#sample {
	display: none;
}

.card {
	margin: 5px;
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
	<h3>프로젝트 상세 보기</h3>
		<div style="text-align: center;">
			<h4>${selectDTO.category}</h4>
			<h1>${selectDTO.title}</h1>
			<h5>${selectDTO.makerName}</h5>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="input-group">
					<c:forEach items="${selectDTO.mediaFiles}" var="media">
						<c:if test="${media.division eq 'photo'}">
							<img
								src="../resources/images/project/f/${selectDTO.num}/${media.fileName}">
						</c:if>
					</c:forEach>
					<div>
						<p>목표 금액 : ${selectDTO.targetAmount}</p>
						<p>종료 일시 : ${selectDTO.closeDate}</p>
						<p>후원 진행 상태 : ${selectDTO.pushAmount}&nbsp / &nbsp${selectDTO.targetAmount}</p>
					</div>
				</div>
			</div>
		</div>
		<div class="input-group">
			<div style="width: 80%;">
				<div class="form-group">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#home">스토리</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu1">제작자 소개</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu2">커뮤니티</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						${selectDTO.projectStory}</div>
						<div id="menu1" class="container tab-pane fade">
						<h4>활동 지역</h4>
						<h5>${selectDTO.makerLocation}</h5>
						<h4>제작자 소개</h4>
						${selectDTO.makerSummary}
						</div>
					<div id="menu2" class="container tab-pane fade">
						<c:if
							test="${not empty membership and membership.id eq selectDTO.id}">

							<a type="button" class="btn btn-outline-danger" id="add"
								title="${selectDTO.num}">진행상황 업데이트</a>
							<div id="community"></div>
						</c:if>
						<c:forEach items="${community}" var="comm">
							<div class="card" style="width: 50rem; margin: 1rem;">
								<h4 class="card-text">${comm.title}</h4>
								<br>
								<div style="height: auto; width: 100%; boarder: 1px solid gray;">
									${comm.contents}</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>

			<div style="width: 20%; text-align: center;">

				<c:if test="${not empty membership and membership.id ne selectDTO.id}">

					<c:if test="${pList eq null}">
						<c:if test="${payList.size()>0}">
							<c:forEach begin="1" end="4" var="i">
								<div class="card autoSelect" title="${i*10000}">
									<div class="card-body">
										<form id="frm" action="/p1/push/pushInsert">
											<input type="hidden" name="id" value="${membership.id}">
											<input type="hidden" name="projectNum"
												value="${selectDTO.num}"> <input id="quantity"
												type="hidden" name="quantity" value="">
											<h4>${i*10000}원</h4>
										</form>
									</div>
								</div>
							</c:forEach>
							<div class="card">
								<div class="card-body">
									<form action="/p1/push/pushInsert">
										<h5>직접 입력</h5>
										<input type="text" id="directly" class="form-control"
											name="quantity" placeholder="후원 금액 직접 입력"> <input
											type="hidden" name="id" value="${membership.id}"> <input
											type="hidden" name="projectNum" value="${selectDTO.num}">
										<button type="submit"
											class="btn btn-outline-primary btn-block">후원하기</button>
									</form>
								</div>
							</div>
						</c:if>
					</c:if>
					
					<c:if test="${pList ne null}">
					<c:set var="loop_flag2" value="false" />
						<c:forEach items="${pList}" var="push">
							<c:if test="${not loop_flag2}">
								<c:if test="${push.projectNum eq selectDTO.num}">
									<c:set var="loop_flag2" value="true" />
								</c:if>
							</c:if>
						</c:forEach>


						<c:if test="${not loop_flag2}">
							<c:if test="${payList.size()>0}">
								<c:forEach begin="1" end="4" var="i">
									<div class="card autoSelect" title="${i*10000}">
										<div class="card-body">
											<form id="frm" action="/p1/push/pushInsert">
												<input type="hidden" name="id" value="${membership.id}">
												<input type="hidden" name="projectNum"
													value="${selectDTO.num}"> <input id="quantity"
													type="hidden" name="quantity" value="">
												<h4>${i*10000}원</h4>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="card">
									<div class="card-body">
										<form action="/p1/push/pushInsert" id="dFrm">
											<h5>직접 입력</h5>
											<div class="input-group mb-3">
											<input type="text" id="directly" class="form-control"
												name="quantity" placeholder="후원 금액 직접 입력"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
												<h5>원</h5>
												</div> <input
												type="hidden" name="id" value="${membership.id}"> <input
												type="hidden" name="projectNum" value="${selectDTO.num}">
											<a type="button"
												class="btn btn-outline-primary btn-block" id="direc">후원하기</a>
										</form>
									</div>
								</div>
							</c:if>
						</c:if>
					</c:if>

					<c:if test="${payList.size()<1}">
						<div class="card">
							<p>후원을 위해 결제수단을 등록해 주세요</p>
							<a href="/p1/payment/paymentList" type="submit"
								class="btn btn-outline-primary btn-block">결제수단 등록</a>
						</div>
					</c:if>
				</c:if>
				<c:if
					test="${not empty membership and membership.id eq selectDTO.id}">
					<div class="card">
						<p>내가 만든 프로젝트 입니다.</p>
					</div>
				</c:if>

				<c:set var="loop_flag" value="false" />

				<c:if test="${pList ne null}">
					<c:forEach items="${pList}" var="push">
						<c:if test="${not loop_flag }">
							<c:if test="${push.projectNum eq selectDTO.num}">
								<div class="card">
									<a></a>
									<div class="card">
										<p>이미 후원 한 프로젝트 입니다.</p>
										<a href="/p1/push/pushList?id=${membership.id}" type="submit"
											class="btn btn-outline-primary btn-block">후원 내역 확인</a>
									</div>
								</div>
								<c:set var="loop_flag" value="true" />
							</c:if>
						</c:if>
					</c:forEach>
				</c:if>

				<c:if test="${empty membership}">
					<div class="card">
						<a></a>
						<div class="card">
							<p>후원을 위해 로그인을 해 주세요</p>
							<a href="/p1/membership/login" type="submit"
								class="btn btn-outline-primary btn-block">로그인</a>
						</div>
					</div>
				</c:if>

			</div>

		</div>
	</div>


	<script type="text/javascript" src="../resources/jquery/summerFile.js"></script>
	<script type="text/javascript"
		src="../resources/jquery/projectSelect.js"></script>
</body>
</html>