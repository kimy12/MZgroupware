<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />


<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    <div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal12">
        	<div class="att-modal">
                <h3>폴더수정</h3>

				<table>
					<tbody>
						<tr>
							 <td>
                            	<div class="attModalFrom flex">
	                                <label>폴더명</label>
	                                <div>
	                                    <input type="text" name="name" id="name" autocomplete="off">
	                                </div>
                                </div>
                            </td>
						</tr>
						
						<tr>
                            <td>
                            	<div class="attModalFrom flex">
	                                <label>수정일</label>
	                                <div>
	                                    <!-- <input type="date" name="encpn" id="encpn" placeholder="ex) 20220408"> -->
	                                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
												<c:out value="${now}" />
	                                </div>
	                            </div>
                            </td>
                        </tr>
                        
                         <tr>
                            <td>
                            	<div class="attModalFrom flex">
	                                <label>부서</label>
	                                <div class="flex ju-sp-bt al-it-ce">
	                                    <select id="depart-selector" style="margin-right:10px">
	                                                    <option>부서</option>
													    <c:forEach items="${departList}" var="depart">
	                                                   	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
	                                                   </c:forEach>
	                                    </select>
	                                    
	                                     <select id="depart-emp-seletor" style="margin-right:10px">
	                                                	<!-- <option id = "notSelect" value="notSelect">선택</option> -->
	                                     </select>
	            
	                                     <button id="add-setle-emp" class="add-mem" type="button" style="padding: 6px 20px;">
	                                         <div class="flex al-it-ce">
	                                         	<i class="fa-solid fa-user-plus"></i>  추가
	                                         </div>
	                                     </button>
	                                </div>
	                              </div>
                            </td>
                        </tr>
                        
                        
                         <tr>
                            <td id="nickBox" class="nickBox">
                                <!-- 참조자 박스  들어갈곳 -->
                                <!-- <span class="add-m">조조<i class="fa-solid fa-xmark"></i>
                                	<input type="hidden" value="조조" id="조조" name="ccEmpList">
                                </span> -->
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
    </div>


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>개인자료실 폴더<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
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

							 <c:forEach items="${pdsPrivateList }" var="pdsP">
                            <li>
                                <div class="remove-check">
                                <c:choose>
                                	<c:when test="${loginEmp.ncnm ne pdsP.m_writer }">
                                	<i class="fa-solid fa-user-tag"></i>${pdsP.m_writer}
                                	</c:when>
                                	<c:otherwise>
                                    <input type="checkbox" name="checkNo" value="${pdsP.m_unityatchmnflno}">
                                    </c:otherwise>
                                </c:choose>
                                </div>
                                <img src="<%=request.getContextPath() %>/resources/images/aca.png" onclick="list_goo('pdsPrivateList','${pdsP.m_unityatchmnflno}','${pdsP.m_title}','${pdsP.m_writer}');">
                                <div class="arch-name">
                                    <span class="file-name">${pdsP.m_title }
                                    	<input type="hidden" class="m_writer" value="${pdsP.m_writer}">
                                    	<input type="text" name="m_title" class="m_title toDisplay" autocomplete="off" style="display:none"/> 
                                    	<input type="hidden" class="m_unityatchmnflno" value="${pdsP.m_unityatchmnflno}">
                                    	<input type="hidden" class="refrn_unity_no" value="${pdsP.refrn_unity_no}">
                                    	<c:if test="${loginEmp.ncnm eq pdsP.m_writer }">
                                    	<i class="fa-solid fa-pen modify_go"></i>
                                    	</c:if>
                                    </span>
                                </div>
                                <div class="fol-date"   onclick="list_goo('pdsPrivateList','${pdsP.m_unityatchmnflno}');">
                                    <em>생성일</em> <fmt:formatDate value="${pdsP.m_regdate }" pattern="yyyy-MM-dd"/>
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
    
    <c:if test="${from eq 'regist' }">
    	<script>
    		alert("폴더 생성이 완료되었습니다.");
    	</script>
    </c:if>
    
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
			if(!url) url="pdsPrivateFolders";
			
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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
			<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
				{{#each .}}
					<option value={{this.ncnm}} class=appendDepartEmp>{{this.ncnm}}</option>
				{{/each}}
			</script>
			
			<script type="text/javascript">
				$('#depart-selector').on('change',function(){
					var depart = $(this).val();
					$.getJSON("<%=request.getContextPath()%>/emp/EmpListByDepart?depart="+depart,function(empList){
						var template=Handlebars.compile($('#deparEmpList-selector-template').html());
						
						var empHtml = template(empList);
						
						$('.appendDepartEmp').remove();
						
						/* const selectOption = document.getElementById("depart-emp-seletor");
						 selectOption = selectOption.options[selectOption] 
						 
						if(${loginEmp.ncnm} != )  */
						$('#depart-emp-seletor').append(empHtml);
					});
					
				});
				
				let referno = 0;
				const addEmp = document.querySelector("#add-setle-emp");
				console.log(addEmp);
                	
				addEmp.addEventListener("click", function(){
					const nickBox = document.querySelector("#nickBox");
					const checkedValue = $('#depart-emp-seletor option:selected').text(); 
					const addid = document.getElementById(checkedValue);
					if(!addid){ 
					//console.log(checkedValue);	
						
					const span = document.createElement("span");
					const icon = document.createElement("i");
                    const txt = document.createTextNode("checkedValue");
                    const newInput = document.createElement("input");
                    newInput.setAttribute("type","hidden");
                    newInput.setAttribute("value",checkedValue);
                    newInput.setAttribute("id",checkedValue);
                    newInput.setAttribute("name","ccEmpList");
					span.setAttribute("class","add-m");
					icon.setAttribute("class","fa-solid fa-xmark");
					//span.append(txt);
					span.innerHTML = checkedValue;
					span.append(icon);
					span.append(newInput);
					nickBox.append(span);
					} 
					
					
				});
				
				
				const deleteemp = document.querySelector("#nickBox");
				
				deleteemp.addEventListener("click", function(e){
					if(e.target.parentNode.classList.contains("add-m")){
					e.target.parentNode.remove();
					
					}
					
				});
				
				
			</script>
<script>
const modifyNow = document.querySelector('.modifyNow');

modifyNow.addEventListener('click', function(){
	
	
	
	const unity = document.querySelector('#refrn_unity');
	const name = document.querySelector('#name');
	const data = {
		m_title : name.value,
		refrn_unity_no : unity.value
	}
	
 		$.ajax({
 			url : '<%=request.getContextPath()%>/pds/modifyFolderName', 
 			type : 'post', 
 			data : JSON.stringify(data), 
 			contentType : 'application/json', 
 			success : function(result){ 
 				if(result == 'success'){ 
 					//alert('삭제하였습니다.'); 
 					//insertAgainRefrn(unity);
 				} 
 			}, 
 			error : function(error){ 
 				alert('실패되었습니다'); 
 			} 
 		});  
	
	const secData = {
			refrn_unity_no : unity.value
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/pds/deleteRefrn',
			type : 'post',
			data : JSON.stringify(secData),
			contentType : 'application/json',
			success : function(result){
				if(result == 'success'){
					/* Swal.fire({
	                    icon: 'success',
	                    title: '수정되었습니다.',
	                }).then((result)=>{
	                       window.location.reload();
	                   }) */ 
					insertAgainRefrn(unity);
				}
			},
			error : function(error){
				alert('참조자삭제실패되었습니다');
			}
		});
	
	//삭제
});

/* function deleteRefrnNow(unity){
	
} */

function insertAgainRefrn(unity){
	//INSERT
	//const unity = document.querySelector('#refrn_unity');
	/* ccEmpList */
	let pplListArr = [];
	/* const pplList = document.querySelectorAll(".add-m"); */
	const pplList = document.querySelectorAll("input[name=ccEmpList]");
	console.log(pplList);
	for(let i=0; i<pplList.length; i++){
		let thirData = {
				refrn_unity_no : unity.value,
				emp_nickname   : $('input[name=ccEmpList]').eq(i).val()
		}
		console.log(pplList[i].value);
		pplListArr.push(thirData);
	}
	if(pplListArr[0] != null){
	$.ajax({
		url : '<%=request.getContextPath()%>/pds/insertAgainRefrn',
		type : 'post',
		data : JSON.stringify(pplListArr),
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
			alert('참조자insert실패되었습니다');
		}
	});
	} else {
		Swal.fire({
            icon: 'success',
            title: '수정되었습니다.',
        }).then((result)=>{
               window.location.reload();
           })
	}
	
}
	


const removeCodeUpdate = document.querySelector('#removeB');

let m_unityatchmnflno = [];

removeCodeUpdate.addEventListener('click', function(e){
const folder_length = document.getElementsByName("checkNo").length;
	
	for(let i=0; i<folder_length; i++){
		
		if(document.getElementsByName("checkNo")[i].checked == true){
			m_unityatchmnflno.push(document.getElementsByName("checkNo")[i].value);
		}
	}
			if(m_unityatchmnflno.length == 0){
				alert("삭제할 폴더를 선택하세요");
			}
			else{
				
				$.ajax({
					url : '<%=request.getContextPath()%>/pds/countFiles',
					type : 'post',
					data : JSON.stringify(m_unityatchmnflno),
					contentType : 'application/json',
					success : function(result){
						for(let i = 0; i < result.length; i++){
							if(result[i] > 1){
								Swal.fire({
				                    icon: 'error',
				                    title: '삭제 불가한 폴더가 존재합니다.',
				                    text: '파일을 먼저 삭제하세요.',
				                });
								//alert('파일을 먼저 지우고 폴더를 삭제해야함');
								m_unityatchmnflno = [];
								return;
							}
						}
						deleteFolder(m_unityatchmnflno);
					},
					error : function(error){
						alert('실패되었습니다');
					}
				});
			} 
	});

function submit_go(url,m_unityatchmnflno){	
	location.href=url;
}

function list_goo(url,m_unityatchmnflno,m_title,m_writer){	
	location.href=url+"?m_unityatchmnflno="+m_unityatchmnflno+"&m_title="+m_title+"&m_writer="+m_writer;
}
 
 	const unityatchmnflno = document.querySelectorAll('.m_unityatchmnflno');
 	const pen = document.querySelectorAll('.fa-pen');
 	const nickBox = document.querySelector('.nickBox');
 	const name = document.querySelector('#name');
 	const modifyModal = document.querySelector("#modifyModal");
 		
 	
 	
 	for(let i = 0; i<unityatchmnflno.length; i++){
	 		pen[i].addEventListener('click', function(e){
	 		
		 	javascript:openModal('modal12');
	 		
	 		while (nickBox.hasChildNodes()) {	
	 			nickBox.removeChild(
	 					nickBox.firstChild
	 			  );
	 			}
	 		
	 		while (modifyModal.hasChildNodes()) {	
	 			modifyModal.removeChild(
	 					modifyModal.firstChild
	 			  );
	 			}
	 		
	 		let writerName = e.target.parentNode.innerText;
	 		name.setAttribute("value",writerName);
	 		
	 		//console.log($('.refrn_unity_no').eq(i).val());
	 		
	 		
		 	const data = {
		 			m_unityatchmnflno : unityatchmnflno[i].value
		 	}
		 	console.log(data);
		 	$.ajax({
				url : '<%=request.getContextPath()%>/pds/folderModify',
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(result){
					
					console.log(result);
					
					const makeNewInput = document.createElement('input');
					makeNewInput.setAttribute("type","hidden");
					makeNewInput.setAttribute("id","refrn_unity");
					makeNewInput.setAttribute("value",$('.refrn_unity_no').eq(i).val());
					modifyModal.append(makeNewInput);
					
					if(result.pdsRefrn[0] != null){
					for(let i = 0; i<result.pdsRefrn.length; i++ ){
						 
						let name = result.pdsRefrn[i].emp_nickname;
						console.log(result);
						console.log(name);
						const newSpan = document.createElement('span');
						newSpan.setAttribute("class","add-m");
						newSpan.innerText = name;
						const newIcon = document.createElement('i');
						newIcon.setAttribute("class","fa-solid fa-xmark");
						const newInput = document.createElement('input');
						newInput.setAttribute("type","hidden");
						newInput.setAttribute("value",name);
						newInput.setAttribute("class","add-m");
						newInput.setAttribute("name","ccEmpList");
						newSpan.append(newIcon);
						newSpan.append(newInput);
						nickBox.append(newSpan);
					}
					}
				},
				error : function(error){
					alert('변경실패!');
				}
			});
		 	
 		})
 }
 	function deleteFolder(m_unityatchmnflno){
 		$.ajax({
 			url : '<%=request.getContextPath()%>/pds/deleteFolder', 
 			type : 'post', 
 			data : JSON.stringify(m_unityatchmnflno), 
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
 
</script>

  <%@ include file="/WEB-INF/include/footer.jsp" %>