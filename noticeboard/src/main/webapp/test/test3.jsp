<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/views/member/memeberJoin.jsp" method="post">
		<fieldset>
			<legend>회원 가입</legend>
			회원 ID : <input type="text" name="userId" placeholder="ID를 입력하세요"><br>
			비밀 번호 : <input type="password" name="userPwd" placeholder="PW를 입력하세요"><br>
			비밀 번호(re) : <input type="password" name="userPwd_re" placeholder="PW를 재입력하세요"><br>
			이름 : <input type="text" name="userName" placeholder="이름을 입력하세요"><br>
			나이 : <input type="text" name="age" size=3>세<br>
			이메일 : <input type="email" name="email" size=30 placeholder="@ 형식의 이메일을 입력하세요"><br>
			휴대폰 : <input type="text" name="phone" placeholder="폰번호를 입력하세요"><br>
			주소 : <input type="text" name="address" placeholder="주소를 입력하세요"><br>
			성별 : <input type="radio" name="gender" value="M" checked>남 
			<input type="radio" name="gender" value="F">여<br>
			취미 <br>
			<input type="checkbox" name="hobby" value="운동">운동 
			<input type="checkbox" name="hobby" value="등산">등산 
			<input type="checkbox" name="hobby" value="독서">독서<br> 
			<input type="checkbox" name="hobby" value="노래">노래 
			<input type="checkbox" name="hobby" value="댄스">댄스 
			<input type="checkbox" name="hobby" value="기타">기타 <br>
			<br><br>
			<input type="submit" value="가입하기" id="joinBtn"> <input type="reset" value="다시 입력하기"><br><br>
			<a href="/">메인 페이지로 돌아가기</a>
		</fieldset>
	
	
	<script>
		$('#joinBtn').click(function(){
			// 간단한 유효성 검사
			var userPwd=$('input[name=userPwd]').val();
			var userPwd_re=$('input[name=userPwd_re]').val();
			
			if(userPwd!=userPwd_re){
				alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
				return false
			}
			
			return true;
		});
	
	</script>
	</form>
</body>
</html>