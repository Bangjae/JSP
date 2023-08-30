<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script type="text/javascript">
	function validateForm(form)
	{
		if(form.name.value == "")
		{
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		
		if(form.title.value == "")
		{
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
		if (form.pass.value == "")
		{
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
</script>
<style>
input
{
	height: 30px;
	width: 20%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 5px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 12px;
	font-weight: 200;
}

button {
	margin-top: 50px;
	width: 100%;
	background-color: #ffffff;
	color: #080710;
	/* padding: 15px 0; */
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}

button.sample {
	margin-top: 20px;
	margin-left: 10px;
	margin-bottom: 20px;
	background-color: #d3d3d3;
	width: 20%;
	color: #080710;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 15px;
	height: 50px;
}

td
{
	font-size: 18px;
	font-weight:600;
}

textarea

{
	height: 400px;
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
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="${ pageContext.request.contextPath }/view/MainPage.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/view/SignUp.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/view/LoginPage.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link active" href="../mvcboard/list.do">자유게시판</a></li>	
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



<div style="margin-top:30px;">
<h2 style="text-align:center; font-size:35px; magrin-top:30px; font-weight:600; ">자유 게시판 - 글쓰기(Write)</h2>
</div>

<div style="margin-top:20px;">
<form name="writeFrm" method="post" enctype="multipart/form-data" style="margin-left:20px; "
	action="../mvcboard/write.do" onsubmit="return validateForm(this);">
<table border="2" width="90%" class="table table-bordered">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" />
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" style="width:90%" />
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width:90%;"></textarea>
		</td>
	</tr>
	<tr>
		<td>첨부 파일</td>
		<td>
			<input type="file" name="ofile" />
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="sample">작성 완료</button>
			<button type="reset" class="sample">RESET</button>
			<button type="button" class="sample" onclick="location.href='../mvcboard/list.do';">
				목록 바로가기
			</button>
		</td>
	</tr>
</table>
</div>
<br><br><br><br><br><br>
</body>
</html>