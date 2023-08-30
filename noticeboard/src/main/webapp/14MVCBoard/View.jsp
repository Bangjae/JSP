<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
.td1
{
	font-size: 18px;
	font-weight:600;
}

</style>
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
					if (session.getAttribute("id") == null)
					{ //로그아웃 상태
					%>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${ pageContext.request.contextPath }/view/MainPage.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/view/SignUp.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/view/LoginPage.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="../mvcboard/list.do">자유게시판</a></li>
					<%
					} else if (session.getAttribute("id") != null)
					{
					String showId = (String) session.getAttribute("id");
					%>
					<li class="nav-item"><a class="nav-link" href="#"><%=showId%>님</a></li>
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
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/view/Navigation.jsp">오시는
							길</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="margin-top: 30px;">
		<h2
			style="text-align: center; font-size: 35px; magrin-top: 15px; font-weight: 600;">자유
			게시판 - 내용</h2>
	</div>

	<div style="margin-top: 30px;">
	<table border="2" width="90%" class="table table-sm">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>
		<!-- 게시글 정보  -->
		<tr>
			<td class="td1">번호</td>
			<td>${ dto.idx }</td>
			<td class="td1">작성자</td>
			<td>${ dto.name }</td>
		</tr>
		<tr>
			<td class="td1">작성일</td>
			<td>${ dto.postdate }</td>
			<td class="td1">조회수</td>
			<td>${ dto.visitcount }</td>
		</tr>
		<tr>
			<!-- 첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
    다운로드가 완료되면 다운로드 횟수를 1증가시키기 위해 게시물의 일련번호를 
    파라미터로 전달한다. -->
			<td class="td1">제목</td>
			<td colspan="3">${ dto.title }</td>
		</tr>
		<tr>
			<td class="td1">내용</td>
			<td colspan="3" height="100">${ dto.content } <c:if
					test="${ isImage eq true }">
					<p>
						<img src="../Uploads/${dto.sfile }" alt="" />
					</p>
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="td1">첨부파일</td>
			<td><c:if test="${ not empty dto.ofile }">${ dto.ofile }<a
						href="../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }">[다운로드]</a>
				</c:if></td>
			<td class="td1">다운로드수</td>
			<td>${ dto.downcount }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.idx }';">수정하기</button>
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.idx}';">삭제하기</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">목록
					바로가기</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
