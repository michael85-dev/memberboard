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
	<h2>index.jsp</h2>
	<h3>첫 화면 페이지</h3>
	<div>
		<a href="/member/insertform">회원가입 페이지</a>
		<a href="admin">관리자 화면 이동</a> <br>
	</div>
	<div>
		<a href="/member/loginform">로그인</a>
	</div>
	<c:if test="${sessionScope.loginById eq 'admin'}">   
	   <a href="/member/findMember">회원목록(관리자만 보이게)</a>
   </c:if>
   
</body>
</html>