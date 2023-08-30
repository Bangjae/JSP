<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
   integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
   crossorigin="anonymous"></script>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
   integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
   crossorigin="anonymous">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
</script>
<title></title>
<style>
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

form {
	margin-top: 3%;
	height: auto;
	width: 700px;
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
	font-size: 28px;
	font-weight: 400;
	line-height: 0px;
	text-align: center;

}

label {
	display: block;
	margin-top: 8px;
	font-size: 16px;
	font-weight: 500;
}

input {
	/* display: block; */
	height: 40px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 5px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 12px;
	font-weight: 200;
}

::placeholder {
	color: #e5e5e5;
}

button {
	margin-top: 15px;
	width: 50%;
	background-color: #ffffff;
	color: #080710;
	/* padding: 15px 0; */
	font-size: 16px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
   function validateForm(form) {
      if (form.pass.value == "") {
         alert("비밀번호를 입력하세요.");
         form.pass.focus();
         return false;
      }
   }
   $(function() {
      if ("${id}"=="") {
         alert("로그인 후 이용하세요");
         location.href="${pageContext.request.contextPath}/view/MainPage.jsp"
      }
      $('#pass').focus();
   });
   function back() {
	location.href='${pageContext.request.contextPath }/view/MainPage.jsp'
}
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


   <form action="${pageContext.request.contextPath }/Controller/DeleteController.do" name="verify" method="post"
      onsubmit="return validateForm(this)">
      <div class="container"
         style="align-content: center; margin: auto; top:5px; padding-left: 25%;">
         <table style="width: 400px;">
            <tr>
               <td style="text-align: center;"></td>
            </tr>
            <tr>
               <td>회원정보 보호를 위해 비밀번호 검증이 필요합니다.</td>
            </tr>
            <tr>
               <td>
                  <div class="row g-3 align-items-center">
                     <div class="col-auto">
                        <label for="inputPassword6" class="col-form-label">Password</label>
                     </div>
                     <div class="col-auto">
                        <input type="password" id="pass" class="form-control"
                           name="pass" aria-describedby="passwordHelpInline">
                     </div>
                  </div> <!--                <span>비밀번호</span><input type="password" class="form-control" name="pass" style="width: 100px;" /> -->
               </td>
            </tr>
            <tr>
               <td style="text-align: center;">
                  <button type="submit" style="width:30%; background-color: rgb(0, 89, 253);">입력하기</button>
                  <button type="button" style="width:30%; background-color: beige;" 
                     onclick='back();'>돌아가기</button>
               </td>
            </tr>
         </table>
      </div>
   </form>
</body>
</html>