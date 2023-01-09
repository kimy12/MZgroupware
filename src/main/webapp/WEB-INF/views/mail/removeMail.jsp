<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="removeMailList" value="${dataMap.list }" />

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
  <div class="wrap">
 	 <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
             
            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>휴지통 <span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                   
                </div>

     
                <div class="mail-search">
                    <div class="sear-box flex">
                        <select id="selectNew" name="lib_sel">
                            <option value="">전체</option>
                            <option value="0">작성자</option>						
                            <option value="1">제목</option>						
                        </select>
                        
                        <div class="input-bx">
                            <input id="search_input" type="text" placeholder="Search">
                        </div>				
                    </div>
                 </div>
              
                    <div class="mail-wrap">
                        <div class="mail-caption flex ju-sp-bt al-it-ce">
                            <ul class="flex al-it-ce">
                                <li><input type="checkbox" name="allCk" id="checkAll"></li>
                                <li>
                                    <button type="button" id="removeUp"><i class="fa-solid fa-trash-can"></i>영구 삭제</button>
                                    <button type="button" id="returnUp"><i class="fa-solid fa-arrow-rotate-left"></i>복구</button>
                                </li>
                            </ul>
                        </div>

                      
                        <div class="mail-list">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="15%">
                                    <col width="47%">
                                    <col width="15%">
                                    <col width="7%">
                                </colgroup>

                                <tbody>
                                	
                                 	<c:if test="${empty removeMailList }" >
										<tr>
											<td colspan="7" class="notContent">
												해당 메일이 없습니다.
											</td>
										</tr>
									</c:if>	
									
									<c:forEach items="${removeMailList }" var="remail">
	                                    <tr>
	                                         <td>
	                                         	<input type="hidden" value="${remail.tableCode }" name="tableCode" />
	                                         	<input type="hidden" value="${loginEmp.empl_no }" name="mailEmp" />
	                                         	<input type="checkbox" name="chk" id="check-mark" value="${remail.emailNo }">
	                                         	<input type="hidden" value="${remail.gap}" name="mailGap"/>
	                                         </td>
	                                        
	                                        
	                                         <c:choose>
		                                        <c:when test="${!empty remail.unityNo}">
		                                        	<td><i class="fa-solid fa-paperclip on"></i></td>
		                                        </c:when>
		                                        
		                                        <c:otherwise>
		                                        	<td><i class="fa-solid fa-paperclip off"></i></td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        
	                                        <c:choose>
		                                        <c:when test="${remail.emailSttus eq 0}">
		                                        	 <td><i class="fa-solid fa-envelope"></i></td>
		                                        </c:when>
		                                        
		                                        <c:otherwise>
		                                        	<td><i class="fa-solid fa-envelope-open"></i></td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        
	                                        
	                                        <c:choose>
		                                        <c:when test="${remail.sendName eq loginEmp.name}">
		                                        	  <td>[보낸사람 : ${remail.sendName}]</td>
		                                        </c:when>
		                                        
		                                        <c:otherwise>
		                                        	 <td>[받는사람 : ${remail.sendName}]</td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        
	                                        
	                                    
	                                        
	                                        
	                                        <td class="o-title" onClick="detail_go(${remail.emailNo})"><div>${remail.emailSj }</div></td>
	                                        <td>${remail.writngOn }</td>
	                                        <td>${remail.mailSize }</td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>



                   <div class="page-btn flex ju-sp-ce">
                        <a class="p-num prev-first" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left" aria-hidden="true"></i>
							</a> <a class="p-num prev" href="javascript:list_go('1');">
								<i class="fas fa-angle-left" aria-hidden="true"></i>
							</a>

							<a class="p-num next" href="javascript:list_go('1');">
								<i class="fas fa-angle-right" aria-hidden="true"></i>
							</a> <a class="p-num next-last" href="javascript:list_go('0');"> <i class="fas fa-angle-double-right" aria-hidden="true"></i>
							</a>
                       
                    </div>

            </div>
       </div>

    </div>
    
    <script>
		 	function detail_go(eno){
		   		console.log(eno);
		   		location.href = "detail?eno=" + eno;
		   	}
    
    
		 	var checkBox = document.getElementById("checkAll");
			var checkMark = document.getElementsByName("chk");
			var checkArr = checkMark.length;
		
			var removeCkArr = new Array();
			var removeTable = new Array();
			
			
			var tableCode = new Array();
			var emailNo = new Array();
			
			
			
			$(checkBox).click(function (){
				if($("input:checkbox[name='allCk']").is(":checked") == true){
					
					$("input:checkbox[name='chk']").prop("checked", true);
					
					for(var i = 0; i < checkArr; i++){
						removeCkArr.push($("input:checkbox[name='chk']").eq(i).val());
						removeTable.push($("input:hidden[name='mailGap']").eq(i).val());
						console.log(removeCkArr);
						console.log(removeTable + "테이블이 모에용?")
					}
				}else{
					$("input:checkbox[name='chk']").prop("checked", false);
					
					for(var i = 0; i < checkArr; i++){
						removeCkArr.splice(0, checkArr);
						removeTable.splice(0, checkArr);
						console.log(removeCkArr);
						console.log(removeTable + "테이블이 빠집니당");
					}
				}
			});
			
			const removeCodeUpdate = document.querySelector('#removeUp');
			
			removeCodeUpdate.addEventListener('click', function(e){
			
				/*
				var mailEmp = new Array();				
				emailNo = new Array();
				tableCode = new Array();
				
				for(var i = 0; i < checkArr; i++){
					let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
					
					if(ch == true){
						emailNo.push($("input:checkbox[name='chk']").eq(i).val());
						tableCode.push($("input:hidden[name='tableCode']").eq(i).val())
						mailEmp.push($('input[name = "mailEmp"]').eq(i).val());
						
						console.log("삭제 들어오는 배열 확인" + emailNo);
						console.log("삭제 들어오는 테이블 확인" + tableCode);
						console.log("삭제 로그인 들어오는 테이블 확인" + mailEmp);
					}
				}
				
				var allArray = { "emailNo" :emailNo,
								 "tableCode" :tableCode,
								 "sendEmp" : mailEmp,
								 "receEmp" : mailEmp};
				*/
				
				var allArray = [];
				var mailVo = {};
				for(var i = 0; i < checkArr; i++){
					let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");				
					
					if(ch == true){
						
						mailVo = {};
						
						mailVo.emailNo = $("input:checkbox[name='chk']").eq(i).val();						
						mailVo.tableCode = $("input:hidden[name='tableCode']").eq(i).val();
						mailVo.receEmp = $('input[name = "mailEmp"]').eq(i).val();
						mailVo.sendEmp = $('input[name = "mailEmp"]').eq(i).val();
						
						console.log("삭제 들어오는 배열 확인" + JSON.stringify(mailVo));
						
						allArray.push(mailVo);
					}
				}		
				
				
				console.log("배열 확인 " + allArray);
				
				if(allArray.length == 0){
					Swal.fire({
					 	title: "영구삭제할 메일을 선택하세요.",
			               icon: 'success',
			               confirmButtonColor: '#3085d6',
			               confirmButtonText: '확인'
			               
			           })
				}else{
					
					Swal.fire({
					 	title: "영구삭제 하시겠습니까? 확인 시 복구가 불가합니다.",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            confirmButtonText: '확인',
			            cancelButtonColor: '#d33',
			            cancelButtonText: '취소'
			            
					}).then((result) => {
						if (result.isConfirmed) {
						
						$.ajax({
							url : '<%=request.getContextPath()%>/mail/deleteMail',
							type : 'post',
							data : JSON.stringify(allArray),
							//data : allArray,
							contentType : 'application/json',
							success : function(result){
								if(result == 'success'){
									window.location.reload();
									alert('메일이 영구삭제 되었습니다.');
								}
							},
							error : function(error){
								alert('메일 삭제가 실패 되었습니다.');
							}
						});
						
						arr = new Array();
						}
					}); 
				} 
			});

			
			
			/*=====================복구===================*/
			
			const returnCodeUpdate = document.querySelector('#returnUp');
			
			returnCodeUpdate.addEventListener('click', function(e){
			
				removeCkArr = new Array();
				removeTable = new Array();
				
				
				for(var i = 0; i < checkArr; i++){
					let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
					
					if(ch == true){
						removeCkArr.push($("input:checkbox[name='chk']").eq(i).val());
						removeTable.push($("input:hidden[name='mailGap']").eq(i).val())
						
						console.log("들어오는 배열 확인" + removeCkArr);
						console.log("들어오는 테이블 확인" + removeTable);
					}
				}
				
				var allArray = { "removeCkArr" :removeCkArr,
								 "removeTable" :removeTable};
				
				console.log("배열 확인 " + allArray);
				
				if(removeCkArr.length == 0){
					Swal.fire({
					 	title: "복구할 메일을 선택하세요.",
			               icon: 'success',
			               confirmButtonColor: '#3085d6',
			               confirmButtonText: '확인'
			               
			           })
				}else{
					Swal.fire({
					 	title: "메일을 복구하시겠습니까?",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            confirmButtonText: '확인',
			            cancelButtonColor: '#d33',
			            cancelButtonText: '취소'
			            
					}).then((result) => {
						if (result.isConfirmed) {
					
					$.ajax({
						url : '<%=request.getContextPath()%>/mail/returnMail',
						type : 'post',
						data : JSON.stringify(allArray),
						contentType : 'application/json',
						success : function(result){
							Swal.fire({
	      					 	title: "메일이 복구되었습니다.",
	      			               icon: 'success',
	      			               confirmButtonColor: '#3085d6',
	      			               confirmButtonText: '확인'
	      			               
	      			           }).then((result) => {
	      			        	 window.location.reload();
	      			      	});
						},
						error : function(error){
							alert('메일 복구가 실패 되었습니다.');
						}
					});
					arr = new Array();
				
					
						}
					}); 
				} 
			});
			
    </script>
    
<%@ include file="/WEB-INF/include/footer.jsp" %>