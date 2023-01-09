<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/find.css">
<script src="<%=request.getContextPath() %>/resources/js/popup.js" ></script>
</head>
<body>

	<div class="find-wrap">
		<h1 class="resultH1">회원님의 패스워드는 <br /> &#91; ${pwd } &#93; &nbsp;입니다!</h1><br>
		<input type="button" id="closePop" value="닫기" class="popC">
	</div>
	
	
	<script>
		const closePop = document.querySelector('#closePop');
		
		closePop.addEventListener('click',function(){
			CloseWindow();
		});
	</script>
</body>
</html>