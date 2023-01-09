<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/WEB-INF/include/header.jsp" %>
<body>

  <div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
               

            <div class="content">
            	<div class="p-wrap">
            		<div class="backPage" onClick="javascript:history.go(-1)">
            			<i class="fa-solid fa-arrow-rotate-left"></i>
            			리스트로 돌아가기
            		</div>
            
                    <div class="work-regist">

                        <div class="detail-title">
                            <div class="txt flex ju-sp-bt al-it-ce">
                                <h2>
                                    ${work.jobNm }
                                </h2>
                                
                               <c:choose>
		                          <c:when test="${loginEmp.empl_no eq work.jobWriter}">
	                                <div class="de-btn">
	                                    <button type="button" class="modi" onclick="submit_go('modifyForm.do','${work.jobCode }');">수정</button>
	                                    <button type="button" class="remo" onclick="delete_go('${work.jobCode }');">삭제</button>
	                                </div>
	                              </c:when>
	                              
	                              
                              </c:choose>
                              
                              
                              <c:forEach items="${assignList}" var="asslist">
                              		<c:if test="${work.jobCode eq  asslist.jobCode}">
                                      	<c:if test="${loginEmp.empl_no eq asslist.jobMemCode}">
	                                      	<div class="de-btn">
		                              			<button type="button" class="modi" onclick="submit_go('modifyForm.do','${work.jobCode }');">수정</button>
		                              		</div>
                                      	</c:if>    
		                            </c:if>            	
                               	</c:forEach>
                               	
                               	
                                
                            </div>
                            <div class="user flex">
                                <div class="user-img" data-id="${work.empId }"></div>
                                <div class="user-name">
                                    <p>${work.empName } <span class="ml-10">${work.empRank }</span></p>
                                    <span><i class="fa-solid fa-briefcase"></i>${work.empRank } <!-- <em>마케팅1팀</em> --></span>
                                </div>
                            </div>
                        </div>

                        <table>
                            <tbody>
                                <tr>

                                    <td>
                                        <label>작성날짜</label>
                                        <div class="detailTxt">
                                        	${work.jobUpdde }
                                        </div>
                                    </td>

                                    <td>
                                        <label>담당부서</label>
                                        <div class="detailTxt">
                                        	${work.jobDept }
                                        </div>
                                    </td>

                                    <td>
                                        <label>일감 기간</label>
                                        <div class="detailTxt flex al-it-ce">
                                            ${work.jobBgnde }
                                            <span class="date-bet">~</span>
                                            ${work.jobEndde }
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label>일감상태</label>
                                        
                                        <div class="detailTxt">
	                                        <c:choose>
		                                         <c:when test="${work.jobSttus eq 0 }">
		                                        	<span>신규</span>
		                                         </c:when>
		                                         
		                                         <c:when test="${work.jobSttus eq 1 }">
		                                        	<span>진행</span>
		                                         </c:when>
		                                         
		                                         <c:when test="${work.jobSttus eq 2 }">
		                                        	<span>마감</span>
		                                         </c:when>
		                                         
		                                         <c:when test="${work.jobSttus eq 3 }">
		                                        	<span>불가</span>
		                                         </c:when>
	                                        </c:choose>
                                        </div>
                                    </td>
                                    <td>
                                        <label>수정날짜</label>
                                        <div class="detailTxt">
                                        	${work.jobRedde }
                                        </div>
                                    </td>

                                    <td>
                                        <label>수정자</label>
                                       <div class="detailTxt">
                                        	${work.upEmp }
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label>할당자</label>
                                        <div class="report-mem">
                                            <ul class="flex flex-wrap">
                                            
                                            	<c:forEach items="${assignList}" var="asslist">
		                                        	<c:if test="${work.jobCode eq asslist.jobCode}">
		                                        		  <li class="flex al-it-ce">
		                                                    <div class="re-memImg" data-id="${asslist.empId }"></div>
		                                                    <div class="re-memName flex al-it-ce">
		                                                        <div>
		                                                         <h4>${asslist.empName } ${asslist.empRank }</h4>
		                                                         <span>${asslist.empDept }</span>
		                                                         </div>
		                                                      
		                                                    </div>
		                                                </li>
		                                        	</c:if>
	                                        	</c:forEach>
                                            </ul>
                                         </div>
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="3">
                                        <label>업무내용</label>
                                     	<div class="detailTxt">
                                        	${work.jobCn }
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <c:choose>
                                         	<c:when test="${work.unitNo eq -1}">
                                         
                                         	</c:when>
                                         	
                                         	 <c:otherwise>
                                         	  	<div class="flex ju-sp-bt">
		                                            <label>첨부파일</label>
		                                            <label class="downHover"><i class="fa-solid fa-download"></i>전체다운로드</label>
		                                        </div>
		                                        
                                         	 	<ul class="fileList">
		                                        	<c:forEach items="${upFileList }" var="upf">
		                                        		<c:if test="${work.unitNo eq upf.unityatchmnflno}">
				                                            <li class="flex ju-sp-bt al-it-ce" onclick="location.href='<%=request.getContextPath()%>/work/download?ano=${upf.ano }&unityatchmnflno=${upf.unityatchmnflno }';">
				                                                <div class="file-name">
				                                                   <i class="fa-solid fa-file"></i>${upf.originalname }	
				                                                </div>
				
				                                                <div class="file-size">
				                                                    ${upf.filesize }
				                                                </div>
				
				                                                <div class="file-date">
				                                                    ${work.jobUpdde }
				                                                </div>
				
				                                                <div class="file-dele">
				                                                  <i class="fa-solid fa-download"></i>
				                                                </div>
				                                            </li>
			                                            </c:if>
													</c:forEach>
		                                        </ul>
                                         	 </c:otherwise>
                                        </c:choose>
                                    </td>
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
<form role="form">
	<input type="hidden" name="job_code" value="${work.jobCode }" id="job_code" /> 
		<input type="hidden" name="empl_no" value="${loginEmp.empl_no }"
		id="empl_no" />
</form>
   
   
   
  <%--  <%@ include file="./reply_js.jsp" %> --%>
  
  
  <script>
	  	function submit_go(url,wno){	
			location.href=url+"?wno="+wno;
		}
	  	
	  	
	  	
	  	function delete_go(wno){
	  		
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
	  			$.ajax({
					url : '<%=request.getContextPath()%>/work/deleteWork',
					type : 'post',
					data : wno,
					contentType : 'application/json',
					success : function(result){
						 Swal.fire({
	      					 	title: "삭제되었습니다.",
	      			               icon: 'success',
	      			               confirmButtonColor: '#3085d6',
	      			               confirmButtonText: '확인'
	      			               
	      			           }).then((result) => {
	      			        	 location.href = '<%=request.getContextPath()%>/work/commonList'
	      			      });
						
					},
					error : function(error){
						alert('삭제실패');
					}
				});
	  		}else{
	  			alert('취소되었습니다.');
	  		}
	  		
			}); 
	  		
	  	}
	  	
	  	
	  	MemberProFilePictureThumb('<%=request.getContextPath()%>');
		
		function MemberProFilePictureThumb(contextPath){
			 for(var target of document.querySelectorAll('.re-memImg')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
		
		
		
		
		function callReplyList(page){
			
			
		    $.ajax({
		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "<%=request.getContextPath()%>/workReply/list",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		        	job_code : ${work.jobCode },
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
			
			
			console.log('${work.jobCode}');
			console.log('${loginEmp.ncnm}');
			console.log('${loginEmp.empl_no}');
			
				if($('#reply-content').val()){
		  		$.ajax({
			        type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "<%=request.getContextPath()%>/workReply/regist",
			        
			        
			        
			        // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	job_code : '${work.jobCode }',
			        	empl_no : '${loginEmp.empl_no}',
			        	job_reply_cont	: $('#reply-content').val()
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
								job_reply_no :$(obj).children().val(),
								job_reply_cont : $(obj).parent().parent().next().children().children().val()
								};
			    		console.log(data);
			   
						 $.ajax({
						      url : "<%=request.getContextPath()%>/workReply/modify",
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
						job_reply_no :$(obj).parent().next().val()
				};
				console.log(data);

				 $.ajax({
				      url : "<%=request.getContextPath()%>/workReply/remove",
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
		                                             		   <input type="hidden" value="{{job_reply_no}}"/>
													 </td>		
													 <td class="right" style="display: none;">
				                                             <i class="fa-solid fa-check-double" onclick="modifyContent(this);" id="modify">

															   <input type="hidden" value="{{job_reply_no}}"/>
															</i>
														 <i class="fa-solid fa-arrow-rotate-left" onclick="displayIcon(this)"></i>
		                                                   
		                                                </td>
		                                            </tr>

		                                            <tr>
		                                                <td colspan="2" class="replycontent">{{job_reply_cont}}</td>
		                                                
		                                            </tr>

		                                            <tr>
		                                                <td><div class="reply-date">{{#prettifyDate job_reply_rgdt}}{{/prettifyDate}}</div></td>
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
	
<%@ include file="/WEB-INF/include/footer.jsp" %>    