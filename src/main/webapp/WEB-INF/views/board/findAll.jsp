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
</head>
<body>
	<h2>findAll.jsp</h2>
	<h3>전체 작성 글 조회</h3>
	로그인 아이디 : ${sessionScope.loginId}
	<button onclick="logout()">로그아웃</button>

	<div>
		<form action="/board/search" method="get">
			<select name="searchtype">
				<option value="b_title">제목</option>
				<option value="b_writer">작성자</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어..">
			<input type="submit" value="검색">
		</form>
	</div>
	<table class="table table-dark">
		<tr>
			<th>글 번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>보기</th>
			<th>조회수</th>
			<th>댓글수</th>
			<th>작성시간</th>
			<th>파일여부</th>
			<th>수정</th>
			<th>삭제</th>
			<th>현재</th>
		</tr>
		<c:choose>
		<c:when test="${sessionScope.loginId ne null}">
			<c:forEach items="${bList}" var="b">
				<tr>
					<td>${b.b_number}</td>
					<td>${b.b_writer}</td>
					<td>${b.b_title}</td>
					<td>
						<a href="/board/detail?b_number=${b.b_number}">보기</a>
					</td>
					<td>${b.b_hits}</td>
					<td>${cList}</td>
					<td>${b.b_date}</td>
					<td>${b.b_filename}</td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.loginId eq b.b_writer}">
								<a href="/board/update?b_number=${b.b_number}&page=${page}">수정</a>
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.loginId eq b.b_writer or 'admin'}">
								<a href="/board/delete?b_number=${b_number}&page=${page}">삭제</a>
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${b.b_writer}
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
		</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 페이지 번호를 뿌려주는 코드 -->
	<div>
		<c:choose>
			<c:when test="${paging.page <= 1 }"> <!-- 현재 페이지 값 -->
				[이전]&nbsp;
			</c:when>
			<c:otherwise> <!-- 현재 페이지에서 1감소한 페이지 요청하는 링크 -->
				<a href="/board/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.page >= paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${apging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<c:if test="${sessionScope.loginById eq admin}">
		<div class="detail-view"></div>
	</c:if>
	
</body>
<script>
	console.log('${cList}');
	function logout() {
		console.log('logout 함수 호출')
		location.href="/logout";
	}
</script>
</html>