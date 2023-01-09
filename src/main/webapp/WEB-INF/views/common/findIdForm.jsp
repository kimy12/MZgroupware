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

	<form method="post" action="findId">
	
		<div class="find-wrap">
			<div class="tit">
				<h4>ID 찾기</h4>
			</div>
			
			<div class="txt mb-30">
				<h5>등록된 이메일로 찾기</h5>
				<p>가입 당시 입력한 이메일을 통해 인증을 해주세요.</p>
			</div>
			
			
		    <div class="col mb-10">
			    <label>이름 </label> 
			    <input type="text" name="name" class="viInut" autocomplete="off">
		    </div>
		  
		  	<div class="col mb-50">
			    <label>이메일</label>  
			    <input type="email" name="email" class="viInut" autocomplete="off">
		    </div>
		     
		    <div class="find-btn">
		    	<input type="button" id="close" value="취소" class="cl">
			    <input type ="submit" value="확인" class="ck">
	    	</div> 
    	</div>
    </form>
    
    <script>
    	const close = document.querySelector('#close');
    	
    	close.addEventListener('click', function(){
    		CloseWindow();
    	});
    </script>
</body>
</html>