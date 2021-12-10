<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function detailAjax(m_number) {
		console.log(m_number);
		$.ajax({
			type:'post',
			url: '/member/detailAjax',
			data: {'m_number' : m_number},
			dataType: 'json',
			success: function(result) {
				console.log(result);
				console.log(result.m_number);
				console.log(result.m_id);
				
				let output = "<table class='table'>";
				
				output += "<tr><th>회원번호</th> <th>아이디</th> <th>비밀번호</th>";
				output += "<th>이름</th> <th>이메일</th> <th>전화번호</th>";
				output += "<th>프로필사진</th> </tr>";
				output += "<tr>";
				output += "<td>" + result.m_number + "</td>";
				output += "<td>" + result.m_id + "</td>";
				output += "<td>" + result.m_password + "</td>";
				output += "<td>" + result.m_name + "</td>";
				output += "<td>" + result.m_email + "</td>";
				output += "<td>" + result.m_phone + "</td>";
				output += "<td><img alt='' src='/resources/upload'" + result.m_photoname + "></td>";
			
				view.innerHTML = output;
			}, 
			error: function() {
				console.log('오류 찾기')
			}
		});
	}
</script>
</head>
<body>
	<h2>회원목록(findMember.jsp)</h2>
	로그인 아이디 : ${sessionScope.loginId} 
	<button onclick="logout()">로그아웃</button> <br>
	<table class="table table-dark">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>프로필사진</th>
			<th>상세조회</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

		<c:forEach items="${mList}" var="m">
			<tr>
				<td>${m.m_number}</td>
				<td>${m.m_id}</td>
				<c:choose>
					<c:when test="${sessionScope.loginId eq 'admin' or m.m_id}"> 
						<td>${m.m_password}</td>
					</c:when>
					<c:otherwise>
						비공개
					</c:otherwise>
				</c:choose>
				<td>${m.m_name}</td>
				<td>${m.m_email}</td>
				<td>${m.m_phone}</td>
				<td>
					<img alt="" src="/resources/upload${m.m_photoname}">
				</td>
				<td>
					<button onclick="detailAjax('${m.m_number}')">조회</button>
				</td>
				<td>
					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin' or m.m_id}"> 
							<a href="/member/updateform">수정</a>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${sessionScope.loginById eq admin}"> 
							<a href="/member/delete">삭제</a>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

	</table>
	
	<div id="detail-view"></div>
</body>
</html>