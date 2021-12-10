<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>새글 작성 페이지(save.jsp)</h2>
	로그인 아이디 : ${sessionScope.loginId}
	<form action="/board/save" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="b_writer" value="${sessionScope.loginId}" readonly> <br>
		비밀번호 : <input type="password" name="b_password" id="pw" placeholder="비밀번호" onblur="pCheck()">
		<span id="pCheck"></span> <br>
		글 제목 : <input type="text" name="b_title"> <br>
		글 내용 : <textarea name="b_contents" rows="5"></textarea> <br>
		파일 첨부 : <input type="file" name="b_file"> <br>
		<input type="submit" value="작성">
	</form>
</body>
<script>
	function pCheck() {
		const pCheck = document.getElementById('pCheck');
		const pw = document.getElementById('pw').value;
		
		if (pw == null) {
			pCheck.style.color = 'red';
			pCheck.innerHTML = '1자 이상 적어주세요';
		}
	} // 해당껏에 특문 기능 넣기
</script>
</html>