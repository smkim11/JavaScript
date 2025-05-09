<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>addBoard</h1>
	<form id="addForm" method="post" action="${pageContext.request.contextPath}/addBoard" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>boardtitle</th>
				<td>
					<input type="text" name="boardTitle" id="boardTitle">
				</td>
			</tr>
			<tr>
				<th>boardfile</th>
				<td>
					<div>
						<button type="button" id="appendFile">파일추가</button>
					</div>
					<div id="fileDiv">
						<input type="file" name="boardfile" class="boardfile">
					</div>
				</td>
			</tr>
		</table>
		<button id="addBtn" type="button">입력</button>
	</form>
	<script>
		// 파일 여러개선택
		
		document.querySelector('#appendFile').addEventListener('click',()=>{
			// input type =file 추가 : 앞에 파일이 더 선택되어 있다면
			let flag = false;
			let boardFiles = document.querySelectorAll('.boardfile');
			boardFiles.forEach((e)=>{
				if(e.value==''){
					alert('공백의 boardfile이 있습니다');
					flag = true; // 공백이 존재
					return; // forEach 콜백함수를 탈출
				}
			});
			
			if(flag){ // 공백이 존재한다면 
				return; // 콜백함수 탈출
			}
			
			let inputFile = document.createElement('input');
			inputFile.setAttribute('type','file');
			inputFile.setAttribute('name', 'boardfile');
			inputFile.setAttribute('class', 'boardfile');
			
			document.querySelector('#fileDiv').appendChild(inputFile);
		});
	
		document.querySelector('#addBtn').addEventListener('click',()=>{
			//alert('addBtn Click!');
			// 폼(값) 유효성 검사
			document.querySelector('#addForm').submit();
		});
	</script>
</body>
</html>