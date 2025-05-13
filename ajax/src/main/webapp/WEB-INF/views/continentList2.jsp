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
	<form id="form1" action="/continentList2">
		<select id="continent" name="continent">
			<option value="">:::대륙선택:::</option>
			<c:forEach var="continent" items="${continentList }">
				<option value="${continent.continentNo}">${continent.continentName}</option>
			</c:forEach>
		</select>
		
		<select id="country" name="country">
			<option value="">:::나라선택:::</option>
			<c:forEach var="country" items="${countryList}">
				<option value="${country.countryNo}">${country.countryName}</option>
			</c:forEach>
		</select>
		
		<select id="city" name="city">
			<option value="">:::도시선택:::</option>
			<c:forEach var="city" items="${cityList}">
				<option value="${city.cityNo}">${city.cityName}</option>
			</c:forEach>
		</select>
	</form>
	<script>
		document.querySelector('#continent').addEventListener('change', function(){
			if(this.value == ''){
				alert('대륙을 선택하세요');
				return;
			}
			// 선택된 대륙의 나라목록을 가져와서 country에 append(비동기 호출)
			fetch('/countryList/'+this.value)
			.then(function(res){return res.json()})
			.then(function(result){
					document.querySelector('#country').innerHTML = '<option value="">:::나라선택:::</option>';
					result.forEach(function(e){
						let option = document.createElement('option');
						option.setAttribute('value', e.countryNo);
						option.textContent = e.countryName; // ex) <option value="1">런던</option>
						document.querySelector('#country').append(option);
					})
			});
		});
		
		document.querySelector('#country').addEventListener('change', function(){
			if(this.value == ''){
				alert('나라를 선택하세요');
				return;
			}
			// 선택된 나라의 도시목록을 가져와서 city에 append(비동기 호출)
			fetch('/cityList/'+this.value)
			.then((res)=>{return res.json()})
			.then((result)=>{
				document.querySelector('#city').innerHTML = '<option value="">:::도시선택:::</option>';
				result.forEach((e)=>{
					let option = document.createElement('option');
					option.setAttribute('value',e.cityNo);
					option.textContent=e.cityName;
					document.querySelector('#city').append(option);
				})
			})
		});
		
		document.querySelector('#city').addEventListener('change', function(){
			if(this.value == ''){
				alert('도시를 선택하세요');
				return;
			}
		});
	</script>
</body>
</html>