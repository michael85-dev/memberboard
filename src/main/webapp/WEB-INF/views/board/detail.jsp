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
	<h2>detail.jsp</h2>
	<h3>상세 글 조회</h3>
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
			<th>조회수</th>
			<th>작성시간</th>
			<th>파일여부</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>${bDTO.b_number}</td>
			<td>${bDTO.b_writer}</td>
			<td>${bDTO.b_title}</td>
			<td>${bDTO.b_hits}</td>
			<td>${bDTO.b_date}</td>
			<td>
				<img alt="" src="/resources/upload/${bDTO.b_filename}">
			</td>
			<td>
				<c:if test="${sessionScope.loginById eq 'b.b_writer' and 'admin'}">
					<a href="/board/update?b_number=${bDTO.b_number}&page=${page}">수정</a>
				</c:if>
			</td>
			<td>
				<c:if test="${sessionScope.loginById eq 'b.b_writer' and 'admin'}">
					<a href="/board/delete?b_number=${bDTO.b_number}&page=${page}">삭제</a>
				</c:if>
			</td>
		</tr>

	</table>

	<!-- 댓글작성 -->
	<div id="comment_write">
		<input type="text" id="c_writer" placeholder="작성자"> <!-- ${sessonScope.loginById)로 괜찮을듯 -->
		<input type="text" id="c_contents" placeholder="댓글">
		<button id="comment_wrrite_btn">댓글 등록</button>
	</div>
	
	<!-- 댓글 목록 출력 -->
	<div id="comment_list">
		<table class="table">
			<tr>
				<th>댓글번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${cList}" var="c">
				<tr>
					<td>${c.c_number}</td>
					<td>${c.c_writer}</td>
					<td>${c.c_contents}</td>
					<td>${c.c_date}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script>
	$("#comment_write_btn").click(function() {
		console.log('댓글 등록')
		
		const cw = $("#c_writer").val();
		const cc = $("#c_contents").val();
		console.log(cw, cc);
		const bNumber = '${bDTO.b_number}';
		
		console.log(cw, cc, bNumber);
		
		$.ajax({
			type:'post',
			url: '/comment/save',
			data: {'c_writer': cw, 'c_contents': cc, 'b_number': bNumber},
			dataType: 'json',
			success:function(result) {
				console.log(result);
				
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				
				for (let i in result){
					output += "<tr>";
					output += "<td>" + result[i].c_number + "</td>";
					output += "<td>" + result[i].c_writer + "</td>";
					output += "<td>" + result[i].c_contents + "</td>";
					output += "<td>" + result[i].c_date +"</td>";
					output += "</tr>";
				}
				
				output += "</table>";
				
				document.getElementById("comment_list").innerHTML = output;
				document.getElementById('c_writer').value;
				docuement.getElemetById('c_contents').value;
			},
			error: function(result) {
				alert('정보가 없습니다.');
			}
		});
	});
</script>
</html>