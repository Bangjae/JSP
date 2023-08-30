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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
</head>
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
			alert("제목을 입력하세요.")
			form.title.focus();
			return false;
		}
		if(form.content.value == "")
		{
			alert("제목을 입력하세요.")
			form.content.focus();
			return false;
		}
	}
</script>
<style>
.td1
{
	font-size: 18px;
	font-weight:600;
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

<div style="margin-top:30px;">
<h2 style="text-align:center; font-size:35px; magrin-top:30px; font-weight:600; ">자유 게시판 - 수정하기(Edit)</h2>
</div>
<!-- 글쓰기 페이지를 그대로 사용하되 action부분만 수정한다 수정시에도 파일첨부가 있으므로
enctype속성은 추가되어야 한다. -->
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
<!-- 게시물 수정을 위한 일련번호  -->
<input type="hidden" name="idx" value="${ dto.idx }" />
<!-- 기존의 원본파일본 -->
<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
<!-- 기존의 서버에 저장된 파일명 -->
<input type="hidden" name="prevSfile" value="${ dto.sfile }" />
<!--  해당 hidden 값은 게시물 수정 시 첨부파일이 없는경우 사용될 것이다. -->

<div style="margin-top:30px;">
<table border="2" width="90%"  class="table table-bordered" style="margin-top:30px;">
	<tr>
		<td class="td1">작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" value="${ dto.name }" />
		</td>
	</tr>
	<tr>
		<td class="td1">제목</td>
		<td>
			<input type="text" name="title" style="width:90%;" value="${ dto.title }" />
		</td>
	</tr>
	<tr>
		<td class="td1">내용</td>
		<td>
			<textarea name="content" style="width:90%;height:100px;">"${ dto.content }"</textarea>
		</td>
	</tr>
	<tr>
		<td class="td1">첨부 파일</td>
		<td>
			<input type="file" name="ofile" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성 완료</button>
			<button type="reset">RESET</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">
			목록 바로가기
			</button>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>