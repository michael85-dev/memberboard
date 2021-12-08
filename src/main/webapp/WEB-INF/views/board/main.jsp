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
	<h2>main.jsp</h2>
	<a href="/board/findAll">게시글 목록 조회</a>
	<c:if test="${sessionScope.loginById eq 'admin'}">   
	   <a href="/member/findMember">회원목록조회</a>
   </c:if>
   
   
</body>
</html>