<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:set var="pdsBinList" value="${dataMap.pdsBinList }" />
<c:set var="pdsBinFilesList" value="${dataMap.pdsBinFilesList }" /> --%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>휴지통<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce">
									<span id="nowSearchType">선택
									<c:choose>
										<%-- <c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when> --%>
										<%-- <c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when> --%>
										<c:when test="${pageMaker.cri.searchType eq 's'}">제목</c:when>
										<%-- <c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when> --%>
									</c:choose>
									</span><i
										class="fa-solid fa-caret-down"></i>
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

                    <div>
                        <div class="add-sear" style="display: inline-block;">
                        <ul class="flex">
                                <li id="recover-btn"><i class="fa-solid fa-arrow-rotate-left"></i>복구</li>
                                <li id="del-btn"><i class="fa-solid fa-trash-can"></i>영구삭제</li>
                        </ul>
                        </div>
                    </div>

                    <div class="archive">
                        <div class="file-list">
                            <div class="arch-info">
                                <div class="caption n-caption flex ju-sp-bt">
    
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
                                    
                            </div>
                            </div>

                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="10%">
                                    <col width="53%">
                                    <col width="12%">
                                    <col width="20%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td class="txt-c">
                                        	<input type="checkbox" name="allCk" id="checkAll"/>
                                        </td>
                                       <!--  <td class="txt-c"><i class="fa-solid fa-star on"></i></th> -->
                                        <td class="txt-c"><i class="fa-solid fa-sort"></i>종류</td>
                                        <td><i class="fa-solid fa-sort"></i>파일명</td>
                                        <td><i class="fa-solid fa-sort"></i>크기</td>
                                        <td><i class="fa-solid fa-sort"></i>등록날짜</td>
                                        <!-- <td><i class="fa-solid fa-download"></i></td> -->
                                    </tr>

                                </thead>

                                <tbody>
                                	<c:if test="${empty pdsBinList }" >
                                	<c:if test="${empty pdsBinFilesList }" >
									<tr>
										<td colspan="7" class="notContent">
											파일이 존재하지 않습니다.
										</td>
									</tr>
									</c:if>	
									</c:if>	
									<%-- <c:forEach items="${pdsBinList }" var="bin">
                                    <tr>
                                        <td class="txt-c">
                                        	<input type="checkbox" class="chk" name="chk" value="${bin.m_unityatchmnflno }"/>
                                        </td>
                                        <td class="txt-c"><!-- <i class="fa-solid fa-image"></i><i class="fa-solid fa-file-zipper"></i><i class="fa-solid fa-video"></i> -->폴더</td>
                                        <td class="o-title flex"><div>${bin.m_title }</div><!-- <span class="pre-view">미리보기</span> --></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-</td>
                                        <td><fmt:formatDate value="${bin.m_regdate }" pattern="yyyy-MM-dd"/></td>
                                    </tr>
									 </c:forEach> --%>
									 
									 <c:forEach items="${pdsBinFilesList }" var="bin">
                                    <tr>
                                        <td class="txt-c">
                                        	<input type="checkbox" class="chk" name="chk" value="${bin.ano }"/>
                                        </td>
                                        <td class="txt-c imageSelect"></td>
                                        <td class="o-title flex"><div>${bin.originalname }
                                         <input type="hidden" class="fileType" name="fileType" value="${bin.fileType }">
                                        </div><!-- <span class="pre-view">미리보기</span> --></td>
                                        <td class="fileSize">${bin.filesize }</td>
                                        <td><fmt:formatDate value="${bin.regdate }" pattern="yyyy-MM-dd"/></td>
                                    </tr>
									 </c:forEach>
                                    <!-- <tr>
                                        <td class="txt-c"><input type="checkbox" /></td>
                                        <td class="txt-c"><i class="fa-solid fa-image"></i></td>
                                        <td class="o-title flex"><div>원래 버전!!!</div><span class="pre-view">미리보기</span></td>
                                        <td>2.2MB</td>
                                        <td>2021.01.03 &nbsp;  오후 00:00:00</td>
                                    </tr> -->
						
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
		<input type="hidden" name="m_unityatchmnflno" value="${m_unityatchmnflno }">
		<input type="hidden" name="m_title" value="${m_title }">
		<input type="hidden" name="page">
	</form>

<script>
	function list_go(page,url){
		if(!url) url="pdsPrivateBin";
		
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
const checkMark = document.getElementsByName("chk");
var checkBox = document.getElementById("checkAll");
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

//복구하기
const recoverBtn = document.querySelector('#recover-btn');

let ano = [];

recoverBtn.addEventListener('click', function(e){
	
	receCkArr = new Array();
	
	for(var i = 0; i < checkArr; i++){
		let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
		if(ch == true){
			const data = $("input:checkbox[name='chk']").eq(i).val();
			
			ano.push(data);
		}
	}
	if(ano.length == 0){
		alert("복구할 파일을 선택하세요");
	}
	else{
		$.ajax({
			url : '<%=request.getContextPath()%>/pds/recoverFromBin',
			type : 'post',
			data : JSON.stringify(ano),
			contentType : 'application/json',
			success : function(result){
				if(result == 'success'){
					Swal.fire({
	                    icon: 'success',
	                    title: '복구되었습니다.',
	                }).then((result)=>{
	                       window.location.reload();
                       })
				}
			},
			error : function(error){
				alert('복구가 실패되었습니다');
			}
		});
		ano = new Array();
	}
})


const delBtn = document.querySelector('#del-btn');
delBtn.addEventListener('click', function(e){
	
	
	//alert('클릭');
	 receCkArr = new Array();
	
	for(var i = 0; i < checkArr; i++){
		let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
		if(ch == true){
			const data = $("input:checkbox[name='chk']").eq(i).val();
			
			ano.push(data);			
		}
	}
	if(ano.length == 0){
		alert("삭제할 파일을 선택하세요");
	}else{
		
		Swal.fire({
			title: '영구삭제 하시겠습니까?',
			text: "삭제된 파일은 복구가 불가능합니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			}).then((result)=> {
				if (result.isConfirmed){
	       				$.ajax({
	       					url : '<%=request.getContextPath()%>/pds/deleteFiles',
	       					type : 'post',
	       					data : JSON.stringify(ano),
	       					contentType : 'application/json',
	       					success : function(result){
	       						
	       						if(result == 'success'){
	       						Swal.fire({
	       								icon: 'success',
	       								title: '영구삭제 되었습니다.',
	       						}).then((result)=>{
	       	                       window.location.reload();
	       	                        })
	       						}
	       					},
	       					error : function(error){
	       					Swal.fire({
							  text: "실패하였습니다.",
							  icon: "error",
							  button: "확인",
						});
	       					}
	       					
	       				}); 
				}
			})
	} 
});

/* 파일 사이즈 */
function bytesToSize(bytes) {
	   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
	   if (bytes == 0) return '0 Byte';
	   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
	   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
	};
	
	let emp_nickname = [];

const temp = document.querySelectorAll(".fileSize");
for(let i=0; i<temp.length; i++){
	
	let bytes = temp[i].innerText;

function formatBytes(bytes, decimals = 2) {
    if (bytes === 0) return '0 Bytes';

    const k = 1024;
    const dm = decimals < 0 ? 0 : decimals;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}
    temp[i].innerText = formatBytes(bytes);
    
}

const imageSelect = document.querySelectorAll(".imageSelect");

for(let i=0; i<imageSelect.length; i++){
	const isFiletype = document.querySelectorAll(".fileType");
	const imageI = document.createElement('i');
	const zipperI = document.createElement('i');
	const videoI = document.createElement('i');
	const fileI = document.createElement('i');
	
	imageI.setAttribute("class","fa-solid fa-image");
	zipperI.setAttribute("class","fa-solid fa-file-zipper");
	videoI.setAttribute("class","fa-solid fa-video");
	fileI.setAttribute("class","fa-solid fa-file-lines");
	if(isFiletype[i].value == "JPG" || isFiletype[i].value == "PNG" || isFiletype[i].value == "JFIF"){
		imageSelect[i].append(imageI);
	} else if (isFiletype[i].value == "MP4"){
		imageSelect[i].append(videoI);
	} else if (isFiletype[i].value == "ZIP"){
		imageSelect[i].append(zipperI);
	} else {
		imageSelect[i].append(fileI);
	}
	
}

function submit_go(url,unityatchmnflno){	
	location.href=url+"?unityatchmnflno="+unityatchmnflno;
}
</script>

  <%@ include file="/WEB-INF/include/footer.jsp" %>