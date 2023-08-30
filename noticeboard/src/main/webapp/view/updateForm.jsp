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
<title>update Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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
	crossorigin="anonymous">
	
</script>

<script src="./validate.js"></script>
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

.background .shape {
	height: 200px;
	width: 200px;
	position: absolute;
	border-radius: 50%;
}

form {
	margin-top: 5%;
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
	margin-top: 40px;
	margin-left: 15px;
	background-color: #ffffff;
	width: 40%;
	color: #080710;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 15px;
	height: 50px;
}

.c_imp {
	color: rgb(245, 230, 16);
}

button.ss {
	margin-top: 20px;
	width: 85%;
	margin-left: 15px;
	background-color: #ffffff;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 15px;
	height: 50px;
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

	<div class="background"></div>

	<script>
		function Check() {

		}

		function ValidationPass() {
			var uid = document.getElementById("Id")
			var pw = document.getElementById("Password")
			var cpw = document.getElementById("PasswordCheck")

			// 정규식
			// id, pw
			var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
			// 이름
			var regName = /^[가-힣a-zA-Z]{2,15}$/;

			//비밀번호 확인
			if (pw.value == "") {
				alert("변경하실 비밀번호를 입력하세요.")
				pw.focus();
				return false;
			}
			//비밀번호 영어 대소문자 확인
			else if (!regIdPw.test(pw.value)) {
				alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
				pw.focus();
				return false;
			}
			//비밀번호와 아이디 비교
			else if (pw.value == uid.value) {
				alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
				pw.focus();
				return false;
			} else {
				alert("변경 가능한 비밀번호 입니다.")
			}
		}

		function ValidationPassCheck() {
			var uid = document.getElementById("Id")
			var pw = document.getElementById("Password")
			var cpw = document.getElementById("PasswordCheck")

			// 정규식
			// id, pw
			var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
			// 이름
			var regName = /^[가-힣a-zA-Z]{2,15}$/;

			//비밀번호 확인
			if (pw.value == "") {
				alert("변경하실 비밀번호를 입력하세요.")
				pw.focus();
				return false;
			}

			//비밀번호 확인
			if (cpw.value !== pw.value) {
				alert("기존에 입력하신 비밀번호와 동일하지 않습니다.")
				cpw.focus();
				return false;
			} else {
				alert("변경 가능한 비밀번호입니다.")
			}
		}
	</script>

	<form action="../Controller/UpdateController.do" method="post">
		<h3>회원 정보 수정</h3>
		<br /> <label for="userId"> <span class="c_imp">*</span> 아이디
		</label> <input type="text" Style="width: 35%;" name="id" id="Id"
			value="${ dto.id }" readonly> <label for="password">
			<span class="c_imp">*</span> 비밀번호
		</label> <input type="password" Style="width: 60%;" name="password"
			placeholder=" 변경하실 비밀번호를 입력해주세요" id="Password"> <input
			type="button" value="비밀번호확인" onclick="ValidationPass();"
			style="width: 20%; background-color: rgb(97, 87, 87)"
			display="inline;"> <label for="password"> <span
			class="c_imp">*</span> 비밀번호 확인
		</label> <input type="password" Style="width: 60%;" name="passwordCheck"
			placeholder=" 변경하실 비밀번호를 재입력해주세요" id="PasswordCheck"> <input
			type="button" value="비밀번호확인" onclick="ValidationPassCheck();"
			style="width: 20%; background-color: rgb(97, 87, 87)"
			display="inline;"> <label for="username"> <span
			class="c_imp">*</span> 이름(실명)
		</label> <input type="text" Style="width: 40%;" value="${ dto.name }"
			name="name" placeholder="" id="Name" readonly /> <label
			for="username"> 생년월일</label> <input type="text"
			Style="width: 40%; font-size: 12px;" value="${ dto.birth }"
			name="birth" id="Birth" /> <label for="address"> <span
			class="c_imp">*</span> 주소
		</label> <input type="text" id="sample6_postcode" value="${ dto.zipcode }"
			name="zipcode" style="width: 30%;" display="inline;"> <input
			type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
			style="width: 20%; background-color: rgb(97, 87, 87)"
			display="inline;"> <input type="text" id="sample6_address"
			value="${ dto.address }" name="address" style="width: 90%;">

		<input type="text" id="sample6_detailAddress"
			value="${ dto.detailaddress }" name="detailAddress"
			style="width: 45%" display="inline;"> <input type="text"
			id="sample6_extraAddress" value="${ dto.chamgo }" name="chamgo"
			style="width: 45%" display="inline;">

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if (data.userSelectedType === 'R') {
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									// 조합된 참고항목을 해당 필드에 넣는다.
									document
											.getElementById("sample6_extraAddress").value = extraAddr;

								} else {
									document
											.getElementById("sample6_extraAddress").value = '';
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document
										.getElementById("sample6_detailAddress")
										.focus();
							}
						}).open();
			}
		</script>

		<button type="submit" class="sample">변경하기</button>
		<button type="reset" class="sample">취소하기</button>
	</form>
</body>

</html>