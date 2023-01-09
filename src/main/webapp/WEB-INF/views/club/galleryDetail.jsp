<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="detail" value="${detail }" />
<%-- <c:set var="galleryImageList" value="${data.galleryImageList }" /> --%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
    <div class="container flex">
               <input type="hidden" id="unityatchmnflno" name="unityatchmnflno" value="${unityatchmnflno}">
               <input type="hidden" id="clubboard_no" name="clubboard_no" value="${clubboard_no}">
               <input type="hidden" id="club_no" name="club_no" value="${detail.club_no}">

            <div class="sub-content">
				<div class="backPage"
					onClick="location.href='<%=request.getContextPath()%>/club/${detail.club_no}'">
					<i class="fa-solid fa-arrow-rotate-left"></i> 리스트로 돌아가기
				</div>
               <div class="detail">
                    <div class="de-con con01">

                        <div class="detail-title">
                            <div class="txt flex ju-sp-bt al-it-ce">
                                <h2>${detail.clubboard_title }</h2>
                                <div class="de-btn">
                                	<c:if test="${loginEmp.ncnm eq detail.clubboard_writer }">
                                    <button type="button" class="modi">수정</button>
                                    <button type="button" class="remo deleteGallery">삭제</button>
                                    </c:if>
                                </div>
                            </div>
                            <div class="user flex ju-sp-bt al-it-ce">
                                <div class="flex">
                                    <div class="user-img"></div>
                                    <div class="user-name">
                                        <p>${detail.clubboard_writer }</p>
                                        <span>
	                                        <i class="fa-solid fa-briefcase"></i>
	                                        ${detail.dept } 
	                                        <!-- <em>마케팅1팀</em> -->
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                      
          				
          				
                        <div class="club-galleryWrap mb-20">
                          	<div class="btns" id="previous" onclick="slideLeft()"><i class="fa fa-arrow-left"></i></div>
                        	<div class="btns" id="next" onclick="slideRight()"><i class="fa fa-arrow-right"></i></div>
                        	<div class="overflow-wrap">
                        		
								<c:forEach items="${galleryImageList }" var="attach">
									<div class="ga-wrap">
			                        <div class="gallery-box gallery-img" data-id="${attach.ano }"> 
			                            <%-- <img src="<%=request.getContextPath()%>/resources/images/f_test02.jpg"> --%>
			                        </div>
			                        </div>
								</c:forEach>
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
                                    <th>첨부파일</th>
                                    <td colspan="3">
                                         <ul>
                                        <c:forEach items="${galleryImageList }" var="attach">
                                            <li>
                                                <ul class="flex ju-sp-bt">
                                                    <li class="integration"><i class="fa-solid fa-file"></i>${attach.originalname }</li>
                                                    <li>${attach.regdate }</li>
                                                    <li class="fileSize">${attach.filesize }</li>
                                                    <li><i class="fa-solid fa-download"></i></li>
                                                </ul>
                                            </li>
                                       </c:forEach>
                                        </ul>
                                    </td>

                                </tr>

                                <tr>
                                    <th>내용</th>
                                    <td colspan="3"> 
                                      ${detail.clubboard_cont }
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
        
       <script>
       
       MemberPictureThumb('<%=request.getContextPath()%>');
		
		function MemberPictureThumb(contextPath){
			 for(var target of document.querySelectorAll('.gallery-img')){	
				 var ano = target.getAttribute('data-id');
				 const unityatchmnflno = $('#unityatchmnflno').val();
				 
				 target.style.width= "50%";
				 target.style.height= "500px";
				 target.style.backgroundImage="url('"+contextPath+"/club/getGalleryDetailPic?unityatchmnflno="+unityatchmnflno+"&ano="+ano+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="contain"; 
			}
		}
		
		const deleteGallery = document.querySelector('.deleteGallery');
		
		deleteGallery.addEventListener('click', function(){
			
			/* alert("클"); */
			const clubno = $('#club_no').val();
			const clubboardno = $('#clubboard_no').val();
			const data = {
					"clubboard_no" : clubboardno
			}
			
			Swal.fire({
				title: '삭제 하시겠습니까?',
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
				}).then((result)=> {
					if (result.isConfirmed){
		       				$.ajax({
		       					url : '<%=request.getContextPath()%>/club/deleteGalleryDetail',
		       					type : 'post',
		       					data : JSON.stringify(data),
		       					contentType : 'application/json',
		       					success : function(result){
		       						
		       						if(result == 'success'){
		       						Swal.fire({
		       								icon: 'success',
		       								title: '삭제 되었습니다.',
		       						}).then((result)=>{
		       							let url = `<%=request.getContextPath()%>/club/${detail.club_no}`;
		       							location.replace(url);
		       	                    	document.querySelector("#ctab04").focus(); 
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
		})
		
		
		
		
       $('#summernote').summernote({
           placeholder: 'Hello stand alone ui',
           tabsize: 2,
           height: 300,
           toolbar: [
             ['style', ['style']],
             ['font', ['bold', 'underline', 'clear']],
             ['color', ['color']],
             ['para', ['ul', 'ol', 'paragraph']],
             ['table', ['table']],
             ['insert', ['link', 'picture', 'video']],
             ['view', ['fullscreen', 'codeview', 'help']]
           ]
         });
       
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
       </script>
       
       
   <script>
	   var pos = 0;
	   var totalSlides = $('.overflow-wrap .ga-wrap').length;
	   var sliderWidth = 1180;
   
   
	   
   		setInterval(function(){
		    $(".overflow-wrap").animate({"margin-left":"-1180px"},600,function(){
		    	
		    $(".overflow-wrap").append($(".overflow-wrap .ga-wrap:nth-child(1)"));
		    $(".overflow-wrap").css("margin-left",0);
	    });
	    },4000);
   		
   		function slideLeft(){
   		 pos--;
	   	  if(pos==-1){
	   		  pos = totalSlides-1; 
	   	  }
	   	  
		  $('.overflow-wrap').css('left', -(sliderWidth*pos)); 
   		}
   		
   		function slideRight(){
   		  pos++;
   		  if(pos==totalSlides){ 
   			  pos = 0; 
   		  }
   		  
   		  $('.overflow-wrap').css('left', -(sliderWidth*pos)); 
   		}


   		function callReplyList(page){
   			
   			
   		    $.ajax({
   		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
   		        url : "<%=request.getContextPath()%>/clubboardReply/list",      // 컨트롤러에서 대기중인 URL 주소이다.
   		        data : {
   		        	clubboard_no : ${detail.clubboard_no},
   		        	clubboardtype_no : ${detail.clubboardtype_no},
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
   			
   			
   			console.log('${detail.clubboard_no }');
   			console.log('${detail.clubboardtype_no }');
   			console.log('${loginEmp.ncnm}');
   			console.log('${loginEmp.empl_no}');
   			
   				if($('#reply-content').val()){
   		  		$.ajax({
   			        type : "POST",            // HTTP method type(GET, POST) 형식이다.
   			        url : "<%=request.getContextPath()%>/clubboardReply/regist",
   			        
   			        
   			        
   			        // 컨트롤러에서 대기중인 URL 주소이다.
   			        data : {
   			        	clubboard_no : '${detail.clubboard_no }',
   			        	clubboardtype_no : '${detail.clubboardtype_no }',
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

   			
   			function cancel(obj){
   				$(obj).parents("tr").next().find(".replycontent textarea").hide();
   				$(obj).parent('td').siblings('#onTxt').css('display', 'block');
   				$(obj).parent('td').css('display', 'none');
   				/* $(obj).parent('td').siblings('#onTxt').css('display', 'block');
   				$(obj).parent('td').css('display', 'none');
   				$(obj).('#replycontent').css('display', 'none'); */
   				
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
   		                                                <td rowspan="3"><div class="reply-img"></div></td>
   		                                                <td><h3>{{ncnm}}<span>{{dept}}</span></h3> </td>
   		                                                <td class="right" id="onTxt">
   		                                                    <i class="fa-solid fa-pen" onclick="displayIcon(this);" id="modifyBtn"></i>
   		                                  				    <button type="button"><i class="fa-solid fa-xmark" onclick="removeReplay(this);" id="remove"></i></button>
   		                                             		   <input type="hidden" value="{{clubreply_no}}"/>
   													 </td>		
   													 <td class="right" style="display: none;">
   				                                             <i class="fa-solid fa-check-double" onclick="modifyContent(this);" id="modify">

   															   <input type="hidden" value="{{clubreply_no}}"/>
   															</i>
   														 <i class="fa-solid fa-arrow-rotate-left" onclick="cancel(this)"></i>
   		                                                   
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
  <%@ include file="/WEB-INF/include/footer.jsp" %>
