<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Board.main.jsp</h2>
	로그인 아이디 : ${sessionScope.loginId} 
	<button onclick="logout()">로그아웃</button> <br>
	<a href="/member/updateform">회원 정보 수정</a> <br>
	<a href="/board/saveform">새 글 작성</a>
	<a href="/board/findAll">전체 게시글 보기</a>
</body>
</html>