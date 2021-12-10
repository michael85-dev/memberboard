<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 정보 수정 페이지 (member.update.jsp)</h2>
	로그인 아이디 : ${sessionScope.loginId} 
	<button onclick="logout()">로그아웃</button> <br>
	<form action="/member/update" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="m_id" value="${mDTO.m_id}" readonly>
		비밀번호 : <input type="password" name="m_password" id="m_password" onblur="checkPwd()" placeholder="특문, 대문 입력 필수">
		<span id="checkPwd"></span> <br>
		이름 : <input type="text" name="m_name" value="${mDTO.m_name}" readonly> <br>
		이메일 : <input type="text" name="m_email"> <br>
		전화번호 : <input type="text" name="m_phone"> <br>
		프로필사진 : <input type="file" name="m_photo">
	</form>
</body>
</html>
