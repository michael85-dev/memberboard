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
	<h2>main.jsp(로그인 성공시 이동됨)</h2>
	<h3>최상단 페이지 (board 아님)</h3>
	로그인 된 아이디 세션에 저장한 데이터 출력: ${sessionScope.loginId}
	<button onclick="logout()">로그아웃</button>
	<div>
		<a href="/board/saveform">새 글 작성</a> <br>
		<a href="/board/findAll">전체 글 보기</a>
		<c:if test="${sessionScope.loginId eq 'admin'}">   
	   		<a href="/member/findMember">회원목록(관리자만 보이게)</a>
   		</c:if>
	</div>
</body>
<script>
	function logout() {
		console.log('logout 함수 호출')
		location.href="/logout";
	}
</script>

</html>