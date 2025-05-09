<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
	text-align:center;
	}
	table{
	margin:auto;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardOne</h1>
	<a href="./">목록</a>
	<table border="1">
		<tr>
			<th>BoardFileNo</th>
			<th>BoardNo</th>
			<th>Filename</th>
			<th>Filetype</th>	
			<th>삭제</th>
		</tr>
	<c:forEach var="bf" items="${list}">
		<tr>
			<td>${bf.boardfileNo}</td>
			<td>${bf.boardNo}</td>
			<td><a href="/upload2/${bf.filename}" download="${bf.filename}">${bf.filename}</a></td>
			<td>${bf.filetype}</td>
			<td><a href="/deleteBoardfile?boardfileNo=${bf.boardfileNo}&boardNo=${bf.boardNo}">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>