<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkId() {
		
		
	}
	
	function checkPwd() {
		
		
	}
</script>
</head>
<body>
	<h2>login 페이지(login.jsp)</h2>
	<div>
		<input type="text" name="m_id" id="checkId" onblur="checkId()" placeholder="아이디">
		<input type="password" name="m_password" id="checkPwd" onblur="checkPwd()" placeholder="비밀번호">
		<input type="button" value="로그인 요청">
	</div>
</body>
</html>