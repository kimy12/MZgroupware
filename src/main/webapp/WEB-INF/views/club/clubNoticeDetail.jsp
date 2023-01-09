<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>
		<c:set var="cboard" value="${dataMap.cboard }" />
		<div class="container flex">


			<div class="sub-content">
				<div class="backPage"
					onClick="location.href='<%=request.getContextPath()%>/club/${cboard.club_no}'">
					<i class="fa-solid fa-arrow-rotate-left"></i> 리스트로 돌아가기
				</div>
				<div class="detail">
					<div class="de-con con01">

						<div class="detail-title">
							<div class="txt flex ju-sp-bt al-it-ce">
								<h2>${cboard.clubboard_title }</h2>
								 <c:if test="${loginEmp.empl_no eq cboard.clubboard_writer }">
	                                <div class="de-btn">
	                                    <button class="modi" >수정</button>
	                                    <button class="remo">삭제</button>
	                                </div>                                
                                </c:if>
                                <c:if test="${loginEmp.empl_no ne cboard.clubboard_writer }">
	                                <div class="de-btn" style="visibility:hidden;">
	                                    <button class="modi" >수정</button>
	                                    <button class="remo">삭제</button>
	                                </div>                                
                                </c:if>

							</div>
							<div class="user flex">
								<div class="user-img"></div>
								<div class="user-name">
									<p>${cboard.ncnm }</p>
									<span><i class="fa-solid fa-briefcase"></i>${cboard.dept }
										<!-- <em>마케팅1팀</em> --></span>
								</div>
							</div>
						</div>

						<table>
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>

							<tbody>
								<tr>


									<th>작성 일자</th>
									<td id="registDate"><fmt:formatDate
											value="${cboard.clubboard_rgdt  }" pattern="yyyy-MM-dd" /></td>

									<th>기능설정</th>
									<td>
										<div>
											<c:if test="${cboard.pin eq '1'}">
												<i class="fa-solid fa-check"></i>
												<label>상단 고정 여부</label>
											</c:if>
										</div>
									</td>
								</tr>

								<tr>
									<th>첨부파일</th>
									<c:if test="${empty dataMap.upFileList }">
										<td>내용이 없습니다.</td>
									</c:if>


									<td colspan="3">


											<c:forEach items="${dataMap.upFileList }" var="upL">
												<li
													onclick="location.href='<%=request.getContextPath()%>/mail/download?ano=${upL.ano }&unityatchmnflno=${upL.unityatchmnflno }';">
													<ul class="flex ju-sp-bt">
														<li><i class="fa-solid fa-file"></i>${upL.originalname}</li>
														<li>${upL.regdate}</li>
														<li class="fileSize">${upL.filesize}</li>
														<li><i class="fa-solid fa-download"></i></li>
													</ul>

												</li>
											</c:forEach>
									</td>
								</tr>

								<tr>
									<th>내용</th>
									<td colspan="3">${cboard.clubboard_cont }</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="de-con con02">
						<div class="reply-box">
							<div class="reply-add flex al-it-ce">
								<textarea id='reply-content'></textarea>
								<button type="button" onclick="registReply();">
									<i class="fa-solid fa-comment-dots"></i>댓글달기
								</button>
							</div>
							<div class="reply-list" id="replyListDiv"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<c:if test="${from eq 'modify' }">
	       		<script>
		      		Swal.fire({
				 	title: "수정되었습니다.",
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
	<form role="form">
		<input type="hidden" name="clubboard_no"
			value="${cboard.clubboard_no }" id="clubboard_no" /> <input
			type="hidden" name="clubboardtype_no"
			value="${cboard.clubboardtype_no }" id="clubboardtype_no" /> <input
			type="hidden" name="clubboard_writer"
			value="${cboard.clubboard_writer }" id="clubboard_writer" />
	</form>


	<script>
	function modify_go(){
		var formObj = $("form[role='form']");
		formObj.attr({
			'action':'modifyForm',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}

	
	
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
	
const downloadBtn = document.querySelector('#downloadBtn');
const fileListArray = document.getElementById("fileListResult").getElementsByTagName("li");

const uniflno = document.querySelector('#uniflno');
const ano = document.querySelectorAll('#ano');


console.log(fileListArray.length + "배열 수");


const dataSetting = function(){
	var dataArr = [];
	var dataObj = {};
	
	for(let i = 0; i < fileListArray.length; i++){
			dataObj = {"unityatchmnflno" : uniflno.value,
					   "ano" : ano[i].value}
			dataArr.push(dataObj);
		console.log(dataObj.unityatchmnflno + "찍히나요?");
		console.log(dataObj.ano + "찍히나요?");
				
	}
	
	return dataArr;
	
};



function callReplyList(page){
	
	
    $.ajax({
        type : "POST",            // HTTP method type(GET, POST) 형식이다.
        url : "<%=request.getContextPath()%>/clubboardReply/list",      // 컨트롤러에서 대기중인 URL 주소이다.
        data : {
        	clubboard_no : ${cboard.clubboard_no},
        	clubboardtype_no : ${cboard.clubboardtype_no},
        	page : page
        },            // Json 형식의 데이터이다.
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
        	/* console.log("왔음"); */
         	var template = Handlebars.compile($('#replyList-template').html());
         	$('#replyListDiv').html(template(res));
        	
        	
        	var	pagehtml =`<div class="page-btn flex" id="replyPageDiv">
				<a class="p-num prev" href="javascript:callReplyList(1);"> <i class="fas fa-angle-double-left"></i>
				</a>`;
			var cri = res.pageMaker.cri;
        	var start = res.pageMaker.startPage;
        	var end = res.pageMaker.endPage;
        	if(end<1){
        		end = 1;
        	}
        	if(res.pageMaker.totalCount == 0){
        		pagehtml = "";
        		$('#replyListDiv').html(pagehtml);
        	}else{
        	
	        	pagehtml +=`<a class="p-num prev" href="javascript:callReplyList('`
		        	
		        	if(res.pageMaker.prev){
		        		pagehtml += ""+(start-1);
		        	}else{
		        		pagehtml += cri.page
		        	}
		        	
		        	pagehtml +=		`');">
						<i class="fas fa-angle-left"></i>`;
	        	
	        	for(var i = start; i <= end; i++){
	        		pagehtml += `<a class="p-num num `
	        		if(i == cri.page) pagehtml += 'on';
	        		pagehtml +=`" href="javascript:callReplyList('`+i+`');">`+i+`</a>`
	        	}
	        	
	        	pagehtml +=`<a class="p-num next" href="javascript:callReplyList('`
	        	
	        	if(res.pageMaker.next){
	        		pagehtml += ""+(end+1);
	        	}else{
	        		pagehtml += cri.page
	        	}
	        	
	        	pagehtml +=		`');">
					<i class="fas fa-angle-right"></i>`;
	        	
	        	pagehtml +=`<a class="p-num next" href="javascript:callReplyList(`+res.pageMaker.realEndPage+`);"> 
	        	<i class="fas fa-angle-double-right"></i>
					</a>
					</div>`;
	        	
	        	 
	        	 $('#replyListDiv').append(pagehtml);
        	}
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });
}

callReplyList(1);


 function registReply(){
	
	
	console.log('${cboard.clubboard_no }');
	console.log('${cboard.clubboardtype_no }');
	console.log('${loginEmp.ncnm}');
	console.log('${loginEmp.empl_no}');
	
		if($('#reply-content').val()){
  		$.ajax({
	        type : "POST",            // HTTP method type(GET, POST) 형식이다.
	        url : "<%=request.getContextPath()%>/clubboardReply/regist",
	        
	        
	        
	        // 컨트롤러에서 대기중인 URL 주소이다.
	        data : {
	        	clubboard_no : '${cboard.clubboard_no }',
	        	clubboardtype_no : '${cboard.clubboardtype_no }',
	        	writer : '${loginEmp.ncnm}',
	        	empl_no : '${loginEmp.empl_no}',
	        	clubboard_cont	: $('#reply-content').val()
	        },            // Json 형식의 데이터이다.
	        success : function(){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	            // 응답코드 > 0000
	            callReplyList(1);
	            $('#reply-content').val("");
	            alert("등록 성공");
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	            alert("등록 실패")
	        }
	    });
		}else{
			alert("내용을 입력하세요")
		}
	}


let displayFlag = false
function displayIcon(obj) {
	   let a = $(obj).parents("tr").next().find(".replycontent");
	   let temp = '<textarea>'+a.text()+'</textarea>';
	   
	   
	   $(obj).parent().hide()

	   if (displayFlag) {
 	   $(obj).parent().parent().find(".fa-pen").parent().show()
 	   $(obj).parent().parent().find("textarea").parent().hide()
 	  /*  $(obj).parent().parent().find("span").parent().show() */
 	   displayFlag = false
	   } else {
 	   $(obj).parent().parent().find(".fa-check-double").parent().show()
 	   $(obj).parent().parent().find("textarea").parent().show()
 	  /*  $(obj).parent().parent().find("span").parent().hide() */
 	   a.text("");
 	   a.html(temp);
 	   displayFlag = true
	   }
}

	var modifyBreply = document.querySelector('#modify');

	function modifyContent(obj){
	    		   
				var data = {
						clubreply_no :$(obj).children().val(),
						clubboard_cont : $(obj).parent().parent().next().children().children().val()
						};
	    		console.log(data);
	   
				 $.ajax({
				      url : "<%=request.getContextPath()%>/clubboardReply/modify",
					 type : 'post',
					 data : data,
					 success : function(result){
						 alert(result);
						 if(result == 'success'){
							  window.location.reload(); 
							  displayIcon($(obj));
						 }
					 },
					 error : function(error){
						 console.log(error)
						 alert('작성 실패하였습니다.');
					 }
				   });
	}
	
	function removeReplay(obj){
		   
		var data = {
				clubreply_no :$(obj).parent().next().val()
				};
		console.log(data);

		 $.ajax({
		      url : "<%=request.getContextPath()%>/clubboardReply/remove",
			 type : 'post',
			 data : data,
			 success : function(result){
				 alert(result);
				 if(result == 'success'){
					  alert('삭제되었습니다.');
					  window.location.reload(); 
				 }
			 },
			 error : function(error){
				 console.log(error)
				 alert('작성 실패하였습니다.');
			 }
		   });
}
    const fileSize = document.querySelectorAll('.fileSize');
    const remo = document.querySelector('.remo');
    const modi = document.querySelector('.modi');
    const unity = document.querySelector('#unity');
    
    modi.addEventListener('click',()=>{	
		let unityNo = unity.value;
		
        location.href='${pageContext.request.contextPath}/noticeboard/modifyform?boardno='+${notice.board_no }+'&btno='+${notice.boardtype_no }+'&unityno='+unityNo;
    })
    
    remo.addEventListener('click', ()=>{
    	Swal.fire({
		 	title: "정말 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            confirmButtonText: '확인',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
		        location.href='${pageContext.request.contextPath}/noticeboard/remove?board_no='+${notice.board_no }+'&boardtype_no='+${notice.boardtype_no };													                       
            }
        })	
    })

</script>
	<script type="text/x-handlebars-template" id="replyList-template">
		{{#each boardReplyList}}
				<div class="re-con">
                                    <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="80%">
                                            <col width="8%">
                                        </colgroup>

                                        <tbody>
                                            <tr>
                                                <td rowspan="3"><div class="reply-img"></div></td>
                                                <td><h3>{{writer}}<span>{{dept}}팀</span></h3> </td>
                                                <td class="right">
                                                    <i class="fa-solid fa-pen" onclick="displayIcon(this);" id="modifyBtn"></i>
                                  				    <button type="button"><i class="fa-solid fa-xmark" onclick="removeReplay(this);" id="remove"></i></button>
                                             		   <input type="hidden" value="{{clubreply_no}}"/>
											 </td>		
											 <td class="right" style="display: none;">
		                                             <i class="fa-solid fa-check-double" onclick="modifyContent(this);" id="modify">

													   <input type="hidden" value="{{clubreply_no}}"/>
													</i>
												 <i class="fa-solid fa-arrow-rotate-left" onclick="displayIcon(this)"></i>
                                                   
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2" class="replycontent">{{clubboard_cont}}</td>
                                                
                                            </tr>

                                            <tr>
                                                <td><div class="reply-date">{{clubreply_rgdt}}</div></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
		{{/each}}
		
											
		
	</script>


</body>
</html>