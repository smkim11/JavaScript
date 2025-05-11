<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width:30%
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>Update</h1>
	<form id="update" method="post" action="${pageContext.request.contextPath}/updateBoard">
	<table border="1">
		<tr>
			<th>No</th>
			<td><input type="text" value="${b.boardNo}" name="boardNo" id="boardNo" readonly></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type="text" value="${b.boardTitle}" name="boardTitle" id="boardTitle"></td>
		</tr>
	</table>
	<button type="button" id="updateBtn">수정</button>
	</form>
	<script>
		document.querySelector('#updateBtn').addEventListener('click',function(){
			document.querySelector('#update').submit();
		});
	</script>
</body>
</html>