<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>찾아 오시는 길</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
	
</script>
<style>
body {
	background-color: #080710;
}

.div1
{
	margin-left :5%;
	
}


</style>
</head>
<body>
		<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#!">Welcome to BJ Project</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<%
               			if (session.getAttribute("id") == null) { //로그아웃 상태
               		%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="./MainPage.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="./SignUp.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./LoginPage.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="../mvcboard/list.do">자유게시판</a></li>	
					   <%
              				} else if (session.getAttribute("id") != null) {
               				String showId = (String) session.getAttribute("id");
               			%>
               			<li class="nav-item"><a class="nav-link" href="#"><%= showId %>님</a></li>
                        <li class="nav-item"><a class="nav-link" onclick=";"
                           href=" ${ pageContext.request.contextPath }/Controller/LogoutController.do">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" onclick=";"
                           href=" ${ pageContext.request.contextPath }/Controller/UpdateController.do">정보수정</a></li>
						<li class="nav-item"><a class="nav-link" onclick=";"
                           href=" ${ pageContext.request.contextPath }/view/Verify.jsp">회원탈퇴</a></li>
                        <li class="nav-item"><a class="nav-link" onclick=";"
                        href=" ${ pageContext.request.contextPath }/view/Board.jsp">회원게시판</a></li>
						<%
						}
						%>
					<li class="nav-item"><a class="nav-link" href="#!">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/view/Navigation.jsp">오시는 길</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<br/><br/><br/>
	<div class="div1">
	<h1 style="color:white;">        오시는 길</h1>
	</div>
	<br/><br/><br/>
	
	<!-- 지도를 담을 영역  -->
<div class="div1" id="map" style="width:600px;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e46021b8b52f9db7b23289be1a332479"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.55788572281927, 126.97558771121675),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.55788572281927, 126.97558771121675); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
	
	<p style="color:white; margin-left:5%; margin-top:18px;" >
	주소: 서울 중구 세종대로 14 그랜드센트럴 A동 23층 (우)04521 
	<BR/>
	TEL : 02 - 331- 3312  FAX 02-5700-0800 
	<br/>
	</p>
	<br/>
	<ul style="color:white; margin-left: 5%; margin-top:15px; font-size:20px; font-weight: 600;" >
		<li>지하철 이용 시</li></ul>
	<p style="color:white; margin-left: 8%; margin-top:15px; font-size:14px;" >
	1호선 서울역 4번 출구(도보 2분), 4호선 회현역 5번 출구(도보 5분)
	</p>
	
	<ul style="color:white; margin-left: 5%; margin-top:15px; font-size:20px; font-weight: 600;" >
		<li>버스 이용 시</li></ul>
	<p style="color:white; margin-left: 8%; margin-top:15px; font-size:14px;" >
	1호선 서울역 4번 출구(도보 2분), 4호선 회현역 5번 출구(도보 5분)
	</p>
		
		
	<ul style="color:white; margin-left: 5%; margin-top:15px; font-size:20px; font-weight: 600;" >
		<li>자동차 이용 시</li></ul>
	<p style="color:white; margin-left: 8%; margin-top:15px; font-size:14px;" >
	[종로 방향에서 오시는 길]<br/>
	종로 → 서울역 방향으로 직진 → 남대문 경찰서 앞 유턴 → 숭례문 방향 직진 → 그랜드센트럴 지나서 우회전(일방통행) → 건물 주차장 진입
    <br/><br/>
	[홍제동 방향에서 오시는 길]<br/>
	홍제동 → 서울역 방향으로 직진 → 서울역 교차로에서 숭례문 방향으로 좌회전 100m 이동 후 그랜드센트럴 지나서 우회전(일방통행) → 건물 주차장 진입
	<br/><br/>
	[퇴계로 방향에서 오시는 길]<br/>
	퇴계로 남대문시장 서울역 방면으로 직진 → 회현역 사거리 지나서 800m 이동 → 그랜드센트럴 지나서 우회전(일방통행) → 건물 주차장 진입
	<br/><br/>
	[한강대교 방향에서 오시는 길]<br/>
	한강대로 서울역, 숭례문 방향으로 직진 → 서울역 교차로에서 숭례문 방향으로 직진 후 그랜드센트럴 지나서 우회전(일방통행) → 건물 주차장 진입
	</p>
	<br/><br/><br/><br/><br/><br/><br/>
	
</body>
</body>
</html>