<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<script>
</script>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="dclzMediationList" value="${dataMap.dclzMediationList }" />


<body>
    <div id="modal" class="modal-wrap"></div>
            <div class="modal-con modal6">
                <div class="att-modal">
                    <h3>근무 조정</h3>
					
					<input type="hidden" id="modimedno" value=""/>
					<input type="hidden" id="moddclzsn" value=""/>
                    <table>

                        <tbody>
                            <tr>
                                <td class="flex">
                                    <label>변경 요청자</label>
                                    <div id="reqEmp"></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>부서</label>
                                    <div id="reqDept"></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경 요청 일자</label>
                                    <div>
                                       <p id="reqDate"></p>
                                       
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경 요청전 시간</label>
                                    <div class="ori">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경 요청 시간</label>

                                    <div>
                                       <p id="reqTime"></p>
                                       <div class="flex ju-sp-bt">
                                            <input type="time" id="reqBegin">
                                            <span>~</span>
                                            <input type="time" id="reqEnd">
                                       </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경 사유 <em style="color:red">*</em></label>
                                    <div id="reqReason">
                                       
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-btn flex ju-sp-ce">
                    <button id="close" class="close-core">취소</button>
                    <button class="regist" id="change">승인</button>
                </div>
        </div>
        
        
       <div class="modal-con modal67">
           <div class="att-modal">
               <h3>반려</h3>
	           <input type="hidden" id="refmedno" value=""/>
               <table>
                   <tbody>
                   	   <tr>
	                       <td class="flex">
	                           <label>변경 요청자</label>
	                           <div id="refName"></div>
	                       </td>
                       </tr>
                       <tr>
	                       <td class="flex">
	                           <label>부서</label>
	                           <div id="refDept"></div>
	                       </td>
                       </tr>
                       <tr>
                           <td class="flex">
                               <label>반려 사유</label>
                               <div>
	                               <textarea id="refReason" style="width: 100%; height: 50px; resize: none; border: 1px solid #ddd; border-radius: 3px;">
	                               </textarea>
                               </div>
                           </td>
                       </tr> 
                   </tbody>
               </table>
           </div>
           <div class="modal-btn flex ju-sp-ce">
               <button id="close" class="close-core">취소</button>
               <button class="regist" id="refer">반려</button>
           </div>
        </div>

   <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>근태조정신청현황<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
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
                                   <label>상태</label>
                                   <div>
                                       <select name="dclzStatus" id="dclzStatus" onchange="list_go(1);">
                                           <option value="" ${cri.dclzStatus eq '' ? 'selected':''}>모두</option>
                                           <option value="y"  ${cri.dclzStatus eq 'y' ? 'selected':''}>승인완료</option>
                                           <option value="x"  ${cri.dclzStatus eq 'x' ? 'selected':''}>반려완료</option>
                                           
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
                                   <div>
                                      <button onclick="list_go(1);"><i class="fa fa-fw fa-search"></i></button>
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
                             
                                <table class="adjustment">
                                    <colgroup>
                                        <col width="8%">
                                        <col width="8%">
                                        <col width="8%">
                                        <col width="12%">
                                        <col width="12%">
                                        <col width="36%">
                                        <col width="8%">
                                        <col width="8%">
                                    </colgroup>

                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>부서명</th>
                                            <th>요청일자</th>
                                            <th>변경 요청전 시간</th>
                                            <th>변경 요청 시간</th>
                                            <th>변경사유</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<c:if test="${empty dclzMediationList }">
                                    		<tr>
												<td colspan="7">
													데이터가 존재하지 않습니다
												</td>
											</tr>
                                    	</c:if>
                                    	<c:if test="${not empty dclzMediationList }">
                                    		<c:forEach items="${dclzMediationList }" var="mediation">
                                    			<c:set var="medPrevDate" value="${mediation.prevdate }" />
		                                        <input type="hidden" class="dclzsn" value="${mediation.dclzsn }"/>
		                                        <input type="hidden" class="medno" value="${mediation.medno }"/>
		                                        <tr class="dateArea">
		                                            <td class="nm">${mediation.name }</td>
		                                            <td class="dt">${mediation.dept }</td>
		                                            <td class="mpd">${fn:substring(medPrevDate,0,10) }</td>
		                                            <td class="pvt">${mediation.prevbegintime } ~ ${mediation.prevendtime }</td>
		                                            <td class="rbt">${mediation.reqbegintime } ~ ${mediation.reqendtime }</td>
		                                            <td class="mr">${mediation.medreason }</td>
		                                            <c:if test="${mediation.progresscode eq 'n'}">
			                                            <td>
			                                                <a href="void(0);" onclick="openDclzModify(this); return false;">승인</a>
			                                            </td>
			                                            <td>
			                                                <a href="void(0);" onclick="openDclzRefer(this); return false;" style="background:#ef6353; color:#fff">반려</a>
			                                            </td>		 		                                            
		                                            </c:if>
		                                            <c:if test="${mediation.progresscode eq 'y'}">
		                                            	<td colspan="2" style="text-align:center">
															<strong>승인완료</strong>
														</td>
		                                            </c:if>
		                                            <c:if test="${mediation.progresscode eq 'x'}">
		                                            	<td colspan="2" style="text-align:center">
															<strong>반려완료</strong>
														</td>
		                                            </c:if>
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
				   
				
				   
				   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
						<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
					</c:forEach>
					
				 
				   <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');">
						<i class="fas fa-angle-double-right"></i>
				   </a>
				</div>

				<form id="jobForm">	
					<input type='hidden' name="page" value="" />
					<input type='hidden' name="perPageNum" value=""/>
					<input type='hidden' name="searchType" value="" />
					<input type='hidden' name="keyword" value="" />
					<input type='hidden' name="dclzStatus" value="" />
				</form>
				
				
            </div>
       </div>
     </div>
</body>

<script>
	const change = document.querySelector('#change');
	const refer = document.querySelector('#refer');
	
    $(document).ready(function() {
		let current = new Date;
	    let curre = current.toLocaleDateString();
	    let today = curre.slice(0, -1);
       $('#today').text(today);
    });

	function list_go(page,url){
		if(!url) url="mdatReqst";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
		jobForm.find("[name='dclzStatus']").val($('select[name="dclzStatus"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
	
	function openDclzModify(obj){
		$('#reqEmp').text($(obj).parents('tr.dateArea').find('td.nm').text());
		$('#reqDept').text($(obj).parents('tr.dateArea').find('td.dt').text());
		$('#reqDate').text($(obj).parents('tr.dateArea').find('td.mpd').text());
		$('.ori').text($(obj).parents('tr.dateArea').find('td.pvt').text());
		$('#reqTime').text($(obj).parents('tr.dateArea').find('td.rbt').text());
		$('#reqReason').text($(obj).parents('tr.dateArea').find('td.mr').text());
		$('#modimedno').val($(obj).parents('tr.dateArea').prev().val());
		$('#moddclzsn').val($(obj).parents('tr.dateArea').prev().prev().val());
		
		openModal('modal6');
	}
	
	function openDclzRefer(obj){
		$('#refName').text($(obj).parents('tr.dateArea').find('td.nm').text());
		$('#refDept').text($(obj).parents('tr.dateArea').find('td.dt').text());
		$('#refmedno').val($(obj).parents('tr.dateArea').prev().val());
		
		openModal('modal67');
		$('#refReason').focus();
	}
	
	function modifyDclz(){
		const dataObj = {
				medno : $('#modimedno').val(),
				progresscode : 'y',
				reqbegintime : $('#reqBegin').val(),
				reqendtime : $('#reqEnd').val(),
				dclzsn : $('#moddclzsn').val()
		}
		
		$.ajax({
			url: '<%=request.getContextPath()%>/dclzmanager/modifyDclzMed',
			type: 'post',
			data: JSON.stringify(dataObj),
			contentType: 'application/json',
			success: function(response){
				if(response == 'success'){
  					Swal.fire({
					 	title: "변경되었습니다!",
	                    icon: 'success',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인'
	                }).then((result) => {
	                    if (result.isConfirmed) {
					     	window.location.reload();
	                    }
	             	})
  				}
			},
			error: function(xhr){
				alert(xhr.status);
			}
		})
		
	
	}
	
	function referDclz(){
		const dataObj = {
				medno : $('#refmedno').val(),
				progresscode : 'x',
				medreason : $('#refReason').val()
		}
		
		$.ajax({
			url: '<%=request.getContextPath()%>/dclzmanager/removeDclzMed',
			type: 'post',
			data: JSON.stringify(dataObj),
			contentType: 'application/json',
			success: function(response){
				if(response == 'success'){
  					Swal.fire({
					 	title: "반려되었습니다!",
	                    icon: 'success',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인'
	                }).then((result) => {
	                    if (result.isConfirmed) {
					     	window.location.reload();
	                    }
	             	})
  				}
			},
			error: function(xhr){
				alert(xhr.status);
			}
		})
	}
	
	refer.addEventListener('click', referDclz)
	change.addEventListener('click', modifyDclz);
	
</script>

<%@ include file="/WEB-INF/include/footer.jsp" %>