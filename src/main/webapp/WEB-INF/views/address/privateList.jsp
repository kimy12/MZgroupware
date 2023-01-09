<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
    <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>개인 주소록<span>in 개인 주소록(총 <em style="color:#444">54</em>건)</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce">
	                                <span id="nowSearchType">선택
	                                	<c:choose>
											<c:when test="${pageMaker.cri.searchType eq 'a'}">이름</c:when> 
											<c:when test="${pageMaker.cri.searchType eq 's'}">직급</c:when>
											<c:when test="${pageMaker.cri.searchType eq 'c'}">부서</c:when> 
										</c:choose>
	                                </span>
	                                <i class="fa-solid fa-caret-down"></i>
                                </div>
                               <ul class="tog-b" style="display: none;">
                                	<li onclick="searchTypeChange(this);"><input type="hidden" value="a" >이름</li> 
									<li onclick="searchTypeChange(this);"><input type="hidden" value="s" >직급</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="c" >부서</li> 
                                </ul>
                            </div>
                                
                            <input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
                        </div>
                    </div>

                    <div class="address-wrap">
                        <div class="mb-30">
                            <div class="add-sear">
                            <ul class="flex">
                                    <li id="addAddress"><i class="fa-solid fa-user-tag"></i>주소록 추가</li>
                                    <li id="modifyAddress"><i class="fa-solid fa-id-badge"></i>주소록 변경</li>
                                    <li onclick="deleteAddress();"><i class="fa-solid fa-trash-can"></i>삭제</li>
                                    <!-- <li><i class="fa-solid fa-envelope-open-text"></i>메일발송</li> -->
                                    <li><i class="fa-solid fa-print"></i>인쇄</li>
                            </ul>
                            </div>

                            <div class="address-modi" id="addForm" style="display:none;">
                                <span><i class="fa-solid fa-id-badge"></i>주소록 추가</span>
                                <div class="downtab tab1 flex al-it-ce">
                                    <input type="text" name="addName" placeholder="이름(표시명)">
                                    <input type="text" name="addCompany" placeholder="회사">
                                    <input type="text" name="addRank" placeholder="직급">
                                    <input type="text" name="addDept" placeholder="부서">
                                    <input type="text" name="addMobile" placeholder="휴대폰">
                                    <input type="text" name="addEmail" placeholder="이메일">
                                    <input type="text" name="addHp" placeholder="회사전화">
                                    <button id="addBtn"><i class="fa-solid fa-plus"></i></button>
                                </div>
                            </div>

                            
                            <div class="address-modi" id="modifyForm"  style="display:none;">
                                <span><i class="fa-solid fa-id-badge"></i>주소록 변경 (변경을 희망하는 영역을 더블클릭하세요.)</span>
                                <div class="downtab tab1 flex al-it-ce">
                                	<input type="hidden" name="modino" value="">
                                    <input type="text" name="modiName" placeholder="이름(표시명)">
                                    <input type="text" name="modiCompany" placeholder="회사">
                                    <input type="text" name="modiRank" placeholder="직급">
                                    <input type="text" name="modiDept" placeholder="부서">
                                    <input type="text" name="modiMobile" placeholder="휴대폰">
                                    <input type="text" name="modiEmail" placeholder="이메일">
                                    <input type="text" name="modiHp" placeholder="회사전화">
                                    <button onclick="modifyPrivateAddress();"><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>
                        </div>
                     



                        <div class="add-caption">
                            <ul class="flex">
                                <li class="on">전체</li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="가" >
                                <input type="hidden" class="lastLetter" value="나" >
                                ㄱ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="나" >
                                <input type="hidden" class="lastLetter" value="다" >
                                ㄴ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="다" >
                                <input type="hidden" class="lastLetter" value="라" >
                                ㄷ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="라" >
                                <input type="hidden" class="lastLetter" value="마" >
                                ㄹ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="마" >
                                <input type="hidden" class="lastLetter" value="바" >
                                ㅁ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="바" >
                                <input type="hidden" class="lastLetter" value="사" >
                                ㅂ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="사" >
                                <input type="hidden" class="lastLetter" value="아" >
                                ㅅ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="아" >
                                <input type="hidden" class="lastLetter" value="자" >
                                ㅇ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="자" >
                                <input type="hidden" class="lastLetter" value="차" >
                                ㅈ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="차" >
                                <input type="hidden" class="lastLetter" value="카" >
                                ㅊ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="카" >
                                <input type="hidden" class="lastLetter" value="파" >
                                ㅋ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="파" >
                                <input type="hidden" class="lastLetter" value="하" >
                                ㅍ
                                </li>
                                
                                <li>
                                <input type="hidden" class="firstLetter" value="하" >
                                <input type="hidden" class="lastLetter" value="힣" >
                                ㅎ
                                </li>
                                <!-- <li>a-z</li>
                                <li>0-9</li> -->
                            </ul>
                        </div>
                        <div class="add-table">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="16.25%">
                                    <col width="11.25%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td><input type="checkbox" name="allCk" id="checkAll"/></td>
                                      
                                        <td><i class="fa-solid fa-sort"></i>닉네임(표시명)</td>
                                        <td><i class="fa-solid fa-sort"></i>이름</td>
                                        <td><i class="fa-solid fa-sort"></i>회사</td>
                                        <td><i class="fa-solid fa-sort"></i>직급</td>
                                        <td><i class="fa-solid fa-sort"></i>부서</td>
                                        <td>휴대폰</td>
                                        <td>이메일</td>
                                        <td>회사전화</td>
                                    </tr>
                                </thead>

                                <tbody id="isTbodyAddress">
                                    <c:forEach items="${addressList }" var="address">
                                    <tr class="isAddress" style="cursor:pointer;">
                                        <td><input type="checkbox" class="chk" name="chk" value="${address.name }"></td>
                                       
                                        <c:choose>
                                        	
	                                        <c:when test="${not empty address.ncnm}">
	                                        	<td>
	                                        	<input type="hidden" name="nowNo" value="${address.address_no}">
	                                        	${address.ncnm }
	                                        	</td>
	                                        </c:when>
	                                        <c:otherwise>
				                                <td>
				                                <input type="hidden" name="nowNo" value="${address.address_no}">
				                                 - 
				                                 </td>
				                            </c:otherwise>
                                        </c:choose>
                                        <td>
                                        	<span class="nmSpan">
                                        	
	                                        <input type="hidden" name="nowNm" value="${address.name }" />
	                                        ${address.name } <span class="addClick"></span>
	                                        </span>
	                                    </td>
                                        <c:choose>
	                                        <c:when test="${not empty address.company}">
                                       			 <td>
                                       			 <input type="hidden" name="nowCompany" value="${address.company }" />
                                       			 ${address.company }
                                       			 </td>
                                       		</c:when>
                                       		<c:otherwise>
                                       			<%-- <input type="hidden" name="nowCompany" value="${address.company }" /> --%>
				                                <td> - </td>
				                            </c:otherwise>
                                        </c:choose>
                                         <c:choose>
	                                        <c:when test="${not empty address.rank}">
                                        		<td>
                                        		<input type="hidden" name="nowRank" value="${address.rank }" />
                                        		${address.rank }
                                        		</td>
                                        	</c:when>
	                                        <c:otherwise>
				                                <td> - </td>
				                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
	                                        <c:when test="${not empty address.dept}">
                                        		<td>
                                        		<input type="hidden" name="nowDept" value="${address.dept }" />
                                        		${address.dept }
                                        		</td>
                                        	</c:when>
	                                        <c:otherwise>
				                                <td> - </td>
				                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
	                                        <c:when test="${not empty address.hp}">
                                        		<td>
                                        		<input type="hidden" name="nowHp" value="${address.hp }" />
                                        		${address.hp }
                                        		</td>
                                        	</c:when>
	                                        <c:otherwise>
				                                <td> - </td>
				                            </c:otherwise>
				                             </c:choose>
                                        <c:choose>
                                        	<c:when test="${not empty address.email}">
                                        	<td>
                                        	<input type="hidden" name="nowEmail" value="${address.email }" />
                                        	${address.email }
                                        	</td>
                                        	</c:when>
                                        	<c:otherwise>
				                                <td> - </td>
				                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                        <c:when test="${not empty address.company_hp}">
                                        <td>
                                        	<input type="hidden" name="nowEmail" value="${address.company_hp }" />
                                        	${address.company_hp }
                                        	</td>
                                        	</c:when>
                                        	<c:otherwise>
                                       		 <td> - </td>
                                       		  </c:otherwise>
                                         </c:choose>
                                    </tr>
									</c:forEach>

                                </tbody>
                            </table>
                        </div>

                        <div class="page-btn flex ju-sp-ce">
                        <a class="p-num prev-first" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
							</a>

							<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a>
							</c:forEach>

							 <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');"> <i class="fas fa-angle-double-right"></i>
							</a>
                       
                    </div>
                    </div>
                
            </div>
       </div>
	<form id="jobForm">
		<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"> 
		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
		<input type="hidden" name="nowSort" value="${nowSort }"> 
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="page">
	</form>
	
	<script>
	function list_go(page,url){
		if(!url) url="privateList";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);

		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
	</script>
	
	<script type="text/javascript">
	// 페이징 검색을 위한 js
	function sortChange(obj) {

		if (obj == $('#sort-Asc-Off').get(0)) {
			$('#sort-Desc-On').hide();
			$(obj).hide();
			$('#sort-Asc-On').show();
			$('#sort-Desc-Off').show();
			$('input[name="nowSort"]').val("asc");
			list_go('1');
		}

		if (obj == $('#sort-Desc-Off').get(0)) {
			$('#sort-Asc-On').hide();
			$(obj).hide();
			$('#sort-Desc-On').show();
			$('#sort-Asc-Off').show();
			$('input[name="nowSort"]').val("desc");
			list_go('1');
		}

	}

	function searchTypeChange(obj){
		document.querySelector('#nowSearchType').innerText = obj.innerText;
		$(".tog-b").slideToggle();
		$("input[name=searchType]").val($(obj).children("input").val());
		
	}
	
	function changePerPage(obj) {

		document.querySelector('#perPageView').innerText = obj.innerText;
		$(".num-b.nb01").slideToggle();
		$("input[name=perPageNum]").val($(obj).children("input").val());
		list_go('1');
	}
	
	function searchEnter(obj,e){
		
		if(e.keyCode == 13){
			$("input[name=keyword]").val($(obj).val().trim());
			if($("input[name=keyword]").val() == "" 
					|| $("input[name=keyword]").val() == null 
					|| $("input[name=searchType]").val() == ""
					||  $("input[name=searchType]").val() == null){
				return;
			}
			list_go('1');
		}
		
	}
	
	const checkMark = document.getElementsByName("chk");
	var checkBox = document.getElementById("checkAll");
	var checkArr = checkMark.length;
	
	var receCkArr = new Array();
	
	$(checkBox).click(function (){
		if($("input:checkbox[name='allCk']").is(":checked") == true){
			
			$("input:checkbox[name='chk']").prop("checked", true);
			
			for(var i = 0; i < checkArr; i++){
				receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
			}
		}else{
			$("input:checkbox[name='chk']").prop("checked", false);
			
			for(var i = 0; i < checkArr; i++){
				receCkArr.splice(0, checkArr);
			}
		}
	});
	
	let isArrayForName = [];
	
	function deleteAddress (){
		receCkArr = new Array();
		let data = {};
		
		for(var i = 0; i < checkArr; i++){
			let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
			if(ch == true){
				data = {"name" : $("input:checkbox[name='chk']").eq(i).val()}
				isArrayForName.push(data);
			}
		}
			console.log(isArrayForName)
		
		if(isArrayForName.length == 0){
			alert("삭제할 파일을 선택하세요");
		}else{
			
			Swal.fire({
				title: '삭제 하시겠습니까?',
				text: "삭제된 주소록은 복구가 불가능합니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
				}).then((result)=> {
					if (result.isConfirmed){
		       				$.ajax({
		       					url : '<%=request.getContextPath()%>/address/deleteAddress',
		       					type : 'post',
		       					data : JSON.stringify(isArrayForName),
		       					contentType : 'application/json',
		       					success : function(result){
		       						
		       						if(result == 'success'){
		       						Swal.fire({
		       								icon: 'success',
		       								title: '삭제 되었습니다.',
		       						}).then((result)=>{
		       	                       window.location.reload();
		       	                        })
		       						}
		       					},
		       					error : function(error){
		       					Swal.fire({
								  text: "실패하였습니다.",
								  icon: "error",
								  button: "확인",
							});
		       					}
		       					
		       				}); 
		       				isArrayForName = [];
		       				
					}
				})
			
		} 
		
	}
	
	const addAddress = document.getElementById("addAddress");
	const modifyAddress = document.getElementById("modifyAddress");
	const modifyForm = document.getElementById("modifyForm");
	modifyAddress.addEventListener("click",function(){
		if(modifyForm.style.display=='none'){
			modifyForm.style.display='block';
			nmSpanStyleRed();
		}else{
			modifyForm.style.display='none';
			nmSpanStyleWh();
		}
	})
	
	function nmSpanStyleRed(){
		document.querySelectorAll(".nmSpan").forEach(sp => {
			sp.style.border= "1px solid #1A9CE4";
			sp.style.padding= "4px 5px";
			sp.style.borderRadius= "3px";
			sp.style.color = "rgb(26, 156, 228)";
		}) 
		
		document.querySelectorAll(".addClick").forEach(sp => {
			sp.style.display="inline-block";
		})
	}
	
	
	
	function nmSpanStyleWh(){
		document.querySelectorAll(".nmSpan").forEach(sp => {
			sp.style.border= "";
			sp.style.padding= "";
			sp.style.borderRadius= "";
			sp.style.color = "";
		}) 
		document.querySelectorAll(".addClick").forEach(sp => {
			sp.style.display="none";
		})
	}
	
	addAddress.addEventListener("click",function(){
		const addForm = document.getElementById("addForm");
		if(addForm.style.display=='none'){
			addForm.style.display='block';
		}else{
			addForm.style.display='none';
		}
	})
	
	const addBtn = document.getElementById("addBtn");
	addBtn.addEventListener("click", function () {
		const addName = document.querySelector('input[name="addName"]');
		const addCompany = document.querySelector('input[name="addCompany"]');
		const addRank = document.querySelector('input[name="addRank"]');
		const addDept = document.querySelector('input[name="addDept"]');
		const addMobile = document.querySelector('input[name="addMobile"]');
		const addEmail = document.querySelector('input[name="addEmail"]');
		const addHp = document.querySelector('input[name="addHp"]');
		
		if(!addName.value){
			alert("이름은 필수입니다.")
			addName.focus();
			return false;
		} else {
			const data = {
				"name" : addName.value,
				"company" : addCompany.value,
				"rank" : addRank.value,
				"dept" : addDept.value,
				"hp" : addMobile.value,
				"email" : addEmail.value,
				"company_hp" : addHp.value,
				"loginempno" : '${loginEmp.empl_no}'
			}
			
			$.ajax({
					url : '<%=request.getContextPath()%>/address/insertPrivate',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function(result){
						if(result == 'success'){
						Swal.fire({
								icon: 'success',
								title: '등록되었습니다.',
						}).then((result)=>{
	                            window.location.reload();
	                           })
						}
					},
					error : function(error){
					Swal.fire({
				  text: "불가합니다.",
				  icon: "error",
				  button: "확인",
			});
					}
				}); 
		}
		
	})
	
	const isAddress = document.querySelectorAll(".isAddress");	
	
	const modino = document.querySelector('input[name="modino"]');
	const modiName = document.querySelector('input[name="modiName"]');
	const modiCompany = document.querySelector('input[name="modiCompany"]');
	const modiRank = document.querySelector('input[name="modiRank"]');
	const modiDept = document.querySelector('input[name="modiDept"]');
	const modiMobile = document.querySelector('input[name="modiMobile"]');
	const modiEmail = document.querySelector('input[name="modiEmail"]');
	const modiHp = document.querySelector('input[name="modiHp"]');
	

	
	for(let i=0; i<isAddress.length; i++){
	isAddress[i].addEventListener("dblclick", function(){
			
			const thisRow = $(this).closest('tr');
			/* alert(thisRow);
			console.log(thisRow); */
			const nowNo = thisRow.find('td:eq(1)').find('input').val();
			const nowName = thisRow.find('td:eq(2)').find('input').val();
			const nowCompany = thisRow.find('td:eq(3)').find('input').val();
			const nowRank = thisRow.find('td:eq(4)').find('input').val();
			const nowDept = thisRow.find('td:eq(5)').find('input').val();
			const nowMobile = thisRow.find('td:eq(6)').find('input').val();
			const nowEmail = thisRow.find('td:eq(7)').find('input').val();
			const nowHp = thisRow.find('td:eq(8)').find('input').val();
			
			if(modifyForm.style.display=='block'){	
				
				modiCompany.setAttribute("placeholder","회사");
				modiCompany.setAttribute("value","");
				modiHp.setAttribute("placeholder","회사전화");
				modiHp.setAttribute("value","");
				
				//modino.setAttribute("placeholder",nowNo);
				modino.setAttribute("value",nowNo);
				modiName.setAttribute("placeholder",nowName);
				modiName.setAttribute("value",nowName);
				if(nowCompany != undefined){
					modiCompany.setAttribute("placeholder",nowCompany);
					modiCompany.setAttribute("value",nowCompany);
					}
				if(nowRank != undefined){
					modiRank.setAttribute("placeholder",nowRank);
					modiRank.setAttribute("value",nowRank);
				}
				if(nowDept != undefined){
					modiDept.setAttribute("placeholder",nowDept);
					modiDept.setAttribute("value",nowDept);
					}
				if(nowMobile != undefined){
					modiMobile.setAttribute("placeholder",nowMobile);
					modiMobile.setAttribute("value",nowMobile);
					}
				
				if(nowEmail != undefined){
					modiEmail.setAttribute("placeholder",nowEmail);
					modiEmail.setAttribute("value",nowEmail);
				}
				if(nowHp != undefined){
					modiHp.setAttribute("placeholder",nowHp);
					modiHp.setAttribute("placeholder",nowHp);
					}
				
			}
			
		})
	}

	function modifyPrivateAddress(){
		const data = {
				"address_no" : modino.value,
				"name" : modiName.value,
				"company" : modiCompany.value,
				"rank" : modiRank.value,
				"dept" : modiDept.value,
				"hp" : modiMobile.value,
				"email" : modiEmail.value,
				"company_hp" : modiHp.value
		}
		
		 $.ajax({
			url : '<%=request.getContextPath()%>/address/updatePrivate',
			type : 'post',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(result){
				if(result == 'success'){
					Swal.fire({
						icon:'success',
						title:'수정되었습니다.',
					}).then((result)=>{
                        window.location.reload();
                       })
				}
			},
			error : function(error){
			Swal.fire({
		  text: "불가합니다.",
		  icon: "error",
		  button: "확인",
	});
			}
		}); 
		/* alert("클릭!!!"); */
	}
	
</script>	

<%@ include file="/WEB-INF/include/footer.jsp" %>
