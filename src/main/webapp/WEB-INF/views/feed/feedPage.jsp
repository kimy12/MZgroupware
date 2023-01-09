<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<head>
	<script src="<%=request.getContextPath() %>/resources/js/popup.js" ></script>
</head>


<body>
 <div class="wrap">
 	<%@ include file="/WEB-INF/include/topbar.jsp" %>
 		<div class="myfeedHome" onClick="moveFeed_go('${loginEmp.empl_no}')">
 			<i class="fa-solid fa-house-user"></i>
 			<div>MyFeed</div>
 		</div>
            <div class="container flex">
               
            <div class="content">
                   <div class="feed-wrap">
                   		
                   
                        <div class="feed-bg" id="feedBackImg" data-id="${feed.empNo }">
                        <div class="my-feedImg" id="myFeedImg" data-id="${feed.empNo }"></div>
                        
                         <form id="proregistForm" role="proform" class="form-horizontal" method="post" enctype="multipart/form-data">		   
                            <c:if test="${loginEmp.empl_no eq  feed.empNo}"> 
                            	<div id="proFileOn">
	                            	<label for="inputProfile"><i class="fa-solid fa-gear" onclick="profile_img()"></i></label>
		                          	<input id="inputProfileImg" class="form-control" type="hidden" name="proFilePicture" />
                           		</div> 
                           		
                           		<div id="proFileOff" style="display:none">
	                           		<i class="fa-solid fa-arrows-rotate" onclick="profile_go()" ></i>
	                           		<i class="fa-solid fa-xmark" onclick="cenclePro_ch()"></i>
	                           	</div>
                            </c:if>
						 	<input type="hidden" name="profileImg" />
						</form>	
							
						<form id="registForm" role="form" class="form-horizontal" method="post" enctype="multipart/form-data">		
						   <c:if test="${loginEmp.empl_no eq  feed.empNo}">  
	                          	<div id="bgPicUp">
	                          		<label for="inputFile"><i class="fa-solid fa-arrow-rotate-left" onclick="bgCh_func()"></i></label>
	                          		<input id="inputFileName" class="form-control" type="hidden" name="tempPicture"/>
	                           	</div>
	                           	
	                           	<div id="bgPictureUpFileBtn" style="display:none">
	                           		<i class="fa-solid fa-arrows-rotate" onclick="upload_go()" ></i>
	                           		<i class="fa-solid fa-xmark" onclick="cencleBg_ch()"></i>
	                           	</div>
                           	</c:if>
	                       <input type="hidden" name="backImg" />
	                   	</form>     
                          
                        </div>
				
                        <div class="feed-content">
                         	<input type="hidden" id="feedEmp" name="feedEmp" value="${feed.empNo }" />
                         	
                            <div class="my-feedInfo">
                            	<div class="flex al-it-ce ju-sp-bt mb-15">
                            		<div class="flex al-it-ce">
		                                <div class="my-feedName">
		                                	<input type="hidden" name="empNo" value="${loginEmp.empl_no }" id="empNo">
		                                	
		                                    <span class="name" id="nicNameOri">
			                                   	<em id="nicNameTem">${feed.nicName}</em>
			                                   	<em class="feedName">${feed.replyName}</em>
			                                   	
			                                    <c:if test="${loginEmp.empl_no eq  feed.empNo}">
				                                    <i class="fa-solid fa-pen" onClick="nicModi_fun()"></i>
			                                    </c:if>
		                                    </span>
		                                    
		                                    <span id="nicNameModifyBox" style="display:none;">
		                                    	<input type="text" name="nicNameValue" value="${feed.nicName}" id="nicNameValue" />
		                                    	 
												<button type="button" onClick="nicname_modi_go()"><i class="fa-solid fa-check-double"></i></button>
												<button type="button" onClick="nicName_ban()" ><i class="fa-solid fa-ban"></i></button>
											</span>
		                                    
		                                    <span>${feed.userDept}</span>
		                                </div>
		                                
		                                
	
		                                <ul class="flex">
		                                    <li>
		                                        <span><i class="fa-solid fa-image"></i></span>
		                                        <span id="imgNumCount">0</span>
		                                    </li>
		
		                                    <li>
		                                        <span><i class="fa-solid fa-video"></i></span>
		                                        <span id="videoNumCount">0</span>
		                                    </li>
		
		                                    <li id="LikeNum">
		                                        <span><i class="fa-solid fa-heart"></i></span>
		                                        <span id="LikeCount">${feed.likeGoob }</span>
		                                    </li>
		                                    
		                                   <li>
		                                   		<span><i class="fa-solid fa-comment-dots"></i></span>
		                                   		<span id="replyNumCount">00</span>
		                                   </li>
		                                </ul>
	                                </div>
	                                <div class="feed-good" id="clickHeart" >
	                                	<c:set var="likeTo" value="${like.likeCheck }" />
	                                	<c:choose>
											<c:when test="${empty likeTo}">
											    <i class="fa-solid fa-heart" id="likeButton"></i>
	                                			<span>click! like!</span>
												<input type="hidden" value="0" id="likeCheck" />
											</c:when>
	
											<c:otherwise>
												<i class="fa-solid fa-heart on" id="likeButton"></i>
	                                			<span>click! like!</span>
												<input type="hidden" value="${likeTo }" id="likeCheck" />
											</c:otherwise>
										</c:choose>

	                                
	                                
	                                	
	                                </div>
	                                
	                               
                                </div>
                                
                                <div class="greeting" id="messageTemple">
                                	<div class="flex ju-sp-bt">
										<div class="feed-txt" id="messageCon">${feed.mssage }</div>
									                                	
									    <c:if test="${loginEmp.empl_no eq  feed.empNo}">
										<button type="button" id="boxBtn" onClick="txtModi_fun()"><i class="fa-solid fa-pen"></i></button>
									     </c:if>
									</div>
                                </div>
                                
                                <div class="greeting" id="modiBtn" style="display:none;">
                                	<div class="flex ju-sp-bt al-it-ce">
                                		<textarea id="messageBox">${feed.mssage }</textarea>
										<div class="flex al-it-ce">
											<button type="button" onClick="feed_modi_go()"><i class="fa-solid fa-check-double"></i></button>
											<button type="button" onClick="feed_ban()"><i class="fa-solid fa-ban"></i></button>
										</div>
                                	</div>
                                </div>
                            </div>
                        </div>

						<div class="feed-con">
							<div class="f-con fcon01">
									<i class="fa-solid fa-angle-left" id="addScrollLeft"></i>
									<i class="fa-solid fa-angle-right" id="addScrollRight"></i>
							
                                   <div class="feedmem-list">
                                        <ul class="flex">
                                         	<c:forEach items="${feedAddress }" var="fda">
	                                            <li class="flex al-it-ce" onClick="moveFeed_go('${fda.empNo}')">
	                                                <div id="addreMemPic" class="feedmem-Img" data-id="${fda.empNo }"></div>
	                                                <div class="feed-name flex al-it-ce">
	                                                    <div>
	                                                    	<i class="fa-solid fa-house-user"></i>
	                                                    </div>
	                                                    
	                                                    <div>
		                                                    ${fda.nicName }
		                                                   <p>${fda.feedName }</p>
	                                                   </div>
	                                                </div>
	                                                <%-- 
	                                                <input type="hidden" id="fdaEmpNo" value="${fda.empNo}" /> --%>
	                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                            </div>
						</div>


                        <div class="feed-con flex ju-sp-bt" style="padding-bottom: 20px;">
                        
    
                            <div class="f-con fcon02">
                            	<div>
                            		<c:if test="${loginEmp.empl_no eq feed.empNo }" >
                            		
                            		<form id="feedImgForm" role="feedform" class="form-horizontal" method="post" enctype="multipart/form-data">		   
		                            	<input type="hidden" name="unity" value="${feed.unity}"/>
		                            	<div class="feed-upload mb-10">
		                                    <div class="submitFileUpBtn">
		                                    	<div class="flex ju-sp-bt">
			                                    	<button type="button" class="imgCencal" onclick="cencleBg_ch()">취소</button>
			                                    	<button type="button" class="imgUpload" onclick="feedImgCon_go()">파일 업로드</button>
		                                    	</div>
		                                    </div>
		                                    
		                                    
		                                    <div class="filebox">
		                                        <input class="upload-name">
		                                        <label for="file" id="Thumbnail"><i class="fa-solid fa-plus"></i></label> 
		                                        <input id="file" class="form-control" type="file" name="uploadFile" onchange="feedImg_go();">
		                                        <input type="hidden" name="checkUpload" value="0" />	
		                                    </div>
		                               </div>
	                               </form>
	                               
	                               </c:if>
                            	
                            	
                                <div id="feedFileList" class="flex flex-wrap">
                                
                                	<c:forEach items="${upFileList }" var="upf">
                                	
                                		 <c:choose>
		                                        <c:when test="${(upf.fileType eq 'JPG') or (upf.fileType eq 'JEPG') or (upf.fileType eq 'GIF') or (upf.fileType eq 'PNG')}">
		                                        
		                                        	 	
		                                        	 	
													  <div class="f-view" id="feedView" data-id="${upf.unityatchmnflno }" data-ano="${upf.ano }">
													  <%-- '"+contextPath+"/feed/getPicture.do?id="+id+"'
													  '<%=request.getContextPath() %>'/feed/getMemPicture.do?id="+id+"' --%>
													  	<div class="f-modi" style="display:none" onClick="delete_Con(this)">
													  		<i class="fa-solid fa-xmark"></i>
													  		<input type="hidden" name="uni" value="${upf.unityatchmnflno }" />
		                                        	 	    <input type="hidden" name="ano" value="${upf.ano }" />
													  	</div>
				                                   	 </div>
				                                   	 
		                                        </c:when>
		                                        
		                                        <c:when test="${upf.fileType eq 'MP4'}">
		                                        	<div class="f-view video" id="feedVideo" data-id="${upf.unityatchmnflno }" data-ano="${upf.ano }">
		                                        	  <video muted autoplay loop>
												        <source src="videos/Network.mp4" type="video/mp4">
												      </video>
												      
												      <div class="f-modi" style="display:none" onClick="delete_Con(this)">
												      		<i class="fa-solid fa-xmark"></i>
												      		<input type="hidden" name="uni" value="${upf.unityatchmnflno }" />
		                                        	 	    <input type="hidden" name="ano" value="${upf.ano }" />
												      </div>
												     </div>
		                                        </c:when>
                                		</c:choose>
                                	
                                		
	                                   	 
	                                   	 <!-- <video muted autoplay loop>
									        <source src="videos/Network.mp4" type="video/mp4">
									      </video> -->
                                    </c:forEach>
                                    
                                </div>
                            </div>
						</div>
								
                            <div class="f-con fcon03">
                                  <div class="up up-btn"><i class="fa-solid fa-hand-point-up"></i></div>
                                
                               
                                <div class="coWrap" id="replyTemple">
                                
                                <c:forEach items="${reply }" var="rep">
                            		<input type="hidden" id="replyNo" name="replyNo" value="${rep.replyNo}" />
	                                <div class="comment mb-20">
	                                	<div class="flex ju-sp-bt">
		                                    <div class="feedmem-Img" id="feedNewMark" data-id="${rep.replyEmp }">
		                                    	<span class="newReply"><img src="/mzgw/resources/images/new.png"></span>
		                                    </div>
		                                    
		                                    <div class="commen-balloon">
		                                    	<div class="replyFormBox fromB01" id="openReply">
		                                    	 	
			                                        <div class="com-con" id="replyconText">
			                                         	${rep.replyText }
			                                        </div>
			                                        
			                                        <c:if test="${loginEmp.empl_no eq  rep.replyEmp}">
				                                        
			                                    		<input type="hidden" id="replyEmp" value="${loginEmp.empl_no }">
			                                    		
				                                        <div class="com-modibtn">
				                                        	<div>
					                                            <i class="fa-solid fa-pen" onclick="reply_modify(this)"></i>
					                                            <i class="fa-solid fa-xmark" onClick="reply_delete(this)"></i>
					                                            
					                                            <input type="hidden" id="replyDeleteType" value="${rep.replyType }" />
					                                            <input type="hidden" id="replyDeleteNo" value="${rep.replyNo }" />
				                                            </div>
				                                        </div>
			                                        </c:if>
		                                        </div>
		                                        
		                                        <div class="replyFormBox fromB02" id="closeReply" style="display:none;">
			                                         <div class="com-con" id="sib">
			                                         	<input type="hidden" id="replyModiType" value="${rep.replyType }" />
			                                         	<input type="hidden" id="replyModiNo" value="${rep.replyNo }" />
			                                         	<input type="hidden" id="replyModiEmp" value="${rep.replyEmp }" />
			                                         	<input type="hidden" id="feedModiEmp" value="${rep.feedEmp }" />
			                                         	
			                                         	<textarea id="modiReply" name="modiReply">${rep.replyText }</textarea>
			                                         </div>
	                                        	
		                                        	 <div class="com-modibtn">
			                                        	<div>
															<i class="fa-solid fa-check-double" onClick="reply_modiTxt_go(this)"></i>
															<i class="fa-solid fa-ban" onClick="cencel_reply(this)"></i>
														</div>
			                                        </div>
		                                        </div>
		                                    </div>
		                                    
	                                    </div>
	                                    <div class="reply-name">
	                                    	<div class="flex ju-sp-bt">
			                                    <span>${rep.replyName } </span>
			                                  
			                                  
			                                    <span>${rep.replyDate }</span>
			                                      <input type="hidden" id="replyDate" name="replyDate" value="${rep.replyDate }" />
		                                    </div>
	                                    </div>
	                                    
	                                    
	                                  
	                                </div>
                                </c:forEach>
                                
                              
                            	</div>
                                
                                  <div class="com-re">
                                	<input type="hidden" id="replyType" name="replyType" value="${feed.replyNo }" />
                                	<input type="hidden" id="replyEmp" name="replyEmp" value="${loginEmp.empl_no }" />
                                	<input type="hidden" id="replyName" name="replyName" value="${loginEmp.name }" />
                                
                                	
                                	<textarea id="replyText" name="replyText"></textarea>
                                	
                                   <div class="com-btn flex ju-sp-bt al-it-ce">
                                       <span><i class="fa-solid fa-user"></i>${loginEmp.name }</span>
                                       <button type="button" onClick="feed_replyGo()"><i class="fa-solid fa-paper-plane"></i></button>
                                   	 
                                   </div>
                                </div>
                             </div>
                        </div>
                   </div>

                  

                   
                   

                
                
            </div>
       </div>
</div>

<form role="imageForm" action="upload/picture" method="post" 
	  enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control"
		   onchange="picture_go();"	style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<form role="proImageForm" action="upload/picture" method="post" 
	  enctype="multipart/form-data">
	<input id="inputProfile" name="pictureFile" type="file" class="form-control"
		   onchange="proPicture_go();"	style="display:none;">
	<input id="proOldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<!-- <form role="feedContentImg" action="upload/picture" method="post" 
	  enctype="multipart/form-data">
	<input id="file" name="pictureFile" type="file" class="form-control"
		   onchange="feedImg_go();"	style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form> -->


<script type="text/x-handlebars-template"  id="feedReply-template" >
{{#each .}}
<div class="comment mb-20">
	 <div class="flex ju-sp-bt">
		
		
		<div class="feedmem-Img" id="feedNewMark" style="background:{{userImg replyEmp}}; 
		background-position: center center; background-repeat: no-repeat; background-size: cover;">
		
		{{#ifDate replyDate}}
			<span class="newReply"><img src="/mzgw/resources/images/new.png"></span>	
		{{/ifDate}}
		</div>
		

		
		                                    
		<div class="commen-balloon">
		     <div class="replyFormBox fromB01" id="openReply">
		                                    	 	
			 <div class="com-con" id="replyconText">
			      {{replyText}}
			 </div>
			                                        
		
		{{#VisibleByLoginCheck replyEmp }}		                                        
			  <input type="hidden" id="replyEmp" value="${loginEmp.empl_no }">
			                                    		
				 <div class="com-modibtn">
				     <div>
					  <i class="fa-solid fa-pen" onclick="reply_modify(this)"></i>
					  <i class="fa-solid fa-xmark" onclick="reply_delete(this)"></i>
					  <input type="hidden" id="replyDeleteType" value="{{replyType}}" />
					  <input type="hidden" id="replyDeleteNo" value="{{replyNo}}" />
				     </div>
				 </div>
		{{/VisibleByLoginCheck}}
		   </div>
		                                        
		  <div class="replyFormBox fromB02" id="closeReply" style="display:none;">
			       <div class="com-con" id="sib">
			                 <input type="hidden" id="replyModiType" value="{{replyType}}" />
			                  <input type="hidden" id="replyModiNo" value="{{replyNo}}" />
			                  <input type="hidden" id="replyModiEmp" value="{{replyEmp}}" />
			                  <input type="hidden" id="feedModiEmp" value="{{feedEmp}}" />
			         <textarea id="modiReply" name="modiReply">{{replyText}}</textarea>
			      </div>
	                                        	
		  <div class="com-modibtn">
			    <div>
					<i class="fa-solid fa-check-double" onclick="reply_modiTxt_go(this)"></i>
						<i class="fa-solid fa-ban" onclick="cencel_reply(this)"></i>
					</div>
			  </div>
		   </div>
		 </div>
		                                    
	     </div>
	        <div class="reply-name">
	      <div class="flex ju-sp-bt">
			<span>  {{replyName}} </span>
			                                  
			<span>{{#prettifyDate replyDate}}{{/prettifyDate}}</span>
			    <input type="hidden" id="replyDate" name="replyDate" value="{{replyDate}}" />
		   </div>
	  </div>                           
	</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="feedReplyUpdate-template" >
	<div class="comment mb-20">
	 <div class="flex ju-sp-bt">

		<div class="feedmem-Img" id="feedNewMark" style="background:{{userImg replyEmp}}; 
		background-position: center center; background-repeat: no-repeat; background-size: cover;">
		
		{{#ifDate replyDate}}
			<span class="newReply"><img src="/mzgw/resources/images/new.png"></span>	
		{{/ifDate}}
		</div>
	
		                                    
		<div class="commen-balloon">
		     <div class="replyFormBox fromB01" id="openReply">
		                                    	 	
			 <div class="com-con" id="replyconText">
			      {{replyText}}
			 </div>
			                                        
		
			                                        
			  <input type="hidden" id="replyEmp" value="${loginEmp.empl_no }">
			                                    		
				 <div class="com-modibtn">
				     <div>
					  <i class="fa-solid fa-pen" onclick="reply_modify(this)"></i>
					  <i class="fa-solid fa-xmark" onclick="reply_delete(this)"></i>
					  <input type="hidden" id="replyDeleteType" value="{{replyType}}" />
					  <input type="hidden" id="replyDeleteNo" value="{{replyNo}}" />
				     </div>
				 </div>
		
		   </div>
		                                        
		  <div class="replyFormBox fromB02" id="closeReply" style="display:none;">
			       <div class="com-con" id="sib">
			              <input type="hidden" id="replyModiType" value="{{replyType}}" />
			                  <input type="hidden" id="replyModiNo" value="{{replyNo}}" />
			                  <input type="hidden" id="replyModiEmp" value="{{replyEmp}}" />
			                  <input type="hidden" id="feedModiEmp" value="{{feedEmp}}" />
			                                         	
			         <textarea id="modiReply" name="modiReply">{{replyText}}</textarea>
			      </div>
	                                        	
		  <div class="com-modibtn">
			    <div>
					<i class="fa-solid fa-check-double" onclick="reply_modiTxt_go(this)"></i>
						<i class="fa-solid fa-ban" onclick="cencel_reply(this)"></i>
					</div>
			  </div>
		   </div>
		 </div>
		                                    
	     </div>
	        <div class="reply-name">
	      <div class="flex ju-sp-bt">
			<span>  {{replyName}} </span>
			                                  
			<span>{{replyDate}}</span>
			    <input type="hidden" id="replyDate" name="replyDate" value="${{replyDate}}" />
		   </div>
	  </div>                           
	</div>
</script>

<script type="text/x-handlebars-template"  id="feedModifyReply-template">
<scr{{!}}ipt>
	 $(obj).parents('#openReply').find('#replyconText').text("{{replyText}}");
</scr{{!}}ipt>
</script>

<script type="text/x-handlebars-template"  id="feedMessage-template">
<scr{{!}}ipt>
	$('#messageCon').text("{{mssage}}");
</scr{{!}}ipt>
</script>

<script type="text/x-handlebars-template"  id="feedNicName-template">
<scr{{!}}ipt>
	$('#nicNameTem').text("{{nicName}}");
</scr{{!}}ipt>
</script>

<script>
	var formData = "";	
	/*============== 이미지 추가 자바스크립트 ==============*/
	<%-- var id = $('input[name=uni]').val;
	var contextPath = '<%=request.getContextPath()%>';
	var srcCh = document.getElementsByClassName("imgSrc")[0].src = "" + contextPath + "/feed/getFeedImg.do?id=" + id + "";
	
	console.log(srcCh); --%>
	
	function delete_Con(obj){
		var uni = $(obj).children("input[name='uni']").val();
		var ano = $(obj).children("input[name='ano']").val();
		
		var data = {"unityatchmnflno" : uni,
					"ano" : ano
		}
		
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
      				url : '<%=request.getContextPath()%>/feed/feedDeleteContent',
      				type : 'post',
      				data : JSON.stringify(data),
      				contentType : 'application/json',
      				success : function(result){
      					
      				   Swal.fire({
      					 	title: "삭제되었습니다.",
      			               icon: 'success',
      			               confirmButtonColor: '#3085d6',
      			               confirmButtonText: '확인'
      			               
      			           }).then((result) => {
      			        	 window.location.reload() 
      			           });
      				  
      				},
      				error : function(error){
      					alert("실패");
      				}
      			});													                       
              }
          }); 
		
     
		console.log(uni);
		console.log(ano);
	}
	
	
	
	
	feedViewImg('<%=request.getContextPath()%>');
	feedVideoTh('<%=request.getContextPath()%>');
	
	function feedViewImg(contextPath){
		 for(var target of document.querySelectorAll('#feedView')){	
			 var id = target.getAttribute('data-id');
			 var ano = target.getAttribute('data-ano');
			 
			 target.style.backgroundImage="url('"+contextPath+"/feed/getFeedImg.do?unityatchmnflno="+id+"&ano="+ano+"')";
			 target.style.backgroundPosition="center";
			 target.style.backgroundRepeat="no-repeat";
			 target.style.backgroundSize="cover";
		}
	}
	
	function feedVideoTh(contextPath){
		 var index = 0;
		
		 for(var target of document.querySelectorAll('#feedVideo')){	
			 var id = target.getAttribute('data-id');
			 var ano = target.getAttribute('data-ano'); 
			 
			var videoFile = ""+contextPath+"/feed/video?unityatchmnflno="+id+"&ano="+ano+"";
			
			console.log(videoFile);
			
			$('.f-view.video video source').eq(index++).attr('src', videoFile);
			
		 }
	}

	function feedImg_go(){
		
		var form = $('form[role="feedImgForm"]');
		
		 var picture = $('input[name=uploadFile]').val();
		 
		 var pictureReader = document.getElementById("file");
		 var pictureView = document.getElementById("file").files[0];
		 var fileSize = document.getElementById("file").files[0].size;
		 
		 var fileFormat = picture.substr(picture.lastIndexOf(".") + 1).toUpperCase();
		 
		 if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="GIF" || fileFormat=="PNG" || fileFormat=="MP4")){
			 alert("이미지는 jpg/jpeg/png/gif/mp4 형식만 가능합니다.");
			 return;
		 }
		 
		 
		//이미지 파일 용량 체크
	   if(fileSize>1024*1024*3){
	      alert("사진 용량은 3MB 이하만 가능합니다.");
	      picture.value="";
	      return;
	   };
		 
	   
	   if (pictureReader.files && pictureView) {
			
			var reader = new FileReader();
			
			reader.onload = function (e) {
				 $('#Thumbnail').css({'background-image':'url('+e.target.result+')',
	                 'background-position':'center',
	                 'background-size':'contain',
	                 'background-repeat':'no-repeat'
	                 });
			}
			
			reader.readAsDataURL(pictureView);
			
		};
		
		$('#Thumbnail .fa-solid.fa-plus').css('display', 'none');
	   
		console.log(pictureReader.files);
		console.log(pictureView);
		console.log(picture);
		console.log(fileSize);
		console.log(fileFormat);
		
	}
	

	function feedImgCon_go(){
		var form = document.querySelector("#feedImgForm");
		
		if($('input[name=uploadFile]').val() == ""){
			alert("파일을 넣어주세요");
			return
		}else{
			form.action = "<%=request.getContextPath()%>/feed/feedImgContent";
		    form.submit();
		}
	    
		console.log($('input[name=unity]').val());
		console.log($('input[name=uploadFile]').val());
		console.log("폼");
	}
		
	

	$('.f-view').hover(function(){
		var feedEmp = $('input[name="feedEmp"]').val();
		var empNo = $('input[name="empNo"]').val();
		
		if(feedEmp == empNo){
			 $(this).children('.f-modi').css('display','block');
		}
    }, function() {
    	
        $(this).children('.f-modi').css('display','none');
    });
	


</script>




<script>
$("#likeButton").click(function(event){
	var feedEmp = document.getElementById('feedEmp').value;
	
	if($("#likeCheck").val()=='1'){
		 document.getElementById('likeButton').className ='fa-solid fa-heart';
		 document.getElementById('likeCheck').value = "0"
	}else{
		 document.getElementById('likeButton').className = 'fa-solid fa-heart on';
		 document.getElementById('likeCheck').value = "1"
	}

    var data = {"feedEmp" : feedEmp,
                "likeCheck" : $('#likeCheck').val() 
   	}


 		$.ajax({
            url : '<%=request.getContextPath()%>/feed/like',
			type : "post",
			data : JSON.stringify(data),
            contentType : 'application/json',
			success : function(data) {
				var temp = '<span id="LikeCount">' + data + '</span>';
				$("#LikeCount").remove();
				$('#LikeNum').append(temp);
	
				console.log(data);
			}
		});
	});
	

	function moveFeed_go(fdaNo){
		location.href = "feedMove?empNo=" + fdaNo;
	}



	
</script>

<script>
		var formData = "";	
		/*============================== 상단 스크롤============================== */
		$('.up').on('click',function(e){
			e.preventDefault();
			$('#replyTemple').animate({scrollTop:0},1000);
		});
		
		/*============================== 주소록 스크롤============================== */
		$('#addScrollRight').on('click',function(e){
			/* var _scrollX = $('.f-con.fcon01').scrollLeft();
			  $('.f-con.fcon01').scrollLeft(_scrollX + 100).animate(1000); */
			
			 e.preventDefault();
			$('.f-con.fcon01').animate({scrollLeft: "+=150"},1000);
		});
		
		$('#addScrollLeft').on('click',function(e){
			e.preventDefault();
			$('.f-con.fcon01').animate({scrollLeft: "-=150"},1000);
		});
		
		
		
		/*============================== 숫자 제이쿼리============================== */
		var reply = $("#replyTemple > div").length;
		function replyListNum(){
       		
       		
       		var fileFromList = $("#feedFileList > div").length;
       		var jpgNum = 0;
       		var videoNum = 0;
       		
       		console.log(fileFromList);
       		$("#replyNumCount").text(reply);
       	}
		
		replyListNum();
		/*============================== new 스티커============================== */
		function timeTip(){
			var replyArr = document.querySelectorAll(".comment");
			
			var today = new Date();
			var date = today.getDate();
			
			for (let i = 0; i < replyArr.length; i++) {
				var replyDate = $(replyArr[i]).find("input[name='replyDate']");
				var newtoday = new Date(replyDate.val());
				var getNewDate = newtoday.getDate();
				
				if(getNewDate !== date){
					$(replyArr[i]).find(".newReply").css("display", "none");
				}
			}
		};
		
		timeTip();
		
		/*============================== 댓글 작성============================== */
		function feed_replyGo(target, templateObject){
			var replyType =  document.getElementById('replyType').value;
			var replyEmp = document.getElementById('replyEmp').value;
			var replyText = document.getElementById('replyText').value;
			var replyName = document.getElementById('replyName').value;
			var feedEmp = document.getElementById('feedEmp').value;
			//var replyModiNo = $(obj).parents('.com-modibtn').siblings('#sib').find('#replyModiNo').val();
			
			var replyTemplt = document.getElementById('replyTemple').value;
			
			
			var addData = {"replyType" : replyType,
						   "replyEmp" : replyEmp,
						   "replyText" : replyText,
						   "feedEmp" : feedEmp};
			
			
			let today = new Date();   
	
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let day = today.getDay();  // 요일
	
			let replyDay = year + "-" + month + "-" + date;
			
			$.ajax({
				url : '<%=request.getContextPath()%>/feed/feedReplyInsert',
				type : 'post',
				data : JSON.stringify(addData),
				contentType : 'application/json',
				success : function(result){
					
					addData = {"replyType" : replyType,
							   "replyEmp" : replyEmp,
							   "replyText" : replyText,
							   "feedEmp" : feedEmp,
							   "replyNo" : result,
							   "replyName" : replyName,
							   "replyDate" : replyDay
							  
					};
					
					/*  ReplyprintData(result, $('#replyTemple'), $('#feedReplyUpdate-template')); */
					 ReplyprintData(addData, $('#replyTemple'), $('#feedReplyUpdate-template'));
					 $("#replyNumCount").text(reply + 1);
				},
				error : function(error){
					 alert('등록실패');
				}
			});
			
			$('#replyTemple').animate({scrollTop:0},1000);
	
			function ReplyprintData(reply, target, templateObject){
			   let template=Handlebars.compile(templateObject.html());
			   let temp = template(reply);   
			   /* $('.comment').remove(); */
			   target.prepend(temp);
			}
			
			
			$('#replyText').val("");
			
			console.log(addData);
		}
		
		
		/*============================== 상태메세지 수정============================== */
		function feed_modi_go(){
			
			var empNo =  document.getElementById('empNo').value;
			var messageBox =  document.getElementById('messageBox').value;
			
			var addData = {"empNo" : empNo,
					       "mssage" : messageBox};
			
			$.ajax({
				url : '<%=request.getContextPath()%>/feed/feedMessage',
				type : 'post',
				data : JSON.stringify(addData),
				contentType : 'application/json',
				success : function(result){
					 alert('등록성공');
					 $('#messageCon').text("");
					 FeedMessage(addData, $('#messageTemple'), $('#feedMessage-template'));
					 
					 $('.greeting ').css('display', 'block');
					 $('#boxBtn').css('display', 'block');
					 $('#modiBtn').css('display', 'none');
				},
				error : function(error){
					 alert('등록실패');
				}
			});
			
			function FeedMessage(feed, target, templateObject){
				   let template=Handlebars.compile(templateObject.html());
				   let temp = template(feed);  
				   target.prepend(temp);
			}
			
			
		}
		
		/*============================== 닉네임 변경============================== */
		function nicname_modi_go(){
			
			var empNo =  document.getElementById('empNo').value;
			var nicNameValue =  document.getElementById('nicNameValue').value;
			
			var addData = {"empNo" : empNo,
				       	   "nicName" : nicNameValue};
			
			$.ajax({
				url : '<%=request.getContextPath()%>/feed/feedNicName',
				type : 'post',
				data : JSON.stringify(addData),
				contentType : 'application/json',
				success : function(result){
					 alert(result);
					 
					 if(result == "중복되는 닉네임 입니다."){
						 $('#nicNameTem').text();
					 }else{
						 $('#nicNameTem').text("");
						 FeedNicName(addData, $('#nicNameOri'), $('#feedNicName-template'));
					 }
				},
				error : function(error){
					 alert('등록실패');
				}
			});
			
			function FeedNicName(feed, target, templateObject){
				   let template=Handlebars.compile(templateObject.html());
				   let temp = template(feed);   
				   target.prepend(temp);
			}
			
			$('#nicNameModifyBox').css('display', 'none');
			$('#nicNameOri').css('display', 'block');
		}
		
		
		/*============================== 댓글 수정============================== */
		function reply_modiTxt_go(obj){
			
            var replyModiType = $(obj).parents('.com-modibtn').siblings('#sib').find('#replyModiType').val();
            var replyModiNo = $(obj).parents('.com-modibtn').siblings('#sib').find('#replyModiNo').val();
            var replyModiEmp = $(obj).parents('.com-modibtn').siblings('#sib').find('#replyModiEmp').val();
            var feedModiEmp = $(obj).parents('.com-modibtn').siblings('#sib').find('#feedModiEmp').val();
            var modiReply = $(obj).parents('.com-modibtn').siblings('#sib').find('#modiReply').val();
            
            
            
			
        	var addData = {"replyType" : replyModiType,
				       	   "replyNo" : replyModiNo,
				       	   "replyEmp" : replyModiEmp,
				       	   "feedEmp" : feedModiEmp,
				       	   "replyText" : modiReply
				   };
        	
            console.log(addData.replyType);
            console.log(addData.replyNo);
            console.log(addData.replyEmp);
            console.log(addData.feedEmp);
            console.log(addData.replyText);
            
            
			
			 $.ajax({
				url : '<%=request.getContextPath()%>/feed/replyModify',
				type : 'post',
				data : JSON.stringify(addData),
				contentType : 'application/json',
				success : function(result){
					 alert('수정성공');
					 
					ReplyprintData(result, $('#replyTemple'), $('#feedReply-template'));
					/* replyModifyFunc(modiReply, $(obj).parents('#openReply').find('#replyconText'), $('#feedModifyReply-template')); */
					
				},
				error : function(error){
					 alert('수정실패');
				}
			});
			 
			/* function replyModifyFunc(modiT, target, templateObject){
				   let template=Handlebars.compile(templateObject.html());
				   let temp = template(modiT);   
			} */
		 	function ReplyprintData(reply, target, templateObject){
			   let template=Handlebars.compile(templateObject.html());
			   let temp = template(reply);   
			   target.empty();
			   target.append(temp);
			}
			
			 
			$(obj).parents('#closeReply').css('display', 'none');
			$(obj).parents('#closeReply').siblings('#openReply').css('display', 'block');
		}
		
		/*============================== 댓글 삭제============================== */
		function reply_delete(obj){
			var replyDeleteType = $(obj).siblings('#replyDeleteType').val();
			var replyDeleteNo = $(obj).siblings('#replyDeleteNo').val();
			
			
			var addData = {"replyType" : replyDeleteType,
						   "replyNo" : replyDeleteNo
			};
			
			if(confirm("삭제하시겠습니까?")){
			 $.ajax({
					url : '<%=request.getContextPath()%>/feed/deleteReply',
					type : 'post',
					data : JSON.stringify(addData),
					contentType : 'application/json',
					success : function(result){
						 alert('삭제성공');
						 
						 ReplyprintData(result, $('#replyTemple'), $('#feedReply-template'));
						 
						 $("#replyNumCount").text(reply - 1);
					},
					error : function(error){
						 alert('삭제실패');
					}
				});
			}
			
			function ReplyprintData(reply, target, templateObject){
			   let template=Handlebars.compile(templateObject.html());
			   let temp = template(reply);   
			   $('.comment').remove();
			   target.prepend(temp);
			}
			
			
			console.log(replyModiType);
			console.log(replyModiNo);
		}
		
		
		/*============================== 상태 메세지 제이쿼리============================== */
		function txtModi_fun(){
			$('.greeting ').css('display', 'none');
			$('#boxBtn').css('display', 'none');
			$('#modiBtn').css('display', 'block');
		}
		
		function feed_ban(){
			$('.greeting ').css('display', 'block');
			$('#boxBtn').css('display', 'block');
			$('#modiBtn').css('display', 'none');
		}
		
		
		
      	
		/*============================== 닉네임 제이쿼리============================== */
		function nicModi_fun(){
			$('#nicNameOri').css('display', 'none');
			$('#nicNameModifyBox').css('display', 'block');
		}
		
		function nicName_ban(){
			$('#nicNameModifyBox').css('display', 'none');
			$('#nicNameOri').css('display', 'block');
		}

		
		/*============================== 댓글 제이쿼리============================== */
		function reply_modify(obj){
			$(obj).parents('#openReply').css('display', 'none');
			$(obj).parents('#openReply').siblings('#closeReply').css('display', 'block');
		}
		
		function cencel_reply(obj){
			$(obj).parents('#closeReply').css('display', 'none');
			$(obj).parents('#closeReply').siblings('#openReply').css('display', 'block');
		}
		
		
		/*============================== 배경 바꾸기 버튼 제이쿼리============================== */
		function bgCh_func(){
			$('#bgPicUp').css('display', 'none');
			$('#bgPictureUpFileBtn').css('display', 'block');
		}
		
		function cencleBg_ch(){
			location.reload();
		}
		
		/*============================== 프로필 바꾸기 버튼 제이쿼리============================== */
		function profile_img(){
			$('#proFileOn').css('display', 'none');
			$('#proFileOff').css('display', 'block');
		}
		
		function cenclePro_ch(){
			location.reload();
		}
    
		
		
		
		
		/*============================== 피드 배경 사진 바꾸기============================== */
	
	
		function picture_go(){
			//alert("file change!");
			
		   var form = $('form[role="imageForm"]');
		   var picture = form.find('[name=pictureFile]')[0];
			   
		   formData = new FormData($('form[role="imageForm"]')[0]);
		   
		   //이미지 확장자 jpg 확인
		   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
			if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="GIF" || fileFormat=="PNG")){
		   		alert("이미지는 jpg/jpeg/gif/png 형식만 가능합니다.");
		   		picture.value="";      
		   		return;
			} 
		
			//이미지 파일 용량 체크
		   if(picture.files[0].size>1024*1024*1){
		      alert("사진 용량은 1MB 이하만 가능합니다.");
		      picture.value="";
		      return;
		   };
			
		   //업로드 확인변수 초기화 (사진변경)
		   form.find('[name="checkUpload"]').val(0);	
		   document.getElementById('inputFileName').value=picture.files[0].name;
		   
		   
		   if (picture.files && picture.files[0]) {
			
				var reader = new FileReader();
				
				reader.onload = function (e) {
					 $('div#feedBackImg').css({'background-image':'url('+e.target.result+')',
		                 'background-position':'center',
		                 'background-size':'cover',
		                 'background-repeat':'no-repeat'
		                 });
				}
				
				reader.readAsDataURL(picture.files[0]);
			}
		}
	
		function upload_go(){
			//alert('upload btn click');
			
		   if(!$('input[name="pictureFile"]').val()){
			  alert("사진을 선택하세요.");
			  $('input[name="pictureFile"]').click();
			  return;
		   	}  
		   if($('input[name="checkUpload"]').val()==1){
		      alert("이미업로드 된 사진입니다.");
		      return;      
			}
		   
		   $.ajax({
			  url: '<%=request.getContextPath()%>/feed/picture',
		      data:formData,
		      type:'post',
		      processData:false,
		      contentType:false,
		      success:function(data){
		    	  //업로드 확인변수 세팅
		          $('input[name="checkUpload"]').val(1);
		          //저장된 파일명 저장.
		          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
		          $('form[role="form"]  input[name="backImg"]').val(data);	    	  
		    	  alert("사진이 업로드 되었습니다.");
		    	  regist();
		      },
		      error:function(error){
		          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
		      }
		   });
		}
		
		MemberPictureThumb('<%=request.getContextPath()%>');
		
		function MemberPictureThumb(contextPath){
			 for(var target of document.querySelectorAll('#myFeedImg')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/feed/getMemPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
		
		/*============================== 프로필 이미지  바꾸기============================== */
	
		function proPicture_go(){
			var form = $('form[role="proImageForm"]');
			   var picture = form.find('[name=pictureFile]')[0];
				   
			   formData = new FormData($('form[role="proImageForm"]')[0]);
			   
			   //이미지 확장자 jpg 확인
			   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
				if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
			   		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
			   		picture.value="";      
			   		return;
				} 
			
				//이미지0 파일 용량 체크
			   if(picture.files[0].size>1024*1024*1){
			      alert("사진 용량은 1MB 이하만 가능합니다.");
			      picture.value="";
			      return;
			   };
				
			   //업로드 확인변수 초기화 (사진변경)
			   form.find('[name="checkUpload"]').val(0);	
			   document.getElementById('inputProfileImg').value=picture.files[0].name;
			   
			   
			   if (picture.files && picture.files[0]) {
				
					var reader = new FileReader();
					
					reader.onload = function (e) {
						 $('div#myFeedImg').css({'background-image':'url('+e.target.result+')',
			                 'background-position':'center',
			                 'background-size':'cover',
			                 'background-repeat':'no-repeat'
			                 });
					}
					
					reader.readAsDataURL(picture.files[0]);
				}
		}
		
		function profile_go(){
			var form = $('form[role="proImageForm"]');
			
			if(!form.find('[name="pictureFile"]').val()){
				  alert("사진을 선택하세요.");
				  form.find('[name="pictureFile"]').click();
				  return;
			   	}  
			
		   if($('input[name="checkUpload"]').val()==1){
		      alert("이미업로드 된 사진입니다.");
		      return;      
			}
		   
		   $.ajax({
			  url: '<%=request.getContextPath()%>/feed/picture',
		      data:formData,
		      type:'post',
		      processData:false,
		      contentType:false,
		      success:function(data){
		    	  //업로드 확인변수 세팅
		          form.find('[name="checkUpload"]').val(1);
		          //저장된 파일명 저장.
		          form.find('#oldPicture').val(data); // 변경시 삭제될 파일명	          
		          $('form[role="proform"]  input[name="profileImg"]').val(data);
		    	  alert("사진이 업로드 되었습니다.");
		    	  
		    	  proregist();
		    	  
		      },
		      error:function(error){
		          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
		      }
		   });
		}
		
		
		MemberProFilePictureThumb('<%=request.getContextPath()%>');
		
		function MemberProFilePictureThumb(contextPath){
			 for(var target of document.querySelectorAll('#feedBackImg')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/feed/getPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
		
		
		/*============================== 주소록 프로필 이미지============================== */
		AddressMemberPictureThumb('<%=request.getContextPath()%>');
		
		function AddressMemberPictureThumb(contextPath){
			 for(var target of document.querySelectorAll('#addreMemPic')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/feed/getMemPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
		
		/*============================== 댓글 이미지============================== */
		ReplyMemberPictureThumb('<%=request.getContextPath()%>');
		
		function ReplyMemberPictureThumb(contextPath){
			 for(var target of document.querySelectorAll('#feedNewMark')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/feed/getMemPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}

		/*============================== 이미지 변경 form============================== */
		function regist(){
			var form = document.querySelector("#registForm");
		 	form.action = "<%=request.getContextPath()%>/feed/regist";
		    form.submit();
		}
		
		function proregist(){
			var form = document.querySelector("#proregistForm");
		 	form.action = "<%=request.getContextPath()%>/feed/proregist";
		    form.submit();
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
       'ifDate':function(day, options){
    	   
    	   var dateObj=new Date(day);
           var year=dateObj.getFullYear();
           var month=dateObj.getMonth()+1;
           var reDate=dateObj.getDate();
    	   
    	   
    	   var replyArr = document.querySelectorAll(".comment");
    	   var today = new Date();
    	   var todate = today.getDate();
    	   
    	   for (let i = 0; i < replyArr.length; i++) {
    		  if(dateObj.getDate() == todate){
    			  return options.fn(this);
    		  }
    	   }
       },
      'loop':function(data, options) {
         var to = data.endPage;
         var from = data.StartPage;
         
         if(to == 0){
            to=1;
         }
          var accum = '';
          for(var i = from; i <= to; i++)
              accum += options.fn(i);
          return accum;
      },
      'userImg':function(dataId){
			 let contextPath = '<%=request.getContextPath()%>';
			 let path = "url('"+contextPath+"/feed/getMemPicture.do?id="+dataId+"')";
			 
			 
			 return path;
			
		}
    });
 
  
	
   </script>

 <%@ include file="/WEB-INF/include/footer.jsp" %>