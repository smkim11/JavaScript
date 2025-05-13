<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<h2>주민번호검증</h2>
	<table border="1">
		<tr>
			<th>주민번호</th>
			<td>
				<!-- keyup length 6이 되면 focus sn2 -->
				<input type="text" id="sn1" name="sn1" maxlength="6"> 
				-
				<!-- blur length가 7이면 snapi호출, true이면 gender와 age값 채움 -->
				<input type="text" id="sn2" name="sn2" maxlength="7">
			</td>
		</tr>
	</table>
	
	<hr>
	<h2>ID검색</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="idck">
				<button type="button" id="idckBtn">ID검색</button>
			</td>
			
		</tr>
	</table>
	<form id="joinForm" action="/joinMember" method="post">
		<table border="1">
			<tr>
				<th>성별</th>
				<td><input type="text" id="gender" name="gender" readonly></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" id="age" name="age" readonly></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="pw">
					확인-<input type="password" id="pw2" name="pw2">
				</td>
			</tr>
		</table>
		<button type="button" id="btn">회원가입</button>
	</form>
	
	<script>
		// 외부 API서버 호출 - 비동기 구현 필수O
		$('#sn2').blur(function(){
			// sn1.length == 6 && sn2.length == 7 
			// 둘다 isNaN 아니면
			$.ajax({
				url:"http://localhost:9999/isSn/"+$('#sn1').val()+$('#sn2').val()
				, type :'get'
				, success: function(data){
							if(data == true){
								alert('주민번호 인증 성공');
								// 성별 구해서 input에 값 입력
								if(Number($('#sn2').val().substr(0,1)) % 2 ==0){
									$('#gender').val('여');
								}else{
									$('#gender').val('남');
								}
								
								// 나이 구해서 input에 값 입력
								const today = new Date();
								const year = today.getFullYear();
								const month = today.getMonth()+1;
								const date = today.getDate();
								
								let birthYear = 0;
								if($('#sn2').val().substr(0,1)=='1' || $('#sn2').val().substr(0,1)=='2'){
									birthYear = Number('19'+ $('#sn1').val().substr(0,2));
								}else{
									birthYear = Number('20'+ $('#sn1').val().substr(0,2));
								}
								console.log(birthYear);
								
								let birthMonth = Number($('#sn1').val().substring(2,4));
								let birthDate = Number($('#sn1').val().substring(4));
								console.log(birthMonth);
								console.log(birthDate);
								
								if(month<birthMonth || (month==birthMonth && date<birthDate)){
									$('#age').val(year-birthYear-1);
								}else{
									$('#age').val(year-birthYear);
								}
							}else{
								alert('주민번호 인증 실패');
							}
						}
			});
		});
		// 내부 API서버 호출 - 비동기 구현 필수X -> 편의상 비동기로 구현
		$('#idckBtn').click(function(){
			$.ajax({
				// $('#idck').val() 공백이 아니라면
				url:'/isId/'+$('#idck').val()
				, type: 'get'
				, success: function(data){
					if(data == true){
						alert('사용 불가 ID');
						$('#id').val('');
					}else{
						alert('사용 가능 ID');
						$('#id').val($('#idck').val());
					}
				}
			})
		});
		
		$('#btn').click(function(){
			// 입력값 검사
			if($('#gender').val()== null || $('#gender').val()== '' || $('#gender').val()== 'undefined'){
				$('#gender').val() == '';
			}
			if($('#age').val()== null || $('#age').val()== '' || $('#age').val()== 'undefined'){
				$('#age').val() == '';
			}
			if($('#id').val()== null || $('#id').val()== '' || $('#id').val()== 'undefined'){
				$('#id').val() == '';
			}
			if($('#pw').val()== null || $('#pw').val()== '' || $('#pw').val()== 'undefined'){
				$('#pw').val() == '';
			}
			if($('#pw2').val()== null || $('#pw2').val()== '' || $('#pw2').val()== 'undefined'){
				$('#pw2').val() == '';
			}
			
			// pw == pw2 검사
			if($('#pw').val()==$('#pw2').val()){
				if($('#gender').val() != '' && $('#age').val() != '' && $('#id').val() != '' 
				   && $('#pw').val() != '' && $('#pw2').val() != ''){
					$('#joinForm').submit(); 
				}else{
					alert('입력하지 않은 값이 있습니다.');
				}
			}else{
				alert('비밀번호가 일치하지 않습니다.');
			}
			
			
		});
	</script>
</body>
</html>