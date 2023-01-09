<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>


   <div class="wrap">
  		<%@ include file="/WEB-INF/include/topbar.jsp" %>

            <div class="container flex">
             
            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>받은메일함 <span>메일 <i class="fa-solid fa-angle-right"></i> 받은메일함</span></h1> 
                   
                </div>


                <div class="mail-state">
                    <ul class="flex al-it-ce ju-sp-bt">
                        <li>
                            <i class="fa-solid fa-envelope"></i>
                            <em>전체메일</em> <span>${ALL_COUNT }</span>
                        </li>

                        <li>
                            <i class="fa-solid fa-envelope-open-text"></i>
                            <em>받은메일</em> <span>${RECV_COUNT }</span>
                        </li>

                        <li>
                            <i class="fa-solid fa-paper-plane"></i>
                            <em>보낸메일</em> <span>${SEND_COUNT }</span>
                        </li>

                        <li>
                            <i class="fa-solid fa-inbox"></i>
                            <em>임시보관함</em> <span>${SAVE_COUNT }</span>
                        </li>

                        <li>
                            <i class="fa-solid fa-trash-can"></i>
                            <em>휴지통</em> <span>${TRASH_COUNT } </span>
                        </li>
                    </ul>
                </div>


     	    <form method="POST" id="checkRemoveCodeUp">
     			<input type="hidden" name="receCkArr" value="" id="receCkArr"/>
     		</form>
     		
                 <div class="mail-search">
                    <div class="sear-box flex">
							<div class="work-state">
								<div class="select-tog flex ju-sp-bt al-it-ce">
									<span id="nowSearchType">
									<c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'SJ'}">제목</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'CN'}">내용</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'WRI'}">날짜</c:when>
									</c:choose>
									
									
									
									</span>
									<i class="fa-solid fa-caret-down"></i>
								</div>
								
								<ul class="tog-b" style="display: none;">
									<li onclick="searchTypeChange(this);"><input type="hidden" value="SJ" >제목</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="CN" >내용</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="WRI" >날짜</li>
								</ul>
							</div>
		
							<input id="search" type="text" placeholder="Search" value="<c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
										<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
									</c:choose>" onkeypress="searchEnter(this,event);">
						</div>
            
                 </div>
              
                    <div class="mail-wrap">
                        <div class="mail-caption flex ju-sp-bt al-it-ce">
                            <ul class="flex al-it-ce">
                                <li><input type="checkbox" name="allCk" id="checkAll"></li>
                                <li>
                                    <button id="stateUp"><i class="fa-solid fa-envelope-open"></i> 읽음</button>
                                    <button id="removeUp"><i class="fa-solid fa-trash-can"></i> 휴지통</button>
                                    <!-- <button><i class="fa-solid fa-paper-plane"></i>답장</button> -->
                                    <!-- <button><i class="fa-solid fa-inbox"></i>임시보관함</button> -->
                                </li>
                            </ul>
                        </div>

                      
                        <div class="mail-list">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="18%">
                                    <col width="36%">
                                    <col width="10%">
                                    <col width="8%">
                                </colgroup>

                                <tbody>
                                
			                    <c:if test="${empty receMailList }" >
									<tr>
										<td colspan="7" class="notContent">
											해당 메일이 없습니다.
										</td>
									</tr>
								</c:if>	
								
                               	  <c:forEach items="${receMailList }" var="rmail">
	                                    <tr>
	                                        <td><input type="checkbox" name="chk" id="check-mark" value="${rmail.emailNo }"></td>
	                                        
	                                        <c:choose>
		                                        <c:when test="${rmail.unityNo eq -1}">
		                                        	<td><i class="fa-solid fa-paperclip off"></i></td>
		                                        </c:when>
		                                        
		                                        <c:otherwise>
		                                        	<td><i class="fa-solid fa-paperclip on"></i></td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        
	                                       
	                                         <c:choose>
		                                        <c:when test="${rmail.emailSttus eq 0}">
		                                        	 <td><i class="fa-solid fa-envelope"></i></td>
		                                        </c:when>
		                                        
		                                        <c:otherwise>
		                                        	<td><i class="fa-solid fa-envelope-open"></i></td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                       
	                                        
	                                        
	                                        <td>[보낸사람 : ${rmail.ncnm}]</td>
	                                        <td>${rmail.sendEmpMail }</td>
	                                        <td class="o-title" onClick="detail_go(${rmail.emailNo})"><div>${rmail.emailSj }</div></td>
	                                        <td>${rmail.writngOn }</td>
	                                        <td>${rmail.mailSize }</td>
	                                    </tr>
	                               </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
				

                    <div class="page-btn flex ju-sp-ce">
						<a class="p-num prev-first" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
						</a> 
						<%-- <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
							<i class="fas fa-angle-left"></i>
						</a> --%>

						<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a>
						</c:forEach>

						<%-- <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
							<i class="fas fa-angle-right"></i>
						</a>  --%>
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
				if(!url) url="receivedMail";
				
				let jobForm=$('#jobForm');
				
				jobForm.find("[name='page']").val(page);
		
				jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
			
				jobForm.attr({
					action:url,
					method:'get'
				}).submit();
			}
			
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
	    	
	</script> 
    
   <script>
	   	function detail_go(eno){
	   		console.log(eno);
	   		location.href = "detail?eno=" + eno;
	   	}
	   	
	   
	   	
	   	var checkBox = document.getElementById("checkAll");
		var checkMark = document.getElementsByName("chk");
		var checkArr = checkMark.length;

		var receCkArr = new Array();
		
	
		$(checkBox).click(function (){
			if($("input:checkbox[name='allCk']").is(":checked") == true){
				
				$("input:checkbox[name='chk']").prop("checked", true);
				
				for(var i = 0; i < checkArr; i++){
					receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
					console.log(receCkArr);
				}
			}else{
				$("input:checkbox[name='chk']").prop("checked", false);
				
				for(var i = 0; i < checkArr; i++){
					receCkArr.splice(0, checkArr);
					console.log(receCkArr);
				}
			}
		});
		
		
		
		const removeCodeUpdate = document.querySelector('#removeUp');

		
			removeCodeUpdate.addEventListener('click', function(e){
			
				receCkArr = new Array();
				
				for(var i = 0; i < checkArr; i++){
					let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
					if(ch == true){
						receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
						console.log("들어오는 배열 확인" + receCkArr);
					}/* else if(ch == false){
						
						for(var j = 0; j < i; j++){
							receCkArr.splice(j, i);
						console.log("나가는 배열 확인" + receCkArr);
						}
					} */
				}
			
				console.log("배열 확인 " + receCkArr);
				
				if(receCkArr.length == 0){
					Swal.fire({
					 	title: "삭제할 메일을 선택하세요.",
			               icon: 'success',
			               confirmButtonColor: '#3085d6',
			               confirmButtonText: '확인'
			               
			           })
				}
				else{
					Swal.fire({
					 	title: "휴지통으로 이동하시겠습니까?",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            confirmButtonText: '확인',
			            cancelButtonColor: '#d33',
			            cancelButtonText: '취소'
			            
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url : '<%=request.getContextPath()%>/mail/receRemoveCode',
								type : 'post',
								data : JSON.stringify(receCkArr),
								contentType : 'application/json',
								success : function(result){
									
									Swal.fire({
			      					 	title: "휴지통으로 이동하였습니다.",
			      			               icon: 'success',
			      			               confirmButtonColor: '#3085d6',
			      			               confirmButtonText: '확인'
			      			               
			      			           }).then((result) => {
			      			        	 window.location.reload();
			      			      	});
									
								},
								error : function(error){
									alert('휴지통 이동이 실패되었습니다');
								}
							});
							arr = new Array();
						}
					}); 
				
				} 
			});
	
		
			const stateCodeUpdate = document.querySelector('#stateUp');
   		
			stateCodeUpdate.addEventListener('click', function(e){
				
				receCkArr = new Array();
				
				for(var i = 0; i < checkArr; i++){
					let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
					if(ch == true){
						receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
						console.log("들어오는 배열 확인" + receCkArr);
					}/* else if(ch == false){
						
						for(var j = 0; j < i; j++){
							receCkArr.splice(j, i);
						console.log("나가는 배열 확인" + receCkArr);
						}
					} */
				}
			
				console.log("배열 확인 " + receCkArr);
				
				if(receCkArr.length == 0){
					alert("읽음 처리할 메일을 선택해주세요.");
				}
				else{
				$.ajax({
					url : '<%=request.getContextPath()%>/mail/stateUpdate',
					type : 'post',
					data : JSON.stringify(receCkArr),
					contentType : 'application/json',
					success : function(result){
						window.location.reload();
					},
					error : function(error){
						alert('실패');
					}
				});
				arr = new Array();
				
				} 
			});
	
   	
   </script>
    
   
 <%@ include file="/WEB-INF/include/footer.jsp" %>