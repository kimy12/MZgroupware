<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>LoginForm</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/login.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core-main.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-01.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-02.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-03.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-04.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/popup.js" ></script>
  <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
  
</head>

<body>
	<div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal99">
            <div class="att-modal">
                <h3>사원추가</h3>
               <table>		
       	          <tbody>
                        <tr>
                            <td class="flex">
                                <label>아이디</label>
                                <div>
                                    <input type="text" name="newId" id="newId" autocomplete="off">
                                    <input type="button" id="checkBtn" value="중복확인">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>비밀번호</label>
                                <div>
                                    <input type="password" name="password" id="password" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>닉네임</label>
                                <div>
                                    <input type="text" name="ncnm" id="ncnm" autocomplete="off">
                                </div>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>

            </div>

            <div class="modal-btn flex ju-sp-ce">
                <button id="close" class="close-core">취소</button>
                <button class="regist">변경</button>
            </div>
    </div>
    
  <div class="wrapper">
      <div class="face face-front">
        <div class="login_content">
          <h2><img src="<%=request.getContextPath()%>/resources/images/Loginlogo.png" alt="로고" /></h2>
          <form action="<%=request.getContextPath() %>/common/login" method="post" onsubmit="return checkSum();">
            <div class="field-wrapper">
              <input type="text" name="id" id="id" placeholder="id" autocomplete="off">
              <label>사원아이디</label>
            </div>
            <div class="field-wrapper">
              <input type="password" name="password" placeholder="password" autocomplete="new-password">
              <label>비밀번호</label>
            </div>
            <div class="field-wrapper">
              <input type="submit" value="Login">
            </div>
          </form>
			
          
          <div class="login-btn">
            <button id="findId"><i class="fa-solid fa-id-badge"></i>Find ID</button>
            <span class="psw" id="findPwd"><i class="fa-solid fa-key"></i>Forgot Password?   </span>
          </div>
        </div>
      </div>
  </div>
	<c:if test="${param.from eq 'new'}">
		<script>
			openModal('modal99');						
		</script>
	</c:if>
	<script>
		const newId = document.querySelector('#newId');
		const id = document.querySelector('#id');
		const pwd = document.querySelector('#password');
		const ncnm = document.querySelector('#ncnm');
		const checkBtn = document.querySelector('#checkBtn');
		const registBtn = document.querySelector('.regist');
		const findId = document.querySelector('#findId');
		const findPwd = document.querySelector('#findPwd');
		const close = document.querySelector('.close-core');
		
		function checkSum(){
			let idCookie = 'idValue='+id.value;
			
			document.cookie = idCookie;
			
			return true;
		}
		
		let chk = false;
		function checkId(){
			if(!newId.value){
				Swal.fire({
					  icon: 'error',
					  title: '아이디를 입력해주세요!',
					  showConfirmButton: false,
					  timer: 1500
				});
				newId.focus();
				return;
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/emp/idCheck',
				type : 'get',
				data : {'id' : newId.value},
				success : function(result){
					if(result == 'duplicated'){
						alert('이미 존재하는 아이디 입니다.');
						id.focus();
					}else{
						alert('사용 가능한 아이디 입니다.');
						chk = true;
						id.value = id.value.trim();
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);	
				}
			});
		}
		
		function modifyEmp(){
			let blankCheck = !pwd.value || !ncnm.value
			if(!chk){
				Swal.fire({
					  icon: 'error',
					  title: '아이디 중복체크는 필수 입니다!'
				});

				return;
			}
			if(blankCheck){
				Swal.fire({
					  icon: 'error',
					  title: '아이디 중복체크는 필수 입니다!'
				});

 				return;
			}
			if(pwd.value.length < 6){
				Swal.fire({
					  icon: 'error',
					  title: '비밀번호는 최소 6자 이상 입력하셔야 합니다!'
				});

 				return;
			}
			if(ncnm.value.length < 4){
				Swal.fire({
					  icon: 'error',
					  title: '닉네임은 최소 4자 이상 입력하셔야 합니다!'
				});

 				return;
			}
			
			let cookies = document.cookie.split(';');
			let chkId = "";
			for(let i in cookies){
				if(cookies[i].search('idValue') != -1){
					chkId = cookies[i].replace('idValue=', '');					
				}
			}
			
			
			const data = {
				"id" : newId.value,
				"password" : pwd.value,
				"ncnm" : ncnm.value,
				"chkId" : chkId
			}
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/emp/changeEmpInfo',
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(result){
					if(result == 'success'){
						alert('정상적으로 등록되었습니다! 다시 로그인 해주세요!');
						$("#modal").fadeOut(300);
				        $(".modal-con").fadeOut(300);
				        id.value = "";
					}
				},
				error : function(error){
					AjaxErrorSecurityRedirectHandler(error.status);	
				}
			});
		}
		
		close.addEventListener('click', ()=> {
			id.value = "";
			pwd.value = "";
		});
		checkBtn.addEventListener('click', checkId);
		registBtn.addEventListener('click', modifyEmp);
		findId.addEventListener('click', function(){
			OpenWindow('findIdForm','아이디 찾기',600,400);
		});
		
		findPwd.addEventListener('click', function(){
			OpenWindow('findPwdForm','비밀번호 찾기',600,400);
		});
	</script>
</body>
</html>