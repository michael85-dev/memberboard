<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>update.jsp</h2>
	<div>
	<h2>내용 수정 페이지(update.jsp)</h2>
	로그인 아이디 : ${sessionScope.loginId} 
	<button onclick="logout()">로그아웃</button> <br>
	<form action="/board/update" method="post" enctype="Multipart/form-data">
		<input type="hidden" name="page">
		<input type="hidden" name="b_number">
		작성자 : <input type="text" name="b_writer" value="${sessionScope.loginId}" readonly> <br>
		비밀번호 : <input type="password" name="b_password" id="pw" placeholder="비밀번호" onblur="pCheck()">
		<span id="pCheck"></span> <br>
		글 제목 : <input type="text" name="b_title"> <br>
		글 내용 : <textarea name="b_contents" rows="5"></textarea> <br>
		파일 첨부 : <input type="file" name="b_file"> <br>
		<input type="button" value="수정" onclick="pCheck()">
	</form>
	</div>
</body>
<script>
	function pCheck() {
		// const pCheck = document.getElementById('pCheck');
		const pw = document.getElementById('pw').value;
		const pwDB = '${bDTO.b_password}';
		if (pw == pwDB) {
			pCheck.style.color = 'green';
			pCheck.innerHTML = '일치';
			update_form.submit();
		} else {
			pCheck.style.color = 'red';
			pCheck.innerHTML = '불일치';
		}
	}

</script>	
</html>