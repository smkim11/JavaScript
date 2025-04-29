<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
	<form id="joinForm" method="post" action="${pageContext.request.contextPath}/joinMember"><!-- /join/joinMember -->
		<table border="1">
            <!-- 아이디 -->
            <tr>
                <td>아이디</td>
                <td><input type="text" name = "id" id="id"></td><!-- 4자이상 -->
            </tr>
            <!-- 비밀번호 -->
            <tr>
                <td>
                    <div>비밀번호</div><!-- 8자리 이상 -->
                    <div>비밀번호확인</div>
                </td>
                <td>
                    <div><input type="password" name="pw" id="pw"></div>
                    <div><input type="password" name="pwCheck" id="pwCheck"></div>
                </td>
            </tr>
            <!-- 이름 -->
            <tr>
                <td>이름</td><!-- 2자 이상 -->
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <!-- 생일 -->
            <tr>
                <td>생일</td><!-- 공백 X -->
                <td><input type="date" name="birth" id="birth"></td>
            </tr>
            <!-- 나이 -->
            <tr>
                <td>나이</td><!-- 숫자만 입력 -->
                <td><input type="text" name="age" id="age"></td>
            </tr>
            <!-- 성별 -->
            <tr>
                <td>성별</td>
                <td>
                    <input type="radio" name="gender" class="gender" value="남">남
                    <input type="radio" name="gender" class="gender" value="여">여
                </td>
            </tr>
            <!-- 취미 -->
            <tr>
                <td>취미</td>
                <td>
                    <input type="checkbox" name="hobby" class="hobby" value="여행">여행
                    <input type="checkbox" name="hobby" class="hobby" value="게임">게임
                    <input type="checkbox" name="hobby" class="hobby" value="등산">등산
                </td>
            </tr>
            <!-- 메일주소 -->
            <tr>
                <td>메일</td>
                <td>
                    <span><input type="text" name="mailId" id="mailId"></span>
                    <span>@</span>
                    <select name="mailAddr" id="mailAddr">
                        <option value="">선택</option>
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                    </select>
                </td>
            </tr>
            <!-- 메모 -->
            <tr>
                <td>메모</td>
                <td>
                    <textarea cols="50" rows="5" name="memo" id="memo"></textarea>
                </td>
            </tr>
        </table>
        <button type="button" onclick="join()">회원가입</button>
	</form>
	<script>
		function join(){
			if(document.querySelector('#id').value.length<4){
				alert('아이디는 4자 이상이어야 합니다.');
			}else if(document.querySelector('#pw').value.length<8){
				alert('비밀번호는 8자 이상이어야 합니다.');
			}else if(document.querySelector('#pw').value != document.querySelector('#pwCheck').value){
				alert('비밀번호 확인.');
			}else if(document.querySelector('#name').value.length<2){
				alert('이름은 2자 이상이어야 합니다.');
			}else if(document.querySelector('#birth').value.length<1){ // 공백 검사 === ''
				alert('생일 입력하세요.');	
			}else if(document.querySelector('#age').value==''  // 공백이거나 
					|| isNaN(document.querySelector('#age').value)){ // isNaN(value) : value가 숫자가 아니면 true
				alert('나이는 숫자로 입력하세요.');
			}else if(document.querySelectorAll('.gender:checked').length == 0){ // .gender중 checked된게 없다
				alert('성별을 선택하세요.');
			}else if(document.querySelectorAll('.hobby:checked').length < 2){ 
				alert('취미를 2개이상 선택하세요.');
			}else if(document.querySelector('#mailId').value.length<1
					|| document.querySelector('#mailAddr').value.length<1){ // 이메일 확인
				alert('이메일을 확인하세요.');
			}else if(document.querySelector('#memo').value.length<1){
				alert('메모를 입력하세요.');	
			}else{
				document.querySelector('#joinForm').submit(); // document.getElementById('joinForm')
			}
		}
	</script>
</body>
</html>