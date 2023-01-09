<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/find.css">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${empty id }">
		<script>
			alert('입력하신 정보가 일치하지 않습니다!');
			location.href = document.referrer;
		</script>
	</c:if>
	
	
	
	<c:if test="${not empty id }">
		<div class="find-wrap">
			<h1 class="resultH1">회원님의 아이디는 <br /> &#91; ${id } &#93; &nbsp;입니다!</h1><br>
			<input type="hidden" value="${id }" id="idValue">
			<input type="button" id="closePop" value="닫기" class="popC">
		</div>
	</c:if>
	
	
	
	
	<script>
		const closePop = document.querySelector('#closePop');
		const id = document.querySelector('#idValue');
		
		console.log(closePop);
		
		closePop.addEventListener('click',function(){
			window.opener.document.getElementsByName('id')[0].value = id.value;
			window.close();
		});
	</script>
</body>
</html>