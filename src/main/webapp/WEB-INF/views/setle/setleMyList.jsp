<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<body>
	
	<div class="wrap">

		<div class="top-bar flex ju-sp-bt al-it-ce">
			<%@ include file="/WEB-INF/include/topbar.jsp"%>
		</div>

		<div class="container flex">


			<div class="content">
				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<h1>
						<a href="<%=request.getContextPath()%>/setle/setleMyList?perPageNum=5">나의 문서 보관함</a> <span>워크플로우 <i class="fa-solid fa-angle-right"></i> 
							나의 문서 보관함
						</span>
					</h1>
					<div class="sear-box flex">
						<div class="work-state">
							<div class="select-tog flex ju-sp-bt al-it-ce">
								<span id="nowSearchType">
								<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>
									<c:when test="${pageMaker.cri.searchType eq 's'}">제목</c:when>
									<c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when>
								</c:choose>
								
								
								
								</span><i
									class="fa-solid fa-caret-down"></i>
							</div>
							<ul class="tog-b" style="display: none;">
								<li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li>
								<li onclick="searchTypeChange(this);"><input type="hidden" value="s" >제목</li>
								<li onclick="searchTypeChange(this);"><input type="hidden" value="c" >내용</li>
							</ul>
						</div>

						<input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
					</div>
				</div>
		<c:if test="${totaDocCount ne 0 }">		
				<div class="setle-gh flex ju-sp-bt mb-30">
					<div class="sgh sgh1 <c:if test="${sttusNo eq 0 }">on</c:if> flex al-it-ce" onclick="changeSttusNo(0);list_go(1)">
						<div class="pie animate" style="--p:${lateDocCount*100 /totaDocCount };--c:rgb(133 201 245 / 100%)"> 
							<span>${lateDocCount*100 /totaDocCount }%</span>
						</div>
						
						<div class="pieText">
							<h3>대기 문서</h3>
							
							<div class="flex ju-sp-bt">
								<div>
									<span>대기</span>
									<p class="gnum">${lateDocCount }건</p>
								</div>
								
								<div>
									<span>전체</span>
									<p class="allnum">${totaDocCount }건</p>
								</div>
							</div>
						</div>
					</div>

					<div class="sgh sgh2 <c:if test="${sttusNo eq 1 }">on</c:if> flex al-it-ce" onclick="changeSttusNo(1);list_go(1)">
						<div class="pie animate" style="--p:${procDocCount*100 /totaDocCount };--c:rgb(107 226 228 / 100%)"> 
							<span>${procDocCount*100 /totaDocCount }%</span>
						</div>
						
						<div class="pieText">
							<h3>진행 문서</h3>
							
							<div class="flex ju-sp-bt">
								<div>
									<span>진행</span>
									<p class="gnum">${procDocCount }건</p>
								</div>
								
								<div>
									<span>전체</span>
									<p class="allnum">${totaDocCount }건</p>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="sgh sgh3 <c:if test="${sttusNo eq 2 }">on</c:if> flex al-it-ce" onclick="changeSttusNo(2);list_go(1)">
						<div class="pie animate" style="--p:${cancDocCount*100 /totaDocCount };--c:rgb(231 135 84 / 100%)"> 
							<span>${cancDocCount*100 /totaDocCount }%</span>
						</div>
						
						<div class="pieText">
							<h3>반려 문서</h3>
							
							<div class="flex ju-sp-bt">
								<div>
									<span>대기</span>
									<p class="gnum">${cancDocCount }건</p>
								</div>
								
								<div>
									<span>전체</span>
									<p class="allnum">${totaDocCount }건</p>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="sgh sgh4 <c:if test="${sttusNo eq 3 }">on</c:if> flex al-it-ce" onclick="changeSttusNo(3);list_go(1)">
						<div class="pie animate" style="--p:${compDocCount*100 /totaDocCount };--c:rgb(101 214 182 / 100%)"> 
							<span>${compDocCount*100 /totaDocCount }%</span>
						</div>
						
						<div class="pieText">
							<h3>완료 문서</h3>
							
							<div class="flex ju-sp-bt">
								<div>
									<span>대기</span>
									<p class="gnum">${compDocCount }건</p>
								</div>
								
								<div>
									<span>전체</span>
									<p class="allnum">${totaDocCount }건</p>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</div>
</c:if>				
				
				<div>
                        <div class="add-sear" style="display: inline-block;">
                        <ul class="flex">
                                <li id="approvalbtn"><i class="fa-solid fa-file-circle-plus"></i>결재신청</li>
                                <!-- <li><i class="fa-solid fa-envelope-open-text"></i>메일발송</li> -->
                                <li id="removeB"><i class="fa-solid fa-trash-can"></i>삭제</li>
                               </ul>
                        </div>
                </div>
				<div class="report-list">

					<div class="list-table">
						<div class="caption flex ju-sp-bt">

							<div class="flex al-it-ce">
								<div class="num-view ">
									<div class="num-tog tog01 flex ju-sp-bt al-it-ce">
										<span id="perPageView">정렬구분</span> <i
											class="fa-solid fa-angle-down"></i>

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
                                 <col width="25%">
                                 <col width="10%">
                                 <col width="10%">
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
										<td onclick="evcut(event);"><input type="checkbox" class="chk" name="chk" value="${setle.setleNo }"><input hidden="hidden" name="setleSttus" value="${setle.sttusNo }"></td>
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
							<%-- </a> <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
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
		<input type="hidden" name="sttusNo" value="${sttusNo }">
	</form>
	<script>
	function list_go(page,url){
		if(!url) url="setleMyList";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);

		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
	
	function changeSttusNo(v){
		$('input[name="sttusNo"]').val(v);
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
const processCodeUpdate = document.querySelector('#approvalbtn');
const removeCodeUpdate = document.querySelector('#removeB');
var isArrayForAtch = [];

processCodeUpdate.addEventListener('click', function(e){
	
	receCkArr = new Array();
	
	for(var i = 0; i < checkArr; i++){
		let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");

		if(ch == true){
			if($("input:checkbox[name='chk']").eq(i).next().val() != 0 && $("input:checkbox[name='chk']").eq(i).next().val() != 2){
				alert("이미 결재 진행 중이거나 완료된 결재가 있습니다.");
				isArrayForAtch = new Array();
				return;
			}
			const data =  $("input:checkbox[name='chk']").eq(i).val()
		
			isArrayForAtch.push(data);
		}
	}
	console.log(isArrayForAtch);
	if(isArrayForAtch.length == 0){
		alert("결재신청할 결재을 선택하세요");
	}
	else{
		$.ajax({
			url : '<%=request.getContextPath()%>/setle/sendProcess',
			type : 'post',
			data : {setleNoList : isArrayForAtch},
			success : function(result){
				if(result == 'success'){
					
					socket.send("pushCheck");
					Swal.fire({
						icon:'success',
						title:'결재신청 되었습니다.',
					}).then((result)=>{
						sendPush();
	                       window.location.reload();
	                        })
				}
			},
			error : function(error){
				alert('결재신청이 실패되었습니다');
			}
		});
		isArrayForAtch = new Array();
	}  
});

removeCodeUpdate.addEventListener('click', function(e){
	
	receCkArr = new Array();
	
	for(var i = 0; i < checkArr; i++){
		let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");

		if(ch == true){
			if($("input:checkbox[name='chk']").eq(i).next().val() != 0){
				alert("대기 상태의 결재만 삭제 가능합니다.");
				isArrayForAtch = new Array();
				return;
			}
			const data =  $("input:checkbox[name='chk']").eq(i).val()
		
			isArrayForAtch.push(data);
		}
	}
// 	console.log(isArrayForAtch);
	if(isArrayForAtch.length == 0){
		alert("삭제할 결재를 선택하세요");
	}
	else{
		$.ajax({
			url : '<%=request.getContextPath()%>/setle/sendTrash',
			type : 'post',
			data : {setleNoList : isArrayForAtch},
			success : function(result){
				if(result == 'success'){
					Swal.fire({
						icon:'success',
						title:'휴지통으로 이동하였습니다.',
					}).then((result)=>{
							
	                       	window.location.reload();
	                        })
				}
			},
			error : function(error){
				alert('휴지통 이동이 실패되었습니다');
			}
		});
		isArrayForAtch = new Array();
	}  
});

</script>

<script>
	$(window).ready(function(){
		  draw(80, '.pie-chart1', '#c2e59c, #0C8B72');
		  draw(55, '.pie-chart2', '#8b22ff');
		  draw(30, '.pie-chart3','#ff0');
	      draw(20, '.pie-chart4','red');
	});

	function draw(max, classname, colorname){
	   var i=1;
	    var func1 = setInterval(function(){
	      if(i<max){
	          color1(i,classname,colorname);
	          i++;
	      } else{
	        clearInterval(func1);
	      }
	    },10);
	}
	
	function color1(i, classname,colorname){
	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% "+i+"%, #F3F5F6 "+i+"% 100%)"
	   });
	}

</script>
<%@ include file="/WEB-INF/include/footer.jsp" %>