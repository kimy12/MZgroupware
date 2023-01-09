<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<head>
<script src="<%=request.getContextPath() %>/resources/js/popup.js"></script>
</head>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="empList" value="${dataMap.empList }" />
<c:set var="deptName" value="${dataMap.deptName }" />

<body>
	<%@ include file="/WEB-INF/include/topbar.jsp" %>
	
	 <div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal7">
            <div class="att-modal">
                <h3>사원추가</h3>

               <table>		
       	          <tbody>
                        <tr>
                            <td class="flex">
                                <label>이름</label>
                                <div>
                                    <input type="text" name="name" id="name" autocomplete="off">
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td class="flex">
                                <label>부서</label>
                                <div>
                                    <select id="dept">
                                        <option value="">부서를 선택하세요</option>
                                        <c:forEach items="${deptName }" var="deptName">
                                        	<option value="${deptName.dept_type }">${deptName.dept_nm }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>직급</label>
                                <div>
                                    <select id="rank">
                                        <option>직급을 선택하세요</option>
                                        <option>대리</option>
                                        <option>과장</option>
                                        <option>부장</option>                                        
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="flex">
                                <label>입사일</label>
                                <div>
                                    <input type="date" name="encpn" id="encpn" placeholder="ex) 20220408">
                                </div>
                            </td>
                        </tr>

                        
                        <tr>
                            <td class="flex">
                                <label>이메일</label>
                                <div>
                                    <input type="text" id="email" autocomplete="off">
                                    <input type="text" id="emailDetail" value="@mzgw.com" disabled>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="flex">
                                <label>전화번호</label>
                                <div>
                                    <input type="text" name="phone" id="phone" placeholder="ex)010********" autocomplete="off">
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="flex">
                                <label>아이피</label>
                                <div>
                                    <input type="text" name="ip" id="ip" autocomplete="off">
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="flex">
                                <label>우편번호</label>
                                <div>
                                	<input type="text" id="zipcode" placeholder="우편번호">
                                    <input type="button" value="우편번호 찾기" onclick="postCode();">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>도로명 주소</label>
                                <div>
                                	<input type="text" id="address" placeholder="주소">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>상세 주소</label>
                                <div>
                                	<input type="text" id="detailAddress" placeholder="상세주소" autocomplete="off">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>


            </div>
        
        
            <div class="modal-btn flex ju-sp-ce">
                <button id="close" class="close-core">취소</button>
                <button class="regist">전송</button>
            </div>
    </div>

   <div class="wrap">
    


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>사원관리<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                    </div>

                    <div class="members-att">
                    	<div class="matt-top">
                            <div class="matt-detail flex al-it-ce ju-sp-ce">
		                    	<h2 id="today">0</h2>
                            </div>
                        </div>
                        <h3 class="list-title">조건별 상세검색</h3>
                        <div class="matt-debox">
                           <ul class="flex">
                               <li>
                               		<li><label>입사일</label>
										<div>
											<input type="date" name="start" value="${cri.start }"> 
											<span> ~ </span> 
											<input type="date" name="end" value="${cri.end }">
										</div>
									</li>
								
							 <li>
                                   <label>정렬개수</label>
                                   <div>
	                                    <select name="perPageNum" 
						  					id="perPageNum" onchange="list_go(1);">					  		  		
									  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >10개씩</option>
									  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
									  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
									  		<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
									  	</select>                                   
                                   </div>
                               </li>
                               <li>
                                   <label>검색어</label>
                                   <div>
                                       <input type="text" name="keyword" placeholder="검색어를 입력하세요!" value="${cri.keyword }" autocomplete="off">
                                   </div>
                               </li>
                               <li>
                                   <label>검색구분</label>
                                   <div>
                                       <select name="searchType" id="searchType">
                                           <option value="" ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
                                           <option value="d"  ${cri.searchType eq 'd' ? 'selected':''}>부서</option>
										   <option value="n"  ${cri.searchType eq 'n' ? 'selected':''}>이 름</option>
										   <option value="p"  ${cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
										   <option value="r"  ${cri.searchType eq 'e' ? 'selected':''}>직급</option>	
                                       </select>
                                   </div>
                               </li>
                               <li>
                                   <div>
                                      <button onclick="list_go(1);"><i class="fa fa-fw fa-search"></i></button>
                                   </div>
                               </li>
                               <li>
								   <div>
										<button class="reset" onclick="location.href='${pageContext.request.contextPath}/manager/list'">검색 조건 초기화</button>
								   </div>
							   </li>
                           </ul>
                       </div>


                        
                        <div class="matt-decap flex flex-end">
                            <div class="matt-icon">
                                <ul class="flex">
                                    <li class="admin-mem">
                                        <a href="javascript:openModal('modal7');">
                                            <i class="fa-solid fa-user"></i>
                                            사원추가
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="matt-cal matt-de">
                            <div class="matt-list">
                             
                                <table class="adjustment">
                                    <colgroup>
                                      <col width="12%">
                                      <col width="12%">
                                      <col width="12%">
                                      <col width="12%">
                                      <col width="12%">
                                      <col width="16%">
                                      <col width="20%">
                                    </colgroup>

                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>사원명</th>
                                            <th>부서</th>                                         	
                                            <th>직급</th>
                                            <th>입사일자</th>
                                            <th>H.P</th>
                                            <th>Email</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<c:if test="${empty empList }" >
						            		<tr>
						            			<td colspan="7" class="text-center">
						            				해당내용이 없습니다.
						            			</td>
						            		</tr>
						            	</c:if>
						            	<c:if test="${!empty empList }" >
		            						<c:forEach items="${empList }" var="emp">
		                                        <fmt:formatNumber var="phone" value="${emp.phone }" pattern="000,0000,0000"/>
		                                        <tr>
		                                            <td>
		                                            	<center>
			                                            	<div class="user-img" data-id="${emp.id }"></div>
		                                            	</center>
													</td>
		                                            <td>${emp.name }</td>
		                                            <td>${emp.dept }</td>
		                                            <td>${emp.rank }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${emp.encpn }" pattern="yyyy-MM-dd"/>
		                                            </td>
		                                            <td>
		                                            	<c:out value="${fn:replace(phone, ',','-') }"/>
		                                            </td>
		                                            <td>${emp.email }</td>
		                                                                                        
		                                        </tr>
											</c:forEach>
		            					</c:if>
                                    </tbody>
                                </table>

                            </div>


                        </div>
                        

                    </div>

             	<div class="page-btn flex ju-sp-ce">
				   <a class="p-num prev-first" href="javascript:list_go(1);">
				   		<i class="fas fa-angle-double-left"></i>
				   </a>
				   
				  <%--  <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
						<i class="fas fa-angle-left"></i>
				   </a> --%>
				   
				   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
						<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
					</c:forEach>
					
				  <%--  <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
						<i class="fas fa-angle-right" ></i>
				   </a> --%>
				   
				   <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');">
						<i class="fas fa-angle-double-right"></i>
				   </a>
				</div>

				<form id="jobForm">	
					<input type='hidden' name="page" value="" />
					<input type='hidden' name="perPageNum" value=""/>
					<input type='hidden' name="searchType" value="" />
					<input type='hidden' name="keyword" value="" />
					<input type='hidden' name="start" value="" />
					<input type='hidden' name="end" value="" />
				</form>

            </div>
       </div>
      </div>
	
	<script>
	 	$(document).ready(function() {
			let current = new Date;
		    let curre = current.toLocaleDateString();
		    let today = curre.slice(0, -1);
	       $('#today').text(today);
	       
	    });
	 	
	 	function list_go(page,url){
			if(!url) url="list";
			
			let date = new Date();
		    let year = date.getFullYear();
		    let month = ("0" + (1 + date.getMonth())).slice(-2);
		    let day = ("0" + date.getDate()).slice(-2);
		    let now = year + month + day; 
			
			let jobForm=$('#jobForm');
			
			jobForm.find("[name='page']").val(page);
			jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
			jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
			jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
			if($("input[name='start']").val() == ''){
				jobForm.find("[name='start']").val('20160101');											
			}else{
				jobForm.find("[name='start']").val($("input[name='start']").val());											
			}
			
			if($("input[name='end']").val() == ''){
				jobForm.find("[name='end']").val(now);																		
			}else{				
				jobForm.find("[name='end']").val($("input[name='end']").val());														
			}
		
			jobForm.attr({
				action:url,
				method:'get'
			}).submit();
		}
	
		const name = document.querySelector('#name');
		const dept = document.querySelector('#dept');
		const rank = document.querySelector('#rank');
		const encpn = document.querySelector('#encpn');
		const email = document.querySelector('#email');
		const emailDetail = document.querySelector('#emailDetail');
		const phone = document.querySelector('#phone');
		const ip = document.querySelector('#ip');
		const zipcode = document.querySelector('#zipcode');
		const address = document.querySelector('#address');
		const detailAddress = document.querySelector('#detailAddress');
		const btn = document.querySelector('.regist');
		let deptName = "";
		let rankName = "";
		
		dept.addEventListener('change',()=>{
			deptName = dept.options[dept.selectedIndex].text;
		});
		
		rank.addEventListener('change',()=>{
			rankName = rank.options[rank.selectedIndex].text;
		});
		
		function postCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               
	            	var addr = ''; 
     
	                if (data.userSelectedType === 'R') { 
	                    addr = data.roadAddress;
	                } else { 
	                    addr = data.jibunAddress;
	                }
	                
	                zipcode.value = data.zonecode;
	                address.value = addr;
	                
	                detailAddress.focus();
             
	            }
	        }).open();
	    }
		
		function leadingZeros(n, digits) {
		    let zero = '';
		    n = n.toString();

		    if (n.length < digits) {
		        for (i = 0; i < digits - n.length; i++)
		            zero += '0';
		    }
		    return zero + n;
		}
		
		function sendData(){
			let now = new Date();
			let check = !name.value || !dept.value ||!encpn.value
					 ||!email.value ||!phone.value ||!zipcode.value ||!ip.value
					 ||!rank.value  ||!address.value ||!detailAddress.value;
			now =  leadingZeros(now.getFullYear(), 4) + '-' +
				   leadingZeros(now.getMonth() + 1, 2) + '-' +
				   leadingZeros(now.getDate(), 2);
			
 			if(check){
 				alert('빈 항목 없이 모두 입력하셔야 합니다!');
 				return;
 			}
			
			const id = 'mzgw'+ phone.value.substring(7);
			const pwd = phone.value.substring(7);
			
			const data = {
					"id" : id,
					"password" : pwd,	
					"name" : name.value,
					"dept" : deptName,
					"rank" : rankName,
					"encpn" : encpn.value,
					"email" : email.value + emailDetail.value,
					"phone" : phone.value,
					"ip" : ip.value,
					"zip" : zipcode.value,
					"bassadres" : address.value,
					"detailadres" : detailAddress.value
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/manager/regist',
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(result){
					if(result == 'success'){
						 Swal.fire({
							 	title: "정상적으로 등록되었습니다!",
			                    icon: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인'
			                }).then((result) => {
			                    if (result.isConfirmed) {
									$("#modal").fadeOut(300);
							        $(".modal-con").fadeOut(300);
									window.location.reload();			                       
			                    }
			                })
					}else{
						 Swal.fire({
							  text: "입력한 형식이 올바르지 않습니다 다시 작성해주세요!",
							  icon: "error",
							  button: "확인",
						});
					}
				},
				error : function(error){
					AjaxErrorSecurityRedirectHandler(error.status);	
				}
			});
		
		}
		
		MemberProFilePictureThumb('${pageContext.request.contextPath}');
		
	   	function MemberProFilePictureThumb(contextPath){
	   		
	   		 for(let target of document.querySelectorAll('.user-img')){	
	   			 let id = target.getAttribute('data-id');
	   			 
	   			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
	   			 target.style.backgroundPosition="center";
	   			 target.style.backgroundRepeat="no-repeat";
	   			 target.style.backgroundSize="cover";
	   			 target.style.width="45px";
	   			 target.style.height="45px";
	   		}
	   	}
		
		btn.addEventListener('click',sendData);
		
		
	</script>
            
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/include/footer.jsp" %>