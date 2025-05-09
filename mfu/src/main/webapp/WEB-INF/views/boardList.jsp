<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{
	text-align:center;
	}
	table{
	margin:auto;
	width:50%
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>BoardList</h1>
	<a href="${pageContext.request.contextPath}/addBoard">add</a>
	<table border="1">
		<tr>
			<th>boardNo</th>
			<th>boardTitle</th>
			<th>update</th>
		</tr>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.boardNo}</td>
					<td><a href="${pageContext.request.contextPath}/boardOne?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
					<td><a href="${pageContext.request.contextPath}/updateBoard?boardNo=${board.boardNo}">수정</a></td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>