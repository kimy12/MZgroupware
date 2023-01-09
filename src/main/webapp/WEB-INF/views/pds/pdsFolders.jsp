<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<%-- <c:set var="pdsPublicList" value="${dataMap.pdsPublicList }" /> --%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    <div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal13">
        	<div class="att-modal">
                <h3>폴더수정</h3>

               <table>	
               		
       	          <tbody>
                        <tr>
                            <td class="flex">
                                <label>폴더명</label>
                                <div>
                                    <input type="text" name="name" id="name" autocomplete="off">
                                    <input type="hidden" name="unityNo" id="unityNo">
                                </div>
                            </td>
                        </tr>


                       

                        <tr>
                            <td class="flex">
                                <label>수정일</label>
                                <div>
                                    <!-- <input type="date" name="encpn" id="encpn" placeholder="ex) 20220408"> -->
                                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
											<c:out value="${now}" />
                                </div>
                            </td>
                        </tr>
                        <tr id="modifyModal">
                        
                        </tr>
                    </tbody>
                </table>


            </div>
            
            <div class="modal-btn flex ju-sp-ce">
                <button id="close" class="close-core">취소</button>
                <button type="button" class="regist modifyNow">수정</button>
            </div>
            
         </div>


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>전사자료실 폴더<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce">
	                                <span id="nowSearchType">선택
										<c:choose>
											<%-- <c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when> --%> 
											<%-- <c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>  --%>
											<c:when test="${pageMaker.cri.searchType eq 's'}">제목</c:when>
											<%-- <c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when> --%>
										</c:choose>
									</span>
	                                <i class="fa-solid fa-caret-down"></i>
                                </div>
                                <ul class="tog-b" style="display: none;">
									<!-- <li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li> -->
									<li onclick="searchTypeChange(this);"><input type="hidden" value="s" >제목</li>
									<!-- <li onclick="searchTypeChange(this);"><input type="hidden" value="c" >내용</li> -->
								</ul>
                            </div>
                                
                            <input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
                        </div>
                    </div>

                    <div class="archive">
                        <div class="arch-info">
                            <div class="caption n-caption flex ju-sp-bt">

                                <div class="flex al-it-ce">
                                    <div class="num-view ">
                                        <div class="num-tog tog01 flex ju-sp-bt al-it-ce">
                                            <span id="perPageView">정렬구분</span>
                                            <i class="fa-solid fa-angle-down"></i>
                                        </div>

                                        <ul class="num-b nb01" style="display: none;" id="perPageList">
												<li onclick="changePerPage(this);">3개씩<input
													type="hidden" value="3"></li>
												<li onclick="changePerPage(this);">7개씩<input
													type="hidden" value="7"></li>
												<li onclick="changePerPage(this);">11개씩<input
													type="hidden" value="11"></li>
												<!-- <li onclick="changePerPage(this);">20개씩<input
													type="hidden" value="20"></li> -->
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

                              
                               <button class="close-core" id="removeB"><i class="fa-solid fa-circle-minus"></i>삭제하기</button>
                            </div>
                        </div>

                        <ul class="fol-list flex flex-wrap">
                            <li class="add-fol">
                                <img src="<%=request.getContextPath() %>/resources/images/addF.png">
                                <button type="button" onclick="submit_go('registForm');"><i class="fa-solid fa-folder-open"></i>폴더 및 자료생성</button>
                            </li>
                            
							 <c:forEach items="${pdsPublicList }" var="pdsE">
                            <li class="folderList">
                                <div class="remove-check">
                                	<input type="hidden" name="folderCreator" value="${pdsE.e_writer }">
                                	  <c:if test="${loginEmp.ncnm eq pdsE.e_writer }">
                                    	<input name="checkNo" value="${pdsE.e_unityatchmnflno}" type="checkbox">                                	
                                	</c:if>
                                </div>
                                <img src="<%=request.getContextPath() %>/resources/images/aca.png" onclick="list_goo('pdsPublicList','${pdsE.e_unityatchmnflno}','${pdsE.e_title}','${pdsE.e_writer}');">
                                <div class="arch-name">
                                    <span>${pdsE.e_title }
                                    	<input type="hidden" class="e_writer" value="${pdsE.e_writer}">
                                    	<input type="text" name="e_title" class="e_title toDisplay" autocomplete="off" style="display:none"/> 
                                    	<input type="hidden" class="e_unityatchmnflno" value="${pdsE.e_unityatchmnflno}">
	                                    <c:if test="${loginEmp.ncnm eq pdsE.e_writer }">
	                                    <i class="fa-solid fa-pen modify_go"></i>
	                                    </c:if>
                                    </span>
                                </div>
                                <div class="fol-date" onclick="list_goo('pdsPublicList','${pdsE.e_unityatchmnflno}','${pdsE.e_title}','${pdsE.e_writer}');">
                                    <em>생성일</em> <fmt:formatDate value="${pdsE.e_regdate }" pattern="yyyy-MM-dd"/>
                                </div>
                            </li>
                            </c:forEach>

                        </ul>

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
		<%-- <input type="hidden" name="m_unityatchmnflno" value="${m_unityatchmnflno }"> --%>
		<%-- <input type="hidden" name="m_title" value="${m_title }">  --%>
		<input type="hidden" name="page">
	</form>
	
<script>
		function list_go(page,url){
			if(!url) url="pdsFolders";
			
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

<script>

const removeCodeUpdate = document.querySelector('#removeB');

let e_unityatchmnflno = [];

removeCodeUpdate.addEventListener('click', function(e){
const folder_length = document.getElementsByName("checkNo").length;
	
	for(let i=0; i<folder_length; i++){
		
		if(document.getElementsByName("checkNo")[i].checked == true){
			e_unityatchmnflno.push(document.getElementsByName("checkNo")[i].value);
		}
	}
			if(e_unityatchmnflno.length == 0){
				alert("삭제할 폴더를 선택하세요");
			}
			else{
				
				$.ajax({
					url : '<%=request.getContextPath()%>/pds/countFilesForE',
					type : 'post',
					data : JSON.stringify(e_unityatchmnflno),
					contentType : 'application/json',
					success : function(result){
						for(let i = 0; i < result.length; i++){
							if(result[i] > 1){
								Swal.fire({
				                    icon: 'error',
				                    title: '삭제 불가한 폴더가 존재합니다.',
				                    text: '파일을 먼저 삭제하세요.',
				                });
								e_unityatchmnflno = [];
								return;
							}
						}
						deleteFolder(e_unityatchmnflno);
					},
					error : function(error){
						alert('실패되었습니다');
					}
				});
			} 
	});

function deleteFolder(e_unityatchmnflno){
		$.ajax({
			url : '<%=request.getContextPath()%>/pds/deleteFolderForE', 
			type : 'post', 
			data : JSON.stringify(e_unityatchmnflno), 
			contentType : 'application/json', 
			success : function(result){ 
				if(result == 'success'){ 
					//alert('삭제하였습니다.'); 
					Swal.fire({
	                    icon: 'success',
	                    title: '삭제되었습니다.',
	                }).then((result)=>{
	                       window.location.reload();
	                   })
				} 
			}, 
			error : function(error){ 
				alert('실패되었습니다'); 
			} 
		}); 
	}

const modifyNow = document.querySelector('.modifyNow');

modifyNow.addEventListener('click', function(){
	const unityNo = document.querySelector('#unityNo');
	const name = document.querySelector('#name');
	const data = {
		e_title : name.value,
		e_unityatchmnflno : unityNo.value
	}
	
 		$.ajax({
 			url : '<%=request.getContextPath()%>/pds/modifyFolderNameForE', 
 			type : 'post', 
 			data : JSON.stringify(data), 
 			contentType : 'application/json', 
 			success : function(result){ 
 				if(result == 'success'){ 
 					Swal.fire({
 	                    icon: 'success',
 	                    title: '수정되었습니다.',
 	                }).then((result)=>{
 	                       window.location.reload();
 	                   }) 
 				} 
 			}, 
 			error : function(error){ 
 				alert('실패되었습니다'); 
 			} 
 		});  
});
	

	const unityatchmnflno = document.querySelectorAll('.e_unityatchmnflno');
	const pen = document.querySelectorAll('.fa-pen');
	const name = document.querySelector('#name');
	const unityNo = document.querySelector('#unityNo');
	const modifyModal = document.querySelector("#modifyModal");
	
	for(let i = 0; i<unityatchmnflno.length; i++){
 		pen[i].addEventListener('click', function(e){
 		
	 	javascript:openModal('modal13');
 		
 		let writerName = e.target.parentNode.innerText;
 		name.setAttribute("value",writerName);
 		unityNo.setAttribute("value",$(this).prev().val());
 		
		});
}

	
	
function submit_go(url,unityatchmnflno){	
	location.href=url;
}

function list_goo(url,e_unityatchmnflno,e_title,e_writer){	
	location.href=url+"?e_unityatchmnflno="+e_unityatchmnflno+"&e_title="+e_title+"&e_writer="+e_writer;
}
function modify_go(url,e_unityatchmnflno){	
	location.href=url+"?e_unityatchmnflno="+e_unityatchmnflno;
}
</script>

  <%@ include file="/WEB-INF/include/footer.jsp" %>