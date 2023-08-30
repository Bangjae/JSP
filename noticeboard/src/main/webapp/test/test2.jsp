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
<title>Main Page</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
	
</script>
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
					   <%
              				} else if (session.getAttribute("id") != null) {
               				String showId = (String) session.getAttribute("id");
               			%>
               			<li class="nav-item"><a class="nav-link" href="#"><%= showId%>님</a></li>
                        <li class="nav-item"><a class="nav-link"
                           href=" ${ pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<%
						}
						%>
					<li class="nav-item"><a class="nav-link" href="#!">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">오시는 길</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>