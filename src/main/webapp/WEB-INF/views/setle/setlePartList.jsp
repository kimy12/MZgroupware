<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<body>
       <div class="wrap">
        <div class="top-bar flex ju-sp-bt al-it-ce">
            <%@ include file="/WEB-INF/include/topbar.jsp" %>
        </div>
    

            <div class="container flex">
             

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1><a href="<%=request.getContextPath()%>/setle/setlePartList">나의 부서 보관함</a> <span>워크플로우 <i class="fa-solid fa-angle-right"></i> 나의 부서 보관함</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce"><span id="nowSearchType">	
                                <c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>
									<c:when test="${pageMaker.cri.searchType eq 's'}">제목</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when>
								</c:choose>
								</span><i class="fa-solid fa-caret-down"></i></div>
                                <ul class="tog-b" style="display: none;">
                                    <li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li>
                                    <li onclick="searchTypeChange(this);"><input type="hidden" value="s" >제목</li>
                                    <li onclick="searchTypeChange(this);"><input type="hidden" value="c" >내용</li>
                                    <li onclick="searchTypeChange(this);">작성자</li>
                                </ul>
                            </div>
                                
                            <input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
                        </div>
                    </div>

                    <div class="report-list">

                        <div class="list-table">
                            <div class="caption flex ju-sp-bt">

                                <div class="flex al-it-ce">
                                    <div class="num-view ">
                                        <div class="num-tog tog01 flex ju-sp-bt al-it-ce">
                                            <span id="perPageView">정렬구분</span>
                                            <i class="fa-solid fa-angle-down"></i>
                                        </div>

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
                                    </div>

                                    <div class="list-select">
	                                     <c:if test="${nowSort eq 'desc'}">
											<img
												src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
												id="sort-Desc-Off" onclick="sortChange(this);" hidden="hidden">
											<img
												src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
												id="sort-Desc-On"> <img
												src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
												id="sort-Asc-Off" onclick="sortChange(this);"> <img
												src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
												id="sort-Asc-On" hidden="hidden">
											</c:if>
											<c:if test="${nowSort eq 'asc'}">
											<img
												src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
												id="sort-Desc-Off" onclick="sortChange(this);">
											<img
												src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
												id="sort-Desc-On"  hidden="hidden"> <img
												src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
												id="sort-Asc-Off" onclick="sortChange(this);" hidden="hidden"> <img
												src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
												id="sort-Asc-On" >
										</c:if>
                                    </div>
                                </div>

                              
                               <button class="regist"
								onclick='location.href="<%=request.getContextPath()%>/setle/setleWrite"'>
								<i class="fa-solid fa-pen"></i> 작성하기
							</button>
                            </div>

                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="7%">
                                    <col width="24%">
                                    <col width="10%">
                                    <col width="12%">
                                    <col width="25%">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="allCk" id="checkAll"></th>
                                        <th>No</th>
                                        <th>합의기한</th>
                                        <th>합의상태</th>
                                        <th>합의종류</th>
                                        <th>제목</th>
                                        <th>합의요청자</th>
                                        <th>합의담당자</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="setle" items="${setleList}" varStatus="status">
									<tr onclick='location.href="<%=request.getContextPath()%>/setle/setleDetail?setleNo=${setle.setleNo }"'>
										<td onclick="evcut(event);"><input type="checkbox" class="chk" name="chk" value="${setle.setleNo }"></td>
										<td>${pageMaker.totalCount - ((pageMaker.cri.page-1) * pageMaker.cri.perPageNum + status.index) }</td>
										<td>
											<div class="flex al-it-ce">
											<fmt:formatDate value="${setle.agrStartDate }"
													pattern="yyyy.MM.dd" /> ~ 
											<fmt:formatDate value="${setle.agrEndDate }" pattern="yyyy.MM.dd" />
											
											<fmt:parseNumber value="${setle.agrStartDate.time / (1000*60*60*24)}" integerOnly="true" var="sdate" scope="request" />
											<fmt:parseNumber value="${setle.agrEndDate.time / (1000*60*60*24)}" integerOnly="true" var="edate" scope="request" />
											<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="tdate"  scope="request"/>
											
												<c:if test="${tdate-sdate gt 0}">
												<c:choose>
													<c:when test="${(edate-tdate+1) gt 0}"><div class="deadlineTime"><span>D-${edate-tdate+1 }일</span></div></c:when>
													<c:when test="${(edate-tdate+1) eq 0}"><div class="deadlineTime"><span>D-Day</span></div></c:when>
													<c:when test="${(edate-tdate+1) lt 0}"><div class="deadlineTime"><span>마감</span></div></c:when>
												</c:choose>
												</c:if>
											</div>
										</td>
										<td><c:choose>
												<c:when test="${setle.sttusNo eq 0 }">
													<span class="y">대기</span>
												</c:when>
												<c:when test="${setle.sttusNo eq 1 }">
													<span class="g">진행</span>
												</c:when>
												<c:when test="${setle.sttusNo eq 2 }">
													<span class="p">반려</span>
												</c:when>
												<c:when test="${setle.sttusNo eq 3 }">
													<span class="b">완료</span>
												</c:when>
											</c:choose></td>
										<td class="o-title"><div><c:forEach var="form" items="${formList}"><c:if test="${form.setleFormNo eq setle.setleFormNo}">${form.formCn }</c:if></c:forEach></div></td>
										<td class="t-title">
											<div>${setle.setleSj}</div>
										</td>
										<td class="o-title"><div>
												<c:forEach var="setleEmp" items="${setle.setleEmpList }"
													varStatus="index">
													<c:if test='${not index.first}'>, </c:if>${setleEmp.empNm }</c:forEach>
											</div></td>
										<td>${setle.lastSetleEmpVO.name }</td>
									</tr>
								</c:forEach>
                                </tbody>
                            </table>

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
		if(!url) url="setlePartList";
		
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
</script>
<script type="text/javascript">
var checkBox = document.getElementById("checkAll");
const checkMark = document.getElementsByName("chk");
var checkArr = checkMark.length;

var receCkArr = new Array();

$(checkBox).click(function (){
	if($("input:checkbox[name='allCk']").is(":checked") == true){
		
		$("input:checkbox[name='chk']").prop("checked", true);
		
		for(var i = 0; i < checkArr; i++){
			receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
			//console.log(receCkArr);
		}
	}else{
		$("input:checkbox[name='chk']").prop("checked", false);
		
		for(var i = 0; i < checkArr; i++){
			receCkArr.splice(0, checkArr);
			//console.log(receCkArr);
		}
	}
});

function evcut(event){
	if (event.stopPropagation) event.stopPropagation();
	else event.cancelBubble = true; // IE 대응
}

</script>
</body>
</html>