<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
       <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>

            <div class="container flex">
               

            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1 onclick="location.href='<%=request.getContextPath() %>/freeboard/list';" style="cursor:pointer;">자유게시판<span>메인 <i class="fa-solid fa-angle-right"></i>게시판목록</span></h1>
                <div class="sear-box flex">
                        <div class="work-state">
                            <div class="select-tog flex ju-sp-bt al-it-ce">
                            <span id="nowSearchType">
                                <c:choose>
 									<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when> 
									<c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>
									<c:when test="${pageMaker.cri.searchType eq 't'}">제목</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'w'}">작성자</c:when>
								</c:choose>
								</span><i class="fa-solid fa-caret-down"></i>
								</div>
                               <ul class="tog-b" style="display: none;">
								<li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li>
								<li onclick="searchTypeChange(this);"><input type="hidden" value="t" >제목</li>
								<li onclick="searchTypeChange(this);"><input type="hidden" value="c" >내용</li>
								<li onclick="searchTypeChange(this);"><input type="hidden" value="w" >작성자</li>
							</ul>
								
                        </div>
                            
                        <input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
                    </div>
                </div>

                

                    <div class="notice-list">
                       
                        <div class="notice-table">
                            <div class="caption n-caption flex ju-sp-bt">

                                <div class="flex al-it-ce">
                                    <div class="num-view ">
                                        <div class="num-tog tog01 flex ju-sp-bt al-it-ce">
                                            <span id="perPageView">정렬개수</span>
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
									</ul>   </div>

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

                              
                               <button class="regist" onclick="location.href='<%=request.getContextPath() %>/freeboard/registform/${btno}';"><i class="fa-solid fa-pen"></i> 작성하기</button>
                            </div>
                          
                            <table>
                                 <colgroup>
                                    <col width="5%">
                                    <col width="7%">
                                    <col width="8%">
                                    <col width="39%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="7%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td></td>
                                        <td class="txt-c">
                                            <!--<span>no</span>-->
                                            <span>
                                               <span>no</span>
                                            </span>
                                        </td>
                                        
                                       <td class="txt-c">구분</td> 
                                        <td>제목</td>
                                        <td class="txt-c">작성자</td>
                                       
                                        <td class="txt-c">작성일</td>
                                        <td class="txt-c">댓글수</td>
                                        <td class="txt-c">조회수</td>
                                        <td class="txt-c">좋아요</td>
                                    </tr>
                                </thead>

                                <tbody>
                                   <c:if test="${empty boardList}">
                                      <tr>
		                                 <td colspan="9" style="text-align: center">
		                                    게시글이 존재하지 않습니다
		                                 </td>
                              		</tr>
                                   </c:if>
                                  <c:if test="${not empty boardList}">
                                                                     
                               <c:forEach items="${boardList }" var="fboard" varStatus="status">
                               
                               				<fmt:parseNumber value="${fboard.board_rgdt.time / (1000*60*60*24)}" integerOnly="true" var="sdate" scope="request" />
											<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="tdate"  scope="request"/>
											
											
												
                                    <tr onclick="location.href='<%=request.getContextPath()%>/freeboard/detail?board_no=${ fboard.board_no}&boardtype_no=${ fboard.boardtype_no}&from=list'" >
                                        <td id="newCheck">	<c:if test="${tdate-sdate lt 1}"><img src="<%=request.getContextPath() %>/resources/images/new.png"></c:if></td>
                                         <td class="txt-c">
                                            <span>${pageMaker.totalCount - ((pageMaker.cri.page-1) * pageMaker.cri.perPageNum + status.index) }</span>
                                       <!-- <span>
                                                <input type="checkbox">
                                            </span>-->
                                        </td>
                                        <td class="txt-c">${fboard.board_head }</td>
                                        <td class="t-title">
                                        	<div style="display: flex;">
                                        			
                                        	
	                                            <div>${fboard.board_title }</div>
	                                            <c:if test="${fboard.board_like >=10}">
	                                           		 <img src="<%=request.getContextPath() %>/resources/images/like.png" class="freeB">
	                                            </c:if>
  												<c:if test="${fboard.board_cnt >= 30}">
			                                         <img src="<%=request.getContextPath() %>/resources/images/crown.png" class="freeB">
  												</c:if>

                                            </div>
                                         </td>
                                        <td class="txt-c">	
                                        	<div class="flex al-it-ce" >
                                        		${fboard.boardncnm }
                                       	 	</div>
                                        </td>
                                       
                                        <td id="registDate"><fmt:formatDate value="${fboard.board_rgdt }" pattern="yyyy-MM-dd"/></td>
                                        <td class="txt-c">${fboard.breply_count }</td>
                                        <td class="txt-c">${fboard.board_cnt }</td>
                                        
                                        <td class="txt-c">${fboard.board_like }</td>
                                    </tr>

                                 </c:forEach>
                                 </c:if>
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
							</a> --%> 
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
		<c:if test="${from eq 'remove' }">
       		<script>
	      		Swal.fire({
			 	title: "삭제되었습니다.",
	               icon: 'success',
	               confirmButtonColor: '#3085d6',
	               confirmButtonText: '확인'
	           }).then((result) => {
	               if (result.isConfirmed) {
			        window.location.reload()													                       
	               }
	           })	
       		</script>	
    </c:if>
    
	<c:if test="${from eq 'regist' }">
       		<script>
		       	Swal.fire({
				 	title: "등록되었습니다.",
	                icon: 'success',
	                confirmButtonColor: '#3085d6',
	                confirmButtonText: '확인'
	            }).then((result) => {
	                if (result.isConfirmed) {
				        window.location.reload()													                       
	                }
	            })	
       		</script>	
    </c:if>
	
	
	
	<script>
	
	
	
	function list_go(page,url){
		if(!url) url="list";
		
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
       
       
       function formatDate(curDate) {
    	    var today, resultDate;
    	    today = new Date();
    	    resultDate = new Date(curDate);
    	        
    	    // Time (minutes * seconds * millisecond)
    	    if ((today - resultDate)/(60*60*1000) <= 24) {
    	          // 하루 이전 글인 경우 여기에 코드 작성
    	    }
    	    else {
    	          // 하루 이후 글인 경우 여기에 코드 작성
    	    }
    	}
       </script>
</body>
</html>