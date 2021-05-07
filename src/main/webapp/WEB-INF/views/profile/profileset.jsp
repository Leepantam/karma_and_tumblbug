<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 500px;
	margin: 0 auto;
	padding-top:30px;
  padding-bottom:30px;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-align: center;
	border-bottom: 5px dotted gray;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
  	font-family: 'MapoGoldenPier'; 
  	text-align: center;
  
}

@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">프로필</li>
			<li><a href = "../membership/memberPage">계정</a></li>
			<li><a href = "../payment/paymentList">결제수단</a></li>
			<li><a href = "../shipping/shippingList">배송지</a></li>
			
		</ul>

		<div id="tab-1" class="tab-content current">
			<jsp:include page="profileset2.jsp" />
		</div>
		

	</div>
<script type="text/javascript" src="../resources/jquery/profileset.js"></script>
</body>
</html>