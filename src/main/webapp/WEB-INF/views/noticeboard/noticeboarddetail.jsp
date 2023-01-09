<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
       <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
             

            <div class="sub-content">
            	<div class="backPage"
					onClick="location.href='<%=request.getContextPath()%>/noticeboard/list'">
					<i class="fa-solid fa-arrow-rotate-left"></i> 리스트로 돌아가기
				</div>
               <div class="detail">
                    <div class="de-con con01">

                        <div class="detail-title">
                            <div class="txt flex ju-sp-bt al-it-ce">
                                 <h2>${notice.board_title }</h2> 
                                 <input type="hidden" id="unity" value="${notice.unityatchmnflno }"/>
                                <c:if test="${loginEmp.empl_no eq notice.board_writer }">
	                                <div class="de-btn">
	                                    <button class="modi" >수정</button>
	                                    <button class="remo">삭제</button>
	                                </div>                                
                                </c:if>
                                <c:if test="${loginEmp.empl_no ne notice.board_writer }">
	                                <div class="de-btn" style="visibility:hidden;">
	                                    <button class="modi" >수정</button>
	                                    <button class="remo">삭제</button>
	                                </div>                                
                                </c:if>
                            </div>
                            <div class="user flex">
									<div class="user-img" data-id="${notice.id}"></div>
                                <div class="user-name">
                                    <p>${notice.ncnm}</p>
                                    <span><i class="fa-solid fa-briefcase"></i>${notice.dept}</span>
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
	                                    <td id="registDate"> 
	                                        <fmt:formatDate value="${notice.board_rgdt  }" pattern="yyyy-MM-dd"/>
	                                    </td>
                                    <th>기능설정</th>
                                    	<td> 
	                                        <div>
		                                        <c:if test="${notice.pin eq 'y'}">
		                                            <i class="fa-solid fa-check"></i>
		                                            <label>상단 고정</label>
		                                        </c:if>
		                                        <c:if test="${notice.pin eq 'n'}">
		                                        	
		                                        </c:if>
	                                        </div>
                                        </td>
                               	</tr>
                                <tr>
                                   <th>메인팝업 여부</th>
                                    <td>
                                       <c:if test="${notice.start_date ne null }">
                                       		<i class="fa-solid fa-check"></i>
                                       </c:if>
                                    </td>
                                   <th>팝업 기간 설정</th>
                                    <td> 
										<c:if test="${notice.start_date != null }">${notice.start_date} ~ ${notice.end_date }</c:if>
                                    </td>
                                </tr>

								<tr>
									<th>첨부파일</th>
										
										<c:if test="${notice.unityatchmnflno eq '-1'}">
											<td>첨부된 파일이 없습니다.</td>
										</c:if>
										
										<c:if test="${notice.unityatchmnflno ne '-1'}">
											<td colspan="3">
												<ul>
													<c:forEach items="${attachList }" var="atch">
														<c:if test="${notice.unityatchmnflno eq atch.unityatchmnflno}">
															<li onclick="location.href='<%=request.getContextPath()%>/mail/download?ano=${atch.ano }&unityatchmnflno=${atch.unityatchmnflno }';">
																<ul class="flex ju-sp-bt">
																	<li><i class="fa-solid fa-file"></i>${atch.originalname}</li>
																	<li>${atch.regdate}</li>
																	<li class="fileSize">${atch.filesize}</li>
																	<li><i class="fa-solid fa-download"></i></li>
																</ul>
															</li>
														</c:if>
													</c:forEach>
												</ul>
											</td>
										</c:if>
									</tr>
	                                <tr>
	                                    <th>내용</th>
	                                    	<td colspan="3">${notice.board_cont }</td>
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
			<input type="hidden" name="board_no" value="${notice.board_no }"id="board_no" /> 
			<input type="hidden" name="boardtype_no" value="${notice.boardtype_no }" id="boardtype_no" /> 
			<input type="hidden" name="empl_no" value="${notice.boardtype_no }"
				id="boardtype_no" />
		</form> 
       
         <script>

      	callReplyList(1);


      	function registReply(){
      		
      		
      		console.log('${notice.board_no }');
      		console.log('${notice.boardtype_no }');
      		console.log('${loginEmp.ncnm}');
      		console.log('${loginEmp.empl_no}');
      		
      			if($('#reply-content').val()){
      	  		$.ajax({
      		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
      		        url : "<%=request.getContextPath()%>/boardReply/regist",
      		        
      		        
      		        
      		        // 컨트롤러에서 대기중인 URL 주소이다.
      		        data : {
      		        	board_no : '${notice.board_no }',
      		        	boardtype_no : '${notice.boardtype_no }',
      		        	writer : '${loginEmp.ncnm}',
      		        	empl_no : '${loginEmp.empl_no}',
      		        	breply_cont	: $('#reply-content').val()
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


      	let displayFlag = false;
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
      		    	    		   breply_no :$(obj).children().val(),
      							breply_cont : $(obj).parent().parent().next().children().children().val()
      							};
      		    		console.log(data);
      		   
      					 $.ajax({
      					      url : "<%=request.getContextPath()%>/boardReply/modify",
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
      					breply_no :$(obj).parent().next().val()
      					};
      			console.log(data);

      			 $.ajax({
      			      url : "<%=request.getContextPath()%>/boardReply/remove",
      				 type : 'post',
      				 data : data,
      				 success : function(result){
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
         
         
         
         
         //인서트 찾아서 비활성화(disabled)를 true해주면 버튼이 작동이 안됨
         //비활성화일떄 insert 색깔 바꿔줌
        $(function () {
        	$('#insert').attr("disabled", true)
        	$('#insert').css("background-color", "#a2aba9")
        	//textarea keyup이벤트 줌 
        	$('textarea[name=breply_cont]').on('keyup', function() {
        		//this(textarea)에 길이가 0보다 크면 
        		//비활성화 된걸 활성화 시키고 색상 변경
        		if($(this).val().length > 0) {
        			$('#insert').attr("disabled", false)
                	$('#insert').css("background-color", "#0C8B72")
        		} else {
                	$('#insert').attr("disabled", true)
                	$('#insert').css("background-color", "#a2aba9")
        		}
        	})
        	
        	for(let i = 0; i < fileSize.length; i++){
        		fileSize[i].innerText = bytesToSize(fileSize[i].innerText);
        	}
        })
        
        function bytesToSize(bytes) {
     	   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
     	   if (bytes == 0) return '0 Byte';
     	   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
     	   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
     	};
       

     	function callReplyList(page){
     		
     		
     	    $.ajax({
     	        type : "POST",            // HTTP method type(GET, POST) 형식이다.
     	        url : "<%=request.getContextPath()%>/boardReply/list",      // 컨트롤러에서 대기중인 URL 주소이다.
     	        data : {
     	        	board_no : ${notice.board_no},
     	        	boardtype_no : ${notice.boardtype_no},
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
     	                                                <td rowspan="3"><div class="reply-img" style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no={{empl_no}}')"></div></td>
     	                                                <td><h3>{{ncnm}}<span>{{dept}}</span></h3> </td>
     	                                                <td class="right">
     	                                                    <i class="fa-solid fa-pen" onclick="displayIcon(this);" id="modifyBtn"></i>
     	                                  				    <button type="button"><i class="fa-solid fa-xmark" onclick="removeReplay(this);" id="remove"></i></button>
     	                                             		   <input type="hidden" value="{{breply_no}}"/>
     												 </td>		
     												 <td class="right" style="display: none;">
     			                                             <i class="fa-solid fa-check-double" onclick="modifyContent(this);" id="modify">

     														   <input type="hidden" value="{{breply_no}}"/>
     														</i>
     													 <i class="fa-solid fa-arrow-rotate-left" onclick="displayIcon(this)"></i>
     	                                                   
     	                                                </td>
     	                                            </tr>

     	                                            <tr>
     	                                                <td colspan="2" class="replycontent">{{breply_cont}}</td>
     	                                                
     	                                            </tr>

     	                                            <tr>
     	                                                <td><div class="reply-date">{{#prettifyDate breply_regdate}}{{/prettifyDate}}</div></td>
     	                                            </tr>
     	                                        </tbody>
     	                                    </table>
     	                                </div>
     			{{/each}}
     			
     												
     			
     		</script>

	<script>
		MemberProFilePictureThumb('<%=request.getContextPath()%>');
		
		function MemberProFilePictureThumb(contextPath){
			 for(var target of document.querySelectorAll('.user-img')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
	
	</script>
	<script type="text/javascript">
	Handlebars.registerHelper({
	  	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();
			return year+"-"+month+"-"+date;
		},
		"VisibleByLoginCheck":function(replyer,opts){
			if (replyer == '${loginEmp.empl_no}') {
		        return opts.fn(this)
		    } else {
		        return opts.inverse(this)
		    }					  
		},
    	'ifCond':function(v1, v2, options) {
    		
		  if(v1 == v2) {
		    return options.fn(this);
		  }
		  return options.inverse(this);
		},
		'loop':function(data, options) {
			var to = data.endPage;
			var from = data.startPage;
			
			if(to == 0){
				to=1;
			}
		    var accum = '';
		    for(var i = from; i <= to; i++){
		    	data.pageNum = i;
		        accum += options.fn(data);
			}
		    return accum;
		},
		'loopTo':function(from, to ,options) {
			
		    var accum = '';
		    for(var i = from; i <= to; i++)
		        accum = accum + options.fn(i);
		    return accum;
		},
		'loopTos':function(from,to ,options) {
			
		    var accum = '';
		    for(var i = from; i < to; i++)
		        accum += options.fn(i);
		    return accum;
		}
    });
	</script>
</body>
</html>