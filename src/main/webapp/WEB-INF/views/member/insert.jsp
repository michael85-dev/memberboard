<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> <!-- jquery적용을 위한 선언 -->
<script>
	function idDuplicate() {
		const id= document.getElementById('m_id').value;
		console.log('id')
		const checkResult = document.getElementById('checkId');
		/*ajax 적용*/
		#.ajax ({
			type:'post',
			url: 'member/idDuplicate',
			data : {'m_id':id},
			dataType: 'text',
			success : function(result) {
				console.log('ajax')
				console.log(result);
				if (result == "ok") {
					checkResult.style.color = 'green';
					checkResult.innerHTML = '사용 가능';
				} else {
					checkResult.style.color = 'red';
					checkResult.innerHTML = '사용 불기';
				}
			},
			error : function(result) {
				consolg.log('오타 찾기')
			}
		});
		
	}/* 
	function checkId() {
		const id = document.getElementById('m_id').value;
		
		const idCheck = document.getElementById('checkId');
		const idDB = '${mDTO.m_id}';
		
		if (id = idDB) {
			idCheck.style.color = 'green';
			idCheck.innerHTML = '사용 가능';
		} else {
			idCheck.style.color = 'red';
			idCheck.innerHTML = '사용 불가능';
		}		
	} */

	
</script>
</head>
<body>
	<h2>회원가입 페이지(insert.jsp)</h2>
	<form action="/member/insert" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="m_id" id="m_id" onblur="checkId()" onkeyup="idDuplicate()" placeholder="20자 미만 입력..">
		<span id="checkId"></span> <br>
		비밀번호 : <input type="password" name="m_password" id="m_password" onblur="checkPwd()" placeholder="특문, 대문 입력 필수">
		<span id="checkPwd"></span> <br>
		이름 : <input type="text" name="m_name"> <br>
		이메일 : <input type="text" name="m_email" id="m_mail" onblur="email()"> <br>
		전화번호 : <input type="text" name="m_phone" placeholder="000-0000-0000"> <br>
		프로필사진 : <input type="file" name="m_photo">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>