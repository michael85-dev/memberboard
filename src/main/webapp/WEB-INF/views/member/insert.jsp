<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입 페이지(insert.jsp)</h2>
	<form action="/member/insert" method="post">
		아이디 : <input type="text" name="m_id" id="m_id" onblur="checkId()" placeholder="20자 미만 입력..">
		<span id="checkId"></span> <br>
		비밀번호 : <input type="password" name="m_password" id="m_password" onblur="checkPwd()" placeholder="특문, 대문 입력 필수">
		<span id="checkPwd"></span> <br>
		이름 : <input type="text" name="m_name"> <br>
		이메일 : <input type="text" name="m_email">@<select id="">
			<option selected>선택하세요</option>
			<option>gmail.com</option>
			<option>naver.com</option>
			<option>hanmail.net</option>
			<option>kakao.com</option>
			<option>daum.net</option>
		</select> <br>
		전화번호 : <input type="text" name="m_phone" placeholder="000-0000-0000"> <br>
		프로필사진 : <input type="file" name="m_photo" id="imageFile" accept="image/*">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>