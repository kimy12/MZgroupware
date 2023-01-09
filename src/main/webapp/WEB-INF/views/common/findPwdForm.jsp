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
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<form method="post" role="findPwdForm" action="findPwd">
	
		<div class="find-wrap">
			<div class="tit pwdTxt">
				<h4>PASSWORD 찾기</h4>
			</div>
			
			<div class="txt mb-30">
				<h5>등록된 휴대폰 번호로 찾기</h5>
				<p>가입 당시 입력한 휴대전화 번호를 통해 인증 후<br /> 새비밀번호를 등록해주세요.</p>
			</div>
	
	       <div class="col mb-10">
			    <label>아이디 </label>  
			    <input type="text" name="id" id="empId" class="viInut">
		   </div>
			    
	       
		   	<div class="col ph mb-10">
				<label>연락처</label>  
			    <div class="nump">
				    <input type="text" name="phone" id="phone">
				 	<input type="button" id="sendNum" value="인증번호 발송">
			 	</div> 
	    	</div>
    	
	    	<div class="validation col" style="display:none;">
		       	<div class="flex ju-sp-bt">
			       	<label>인증번호</label>  
			       	
			    	<div class="reulstPwd flex ju-sp-bt">
			    		<div class="flex">
				    	 	<input type="text" name="certification" id="certification"> 
					    	<input type="button" id="numConfirm" value="인증번호 확인"> 	
				    	</div>
				    	<span id="display" class="remaining" style="color:red;"></span>      
			    	</div>
		    	</div>
		    </div>
		    
	    
    		<input type="button" id="close" value="취소" class="popC mt-20">
    	</div>
    </form>
    
    <script>
    	//Variable
    	let min = 2;
    	let sec = 59;
    	let time;
    	let counter;
    	
		//DOM    
    	const phone = document.querySelector('#phone');
    	const empId = document.querySelector('#empId');
    	const close = document.querySelector('#close');
    	const sendNum = document.querySelector('#sendNum');
    	const numConfirm = document.querySelector('#numConfirm');
    	const certification = document.querySelector('#certification');
    	const validation = document.querySelector('.validation');
    	
    	//function
    	const clearTimer = function(c){
    		clearInterval(c);
    	}
    	
    	const countTimer = function(){
    		min = parseInt(time/60);
    		sec = time % 60;
    		document.querySelector('.remaining').innerText = min + ":" + sec;
    		time--;
    		
    		if(time < 0){
    			clearTimer(counter);
    		}
    	}
    	
    	const startTimer = function(){
    		time = parseInt(min*60) + parseInt(sec);
    		counter = setInterval(countTimer, 1000);
    	}
    	
    	let certNum = "";
    	const sendCertification = function(){
    		if(!empId.value){
    			alert('아이디를 입력하세요!');
    			empId.focus();
    			return;
    		}
    		
    		if(!phone.value){
    			alert('번호를 입력하세요!');
    			phone.focus();
    			return;
    		}
    		
    		$.ajax({
    			url : 'phoneCheck',
    			method : 'get',
    			data : {'id':empId.value,
    				    'phone':phone.value},
    			success : function(result){
    				if(!result){
    					alert('입력하신 정보가 일치하지 않습니다');
    					phone.focus();
    				}else{
    					alert('인증번호를 발송했습니다!');
    					validation.style.display = 'block';
    					certification.focus();
    					startTimer();
    					certNum = result;
    				}
    			},
    			error : function(error){
    				AjaxErrorsecurityRedirectHandler(error.status);
    			}
    		});
    	}
    	
    	const confirmCertification = function(){
    		const form = $('form[role="findPwdForm"]');
    		
    		if(time < 0){
    			certNum == "";
    			alert("시간이 초과되었습니다! 인증번호를 새로 생성해주세요!");
    			certification.value = "";
    			min = 2;
    			sec = 59;
    			return;
    		}
    		
    		if(certNum == certification.value){
    			alert('인증이 성공하였습니다!');
    			form.submit();
    		}else{
    			alert('인증번호가 일치하지 않습니다!');
    		}
    	}
    	
    	//EventHandler
    	close.addEventListener('click', function(){
    		CloseWindow();
    	});
    	sendNum.addEventListener('click',sendCertification);
    	numConfirm.addEventListener('click',confirmCertification);
    </script>
</body>
</html>