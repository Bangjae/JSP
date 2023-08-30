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
<title>회원정보수정</title>
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
               			<li class="nav-item"><a class="nav-link" href="#"><%= showId %>님</a></li>
                        <li class="nav-item"><a class="nav-link" onclick=";"
                           href=" ${ pageContext.request.contextPath }/Controller/LogoutController.do">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" onclick=";"
                           href=" ${ pageContext.request.contextPath }/Controller/UpdateController.do">정보수정</a></li>
						<%
						}
						%>
					<li class="nav-item"><a class="nav-link" href="../mvcboard/list.do">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/view/Navigation.jsp">오시는 길</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	   <form action="${pageContext.request.contextPath }/Controlloer/MemberVerifyController.do" name="verify" method="post"
      onsubmit="return validateForm(this)">
      <div class="container"
         style="align-content: center; margin: auto; top: 20px; padding-left: 25%;"
         class="col-4 ">
         <table style="width: 400px;">
            <tr>
               <td style="text-align: center;"><img src="../images/lock1.jpg"
                  alt="" width="150px" /></td>
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
                  <button type="submit" class="btn btn-primary">입력하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-secondary"
                     onclick='location.herf="${pageContext.request.contextPath }/home.do"'>돌아가기</button>
               </td>
            </tr>
         </table>
      </div>
   </form>
</body>
</html>
</body>
</html>