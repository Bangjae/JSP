<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<title>Login Page</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet">
<!--Stylesheet-->
<style media="screen">
*, *:before, *:after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background-color: #080710;
}

.background {
	width: 430px;
	height: 520px;
	position: absolute;
	transform: translate(-50%, -50%);
	left: 50%;
	top: 50%;
}

.background .shape {
	height: 200px;
	width: 200px;
	position: absolute;
	border-radius: 50%;
}

.shape:first-child {
	background: linear-gradient(#1845ad, #23a2f6);
	left: -80px;
	top: -80px;
}

.shape:last-child {
	background: linear-gradient(to right, #ff512f, #f09819);
	right: -30px;
	bottom: -80px;
}

form {
	height: 520px;
	width: 400px;
	background-color: rgba(255, 255, 255, 0.13);
	position: absolute;
	transform: translate(-50%, -50%);
	top: 50%;
	left: 50%;
	border-radius: 10px;
	backdrop-filter: blur(10px);
	border: 2px solid rgba(255, 255, 255, 0.1);
	box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
	padding: 50px 35px;
}

form * {
	font-family: 'Poppins', sans-serif;
	color: #ffffff;
	letter-spacing: 0.5px;
	outline: none;
	border: none;
}

form h3 {
	font-size: 32px;
	font-weight: 500;
	line-height: 42px;
	text-align: center;
}

label {
	display: block;
	margin-top: 30px;
	font-size: 16px;
	font-weight: 500;
}

input {
	display: block;
	height: 50px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 14px;
	font-weight: 300;
}

::placeholder {
	color: #e5e5e5;
}

.button {
	margin-top: 50px;
	width: 100%;
	background-color: #ffffff;
	color: #080710;
	padding: 15px 0;
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}

.social {
	margin-top: 30px;
	display: flex;
}

.social div {
	background: red;
	width: 150px;
	border-radius: 3px;
	padding: 5px 10px 10px 5px;
	background-color: rgba(255, 255, 255, 0.27);
	color: #eaf0fb;
	text-align: center;
}

.social div:hover {
	background-color: rgba(255, 255, 255, 0.47);
}

.social .fb {
	margin-left: 25px;
}

.social i {
	margin-right: 4px;
}
</style>
</head>
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
						aria-current="page" href="${ pageContext.request.contextPath }/view/MainPage.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/view/SignUp.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/view/LoginPage.jsp">로그인</a></li>
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

	<script>
		function validateLogin(form) {
			if (form.id.value == "") {
				alert("아이디를 입력하세요.");
				form.id.focus();
				return false;
			}

			if (form.password.value == "") {
				alert("비밀번호를 입력하세요.");
				form.password.focus();
				return false;
			}
		}
	</script>
	<!-- 로그인 폼 -->
	<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form action="../Controller/LoginController.do" method="post"
		onsubmit="validateLogin(this);">

		<label for="userId">User Id</label> <input type="text"
			placeholder="Id" id="userId" name="id"> <label for="password">Password</label>
		<input type="password" placeholder="Password" id="password"
			name="password"> <input class="button" type="submit"
			value="Login" />
		<div class="social">
			<div class="go">
				<i class="fab fa-google"></i> Google
			</div>
			<div class="fb">
				<i class="fab fa-facebook"></i> Facebook
			</div>
		</div>
	</form>
</body>
</html>