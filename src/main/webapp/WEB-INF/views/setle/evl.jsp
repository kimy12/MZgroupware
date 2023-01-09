<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<%-- <c:set var="evlList" value="${dataMap.evlList }" /> --%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>


            <div class="container flex">
            
            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>전사평가결과 조회<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                    </div>

                    <div class="members-att">
                        <div class="matt-top">
                            <div class="matt-detail flex al-it-ce ju-sp-ce">
                                <!-- <i class="fa-solid fa-angle-left"></i> -->
                                <h2>
                                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
											<c:out value="${now}" />
                                </h2>
                                <!-- <i class="fa-solid fa-angle-right"></i> -->
                            </div>
                        </div>

                        <h3 class="list-title">조건별 상세검색</h3>
                         <div class="matt-debox">
                            <ul class="flex">
                                <li>
                                    <label>입사일</label>
                                    <div>
                                        <input type="date">
                                            <span> ~ </span>
                                        <input type="date">
                                    </div>
                                </li>
                                <li>
                                    <label>이름</label>
                                    <div>
                                        <input type="text">
                                    </div>
                                </li>
                                <li>
                                    <label>부서명</label>
                                    <div>
                                        <select>
                                            <option>전체</option>
                                            <option>경영지원부</option>
                                            <option>경영지원부</option>
                                            <option>경영지원부</option>
                                        </select>
                                    </div>
                                </li>

                                <li>
                                    <div>
                                       <button>검색</button>
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
                             
                                <table class="adjustment work-flowCore">
                                    <colgroup>
                                      
                                        <col width="10%">
                                        <col width="15%">
                                        <col width="22%">
                                        <col width="11%">
                                        <col width="11%">
                                        <col width="11%">
                                        <col width="12%">
                                        <col width="8%">
                                    </colgroup>

                                    <thead>
                                        <tr>
                                            <th><i class="fa-solid fa-sort"></i>이름</th>
                                            <th>부서명</th>
                                            <th>입사일자</th>
                                            <th>총 워크플로우</th>
                                            <th>업무평가</th>
                                            <th>역량평가</th>
                                            <th>평가진행 워크플로우</th>
                                            <th>총점</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<c:forEach items="${evlListAll }" var="evl">
                                        <tr>
                                            <td>${evl.ncnm }</td>
                                            <td>${evl.dept }</td>
                                            <td><fmt:formatDate value="${evl.encpn }" pattern="yyyy-MM-dd"/></td>
                                            <td>${evl.setle_cnt }</td>
                                            <td>${evl.work } / 5.0</td>
                                            <td>${evl.ability } / 5.0</td>
                                            <td>${evl.evl_ing }</td>
                                            <td>${evl.average }</td>
                                        </tr>
										</c:forEach>
                                    </tbody>
                                </table>

                            </div>


                        </div>
                        

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
       <form id="jobForm">
		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
		<input type="hidden" name="page">
	</form>
	<script>
	function list_go(page,url){
		if(!url) url="result";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);

	
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
</script>
        <%@ include file="/WEB-INF/include/footer.jsp" %>