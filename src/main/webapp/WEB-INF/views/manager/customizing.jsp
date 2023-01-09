<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<c:set var="today" value="<%=new Date()%>"/>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/spectrum.css">
<script src="<%=request.getContextPath() %>/resources/js/popup.js"></script>
<script src="https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js"></script>

<style>
#changeColor{
	position: absolute;
	width:70px;
	height: 40px;
	color:black;
	background: white;
	font-size: 16px;
	border:1px solid #ddd;
}
#changeColor:focus {
	outline:0;
}
#changeColor:hover{
	cursor: pointer;
	color:#fff;
}
</style>
</head>

<c:set var="customBoardList" value="${customBoardList }" />

<body>
	<%@ include file="/WEB-INF/include/topbar.jsp" %>
	<div id="modal" class="modal-wrap"></div>
		<div class="modal-con modal999">
            <div class="att-modal">
                <h3>게시판 상세</h3>
               <table>		
       	          <tbody>
                        <tr>
                            <td class="flex">
                                <label>생성일</label>
                                <div>
                                	<input type="hidden" id="boardno" value="">
                                    <input type="text" id="regDate" value="" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>게시판명</label>
                                <div>
                                    <input type="text" name="modalboardName" id="modalboardName" value="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>생성자</label>
                                <div>
                                    <input type="text" name="maker" value="" id="maker" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <label>공개여부</label>
                                <div>
                                   <select id="openedChk">
									       <option class="isOpen"></option>
									       <option class="isOpen"></option>
		                            </select>
                                </div>
                            </td>
                        </tr>                        
                    </tbody>
                </table>
            </div>
            <div class="modal-btn flex ju-sp-ce">
              	<button class="close-core">취소</button>
                <button id="confirmBoard" class="regist">확인</button>
              
            </div>
    </div>
	
	<div id="modal" class="modal-wrap"></div>
		<div class="modal-con modal1100">
            <div class="att-modal">
                <div class="create-list" id="form-list">
                </div>
            </div>
            <div class="modal-btn flex ju-sp-ce">
                <button class="close-core" >닫기</button>
            </div>
    </div>
	
	<div class="wrap">
            <div class="container flex">
              
            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>커스터마이징 <span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                    </div>
                     
                    <div class="customize flex ju-sp-bt">
                        <div class="custom cus01">
                            <div class="custom-menu">
                                <ul>
                                    <li>
                                        <a href="#cpage01" id="cp1">
                                            <i class="fa-solid fa-bars"></i> 
                                            메뉴바 커스터마이징
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#cpage02" class="on" id="cp2">
                                            <i class="fa-solid fa-list"></i> 
                                            게시판 커스터마이징
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#cpage03" id="cp3">
                                            <i class="fa-solid fa-stopwatch"></i>
                                            근무시간 커스터마이징 
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#cpage04" id="cp4">
                                            <i class="fa-solid fa-file"></i>
                                            결재양식 커스터마이징 
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#cpage05" id="cp5">
                                            <i class="fa-solid fa-basketball"></i>
                                            동호회 커스터마이징 
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="custom cus02">
                           <div class="custom-page cp01" id="cpage01">
                                <div class="cus-title flex ju-sp-bt">
                                    <h3>메뉴바 색상변경</h3>
                                   
                                    <div>
                                        <button id="colorModify"><i class="fa-solid fa-floppy-disk"></i> 저장</button>
                                        <button id="menureset"><i class="fa-solid fa-reply"></i> 초기화</button>
                                    </div>
                                </div>
                           
                                <h4 class="mb-10">현재 색상</h4>
                               <input class='topbarColor' value='' disabled/>
                               <input type="button" id="changeColor" value="선택">                                                     
                                                                 
                           </div>

                           <div class="custom-page cp02" id="cpage02">
                                <div class="cus-title flex ju-sp-bt">
                                    <h3>게시판 추가 또는 삭제</h3>
                                    <div>
                                        <button id="boardSave"><i class="fa-solid fa-floppy-disk"></i>게시판 추가</button>
                                        <button id="boardreset"><i class="fa-solid fa-reply"></i> 초기화</button>
                                    </div>
                                </div>
                                
                                <div class="list-type01">
                                   <table>
                                       <colgroup>
                                        <col width="20%">
                                        <col width="80%">
                                       </colgroup>

                                       <tbody>
                                            <tr>
                                                <td>
                                                    게시판명
                                                </td>

                                                <td>
                                                	<input type="hidden" id="empId" value="${loginEmp.name }">
                                                    <input type="text" name="boardName" id="boardName">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    공개여부
                                                </td>

                                                <td class="flex">
                                                   <div class="public-on">
                                                       <span>공개</span>
                                                       <input type="radio" class="opened" name="opened" id="public" value="1"> 
                                                   </div>

                                                   <div class="public-off">
                                                        <span>비공개</span>
                                                        <input type="radio" class="opened" name="opened" id="private" value="0"> 
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                   </table>
                                </div>


                                <div class="create-list">
                                    <table>
                                        <colgroup>
                                            <col width="20%">
                                            <col width="25%">
                                            <col width="15%">
                                            <col width="20%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>

                                        <thead>
                                            <tr>
                                                <td>생성일</td>
                                                <td>게시판명</td>
                                                <td>생성자</td>
                                                <td>공개여부</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </thead>
 
                                        <tbody id="boardListTbody">
                                        	<c:if test="${empty customBoardList }">
                                        		<td colspan="6">
													<strong>해당 내용이 없습니다.</strong>
												</td>
                                        	</c:if>
                                        	<c:if test="${not empty customBoardList }">
	                                        	<c:forEach items="${customBoardList }" var="customBoard">
		                                            <tr>
		                                                <td>
			                                            	<fmt:formatDate value="${customBoard.regdate }" pattern="yyyy-MM-dd"/>
			                                            </td>
		                                                <td>${customBoard.boardName }</td>
		                                                <td>${customBoard.maker }</td>
		                                                <td>
															<c:if test="${customBoard.opened eq 0}">
																비공개
															</c:if>
															<c:if test="${customBoard.opened eq 1}">
																공개
															</c:if>
		                                                </td>
		                                                <td>
		                                                	<input type="hidden" value="${customBoard.boardtype_no }" />
		                                                	<button class="boardModify" style="background:#4287f5;">변경</button>
		                                                </td>
		                                                <td>
		                                                	<input type="hidden" value="${customBoard.boardtype_no }" />
		                                                    <button class="boardDelete">삭제</button>
		                                                </td>
		                                            </tr>
	                                        	</c:forEach>
                                        	</c:if>
                                         </tbody>
                                    </table>
                                </div>

                               
                            </div>

                          
                            <div class="custom-page cp03" id="cpage03">
                                <div class="cus-title flex ju-sp-bt">
                                    <h3>근무시간 설정</h3>
                                    <div>
                                        <button id="store"><i class="fa-solid fa-floppy-disk"></i> 저장</button>
                                        <button id="timereset"><i class="fa-solid fa-reply"></i> 초기화</button>
                                    </div>
                                </div>


                               <table class="re-setting">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="80%">
                                    </colgroup>

                                   <tbody id="workTimeArea">
                                        <tr id="current">
                                            <td>현재 설정된 시간</td>
                                            <td>
                                                <ul class="mb-30">
                                                	 <c:choose>
				                                        <c:when test="${workTime.workset eq '0'}">
		                                                	<li>
			                                                   	<label><i class="fa-solid fa-check"></i>지정된 시간으로 설정</label>
		                                                	</li>				                                        	
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<li>
			                                                   	<label><i class="fa-solid fa-check"></i>자유 출퇴근으로 설정</label>
		                                                	</li>
				                                        </c:otherwise>
			                                        </c:choose>
                                                    <li class="ori-time">
                                                    	<c:if test="${workTime.monday eq 'y' }">
	                                                        <span class="on">월</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.monday eq 'n' }">
	                                                        <span>월</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.tuesday eq 'y' }">
	                                                        <span class="on">화</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.tuesday eq 'n' }">
	                                                        <span>화</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.wednesday eq 'y' }">
	                                                        <span class="on">수</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.wednesday eq 'n' }">
	                                                        <span>수</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.thursday eq 'y' }">
	                                                        <span class="on">목</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.thursday eq 'n' }">
	                                                        <span>목</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.friday eq 'y' }">
	                                                        <span class="on">금</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.friday eq 'n' }">
	                                                        <span>금</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.saturday eq 'y' }">
	                                                        <span class="on">토</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.saturday eq 'n' }">
	                                                        <span>토</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.sunday eq 'y' }">
	                                                        <span class="on">일</span>                                                    	
                                                    	</c:if>
                                                    	<c:if test="${workTime.sunday eq 'n' }">
	                                                        <span>일</span>                                                    	
                                                    	</c:if>
                                                    	
                                                    	
                                                    </li>
                                                    <li><label><i class="fa-solid fa-check"></i>업무 시작 시간</label> ${workTime.begintime }</li>
                                                    <li><label><i class="fa-solid fa-check"></i>업무 시작 종료</label> ${workTime.endtime }</li>
                                                    <c:if test="${workTime.workset eq '1' }">
	                                                    <li><label><i class="fa-solid fa-check"></i>코어타임</label> ${workTime.coretime }시간</li>
                                                    </c:if>
                                                </ul>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>근무 시간 재설정</td>
                                            <td>
                                                <ul class="flex">
                                                    <li>
                                                        <label>
                                                            지정된 시간으로 설정
                                                        </label>
                                                        <input type="radio" class="timeset" name="timeset" id="restric" value="0">
                                                    </li>

                                                    <li>
                                                        <label>
                                                            자유 출퇴근으로 설정
                                                        </label>
                                                        <input type="radio" class="timeset" name="timeset" id="free" value="1">
                                                    </li>
                                                </ul>

                                                <ul class="time-setting flex" id="worktime" style="display:none">
                                                    <li>
                                                        <label>
                                                            업무시작
                                                        </label>
                                                        <input type="time" id="startTime" value="">
                                                    </li>

                                                    <li>
                                                        <label>
                                                            업무종료
                                                        </label>
                                                        <input type="time" id="endTime" value="">
                                                    </li>
                                                </ul>

                                                <ul class="time-setting flex" id="coretime" style="display:none">
                                                    <li>
                                                        <label>
                                                            최소 근무시간
                                                        </label>
                                                        <select id="core" class="core-time">
                                                        	<option>1</option>
                                                        	<option>2</option>
                                                        	<option>3</option>
                                                        	<option>4</option>
                                                        	<option>5</option>
                                                        	<option>6</option>
                                                        	<option>7</option>
                                                        	<option>8</option>
                                                        	<option>9</option>
                                                        	<option>10</option>
                                                        	
                                                        </select>
                                                    </li> 
                                                    
                                                   <!--  <li>
	                                                    <label>
	                                                            근무 시간 설정
	                                                    </label> 
                                                    	<input type="time" id="cStart" value="" />
                                                    	<input type="time" id="cEnd" value="" />
                                                    </li> -->
                                                </ul>
                                                
                                                <ul id="workweek" style="display:none">
                                                    <li>
                                                        <span class="workw" data-value="n">월</span>
                                                        <span class="workw" data-value="n">화</span>
                                                        <span class="workw" data-value="n">수</span>
                                                        <span class="workw" data-value="n">목</span>
                                                        <span class="workw" data-value="n">금</span>
                                                        <span class="workw" data-value="n">토</span>
                                                        <span class="workw" data-value="n">일</span>
                                                    </li>
                                                </ul>


                                                
                                            </td>
                                        </tr>
                                    </tbody>
                               </table>
                            </div>
                            
                            
                            <div class="custom-page cp04 mb-20" id="cpage04">
                            	
                                 <div class="cus-title flex ju-sp-bt">
                                    <h3>결재양식 추가 또는 삭제</h3>
                                    <div>
                                        <button type="button" id="formSave" onclick="addForm();"><i class="fa-solid fa-floppy-disk" ></i>양식 추가</button>
                                        <button type="button" id="fromList" onclick="getFormList();"><i class="fa-solid fa-list"></i>양식 목록</button>
                                    </div>
                                </div>
<!--                                 getFormList(); -->
                                <div class="list-type01">
                                   <table>
                                       <colgroup>
                                        <col width="20%">
                                        <col width="80%">
                                       </colgroup>

                                       <tbody>
                                            <tr>
                                                <td>
                                                    양식명
                                                </td>

                                                <td>
                                                    <input type="text" name="formNm" id="formNm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    양식내용
                                                </td>

                                                <td>
                                                    <input type="text" name="formCn" id="formCn">
                                                </td>
                                            </tr>
									
											<tr>
												<td colspan="2">
												<textarea id="summernote" name="formFile"></textarea>
												</td>
											</tr>
                                        </tbody>
                                   </table>
                                </div>
		
                            </div>
                            
                            <div class="custom-page cp05" id="cpage05" style="">
                                <div class="cus-title flex ju-sp-bt">
                                    <h3>동호회 추가 또는 삭제</h3>
                                    <div>
                                        <button id="clubSave"><i class="fa-solid fa-floppy-disk"></i>동호회 추가</button>
                                        <button id="clubreset"><i class="fa-solid fa-reply"></i> 초기화</button>
                                    </div>
                                </div>
                                
                                


                                <%@ include file="../club/clubRegistForm.jsp" %>

                               
                            </div>
                        </div>
                    </div>
            </div>
       </div>
	</div>
	<script>
    	//서머노트 불러오기 
		summernote_go($('#summernote'),"<%=request.getContextPath() %>",1400);
    </script>
    	<script type="text/x-handlebars-template"  id="club-list-template">
			<div class="create-list">
                         <table>
                             <colgroup>
                                 <col width="30%">
                                 <col width="25%">
                                 <col width="25%">
                                 <col width="20%">
                             </colgroup>

                             <thead>
                                 <tr>
                                     <td>동호회명</td>
                                     <td>동호회장</td>
                                     <td>생성일</td>
                                     <td></td>
                                 </tr>
                             </thead>

                             <tbody id="boardListTbody">
								{{#each clubList}}
                             	<tr>
	                                 <td>{{club_nm}}</td>
	                                 <td>{{president}}</td>
	                                 <td>{{setDate regdate}}</td>
	                                 <td>
	                                     <button type="button" onclick="deleteClub('{{club_no}}');">폐지</button>
	                                 </td>
                                 </tr>
								{{/each }}                      
                             </tbody>
                         </table>
                    </div>
                            
	           {{#with pageMaker}}
						<div class="page-btn flex ju-sp-ce">
							<a class="p-num prev-first" href="javascript:callClubList(1);"> <i class="fas fa-angle-double-left"></i>
							</a> 


							{{#loop this}}
								<a class="p-num num {{#ifCond this.cri.page this.pageNum}}on{{/ifCond}}" href="javascript:callClubList('{{this.pageNum}}');">{{this.pageNum}}</a>
							{{/loop}}

							
							<a class="p-num next-last" href="javascript:callClubList('{{realEndPage}}');"> <i class="fas fa-angle-double-right"></i>
							</a>
						</div>
			  {{/with}}
		</script>
    
		<script type="text/x-handlebars-template"  id="board-list-template">
	      	{{#each .}}
	 			{{#if boardName}} 
		             <tr id="boardtr">
		                 <td>
							{{prettifyDate regdate}}
			             </td>
		                 <td>{{boardName }}</td>
		                 <td>{{maker }}</td>
		                 <td>
							{{openedCheck opened}}
		                 </td>
		                 <td>
		                 	<input type="hidden" value="{{boardtype_no }}" />
		                 	<button class="boardModify" style="background:#4287f5;">변경</button>
		                 </td>
		                 <td>
		                 	<input type="hidden" value="{{boardtype_no }}" />
		                     <button class="boardDelete">삭제</button>
		                 </td>
		             </tr>
             	{{/if}} 
 				{{else}} 
              		<td colspan="6" style="text-align: center;"> 
 						<strong>해당 내용이 없습니다.</strong> 
 					</td> 
	         	{{/each }}
		</script> 
		
		<script type="text/x-handlebars-template"  id="workTime-template">
	      	<tr id="current">
                 <td>현재 설정된 시간</td>
                 <td>
                     <ul class="mb-30">
		                 <li>
			             	<label><i class="fa-solid fa-check"></i>{{workCheck workset}}</label>
		                 </li>	
                         <li class="ori-time">
	                        <span class="{{dayCheck monday}}">월</span>                                                    	
	                        <span class="{{dayCheck tuesday}}">화</span>                                                    	
	                        <span class="{{dayCheck wednesday}}">수</span>                                                    	
	                        <span class="{{dayCheck thursday}}">목</span>                                                    	
	                        <span class="{{dayCheck friday}}">금</span>                                                    	
	                        <span class="{{dayCheck saturday}}">토</span>                                                    	
	                        <span class="{{dayCheck sunday}}">일</span>  
                         </li>
						 {{#worksetCheck}}
                         	<li><label><i class="fa-solid fa-check"></i>업무 시작 시간</label> {{begintime }}</li>
                         	<li><label><i class="fa-solid fa-check"></i>업무 시작 종료</label> {{endtime }}</li>
						 {{else}}
	                         <li><label><i class="fa-solid fa-check"></i>코어타임</label> {{coretime}}시간</li>
                         {{/worksetCheck}}
                     </ul>
                 </td>
             </tr>
		</script> 
		
		<script type="text/x-handlebars-template"  id="form-list-template">
		<table>
                                        <colgroup>
                                            <col width="40%">
                                            <col width="40%">
                                          
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>

                                        <thead>
                                            <tr>
                                                <td>양식명</td>
                                                <td>양식내용</td>
                                             

                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </thead>
 
                                        <tbody id="formlisttbody">
                                        	{{#if formList}}
                                        		{{#each formList}}
		                                            <tr>
		                                                <td>
			                                            	{{formNm}}
			                                            </td>
		                                                <td>{{formCn}}</td>
		                                               		
		                                              
		                                                
		                                                <td>
		                                                	
		                                                    <button class="formDelete" onclick="formDelete({{setleFormNo}})">삭제</button>
		                                                </td>
		                                            </tr>
		                                            <tr>
		                                            </tr>
	                                        	{{/each}}
                                        	{{else}}
												
												<td colspan="6">
													<strong>해당 내용이 없습니다.</strong>
												</td>
											{{/if}}
                                         </tbody>
                                    </table>
		</script>

       <script>       
	   	//Handlebars
	   		const cp5 = document.querySelector('#cp5');
	   		const clubName = document.querySelector('#clubName');
	   		const clubMaster = document.querySelector('#clubMaster');
	   		const today = document.querySelector('#today');
	   		const minMember = document.querySelector('#minMember');
	   		const maxMember = document.querySelector('#maxMember');
	   		const clubConcept = document.querySelector('#clubConcept');
	   		const startDate = document.querySelector('#startDate');
	   		const endDate = document.querySelector('#endDate');
	   		const clubSave = document.querySelector('#clubSave');
	   		const clubreset = document.querySelector('#clubreset');
	   		const targetMember = document.querySelectorAll('input[name="target"]');
	   		
	   		let tMem = "";
   			const getTargetValue = (e)=> {
   				tMem = e.target.value;
   			}
   			
	   		[].forEach.call(targetMember, (t)=>{
	   			t.addEventListener('click',getTargetValue);
	   		});
	   		clubSave.addEventListener('click', registClub);
	   		cp5.addEventListener('click', clubCustom);
 
   			function registClub(){
   				const dataObj = {
   						club_nm: clubName.value,
   						regdate: today.value,
   						min_ppl: minMember.value,
   						max_ppl: maxMember.value,
   						president: clubMaster.value,
   						target: tMem,
   						startdate: startDate.value,
   						enddate: endDate.value,
   						content: clubConcept.value 
   				}
   				
   				$.ajax({
   					url:'${pageContext.request.contextPath}/ctmzManager/registClub',
   					type:'pose',
   					data:JSON.stringify(dataObj),
   					contentType:'application/json',
   					success:function(response){
   						if(response == "success"){
   							Swal.fire({
	 						 	title: "등록되었습니다.",
	 			                icon: 'success',
	 			                timer: 1500
	 			            })
	 			           callClubList(1);
   						}
   					},
   					error:function(xhr){
   						alert(xhr.status);
   					}
   						
   				});
   			}
	   		   		
	   		function clubCustom(){
	   			callClubList(1);
	   		}
	   		
	   		function deleteClub(clubNo){
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
	                	
	                	ajaxDeleteClub(clubNo);													                       
	                }
	            })	
	   		}
	   		
	   		function ajaxDeleteClub(clubNo,){
	   			$.ajax({
	 		        type : "POST",            
	 		        url : "${pageContext.request.contextPath}/ctmzManager/deleteClub",   
	 		        data : {club_no : clubNo},            
	 		        success : function(res){
	 		        	if(res == "success"){
	 		        		Swal.fire({
	 						 	title: "삭제되었습니다.",
	 			                icon: 'success',
	 			                timer: 1500
	 			            })
		 		        	callClubList($('a.on').text().replace(/\n/g, "").replaceAll(" ", "").substr(9));
	 		        	}	         	
	 		        },
	 		        error : function(XMLHttpRequest, textStatus, errorThrown){ 
	 		            alert("통신 실패.")
	 		        }
	 		    });
	   			
	   		}
	   	
	      	function getCustomPage(pageInfo){    
	      	   $.getJSON(pageInfo,function(data){ 
	      		printCustomData(data,$('#boardListTbody'),$('#board-list-template'));
	      	   });
	      	}
	   		
	      	 function callClubList(page){
	 		    $.ajax({
	 		        type : "POST",            
	 		        url : "${pageContext.request.contextPath}/ctmzManager/clubList",   
	 		        data : {
	 		        	page : page
	 		        },            // Json 형식의 데이터이다.
	 		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	 		        	var template = Handlebars.compile($('#club-list-template').html());
	 		        	$('#customClubArea').empty();
	 		        	$('#customClubArea').append(template(res));
	         	
	 		        },
	 		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	 		            alert("통신 실패.")
	 		        }
	 		    });
	 	    }
	      	
	      	function printCustomData(boardArr,target,templateObject){
	      	   let template=Handlebars.compile(templateObject.html());
	      	   let html = template(boardArr);   
	      	   $('#boardtr').remove();
	      	   target.append(html);
	      	   
	      	}
	   		
	   		function getCustomWorkTime(pageInfo){
	   		  	$.getJSON(pageInfo,function(data){ 
	   		  		printCustomTime(data,$('#workTimeArea'),$('#workTime-template'));
	   		  	});
	   		}
	
	      	function printCustomTime(currTime,target,templateObject){
	      	   let template=Handlebars.compile(templateObject.html());
	      	   let html = template(currTime);   
	      	   $('#current').remove();
	      	   target.prepend(html);
	      	   
	      	}
	      	
	      	
	      	Handlebars.registerHelper({
	      	   "prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
	      	      let dateObj=new Date(timeValue);
	      	      let year=dateObj.getFullYear();
	      	      let month=dateObj.getMonth()+1;
	      	      let date=dateObj.getDate();
	      	      return year+"-"+month+"-"+date;
	      	   },
	      	   "setDate":function(dateValue){ //Handlbars에 날짜출력함수 등록
	      		  let dateObj=new Date(dateValue);
	      	  
	      		  let month = String((dateObj.getMonth() + 1).toString());
	      		  let mm = month.length >= 2 ? month : new Array(2 - month.length + 1).join("0") + month;
	      		  let date = String((dateObj.getDate() + 1).toString());
	      		  let dd = date.length >= 2 ? date : new Array(2 - date.length + 1).join("0") + date;
	      		  
	              let year=dateObj.getFullYear();
	      	      
	      	      return year+"-"+mm+"-"+dd;
	      	   },
	      	   "openedCheck":function(opened){
	      	     let result = "공개";
	      	     if(opened == '0'){
	      	      	result="비공개";
	      	     }
	      	      return result;                    
	      	   },
	      	   "workCheck":function(work){
	      		  let result = "자유 출퇴근으로 설정";
	      	      if(work == '0') {
	      	    	  result = "지정된 시간으로 설정";
	      	      }
	      	    	return result;
	      	   },
	      	   "dayCheck":function(day){
	      		   let result = "";
	      		   if(day == 'y'){
	      			   result = "on";
	      		   }
	      		   return result;
	      	   },
	      	   "ifCond":function(v1, v2, options) {
	     		
		   		  if(v1 == v2) {
		   		    return options.fn(this);
		   		  }
		   		  return options.inverse(this);
		   		},
	      	   "worksetCheck": function (options) {
	      		    if(this.begintime.substring(0,2) != '00'){
	      		    	return options.fn(this);
	      		    }
	      		    return options.inverse(this);
	      		},
	      		"loop":function(data, options) {
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
	    		}
	      
	      	});
	      	
	      	
//=======================================================================
       		//근무시간
       		const worktime = document.querySelector('#worktime');
       		const workweek = document.querySelector('#workweek');
       		const coretime = document.querySelector('#coretime');
       		const restric = document.querySelector('#restric');
       		const core = document.querySelector('#core');
       		const startTime = document.querySelector('#startTime');
       		const endTime = document.querySelector('#endTime');
       		const free = document.querySelector('#free');
       		const store = document.querySelector('#store');
       		const timereset = document.querySelector('#timereset'); 
			const timeset = document.querySelectorAll(".timeset");
			const workw = document.querySelectorAll(".workw");
       		let workValue = "";
       		let coreValue = "";
       		let cnt = 0;
       		
       		[].forEach.call(workw, (wk) => {
       			wk.addEventListener('click', workWeekHandle);
       		});
       		
       		[].forEach.call(timeset, (t) => {
       			t.addEventListener('change', attendanceCheck);
       		});
       		
       		core.addEventListener('change',()=>{
       			coreValue = core.options[core.selectedIndex].text;
    		});
       		
       		function workWeekHandle(){
       			if(this.classList.contains("on")){
       				this.classList.remove("on");
       				this.dataset.value = "n";
       				cnt--;
       			}else{
       				this.classList.add("on");
       				this.dataset.value = "y";
       				cnt++;
       			}
       			
       		}
       		
       		
       		function attendanceCheck(){
       			workValue = this.value;
       			
   				if(workValue === '0'){
   					weekInit();
   					worktime.style.display = 'block';
   					workweek.style.display = 'block';
   					coretime.style.display = 'none';
   				}
   				
   				if(workValue === '1'){
   					weekInit();
   					coretime.style.display = 'block';
   					worktime.style.display = 'none';
   					workweek.style.display = 'block';
   				}
       		}
       		
       		
       		function weekInit(){
       			for(let i = 0; i < workw.length; i++){
       				workw[i].classList.remove("on");
       				workw[i].dataset.value = "n";
       				cnt = 0;
       			}
       		}
       		
       		
       		const timeDiff = function(sh, sm, eh, em){
       			const now = new Date();
       			
       			let year = now.getFullYear();
       			let month = now.getMonth()+1;
       			let day = now.getDate();
       			
       			let startDate = new Date(year,month,day,sh,sm);
       			let endDate = new Date(year,month,day,eh,em);
       			
       			let chkSec = endDate.getTime() - startDate.getTime();
       			let chkMin = chkSec / 1000 / 60; 
       			
       			return chkMin;
       		}
       		
       		
       		const workValidCheck = function(time){    
       			let flag = "";
				(cnt * time < 2400 || cnt * time > 3120) ? 
							  Swal.fire({
								  text: "근무시간은 주간 최소 40시간 이상 최대 52시간 미만 입니다!",
								  icon: "warning"
							  }) : flag = 'a';
				return flag;
       		}
       		
       		
       		const coreValidCheck = function(){
       			let flag = "";
       			
       			cnt < 4 ? Swal.fire({
							  text: "근무일은 최소 4일 이상입니다!",
							  icon: "warning"
						 }) : flag = 'a';
       			
				coreValue < 6 ? Swal.fire({
								  text: "주간 최소 근무시간은 6시간 입니다!",
								  icon: "warning"
							}) : '';
					
				return flag;
       		}
       		
       		
       		const workCheck = function(){
       			let startHour = startTime.value.substring(0,2);
       			let startMinute = startTime.value.substring(3,5);
       			let endHour = endTime.value.substring(0,2);
       			let endMinute = endTime.value.substring(3,5);
       			
       			let wtime = timeDiff(startHour,startMinute,endHour,endMinute);
       			let flag = "";
       			
				if(workValue === '0'){
       				flag = workValidCheck(wtime);
       				return flag;
       			}
				else{
       				flag = coreValidCheck();
       				return flag;
       			}
       			
       		}
       		
       		
       		const dataSetting = function(data){
       			if(workValue === '0'){
       				data.begintime = startTime.value;
       				data.endtime = endTime.value;
       				data.coretime = '0';
       				data.workset = workValue;
       				
       			}else{
       				data.begintime = '00:00:00';
       				data.endtime = '00:00:00';
       				data.coretime = coreValue;
       				data.workset = workValue;
       			}
       				
       		}
       		 	
       		
       		function hasNull(target) {
       		    for (let member in target) {
       		        if (target[member] === null || target[member] === undefined || target[member] === '')
       		            return true;
       		    }
       		    return false;
       		}
       		
       		
       		const sendAjax = function(workData){
       			let isFalsy = hasNull(workData);
       			
       			
       			if(isFalsy){
       				return;
       			}
       			
       			$.ajax({
       				url : '<%=request.getContextPath()%>/ctmzManager/modifyWorkTime',
       				type : 'post',
       				data : JSON.stringify(workData),
       				contentType : 'application/json',
       				success : function(result){
       					if(result == 'success'){
   						 Swal.fire({
   							 	title: "저장되었습니다!",
   			                    icon: 'success',
   			                    confirmButtonColor: '#3085d6',
   			                    confirmButtonText: '확인'
   			                }).then((result) => {
   			                    if (result.isConfirmed) {
   							     	getCustomWorkTime("<%=request.getContextPath()%>/ctmzManager/getCustomWorkTime");
   							     	initializeWorkTime();
   							     	weekInit();
   			                    }
   			                })
       					}
       				},
       				error : function(error){
       					AjaxErrorSecurityRedirectHandler(error.status);
       				}
       				
       			});	
       		}
       		
       		
       		const registWorkTime = function(){
       			if(!workValue ){
       				return;
       			}
       			
       			let flag = false;
       			flag = workCheck();
       			if(!flag){
       				return;
       			}
       			
       			
       			const workData = {
       					'monday' : workw[0].dataset.value,
       					'tuesday' : workw[1].dataset.value,
       					'wednesday' : workw[2].dataset.value,
       					'thursday' : workw[3].dataset.value,
       					'friday' : workw[4].dataset.value,
       					'saturday' : workw[5].dataset.value,
       					'sunday' : workw[6].dataset.value
       			}
       			dataSetting(workData);
       			sendAjax(workData);
       			
       		}
       		
       		const initializeWorkTime = function(){
		     	$("input[name='timeset']").prop('checked',false);
		     	startTime.value = "";
		     	endTime.value = "";
		     	core.value = "1";
// 		     	cStart.value = "";
// 		     	cEnd.value = "";
		     	coreValue = "";
		     	worktime.style.display = 'none';
				workweek.style.display = 'none';
				coretime.style.display = 'none';
		     	weekInit();       			
       		}
       		
       		timereset.addEventListener('click',initializeWorkTime);
       		store.addEventListener('click', registWorkTime);
       		
//==================================================================================================================================
			//게시판 커스터마이징
       		const boardSave = document.querySelector('#boardSave');
       		const boardName = document.querySelector('#boardName');
       		const modalboardName = document.querySelector('#modalboardName');
       		const pv = document.querySelector('#private');
       		const pb = document.querySelector('#public');
       		const empId = document.querySelector('#empId');
       		const openedChk = document.querySelector('#openedChk');
       		const confirmBoard = document.querySelector('#confirmBoard');
       		const boardreset = document.querySelector('#boardreset');
       		const opened = document.querySelectorAll('.opened');
			const isOpen = document.querySelectorAll(".isOpen");
			const mdBtns = document.querySelectorAll('.boardModify');
			const delBtns = document.querySelectorAll('.boardDelete');
       		let opendValue = "";
       		let boardCnt = delBtns.length;
       		
       		
       		
       		
       		[].forEach.call(mdBtns, (mb) => {
	        	mb.addEventListener("click" , getBoardDetail);
	        });
       		
       		[].forEach.call(delBtns, (db) => {
       			db.addEventListener("click" , deleteBoard);
	        });
       		
       		
      		document.querySelector('#boardListTbody').addEventListener('click', function(e){
      			if(e.target.classList.contains('boardDelete')){
      				deleteBoard(e);
      			}
      			
      			if(e.target.classList.contains('boardModify')){
      				getBoardDetail(e);
      			}
      			
      		});
	      	
       		
       		function deleteBoard(e){
       			$.ajax({
	            	url : '<%=request.getContextPath()%>/ctmzManager/deleteBoard',
	            	type : 'post',
	            	data : {'bno' : e.target.previousElementSibling.value},
	            	success : function(result){
	            		if(result == 'success'){
	            			Swal.fire({
	            				  title: '정말 삭제하시겠습니까?',
	            				  text: "삭제된 데이터는 복구할 수 없습니다.",
	            				  icon: 'warning',
	            				  showCancelButton: true,
	            				  confirmButtonColor: '#3085d6',
	            				  cancelButtonColor: '#d33',
	            				  confirmButtonText: '확인',
	            				  cancelButtonText: '취소'
	            				}).then((result) => {
	            				  if (result.isConfirmed) {
	            				    Swal.fire({
	            				      title: '삭제되었습니다!',
	            				      icon: 'success'
	            				    });
	            				    $('#boardListTbody').empty();
			                    	getCustomPage("<%=request.getContextPath()%>/ctmzManager/getCustomList");
			                    	getPage("<%=request.getContextPath()%>/common/getCustom");
			                    	boardCnt--;
			                    	opChk = false;
				 	      			opendValue = "";
	            				  }
	            				})
	            		}
			            	            		
	            	},
	            	error : function(error){
	            		AjaxErrorSecurityRedirectHandler(error.status);
	            	}
	            });
       		}
       		
       		
	        function getBoardDetail(e){
	            $.ajax({
	            	url : '<%=request.getContextPath()%>/ctmzManager/getBoard',
	            	type : 'get',
	            	data : {'bno' : e.target.previousElementSibling.value},
	            	success : function(data){
	            		insertData(data);
			            openModal('modal999');	            		
	            	},
	            	error : function(error){
	            		alert(error.status);
	            	}
	            });
	        }
	        
	        
	        function insertData(data){
		    	   let timestamp = data.regdate;
		    	   let date = new Date(timestamp);
		    	   let yyyy = date.getFullYear();
		    	   let mm = ('0' + (date.getMonth() + 1)).slice(-2);
		    	   let dd = ('0' + date.getDate()).slice(-2);
		    	   let registDate = yyyy + "/" + mm + "/" + dd;
		    	 
		    	   data.opened === 1 ? 
					    			   (isOpen[0].innerText = '공개',
					    				isOpen[0].value = 1,
					    				isOpen[1].innerText = '비공개',
					    				isOpen[1].value = 0) 
		    						 : 
					    				(isOpen[0].innerText = '비공개', 
					    				 isOpen[0].value = 0,
					    				 isOpen[1].innerText = '공개',
					    				 isOpen[1].value = 1);
		    	   
		    	    $('#regDate').val(registDate);
		       		$('#boardno').val(data.boardtype_no);
		       		$('#modalboardName').val(data.boardName);
		       		$('#maker').val(data.maker);
		       }
		       
		       	let opChk = false;
	       		for(let i = 0; i < opened.length; i++){
	 	      		opened[i].addEventListener('change', function(){
	 	      			opChk = true;
	 	      			opendValue = this.value;
	 	      		});
	       		}
	       		
	       		
	       		const addBoard = function(){
	       			if(boardCnt >= 5){
	       				Swal.fire({
							  icon: 'warning',
							  title: '게시판은 최대 5개까지 생성 가능합니다!'
						});
		     			return;
	       			}
	       			
	       			if(!boardName.value){
	       				Swal.fire({
						  icon: 'warning',
						  title: '게시판명을 설정해주세요!'
						});
	     				return;
	       			}
	       			
	       			if(!opChk){
	       				Swal.fire({
						  icon: 'warning',
						  title: '공개여부를 설정해주세요!'
						});
	     				return;
	       			}

	       			const data = {
	       					"maker" : empId.value,
	       					"opened" : opendValue,
	       					"boardName" : boardName.value
	       			}
	       			
	       			$.ajax({
	       				url : "<%=request.getContextPath()%>/ctmzManager/registboard",
	       				method : "post",
	       				data : JSON.stringify(data),
	       				contentType : 'application/json',
	       				success : function(data){
	       					if(data == "success"){
	       						Swal.fire({
								 	title: "게시판이 생성되었습니다!",
				                    icon: 'success',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인'
				                }).then((result) => {
				                    if (result.isConfirmed) {	
				                    	$('#boardListTbody').empty();
				                    	getCustomPage("<%=request.getContextPath()%>/ctmzManager/getCustomList");
				                    	getPage("<%=request.getContextPath()%>/common/getCustom");
				                    	boardName.value = "";
				                    	$("input[name='opened']").prop('checked',false);
				                    	boardCnt++;
				                    	opChk = false;
					 	      			opendValue = "";
				                    }
				                })
	       					}
	       				},
	       				error : function(error){
	       					AjaxErrorSecurityRedirectHandler(error.status);
	       				}
	       			});
	       		}
	       		
	       		
	       		let temp = "";
	       		openedChk.addEventListener('change',()=>{
	       			temp = openedChk.options[openedChk.selectedIndex].value;
	    		});
	       		
	       		let chk = true;
	       		$('#modalboardName').change(function(){
	       			chk = false;
	       			
	       		});
	       		
	       		
	       		const modifyBoard = function(){
	       			if(!temp && chk){
	       				$("#modal").fadeOut(300);
	       		        $(".modal-con").fadeOut(300);
	       		        return;
	       			}
	       			
	       			const data = {
	       					"boardtype_no" : $('#boardno').val(),
	       					"boardName" : $('#modalboardName').val(),
	       					"opened" : temp,	
	       			}
	       			
	       			$.ajax({
	       				url : '<%= request.getContextPath()%>/ctmzManager/modifyBoard',
	       				type : 'post',
	       				data : JSON.stringify(data),
	       				contentType : 'application/json',
	       				success : function(result){
	       					if(result == 'success'){
	   						 Swal.fire({
	   							 	title: "수정되었습니다!",
	   			                    icon: 'success',
	   			                    confirmButtonColor: '#3085d6',
	   			                    confirmButtonText: '확인'
	   			                }).then((result) => {
	   			                    if (result.isConfirmed) {
	   									$("#modal").fadeOut(300);
	   							        $(".modal-con").fadeOut(300);
	   							     	$('#boardListTbody').empty();
				                    	getCustomPage("<%=request.getContextPath()%>/ctmzManager/getCustomList");	
				                    	getPage("<%=request.getContextPath()%>/common/getCustom");
				                    	temp = "";
				                    	chk = true;
	   			                    }
	   			                })
	   						}else{
	   							Swal.fire({
		   							  text: "입력한 형식이 올바르지 않습니다!",
		   							  icon: "error",
		   							  button: "확인",
		   						});
	   						}
	       				},
	       				error : function(error){
	       					AjaxErrorSecurityRedirectHandler(error.status);
	       				}
	       			});
					
	       		}
	       		boardreset.addEventListener('click', ()=>{
	       			boardName.value = "";
                	$("input[name='opened']").prop('checked',false);
	       		})
	       		boardSave.addEventListener('click',addBoard);
	       		confirmBoard.addEventListener('click',modifyBoard);
			
// ================================================================================================================================	       	
// 메뉴바 색상 커스터마이징	  
			const colorModify = document.querySelector('#colorModify');
			const topbarColor = document.querySelector('.topbarColor');
			const menureset = document.querySelector('#menureset');			
			
			const topbarColorModify = function(){
				$.ajax({
					url: '<%=request.getContextPath()%>/ctmzManager/modifyTopbar',
					type: 'post',
					data: {'color': topbarColor.value},
					success: function(result){
						if(result == 'success'){
	   						 Swal.fire({
	   							 	title: "저장되었습니다!",
	   			                    icon: 'success',
	   			                    confirmButtonColor: '#3085d6',
	   			                    confirmButtonText: '확인'
	   			                }).then((result) => {
	   			                    if (result.isConfirmed) {
	   							     	window.location.reload();			                       
	   			                    }
	   			                })
	   						}else{
	   							Swal.fire({
		   							  text: "입력한 형식이 올바르지 않습니다!",
		   							  icon: "error",
		   							  button: "확인",
		   						});
	   					}
					},
					error: function(error){
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			}
			
			menureset.addEventListener('click', ()=>{
				window.location.reload();
			})
			colorModify.addEventListener('click', topbarColorModify);
	       	
	       	$( '.topbarColor' ).spectrum({
	       		type: "component",
	       		showPaletteOnly: true,
		       	allowEmpty: false,
		       	palette: [
		            ['#48A6B8', '#EAA763', '#0C8B72','#FBC02C','#E3C9B5'],
		            ['#F01486', '#A067AD', '#8de33d' ,'#DCD0C3', '#E4CAB5'],
		            ['#B4AAA1', '#8E8F92', '#626466', '#383A3A', '#040000'],
		            ['#16a7a1', '#0c8e7d', '#3c7b7f', '#026573', '#5ebdd8'],
		            ['#1199b7', '#075171', '#0e334f', '#92b5d8', '#648198'],
		            ['#4c6588', '#1b3461', '#ada0a5', '#726a77', '#844d6c'],
		            ['#612655', '#a09bc2', '#705799', '#634870', '#442a54'],
		            ['#b7beae', '#bbbe78', '#878a5d', '#889970', '#889970'],
		            ['#cada72', '#c0ca61', '#659962', '#35523c', '#f6bd6a'],
		            ['#ef8f52', '#ea6d30', '#ba5139', '#e7b3a7', '#ef8668'],
		            ['#ea5a4f', '#db1640', '#f9d877', '#7cbfb6', '#92cbdc'],
		            ['#ceddf2']
		        ]
	       	});
	       	
	       	$('#changeColor').hover(function() {
	       		$(this).css('background-color',$(".topbarColor").val());
	                }, function(){
	                    $(this).css('background-color','white');
	            });
	       	
	       	$("#changeColor").click(function() {
	       	    $(".topbarColor").spectrum("toggle");
	       	    return false;
	       	});

		    
	       	$('#cp2').on('click',function(){
	       		$('.topbarColor').spectrum('hide');
	       	});
	       	$('#cp3').on('click',function(){
	       		$('.topbarColor').spectrum('hide');
	       	});
	       	
	       
       </script>
       <!-- 양식 커스텀 위한 스크립트 -->
       <script>
       
       
       // 저장된 양식 리스트
       
       
       function getFormList(){
           $.ajax({
           	url : '<%=request.getContextPath()%>/setle/getForm',
           	type : 'get',
           	success : function(data){
           		let formlisttemp = $('#form-list-template');
           		let template=Handlebars.compile(formlisttemp.html());
 	      	   	let html = template({formList:data});  
 	      	 	$('#form-list').html(html);
		        openModal('modal1100');	            		
           	},
           	error : function(error){
           		alert(error.status);
           	}
           });
       }
       
       // 양식 리스트 삭제
       function formDelete(formNo){
    	   alert(formNo);
       }
       
       // 양식 추가

       function addForm(){
    	   $.ajax({
              	url : '<%=request.getContextPath()%>/setle/addForm',
              	type : 'post',
              	data : { 
              		formNm		:	$('#formNm').val(),
              		formCn		:	$('#formCn').val(),
              		formFileString	:	$('#cpage04 > div.list-type01 > table > tbody > tr:nth-child(3) > td > div > div.note-editing-area > div.note-editable').html()
              	},
              	success : function(result){
              		if(result == 'success'){
  						 Swal.fire({
  							 	title: "저장되었습니다!",
  			                    icon: 'success',
  			                    confirmButtonColor: '#3085d6',
  			                    confirmButtonText: '확인'
  			                }).then((result) => {
  			                    if (result.isConfirmed) {
  							     	window.location.reload();			                       
  			                    }
  			                })
  						}else{
  							Swal.fire({
	   							  text: "입력한 형식이 올바르지 않습니다!",
	   							  icon: "error",
	   							  button: "확인",
	   						});
  					}    		
              	},
              	error : function(error){
              		alert(error.status);
              	}
              });
       }
       </script>
	 
<%@ include file="/WEB-INF/include/footer.jsp" %>