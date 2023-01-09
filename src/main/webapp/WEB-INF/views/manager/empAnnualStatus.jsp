<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/include/header.jsp"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="annualList" value="${dataMap.annualList }" />

<body>


	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>
		<div class="container flex">


			<div class="content">
				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<h1>
						전사연차현황<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
							2서브메뉴
						</span>
					</h1>
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
							<li><label>입사일</label>
								<div>
									<input type="date" name="start" value="${cri.start }"> 
									<span> ~ </span> 
									<input type="date" name="end" value="${cri.end }">
								</div></li>
								
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
                               <label>검색구분</label>
                               <div>
                                   <select name="searchType" id="searchType">
                                       <option value="" ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
                                       <option value="d"  ${cri.searchType eq 'd' ? 'selected':''}>부서</option>
						   			   <option value="n"  ${cri.searchType eq 'n' ? 'selected':''}>이 름</option>	
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
								<div>
									<button onclick="list_go(1);"><i class="fa fa-fw fa-search"></i></button>
								</div>
							</li>

							<li>
								<div>
									<button class="reset">검색 조건 초기화</button>
								</div>
							</li>
						</ul>
					</div>



					<div class="matt-decap flex flex-end">
						<div class="matt-icon">
							<ul class="flex">
								<li><i class="fa-solid fa-file-arrow-down"></i>엑셀로 내려받기</li>
							</ul>
						</div>
					</div>
					<div class="matt-cal matt-de">
						<div class="matt-list">

							<table>
								<colgroup>
									
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
									<col width="35%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
								</colgroup>

								<thead>
									<tr>
										<th>이름</th>
										<th>부서명</th>
										<th>입사일</th>
										<th>퇴사일</th>
										<th>사용일</th>
										<th>근속 연수</th>
										<th>총 연차</th>
										<th>사용 연차</th>
										<th>잔여 연차</th>
										<th>분류</th>
									</tr>
								</thead>

								<tbody>
									<c:if test="${empty annualList }">
                                   		<tr>
											<td colspan="10" style="text-align: center">
												데이터가 존재하지 않습니다
											</td>
										</tr>
                                    </c:if>
									<c:if test="${not empty annualList }">                                    		
										<c:forEach items="${annualList }" var="anu">
											<c:set var="encpnd" value="${anu.encpn }" />
											<tr>
												<td>${anu.name }</td>
												<td>${anu.dept }</td>
												<td class="encpn">${fn:substring(encpnd,0,10) }</td>
												<td>-</td>
												<td>${anu.startdate } ~ ${anu.enddate }</td>
												<td class="workYear">0</td>
												<td class="totalAnu">0</td>
												<td class="useAnu">${anu.use }</td>
												<td class="leaveAnu">${anu.leave }</td>
		                                        <td class="y">연차</td>
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
				   
				   <%-- <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
						<i class="fas fa-angle-left"></i>
				   </a> --%>
				   
				   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
						<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
					</c:forEach>
					
				 <%--   <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
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
		const reset = document.querySelector('.reset');
		const workYear = document.querySelectorAll('.workYear');
		const totalAnu = document.querySelectorAll('.totalAnu');
		const useAnu = document.querySelectorAll('.useAnu');
		const encpn = document.querySelectorAll('.encpn');
		
		reset.addEventListener('click', ()=>{
			location.href = '${pageContext.request.contextPath}/dclzmanager/empAnnualStatus';
		});
	
		$(document).ready(function() {
			
			
			let current = new Date;
		    let curre = current.toLocaleDateString();
		    let today = curre.slice(0, -1);
	       $('#today').text(today);
	    });
		
		init();
		
		function init(){
			let curr = new Date();
			let empEncpn = new Date(encpn[0].innerText);
			let interval = curr - empEncpn;
			let day = 1000*60*60*24;
			let month = day*30;
			
			
			
			totalAnu[0].innerText = parseInt(interval/month);
// 			if(parseInt(totalAnu[0].innerText - useAnu[0].innerText) < 0){
// 				leaveAnu[0].innerText = 0;
// 			}else if(leaveAnu[0].nextElementSibling.classList.contains('y')){
// 				leaveAnu[0].innerText = parseInt(totalAnu[0].innerText - useAnu[0].innerText);				
// 			}else{
// 				leaveAnu[0].innerText = totalAnu[0].innerText;
// 			}
			
			for(let i = 1; i < encpn.length; i++){
				empEncpn = new Date(encpn[i].innerText);
				
				interval = curr - empEncpn;
				day = 1000*60*60*24;
				month = day*30;
				//totalAnu[i].innerText = leaveAnu[i-1].innerText;
				
// 				if(parseInt(totalAnu[i].innerText - useAnu[i].innerText) < 0){
// 					leaveAnu[i].innerText = 0;
// 				}else if(leaveAnu[i].nextElementSibling.classList.contains('y')){
// 					leaveAnu[i].innerText = parseInt(totalAnu[i].innerText - useAnu[i].innerText);				
// 				}else{
// 					leaveAnu[i].innerText = totalAnu[i].innerText;
// 				}
			}
		}
		
		function list_go(page,url){
			if(!url) url="empAnnualStatus";
			
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
	</script>
</body>
<%@ include file="/WEB-INF/include/footer.jsp"%>