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
                        <h1>개인업무 <span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                       
                       
                       <div class="sear-box flex">
							<div class="work-state">
								<div class="select-tog flex ju-sp-bt al-it-ce">
									<span id="nowSearchType">
									<c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'JNM'}">제목</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'JBD'}">시작날짜</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'JED'}">마감날짜</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'JWRI'}">생성자</c:when>
									</c:choose>
									
									
									
									</span>
									<i class="fa-solid fa-caret-down"></i>
								</div>
								
								<ul class="tog-b" style="display: none;">
									<li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="JNM" >제목</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="JBD" >시작날짜</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="JED" >마감날짜</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="JWRI" >생성자</li>
								</ul>
							</div>
		
							<input id="search" type="text" placeholder="Search" value="<c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
										<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
									</c:choose>" onkeypress="searchEnter(this,event);">
						</div>
                       <%-- <div class="flex">
	                       <ul class="flex" style="display:none">
	                             <li>
	                                 <label>정렬개수</label>
	                                 <div>
	                                   <select name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
								  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >10개씩</option>
								  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
								  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
								  		<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
								  	</select>                                   
	                                 </div>
	                             </li>
	                       </ul>
	                       
	                       <div class="sear-box flex">
	                            <div class="work-state">
	                                <div class="select-tog flex ju-sp-bt al-it-ce" data-role="selectBox">
	                                	<span date-value="optValue" class="selected-option"></span>
	                                	<i class="fa-solid fa-caret-down"></i>
	                                </div>
	                                
	                              	 <ul class="tog-b hide" id="searchType">
	                                    <li value="JNM" ${cri.searchType eq 'd' ? 'selected':''}>제목</li>
	                                </ul>
	                            </div>
	                                
	                            <input id="search" type="text" placeholder="Search">
	                        </div>
                        </div> --%>
                    </div>

                  <!-- <div class="project-tab">
                        <ul class="flex">
                            <li class="on">전체 업무</li>
                            <li>할당된 업무</li>
                        </ul>
                    </div>-->
                    <ul class="num-b nb01" style="display: none;" id="perPageList">
						<li onclick="changePerPage(this);">2개씩<input
							type="hidden" value="2"></li>
						<li onclick="changePerPage(this);">5개씩<input
							type="hidden" value="5"></li>
						<li onclick="changePerPage(this);">10개씩<input
							type="hidden" value="10"></li>
						<li onclick="changePerPage(this);">20개씩<input
							type="hidden" value="20"></li>
					</ul>
                    

                    <div class="project-list">
                        <div class="project-caption">
                            <ul class="flex al-it-ce ju-sp-bt">
                                <li>
                                    <div class="statb" >
                                        <p id="newJobNum">00</p>
                                        <span><i class="fa-solid fa-file-circle-plus"></i>신규 업무</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="statb">
                                        <p id="startJobNum">00</p>
                                        <span><i class="fa-solid fa-file-lines"></i>진행중인 업무</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="statb">
                                        <p id="deadJobNum">00</p>
                                        <span><i class="fa-solid fa-clipboard-check"></i>마감된 업무</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="statb">
                                        <p id="notJobNum">00</p>
                                        <span><i class="fa-solid fa-user-xmark"></i>불가처리 업무</span>
                                    </div>
                                </li>

                                <!--
                                <li>
                                   <button><i class="fa-solid fa-pen"></i> 업무생성</button>
                                </li>
                                -->
                            </ul>
                        </div>

                     

                        <div class="table-title">
                           <table>
                                <colgroup>
                                    <col width="8%">
                                    <col width="30%">
                                    <col width="18%">
                                    <col width="12%">
                                    <col width="12%">
                                    <col width="20%">
                                    <col width="20%">
                                </colgroup>
                               <thead>
                                   <tr>
                                        <td></td>
                                        <td>업무명</td>
                                        <td>업무 생성자</td>
                                        <td>업무 생성일</td>
                                        <td>업무 상태</td>
                                        <td>업무 기간</td>
                                        <td>업무 담당자</td>
                                   </tr>
                               </thead>
                            </table>
                        </div>
                        
                        <c:forEach items="${indivWorkList }" var="invList">
                        	    <c:choose>
                                 	<c:when test="${invList.jobSttus eq 0}">
                                 		<div class="project-con n-table">
				                             <table id="newJobArr">
				                                <colgroup>
								                    <col width="8%">
				                                    <col width="30%">
				                                    <col width="18%">
				                                    <col width="12%">
				                                    <col width="12%">
				                                    <col width="20%">
				                                    <col width="20%">
				                                </colgroup>
				
				                                <tbody>
				                                    <tr onClick="detail_go(${invList.jobCode})">
				                                        <td><div class="modi-img" data-id="${invList.empId }"></div></td>
				                                        <td>${invList.jobNm }</td>
				                                        
											            <td class="invListInfo">
					                                        <span>${invList.empDept }</span> 
					                                        <span>${invList.empName }</span>
					                                        <span>${invList.empRank }</span>
				                                        </td>
				                                        
				                                        <td>${invList.jobUpdde }</td>
				                                        
				                                        <c:choose>
				                                        	<c:when test="${invList.jobSttus eq 0}">
				                                        		<td><span class="n-tip">신규</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 1}">
				                                        		<td><span class="s-tip">진행</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 2}">
				                                        		<td><span class="m-tip">마감</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 3}">
				                                        		<td><span class="c-tip">불가</span></td>
				                                        	</c:when>
				                                        </c:choose>
				                                        <td>${invList.jobBgnde } ~ ${invList.jobEndde }</td>
				                                        
				                                        <td class="assMemList">
				                                        	<c:forEach items="${assignList}" var="asslist">
					                                        	<c:if test="${invList.jobCode eq asslist.jobCode}">
					                                        		<span class="assMem">${asslist.empName }</span>
					                                        	</c:if>
				                                        	</c:forEach>
				                                        </td>
				                                        
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </div>
                                 	</c:when>
                                 	
                                 	<c:when test="${invList.jobSttus eq 1}">
                                 		 <div class="project-con s-table">
					                             <table id="startJobArr">
					                                <colgroup>
									                    <col width="8%">
					                                    <col width="30%">
					                                    <col width="18%">
					                                    <col width="12%">
					                                    <col width="12%">
					                                    <col width="20%">
					                                    <col width="20%">
					                                </colgroup>
					
					                               <tbody>
					                                    <tr onClick="detail_go(${invList.jobCode})">
					                                        <td><div class="modi-img" data-id="${invList.empId }"></div></td>
					                                        <td>${invList.jobNm } </td>
					                                        <td class="invListInfo">
						                                        <span>${invList.empDept }</span> 
						                                        <span>${invList.empName }</span>
						                                        <span>${invList.empRank }</span>
					                                        </td>
					                                        <td>${invList.jobUpdde }</td>
					                                        
					                                        <c:choose>
					                                        	<c:when test="${invList.jobSttus eq 0}">
					                                        		<td><span class="n-tip">신규</span></td>
					                                        	</c:when>
	    	
					                                        	<c:when test="${invList.jobSttus eq 1}">
					                                        		<td><span class="s-tip">진행</span></td>
					                                        	</c:when>
					                                        	
					                                        	<c:when test="${invList.jobSttus eq 2}">
					                                        		<td><span class="m-tip">마감</span></td>
					                                        	</c:when>
					                                        	
					                                        	<c:when test="${invList.jobSttus eq 3}">
					                                        		<td><span class="c-tip">불가</span></td>
					                                        	</c:when>
					                                        </c:choose>
					                                        <td>${invList.jobBgnde } ~ ${invList.jobEndde }</td>
					                                        <td class="assMemList">
					                                        	<c:forEach items="${assignList}" var="asslist">
						                                        	<c:if test="${invList.jobCode eq asslist.jobCode}">
						                                        		<span class="assMem">${asslist.empName }</span>
						                                        	</c:if>
				                                        		</c:forEach>
					                                        </td>
					                                        
					                                       
					                                    </tr>
					                                </tbody>
					                            </table>
					                        </div>
                                 	</c:when>
                                 	
                                 	<c:when test="${invList.jobSttus eq 2}">
                                 		<div class="project-con m-table">
					                            <table id="deadJobArr">
					                                <colgroup>
									                    <col width="8%">
					                                    <col width="30%">
					                                    <col width="18%">
					                                    <col width="12%">
					                                    <col width="12%">
					                                    <col width="20%">
					                                    <col width="20%">
					                                </colgroup>
					
					                               <tbody>
					                                    <tr onClick="detail_go(${invList.jobCode})">
					                                        <td><div class="modi-img" data-id="${invList.empId }"></div></td>
					                                        <td>${invList.jobNm } </td>
					                                        <td class="invListInfo">
						                                        <span>${invList.empDept }</span> 
						                                        <span>${invList.empName }</span>
						                                        <span>${invList.empRank }</span>
					                                        </td>
					                                        <td>${invList.jobUpdde }</td>
					                                        
					                                        <c:choose>
					                                        	<c:when test="${invList.jobSttus eq 0}">
					                                        		<td><span class="n-tip">신규</span></td>
					                                        	</c:when>
					                                        	
					                                        	<c:when test="${invList.jobSttus eq 1}">
					                                        		<td><span class="s-tip">진행</span></td>
					                                        	</c:when>
					                                        	
					                                        	<c:when test="${invList.jobSttus eq 2}">
					                                        		<td><span class="m-tip">마감</span></td>
					                                        	</c:when>
					                                        	
					                                        	<c:when test="${invList.jobSttus eq 3}">
					                                        		<td><span class="c-tip">불가</span></td>
					                                        	</c:when>
									                        </c:choose>
					                                        <td>${invList.jobBgnde } ~ ${invList.jobEndde }</td>
					                                          <td class="assMemList">
					                                        	<c:forEach items="${assignList}" var="asslist">
						                                        	<c:if test="${invList.jobCode eq asslist.jobCode}">
						                                        		<span class="assMem">${asslist.empName }</span>
						                                        	</c:if>
				                                        		</c:forEach>
					                                        </td>
					                                    </tr>
					                                </tbody>
					                            </table>
					                        </div>
                                 	</c:when>
                                 	
                                 	<c:when test="${invList.jobSttus eq 3}">
                                 		 <div class="project-con c-table">
				                           <table id="notJobArr">
				                              	<colgroup>
								                    <col width="8%">
				                                    <col width="30%">
				                                    <col width="18%">
				                                    <col width="12%">
				                                    <col width="12%">
				                                    <col width="20%">
				                                    <col width="20%">
				                                </colgroup>
				
				                                <tbody>
				                                     <tr onClick="detail_go(${invList.jobCode})">
				                                        <td><div class="modi-img" data-id="${invList.empId }"></div></td>
				                                        <td>${invList.jobNm } </td>
				                                        <td class="invListInfo">
					                                        <span>${invList.empDept }</span> 
					                                        <span>${invList.empName }</span>
					                                        <span>${invList.empRank }</span>
				                                        </td>
				                                        <td>${invList.jobUpdde }</td>
				                                        
				                                        <c:choose>
				                                        	<c:when test="${invList.jobSttus eq 0}">
				                                        		<td><span class="n-tip">신규</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 1}">
				                                        		<td><span class="s-tip">진행</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 2}">
				                                        		<td><span class="m-tip">마감</span></td>
				                                        	</c:when>
				                                        	
				                                        	<c:when test="${invList.jobSttus eq 3}">
				                                        		<td><span class="c-tip">불가</span></td>
				                                        	</c:when>
				                                        </c:choose>
				                                        <td>${invList.jobBgnde } ~ ${invList.jobEndde }</td>
				                                         <td class="assMemList">
					                                       <c:forEach items="${assignList}" var="asslist">
					                                        	<c:if test="${invList.jobCode eq asslist.jobCode}">
					                                        		<span class="assMem">${asslist.empName }</span>
					                                        	</c:if>
			                                        		</c:forEach>
					                                     </td>
				                                    </tr>
				                                </tbody>
				     						 </table>
								         </div>
                        
                                 	</c:when>
                                
                               
                                 </c:choose>
                        
                          
                        </c:forEach>
                        
                        

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
				if(!url) url="indivList";
				
				let jobForm=$('#jobForm');
				
				jobForm.find("[name='page']").val(page);
		
				jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
			
				jobForm.attr({
					action:url,
					method:'get'
				}).submit();
			}
		</script> 
		
       <script>
	       	function detail_go(wno){
	       		location.href = "detail?wno=" + wno;
	       	}
	       	
	       	/* const body = document.querySelector('body');
	       	const select = document.querySelector('[data-role="selectBox"]');
	       	const values = select.querySelector('[date-value="optValue"]');
	       	const option = document.querySelector('#searchType');
	       	const opts = option.querySelectorAll('li'); */

	       	
	       	/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
	       	/* function selects(e){
	       	    e.stopPropagation();
	       	    option.setAttribute('style','top:${select.offsetHeight}px');
	       	    
	       	    if(option.classList.contains('hide')){
	       	        option.classList.remove('hide');
	       	        option.classList.add('show');
	       	    }else{
	       	        option.classList.add('hide');
	       	        option.classList.remove('show');
	       	    }
	       	    selectOpt();
	       	} */

	       	/* 옵션선택 */
	       /* 	function selectOpt(){
	       	    opts.forEach(opt=>{
	       	        const innerValue = opt.innerHTML;
	       	        function changeValue(){
	       	            values.innerHTML = innerValue;
	       	        }
	       	        opt.addEventListener('click',changeValue)
	       	    });
	       	} */

	       	/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
	       	/* function selectFirst(){
	       	    const firstValue = opts[0].innerHTML;
	       	    values.innerHTML = '선택'
	       	} */

	       	/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
	       /* 	function hideSelect(){
	       	    if(option.classList.contains('show')){
	       	        option.classList.add('hide');
	       	        option.classList.remove('show');
	       	    }
	       	}

	       	selectFirst();
	       	select.addEventListener('click',selects);
	       	body.addEventListener('click',hideSelect); */
       
	       	
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
	    	
	    	
	    	
	    	function stateWrokArrNum(){
	       		var newA = $("#newJobArr > tbody > tr").length;
	       		var startA = $("#startJobArr > tbody > tr").length;
	       		var deadA = $("#deadJobArr > tbody > tr").length;
	       		var notA = $("#notJobArr > tbody > tr").length;
	       		
	       		
	       		$("#newJobNum").text(newA + "건");
	       		$("#startJobNum").text(startA + "건");
	       		$("#deadJobNum").text(deadA + "건");
	       		$("#notJobNum").text(notA + "건");
	       	}
	      	
	       	
	    
	       	stateWrokArrNum();
       </script>
       
        <script>
       MemberProFilePictureThumb('<%=request.getContextPath()%>');
   	
	   	function MemberProFilePictureThumb(contextPath){
	   		 for(var target of document.querySelectorAll('.modi-img')){	
	   			 var id = target.getAttribute('data-id');
	   			 
	   			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
	   			 target.style.backgroundPosition="center";
	   			 target.style.backgroundRepeat="no-repeat";
	   			 target.style.backgroundSize="cover";
	   		}
	   	}
       </script>
   
<%@ include file="/WEB-INF/include/footer.jsp" %>    