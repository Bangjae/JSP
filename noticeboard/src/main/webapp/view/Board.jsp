<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body
{
	background-color : white;
}

/* a{text-decoration:none;} */

.h2style
{
	margin-top:15px;
	align-content:center;
	align-text:center;
	font-size: 20px;
	font-weight: 600;
}

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
                        <li class="nav-item"><a class="nav-link active" onclick=";"
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
	
	<div class="h2style">
	<br/>
    <h2 style="text-align:center; font-size:35px; magrin-top:15px; font-weight:600; ">회원 게시판</h2>
	</div>

	<div style="margin-top:30px;">
    <!-- 검색 폼 -->
    <form method="get">  
    <table border="1" width="90%" class="table table-sm">
    <tr>
        <td align="center">
            <select name="searchField" style="border-radius:5px;">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="name">작성자</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" style="width:100px;"value="검색하기" />
        </td>
    </tr>
    </table>
    </form>

    <!-- 목록 테이블 -->
    <table border="1" width="90%" class="table table-sm">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
<!-- 게시물이 없을 때  -->
<c:choose>
	<c:when test="${ empty boardLists }">
	<!-- 게시물을 저장하고 있는 boardlist 컬렉션에 내용이 없다면 아래부분을 출력한다. -->
		<tr>
			<td colspan="6" aline="center">
				등록된 게시물이 없습니다^^*
			</td>
		</tr> <!-- when하고 otherwise사이에는 주석이 들어가면 안됨 -->
	</c:when>
	<c:otherwise>
	<!-- 게시물이 있을 때 컬렉션에 저장된 목록의 갯수만큼 반복한다. -->
		<c:forEach items="${ boardLists }" var="row" varStatus="loop">
		<!-- 
			가상번호 계산하기
			=> 전체 게시물갯수 - (((페이지번호-1) * 페이지당 게시물수) + 해당루프의 index)
			참고로 varStatus 속성 index는 0부터 시작한다.
			
			전체 게시물의 갯수가 5개이고, 페이지당 2개씩만 출력한다면 
			1페이지의 첫번 째 게시물 번호 : 5 - (((1-1)*2) + 0) = 5
			2페이지의 첫번 째 게시물 번호 : 5 - (((2-1)*2) + 0) = 3
		 -->
		<tr align="center">
			<td>
				${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
			</td>
			<td align="left">
			<!-- 제목을 클릭할 경우 내용보기 페이지로 이동한다. -->
				<a href="../mvcboard/view.do?idx=${ row.idx }">
					${ row.title }</a>
			</td>
			<td>${ row.name }</td>
			<td>${ row.visitcount }</td>
			<td>${ row.postdate }</td>
			<td>
			<!-- 첨부파일의 경우 필수사항이 아니므로 테이블 생성시에도 not null 조건이
			적용되어 있지 않다. 따라서 첨부파일이 있을 때만 다운로드 링크를 출력한다. -->
			<c:if test="${ not empty row.ofile }">
				<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
    </table>
    
    <!-- 하단 메뉴(바로가기, 글쓰기) -->
    <table border="1" width="90%" class="table table-sm">
    	<tr align="center">
    		<td>W
    			<!-- 컨트롤러(서블릿)에서 클래스 호출을 통해 이미 페이지 번호가
    			문자열로 만들어져 있는 상태이므로 뷰(JSP)에서는 출력만 해주면 된다.-->
    			${ map.pagingImg }
    		</td>
    		<td width="100"><button type="button" onclick="location.href='${ pageContext.request.contextPath }/view/bw.jsp';">
    				글쓰기</button></td>
    		</tr>
    </table>	
	</div>
	
</body>
</html>