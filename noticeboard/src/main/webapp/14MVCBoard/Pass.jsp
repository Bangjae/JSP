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
<script type="text/javascript">
	function validateForm(form)
	{
		if(form.pass.value == "")
			{
				alert("비밀번호를 입력하세요.");
				form.pass.focus();
				return false;
			}
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
<h2 style="text-align:center; font-size:35px; magrin-top:30px; font-weight:600;">자유 게시판 - 비밀번호 검증(Pass)</h2>
</div>
<!-- 
	글쓰기 페이지를 복사하여 해당 페이지를 만들 때 비밀번호 검증시에는 첨부파일이 
	필요없으므로 enctype은 제거해야 한다.
 -->
<form name="writeFrm" method="post" style="margin-top:20px;"
action="../mvcboard/pass.do" onsubmit="return validateForm(this);">
<!-- 
	해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은 후 request영역에 
	저장하여 View에서 확인할 수 있지만, EL을 이용하면 해당 과정없이 param내장객체로
	즉시 값을 받아올 수 있다.
	
	* hidden박스를 사용하는 경우 웹브라우저에서는 숨김처리 되기 때문에 
	제대로 입력되었는지 화면으로 확인 할 수 없다. 따라서 개발자 모드를 사용하거나,
	type을 디버깅용으로 잠깐 수정한 후 값이 제대로 입력되었는지 반드시 확인해야한다.
 -->
<input type="hidden" name="idx" value="${ param.idx }" />
<input type="hidden" name="mode" value="${ param.mode }" />
<div style="margin-top:30px;">
<table border="2" width="90%" style="margin-top:30px;" class="table table-bordered">
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">검증하기</button>
			<button type="reset">RESET</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록 바로가기
			</button>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>