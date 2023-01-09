<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<c:set value="${dataMap.faqList }" var="faqList"/>


<head>
<script>
    $(function () {
        $(".num-b.nb01").hide();
       $(".num-tog.tog01").click( function() {
            $(".num-b.nb01").slideToggle();
       });

       $(".num-b.nb02").hide();
       $(".num-tog.tog02").click( function() {
            $(".num-b.nb02").slideToggle();
       });
    });
</script>
</head>
<body>
       <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>
           
            <div id="modal" class="modal-wrap"></div>
<!--             <form> -->
                <div class="modal-con modal1">
                    <div class="faq-modal">
                        <h3>FQA 질문 추가</h3>

                        <div class="faq-icon">
                            <ul class="flex ju-sp-bt">
                                <li><img src="${pageContext.request.contextPath}/resources/images/how.png"></li>
                                <li class="on" onclick="select_type(this, 1)"><img src="${pageContext.request.contextPath}/resources/images/user.png"></li>
                                <li onclick="select_type(this, 2)"> <img src="${pageContext.request.contextPath}/resources/images/office-building.png"></li>
                                <li onclick="select_type(this, 3)"> <img src="${pageContext.request.contextPath}/resources/images/phone.png"></li>
                            </ul>
                        </div>

                        <div class="add-faq">
                        
                        <input type="hidden" name="faq_type" value=""/>
                        <input type="hidden" name="faq_writer" value="${loginEmp.empl_no }"/>
                            <ul>
                                <li class="flex">
                                    <label>질문</label>
                                    <input type="text" id="title" name="faq_que">
                                </li>

                                <li class="flex">
                                    <label>답변</label>
                                    <textarea id="answer" name="faq_ans"></textarea>
                                </li>
                            </ul>
                           
                        </div>
                    </div>

                    <div class="modal-btn flex ju-sp-ce">
                        <button id="close" class="close-core">취소</button>
                        <button type="button" class="regist" id="insert">추가</button>
                    </div>
                </div>
<!--           </form> -->

            <div class="container flex">
              

            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>FAQ<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
                <div class="sear-box flex">
                        <div class="work-state">
                            <div class="select-tog flex ju-sp-bt al-it-ce"><span>선택</span><i class="fa-solid fa-caret-down"></i></div>
                            <ul class="tog-b" style="display: none;">
                                <li>전체</li>
                                <li>제목</li>
                                <li>내용</li>
                                <li>작성자</li>
                            </ul>
                        </div>
                            
                        <input id="search" type="text" placeholder="Search">
                    </div>
                </div>

            
                    <div class="faq-list">
                        <div class="faq-cap">
                      
                             <div class="faq-view">
                                 <ul class="flex">
                                     <li>
                                         <div class="bg" onclick="location.href='${pageContext.request.contextPath}/faqboard/list?faq_type=0'">
                                             <img src="${pageContext.request.contextPath}/resources/images/how.png">
                                         </div>

                                         <span>전체</span>
                                     </li>

                                    <li>
                                        <div class="bg" onclick="location.href='${pageContext.request.contextPath}/faqboard/list?faq_type=1'">
                                            <img src="${pageContext.request.contextPath}/resources/images/user.png">
                                        </div>

                                        <span>개인</span>
                                    </li>

                                    <li>
                                        <div class="bg" onclick="location.href='${pageContext.request.contextPath}/faqboard/list?faq_type=2'">
                                            <img src="${pageContext.request.contextPath}/resources/images/office-building.png">
                                        </div>

                                        <span>회사</span>
                                    </li>

                                    <li>
                                        <div class="bg" onclick="location.href='${pageContext.request.contextPath}/faqboard/list?faq_type=3'">
                                            <img src="${pageContext.request.contextPath}/resources/images/phone.png">
                                        </div>

                                        <span>시스템</span>
                                    </li>

                                    <li class="modal-open">
                                        <a href="javascript:openModal('modal1');" class="button modal-open"><i class="fa-solid fa-plus"></i></a> 
                                    </li>
                                 </ul>
                             </div>


                        </div>
                          
                        <ul class="faq-box">
                        <c:if test="${empty faqList }">
                                	<tr>
                                		<td colspan="10">
                                			<strong>해당 내용이 없습니다.</strong>
                                		</td>
                                	</tr>
                          </c:if>
                           <c:forEach items="${faqList }" var="faq" varStatus="status">
                            <li class="flex al-it-ce ju-sp-bt" onclick="">
                                <div class="faq-c flex al-it-ce">
                                    <div class="thb-u">
                                    
                                        <img src="${pageContext.request.contextPath}/resources/images/${faq.faq_type == 1 ? 'user' : faq.faq_type == 2 ? 'office-building': 'phone'}.png">
                                    </div>
										<input type="hidden" name="faq_type" value="">
                                    <div>
                                        <p>${faq.faq_que } </p>
                                        <span class="q">${faq.faq_ans }</span>
                                    </div>
                                    <div class="txt" style="display:none;">
                                        <input type="hidden" name="fno" value="${faq.faq_no }">
                                        <input type="text" name="que" value="${faq.faq_que }">
                                        <textarea name="ans">${faq.faq_ans }</textarea>
                                    </div>
                                    
                                </div>
                                <div class="cont-roll">
                                    <i class="fa-solid fa-pen" onclick="displayIcon(this)"></i>
                                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/faqboard/remove?faq_no=${faq.faq_no}'" ><i class="fa-solid fa-xmark"></i></button>
                                </div>
                               <div class="cont-roll" style="display: none;">
                                 <!--   <button type="button" class="modify" id="modify">  --><i class="fa-solid fa-check-double" onclick="modifyContent(this);" id="modify"></i><!-- </button> -->
									<i class="fa-solid fa-arrow-rotate-left" onclick="displayIcon(this)"></i>
                                </div>
                            </li>
                            </c:forEach>

                            <!-- <li class="flex al-it-ce ju-sp-bt">
                                <div class="faq-c flex al-it-ce">
                                    <div class="thb-u">
                                        <img src="${pageContext.request.contextPath}/resources/images/user.png">
                                    </div>

                                     <div class="txt">
                                        <input type="text">
                                        <textarea></textarea>
                                    </div>
                                </div>

                                <div class="cont-roll">
                                    <i class="fa-solid fa-check-double"></i>
									<i class="fa-solid fa-arrow-rotate-left"></i>
                                </div> 
                            </li>  -->
                        </ul>
    
                    </div>
                    
                      <!-- <div class="page-btn flex ju-sp-ce">
                        <a href="#" class="p-num prev-first"><i class="fas fa-angle-double-left" aria-hidden="true"></i></a>

                        <a href="#" class="p-num num on"><span>1</span></a>
                        <a href="#" class="p-num num"><span>2</span></a>
                        <a href="#" class="p-num num"><span>3</span></a>

                        <a href="#" class="p-num next-last"><i class="fas fa-angle-double-right" aria-hidden="true"></i></a>
                       
                    </div> -->
                    
				</div>
            </div>
       </div>
       
       <script>
       // displayFlag: 상태값을 저장하고 있는 변수
       // true: fa-pen이 보여지고, fa-check-double은 안보이게
       // false => else가 실행: fa-check-double은 보여지고, fa-pen은 숨긴다.
       let displayFlag = false
       function displayIcon(obj) {
    	   $(obj).parent().hide()

    	   if (displayFlag) {
	    	   $(obj).parent().parent().find(".fa-pen").parent().show()
	    	   $(obj).parent().parent().find("textarea").parent().hide()
	    	   $(obj).parent().parent().find("span").parent().show()
	    	   displayFlag = false
    	   } else {
	    	   $(obj).parent().parent().find(".fa-check-double").parent().show()
	    	   $(obj).parent().parent().find("textarea").parent().show()
	    	   $(obj).parent().parent().find("span").parent().hide()
	    	   displayFlag = true
    	   }
       }
       
       
       function sumin(obj, index) {
    	   
    	   /*console.log('index', index);  */
    	   var id = $(obj).attr('id')
    	  if (id.indexOf("chaicon")!=-1) {
    		   $(obj).hide();
    		   const idStr = '#chnicon' + index;
    		   $(idStr).show();
    	   } else {
    		   $(obj).hide();
    		   const idStr = '#chaicon' + index;
    		   $(idStr).show();
    		   console.log("ghkrdls");
    	   }
       }
       
		var type = 0;
		function select_type(obj, selectedType){
			type = selectedType
			console.log(type);
			document.querySelector("input[name=faq_type]").value=type;
			console.log(document.querySelector("input[name=faq_type]").value+"값 확인");
			$(obj).parent().children().removeClass("on")
			$(obj).addClass("on")
		}
       
       var insertFaq = document.querySelector('#insert');
       console.log(insertFaq+"아이디확인");
       insertFaq.addEventListener('click',function(i){
    	   
    	/*    var form = document.querySelector("form");
    	    var formData = new FormData(form); */
    	    let flag = !document.querySelector("input[name=faq_que]").value || !document.querySelector("textarea[name=faq_ans]").value;
    	    if(flag){
    	    	$("#modal").fadeOut(300);
			     $(".modal-con").fadeOut(300);
    	    	return;
    	    }
    	    
    	    var data = {
    	    		   "faq_type" : document.querySelector("input[name=faq_type]").value,
    	    		   "faq_writer" : document.querySelector("input[name=faq_writer]").value,
    	    		   "faq_que" : document.querySelector("input[name=faq_que]").value,
    	    		   "faq_ans" : document.querySelector("textarea[name=faq_ans]").value
    	       }
    	    
    	   $.ajax({
    		 url : '${pageContext.request.contextPath}/faqboard/regist' ,
    		 type : 'post',
    		 data : JSON.stringify(data),
    		 contentType : 'application/json',
    		 success : function(result){
    			 alert(result);
    			 if(result == 'success'){
    				  window.location.reload();  
    				 /* alert('작성이 완료되었습니다.'); */
    				 $("#modal").fadeOut(300);
    			     $(".modal-con").fadeOut(300);
    			 }
    		 },
    		 error : function(error){
    			 console.log(error)
    			 alert('작성 실패하였습니다.');
    		 }
    		 
    	   })  
    	  
    	   console.log(type); 
       });
       
       
       
       var modifyFaq = document.querySelector('#modify');
       console.log(modifyFaq+"아이디확인");
       function modifyContent(obj){
    	   		
    	   		var data1 = {
			    		   "faq_que" : $(obj).parent().parent().find("input[name=que]").val(),
			    		   "faq_no" : $(obj).parent().parent().find("input[name=fno]").val(), 
			    		   "faq_ans" : $(obj).parent().parent().find("textarea").val()
			    }
			   
			   $.ajax({
				 url : '${pageContext.request.contextPath}/faqboard/modify' ,
				 type : 'post',
				 data : JSON.stringify(data1),
				 contentType : 'application/json',
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
			  
			   console.log(type); 
		   
       }

    	    
    	    
       </script>
<%@ include file="/WEB-INF/include/footer.jsp" %>