<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/header.jsp" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="annualList" value="${dataMap.annualList }" />
<c:set var="totalUse" value="${dataMap.totalUse }" />

<body>
    

   <div class="wrap">
             <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
               

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>나의 연차내역 <span>근태관리 <i class="fa-solid fa-angle-right"></i> 나의 연차내역</span></h1> 
                    </div>

                
                    <div class="annual">
                        <div class="annual-top flex">
                            <div class="atop01 flex al-it-ce">
                                <div class="modi-img" data-id="${loginEmp.id }"></div>
                                <div class="name"><h3>${loginEmp.name }&nbsp;${loginEmp.rank }</h3><span>${loginEmp.dept }</span></div>
                            </div>

                            <div class="atop02 flex al-it-ce">
                               <ul class="flex">
                                     <li>
                                        <em>발생연차</em>
                                        <span>01</span>
                                     </li>
                               </ul>
                            </div>

                            <div class="atop03 flex al-it-ce">
                                <ul class="flex">
                                    <li>
                                        <em>총 연차</em>
                                        <span>36</span>
<%--                                          id="totalAnnual"<fmt:formatDate value="${loginEmp.encpn }" pattern="yyyy-MM-dd"/> --%>
                                     </li>
 
                                     <li>
                                         <em>사용 연차</em>
                                         <span id="useAnnual">${totalUse }</span>
                                      </li>
 
                                      <li>
                                         <em>잔여 연차</em>
                                         <span>6</span>
                                      </li>
                                </ul>
                             </div>
                        </div>
                        
						
						<div class="flex ju-sp-bt al-it-ce mb-10">
	                        <div class="ann-date flex al-it-ce">
	                            <h3 class="list-title">연차 사용내역</h3>
	                        </div>	
	                        		
	                        <div class="annual-caption">
		                        <div class="ann-date flex al-it-ce" >
		                            <input type="date" name="start" value="${cri.start }">
		                            <em>~</em>
		                            <input type="date" name="end" value="${cri.end }">
		                            <button onclick="list_go(1);">조회</button>
		                        </div>
	                        </div>
                        </div>
						
                          
                        <div class="annual-useList">
                            <table>
                                <colgroup>
                                    
                                    <col width="20%">
                                    <col width="15%">
                                    <col width="20%">
                                    <col width="10%">
                                    <col width="25%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td>연차시작</td>
                                        <td>연차끝</td>
                                        <td>휴가종류</td>
                                        <td>사용연차</td>
                                        <td>내용</td>
                                    </tr>
                                </thead>

                                <tbody>
                                	<c:if test="${empty annualList }">
                                   		<tr>

											<td colspan="5" style="text-align:center">

											<td colspan="5" class="notContent">

												데이터가 존재하지 않습니다
											</td>
										</tr>
                                    </c:if>
									<c:if test="${not empty annualList }"> 
	                                	<c:forEach items="${annualList }" var="anu">
		                                    <tr>
		                                        <td>${anu.startdate }</td>
		                                        <td>${anu.enddate }</td>
		                                        <c:if test="${anu.kind eq 'y' }">
			                                        <td>연차</td>
		                                        </c:if>
		                                        <c:if test="${anu.kind eq 's' }">
			                                        <td>여름휴가</td>
		                                        </c:if>
		                                        <c:if test="${anu.kind eq 'w' }">
			                                        <td>겨울휴가</td>
		                                        </c:if>
		                                        <td class="totaluse">${anu.use }</td>
		                                        <td>${anu.content }</td>
		                                    </tr>                                	
	                                	</c:forEach>
									</c:if>
                                </tbody>

                            </table>
                        </div>
                        
                       <div class="page-btn flex ju-sp-ce">
						   <a class="p-num prev-first" href="javascript:list_go(1);">
						   		<i class="fas fa-angle-left" aria-hidden="true"></i>
						   </a>
						   
						<%--    <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
								<i class="fas fa-angle-left"></i>
						   </a> --%>
						   
						   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
								<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
							</c:forEach>
							
						  <%--  <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
								<i class="fas fa-angle-right" ></i>
						   </a> --%>
						   
						   <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');">
								<i class="fas fa-angle-double-right" aria-hidden="true"></i>
						   </a>
						</div>

				<form id="jobForm">	
					<input type='hidden' name="page" value="" />
					<input type='hidden' name="start" value="" />
					<input type='hidden' name="end" value="" />
					
				</form>


						
                        
                 </div>
            </div>
       </div>
	</div>
	
	<script>
		const totalAnnual = document.querySelector("#totalAnnual");
		const leaveAnnual = document.querySelector("#leaveAnnual");
		const useAnnual = document.querySelector("#useAnnual");
		const totaluse = document.querySelectorAll('.totaluse');
		
		window.addEventListener("DOMContentLoaded",init());
		
		
		function list_go(page,url){
			if(!url) url="annualList";
			
			let date = new Date();
		    let year = date.getFullYear();
		    let month = ("0" + (1 + date.getMonth())).slice(-2);
		    let day = ("0" + date.getDate()).slice(-2);
		    let now = year + month + day; 
			
			let jobForm=$('#jobForm');
			
			jobForm.find("[name='page']").val(page);
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
		
		function init(){
			let now = new Date();
		 
		    
			let empEncpn = new Date(totalAnnual.innerText.substring(0,4),
									totalAnnual.innerText.substring(5,7),
									totalAnnual.innerText.substring(8,9));
			
			let interval = now - empEncpn;
			let day = 1000*60*60*24;
			let month = day*30;
			totalAnnual.innerText = parseInt(interval/month);
			
			if(parseInt(totalAnnual.innerText - useAnnual.innerText) < 0){
				leaveAnnual.innerText = 0;
			}else{
				leaveAnnual.innerText = parseInt(totalAnnual.innerText - useAnnual.innerText);				
			}
			
		}
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
	
</body>
<%@ include file="/WEB-INF/include/footer.jsp" %>