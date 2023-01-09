<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <title>Main</title>
        <%@ include file="/WEB-INF/include/header.jsp" %>
		<style type="text/css">
			canvas{
				    border: 1px solid;
			}
			
			
			.modal-con.modal22 {
					width: auto;
			}
			
			textarea#disagree-cn {
			    width: 490px;
			    height: 250px;
			}
			
			#evlRegist-Btn{
				margin-left:0;
			}
/* 			div#setle-formdiv > *{ */
/*     			border: auto; */
/* 			} */
			span.seleted-emp-span.agree {
				background-color: #1A9CE4;
				color: #fff !important;
				border:0 !important; 
				cursor: auto !important;
			}
			
			span.seleted-emp-span.disagree {
				background-color: #EF6353;
				color: #fff !important;
				border:0 !important; 
				cursor: auto !important;
			}
			.re-detail ul li .se-mem span{
				cursor: auto !important;
			}
			.fa-solid.fa-check-double{
				display: none;
			}
			
			.fa-solid.fa-arrow-rotate-left{
				display: none;
			}
			
			textarea[name="evlModifyText"]{
				display: none;
			}
			.agreement-coment {
    			max-width: 375.02px;
    	
			}
			
		</style>
        
   </head>
<script>

function canvasStart(){
	var canvas = document.getElementById('sign-canvas');
	
	if (canvas.getContext){
	  var ctx = canvas.getContext('2d');
	  // drawing code here
	} else {
	  // canvas-unsupported code here
	}
	let painting = false;
	let filling = false;
	
	function startPainting() {
	  painting = true;
	}
	
	function stopPainting() {
	  painting = false;
	}
	
	function onMouseMove(event) {
	  const x = event.offsetX;
	  const y = event.offsetY;
	  if (!painting) {
	    ctx.beginPath();
	    ctx.moveTo(x, y);
	  } else {
	    ctx.lineTo(x, y);
	    ctx.stroke();
	  }
	}
	
	if (canvas) {
	  canvas.addEventListener("mousemove", onMouseMove);
	  canvas.addEventListener("mousedown", startPainting);
	  canvas.addEventListener("mouseup", stopPainting);
	  canvas.addEventListener("mouseleave", stopPainting);
	}
}

function canvasRemove(){
	var canvas = document.getElementById('sign-canvas');
// 	var dataURL = canvas.toDataURL('image/png');

//     dataURL = dataURL.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');

//     dataURL = dataURL.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');



//     var aTag = document.createElement('a');

//     aTag.download = 'from_canvas.png';

//     aTag.href = dataURL;

//     aTag.click();
	canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height);

}

</script>

<body >

	<form action="<%=request.getContextPath() %>/setle/regist" method="post" id="submitForm" enctype="multipart/form-data">
	
       <div class="wrap">
       
        
        
            <%@ include file="/WEB-INF/include/topbar.jsp" %>
            
        	<div id="modal" class="modal-wrap"></div>
       		<div class="modal-con modal22">
            
	            <canvas id="sign-canvas" width="300" height="300" class="mb-20"></canvas>
	            <div class="modal-btn flex ju-sp-ce">
	              
	                <button type="button" class="close-core" onclick="canvasRemove();">취소</button>
	                  <button type="button" class="regist" onclick="updateEmpSttusToAgree();">확인</button>
	            </div>
          	</div>
          	<div id="modal" class="modal-wrap"></div>
          	<div class="modal-con modal23">
            
	            <textarea id="disagree-cn" class="mb-20" style="resize:none; width:100%"></textarea>
	            <div class="modal-btn flex ju-sp-ce" >
	              
	                <button type="button" class="close-core">취소</button>
	                <button type="button" class="regist" onclick="updateEmpSttusToDisagree();">확인</button>
	            </div>
          	</div>
    	<div class="container flex">
             
            
             

            <div class="content">
            	
             
            
                <div class="approval-wrap">
                
                   <div class="flex flex-end mb-20">
	                    <button type="button" class="back" onclick="backPage();"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
	                    <c:if test="${setle.sttusNo ne 3}">
		                    <c:if test="${setle.sttusNo eq 0 or setle.sttusNo eq 2}">
		                    	<button type="button" class="regist" onclick="modify_setle();"><i class="fa-solid fa-floppy-disk"></i>수정하기</button>
		                    </c:if>
		                    
		                    <c:if test="${setle.sttusNo ne 0 and setle.sttusNo ne 2}">
		                    	<button type="button" class="regist" onclick="setle_cancel();"><i class="fa-solid fa-floppy-disk"></i>회수하기</button>
		                    </c:if>
	                    </c:if>
	                </div>
	                
                    <div class="approval-regist">
                        <div class="approval-title flex al-it-ce">
                            <i class="fa-solid fa-file-pen"></i>
                            ${setle.setleSj }
                        </div>

                        <div class="approval-content flex ju-sp-bt">
                            <div class="app-con con01">
                                <div class="app-tab con01 flex ju-sp-bt al-it-ce">
                                    <ul class="flex">
                                        <li><a href="#tab01" class="active">상세정보</a></li>
                                        <li><a href="#tab02" id="setleFormView">입력양식</a></li>
                                    </ul>

                                    <div class="all-down" id="downloadBtn">
                                        <span>전체 다운로드</span>
                                    </div>
                                </div>

                                <div class="app-tabcontent">
                                    <div id="tab01">
                                      
                                        <div class="detail-con mb-20">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <span>${setle.writerEmpVO.name }의 결재 합의서</span>
                                            </div>

                                            <div class="de-bot flex">
                                                <div class="de-userinfo">
                                                <div class="user-img">
                                                    </div>

                                                    <div class="user-detail">
                                                        <h4>
                                                            작성자와의 소통
                                                        </h4>

                                                        <ul>
                                                            <li>
                                                                <em>Feed</em>
                                                                <span style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/feed/feedPage?emp=${setle.writerEmpVO.empl_no }'"><i class="fa-solid fa-heart"></i>피드로 이동하기</span>
                                                            </li>

                                                            <li>
                                                                <em>Email</em>
                                                                <span><i class="fa-solid fa-envelope"></i>${setle.writerEmpVO.email }</span>
                                                            </li>

                                                            <li>
                                                                <em>내선번호</em>
                                                                <span><i class="fa-solid fa-phone"></i> ${setle.writerEmpVO.phone }</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="de-con">
                                                    <div class="wri-info flex ju-sp-bt al-it-ce">
                                                        <div class="de-name">
                                                            <h1>${setle.writerEmpVO.name }</h1>
                                                            <span>${setle.writerEmpVO.ncnm }</span>
                                                        </div>

                                                        <div class="de-part">
                                                            <span><i class="fa-solid fa-briefcase"></i>${setle.writerEmpVO.dept }</span>
<!--                                                             <em>마케팅1부</em> -->
                                                        </div>
                                                    </div>

                                                    <div class="re-detail modi">
                                                        <ul class="flex flex-wrap">
                                                            <li>
                                                                <i class="fa-solid fa-pen"></i>
                                                                작성일 : 
                                                                <span><fmt:formatDate value="${setle.writngOn }" pattern="yyyy.MM.dd"/></span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                평가기한 :
                                                                <fmt:formatDate value="${setle.evlStartDate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${setle.evlEndDate }" pattern="yyyy.MM.dd"/> 
                                                            </li>

                                                            
                                                            <li>
                                                                <i class="fa-solid fa-users"></i>
                                                                평가인원 :
                                                                <span>부서전체 (${departEmpCount })</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                합의기한 :
                                                                <fmt:formatDate value="${setle.agrStartDate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${setle.agrEndDate }" pattern="yyyy.MM.dd"/>
                                                            </li>

                                                            <li>
<!--                                                                 <div class="flex al-it-ce mb-10"> -->
<!--                                                                 <i class="fa-solid fa-users" style="margin-right: 13px"></i> -->
                                                                
<!--                                                               합의인원 :   <div class="aggre-mem"> -->
<!--                                                                     <select id="depart-selector"> -->
<!--                                                                         <option>부서</option> -->
<%--                                                                         <c:forEach items="${departList}" var="depart"> --%>
<%--                                                                         	<option value="${depart.dept_nm }">${depart.dept_nm }</option> --%>
<%--                                                                         </c:forEach> --%>
<!--                                                                     </select> -->

<!--                                                                     <select id="depart-emp-seletor"> -->
<!--                                                                         <option value="notSelect">이름</option> -->
<!--                                                                     </select> -->

<!--                                                                     <button type="button" id="add-setle-emp"><i class="fa-solid fa-plus"></i></button> -->
<!--                                                                 </div> -->
<!--                                                                 </div> -->

                                                                <div class="se-mem detailmember" id="selected-depart-emp">
                                                               합의인원 :      
                                                               <c:forEach var="setleEmp" items="${setle.setleEmpList }">
                                                               <span class="seleted-emp-span <c:if test="${setleEmp.agrSttus eq 2}">disagree</c:if><c:if test="${setleEmp.agrSttus eq 3}">agree</c:if>">${setleEmp.empNm}</span>
                                                               </c:forEach>
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
                                                                </div>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <div class="regist-box" id="regist-box">
                                                    <h4>내용</h4>

                                                    
                                                        <div class="editor">
                                                            ${setle.setleCn }
                                                        </div>
	                                                    
                                                  	</div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                         
										<c:forEach var="attach" items="${setle.setleAttachList }">
                                        <div class="file flex al-it-ce" role="fileListView" >
                                            <i class="fa-solid fa-file-lines"></i>
                                            <span>${attach.originalname }</span>
                                            <i class="fa-solid fa-download" onclick="location.href='<%=request.getContextPath() %>/setle/download?uploadPath=${attach.uploadPath }&fileName=${attach.fileName }'"></i>
                                            
                                        </div>
                                        </c:forEach>

                                    </div>

                                    <div id="tab02">
<%--                                        <c:forEach var="attach" items="${setle.setleAttachList }"> --%>
<!--                                         <div class="file flex al-it-ce" role="fileListView" > -->
<!--                                             <i class="fa-solid fa-file-lines"></i> -->
<%--                                             <span>${attach.originalname }</span> --%>
<%--                                             <i class="fa-solid fa-download" onclick="location.href='<%=request.getContextPath() %>/setle/download?uploadPath=${attach.uploadPath }&fileName=${attach.fileName }'"></i> --%>
<!--                                         </div> -->
<%--                                         </c:forEach> --%>
                                        

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce ju-sp-bt">
                                                <i class="fa-solid fa-list"></i> 
                                                <!-- <select id="formselect" onchange="formChange();">
                                                	<option value="form1" id="">연차신청서</option>
                                                	<option value="form2" id="">비품신청서</option>
                                                	<option value="form3" id="">지출청구서</option>
                                                	<option value="form4" id="">시말서</option>
                                                	<option value="form5" id="">사후보고서</option>
                                                </select> -->
                                                <div class="print"  id="formPrint" >
                                                	<i class="fa-solid fa-print"></i>
                                                	<input type="button" value="인쇄" >
                                                </div>
                                                
                                            </div>

                                            <div class="de-bot flex" style="overflow: scroll;" >
                                                <div id="setle-formdiv" style="heimin-height :297mm; min-width: 210mm;"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="app-con con02">
                            <c:if test="${setle.sttusNo eq 1}">
                                      <c:forEach var="setleEmp" items="${setle.setleEmpList }">
                                      
	                                      <c:if test="${setleEmp.emplNo eq loginEmp.empl_no }">
	                                      	<c:if test="${setleEmp.agrSttus ne 3 }">
	                                        
	
	                                        <div class="agreement-btn flex ju-sp-bt">
	                                            <button type="button" class="ag" style="margin-left:0;" onclick="javascript:openModal('modal22');canvasStart();"><i class="fa-solid fa-handshake"></i> 합의</button>
	                                            <button type="button" class="bk" onclick="javascript:openModal('modal23');"><i class="fa-solid fa-arrow-rotate-left"></i>반려</button>
	                                        </div>
	                                        </c:if>
	                                      </c:if>
                                      </c:forEach>
                                      </c:if>
                                <div class="app-btntab">
                                    <ul class="flex ju-sp-bt">
                                        <li><a href="#agreTab01" class="on">평가</a></li>
                                        <li><a href="#agreTab02">댓글</a></li>
                                    </ul>
                                </div>

                                <div class="comment-tab">
                                    <div id="agreTab01">
                                    
                                        <div class="agree-cowrap">
                                        <c:if test="${(setle.evlStartDate le today) and (setle.evlEndDate ge today)}">
<c:if test="${setle.sttusNo eq 3 }">
<c:if test="${loginEmp.empl_no ne setle.setleWriter}">
<c:choose>
<c:when test="${loginEmp.dept eq setle.writerEmpVO.dept }">
                                            <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"    style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no=${loginEmp.empl_no }')"></div>
                                                            <div class="nick-name">${loginEmp.ncnm }</div>
                                                            
                                                        </div>

                                                    </div>

                                                    <div class="ag-con">
                                                        <div class="flex al-it-ce mb-20">
                                                            <select id="evlTy-selector" >
                                                            <c:forEach var="setleEmps" items="${setle.setleEmpList }">
															<c:if test="${setleEmps.emplNo eq loginEmp.empl_no}"> 
                                                                <option value="0">업무평가</option>
                                                            </c:if>   
                                                            </c:forEach>
                                                             
                                                            <c:if test="${loginEmp.dept eq setle.writerEmpVO.dept }">
                                                                <option value="1">역량평가</option>
                                                            </c:if>
                                                            </select>
                                                            <ul class="flex" id="evlLv-ul">
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star on"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                            </ul>
                                                        </div>

                                                        <div>
                                                            <textarea id="evlCn"></textarea>
                                                        </div>

                                                

                                                        <div class="ag-btn">
                                                            <button type="button" id="evlRegist-Btn" onclick="registEvl();">작성하기</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
</c:when>
<c:otherwise>
<c:forEach var="setleEmp" items="${setle.setleEmpList }">
<c:if test="${setleEmp.emplNo eq loginEmp.empl_no}">                                            
											<div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"   style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no=${loginEmp.empl_no }')" ></div>
                                                            <div class="nick-name">${loginEmp.ncnm }</div>
                                                            
                                                        </div>

                                                    </div>

                                                    <div class="ag-con">
                                                        <div class="flex al-it-ce mb-20">
                                                            <select id="evlTy-selector" >
                                                            <c:forEach var="setleEmps" items="${setle.setleEmpList }">
															<c:if test="${setleEmps.emplNo eq loginEmp.empl_no}"> 
                                                                <option value="0">업무평가</option>
                                                            </c:if>   
                                                            </c:forEach>
                                                             
                                                            <c:if test="${loginEmp.dept eq setle.writerEmpVO.dept }">
                                                                <option value="1">역량평가</option>
                                                            </c:if>
                                                            </select>
                                                            <ul class="flex" id="evlLv-ul">
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star on"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                                <li><i role="evlLv-star-input" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
                                                            </ul>
                                                        </div>

                                                        <div>
                                                            <textarea id="evlCn"></textarea>
                                                        </div>

                                                

                                                        <div class="ag-btn">
                                                            <button type="button" id="evlRegist-Btn" onclick="registEvl();">작성하기</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
</c:if>
</c:forEach>
</c:otherwise>
</c:choose>
</c:if>
</c:if>
</c:if>
											<div id="evlListPrint">
	                                            
                                            </div>

                                        </div>
                                    </div>

                                    <div id="agreTab02">
                                    <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"    style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no=${loginEmp.empl_no }')"></div>
                                                            <div class="nick-name">${loginEmp.ncnm }</div>
                                                            <c:if test="${loginEmp.empl_no eq setle.setleWriter}"><span class="mytip">MY</span></c:if>
                                                        </div>

                                                    </div>

                                                    <div class="ag-con">

                                                        <div>
                                                            <textarea id='reply-content'></textarea>
                                                        </div>

                                                

                                                        <div class="ag-btn mg-de">
                                                            <button type="button" onclick="registReply();">작성하기</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
	                                  	<div class="agree-cowrap-s">
                                    		<div id="replyListDiv">
	                                            <div class="agreement-coment">
	                                                <div class="ag-coment">
	                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
	                                                        <div class="flex al-it-ce">
	                                                            <div class="modi-img"></div>
	                                                            <div class="nick-name"></div>
	                                                            <span class="mytip">MY</span>
	                                                        </div>
	
	                                                        
	                                                        <ul class="flex">
	<!--                                                             <li><i class="fa-solid fa-pen"></i></li> -->
	<!--                                                             <li><i class="fa-solid fa-xmark"></i></li> -->
	                                                        </ul>
	                                                    </div>
	
	                                                    <div class="ag-con">
	
	                                                        <div class="ag-result">
	                                                            평가 내용 넣어주세요옹~
	                                                        </div>
	                                                        <em class="ag-date">2022. 01. 01</em>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="agreement-coment">
	                                                <div class="ag-coment">
	                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
	                                                        <div class="flex al-it-ce">
	                                                            <div class="modi-img"></div>
	                                                            <div class="nick-name"></div>
	                                                            <span class="mytip">MY</span>
	                                                        </div>
	
	                                                        
	                                                        <ul class="flex">
	<!--                                                             <li><i class="fa-solid fa-pen"></i></li> -->
	<!--                                                             <li><i class="fa-solid fa-xmark"></i></li> -->
	                                                        </ul>
	                                                    </div>
	
	                                                    <div class="ag-con">
	
	                                                        <div class="ag-result">
	                                                            평가 내용 넣어주세요옹~
	                                                        </div>
	                                                        <em class="ag-date">2022. 01. 01</em>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="agreement-coment">
	                                                <div class="ag-coment">
	                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
	                                                        <div class="flex al-it-ce">
	                                                            <div class="modi-img"></div>
	                                                            <div class="nick-name"></div>
	                                                            <span class="mytip">MY</span>
	                                                        </div>
	
	                                                        
	                                                        <ul class="flex">
	<!--                                                             <li><i class="fa-solid fa-pen"></i></li> -->
	<!--                                                             <li><i class="fa-solid fa-xmark"></i></li> -->
	                                                        </ul>
	                                                    </div>
	
	                                                    <div class="ag-con">
	
	                                                        <div class="ag-result">
	                                                            평가 내용 넣어주세요옹~
	                                                        </div>
	                                                        <em class="ag-date">2022. 01. 01</em>
	                                                    </div>
	                                                </div>
	                                            </div>
                                            </div>
<!--                                             <div class="page-btn flex" id="replyPageDiv"> -->
<!-- 												<a class="p-num prev" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i> -->
<%-- 												</a> <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');"> --%>
<!-- 													<i class="fas fa-angle-left"></i> -->
<!-- 												</a> -->
					
<%-- 												<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }"> --%>
<%-- 													<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a> --%>
<%-- 												</c:forEach> --%>
					
<%-- 												<a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');"> --%>
<!-- 													<i class="fas fa-angle-right"></i> -->
<%-- 												</a> <a class="p-num next" href="javascript:list_go('${pageMaker.realEndPage}');"> <i class="fas fa-angle-double-right"></i> --%>
<!-- 												</a> -->
<!-- 											</div> -->

                                            
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        
                    </div>
                </div>

                
            </div>

       </div>
      </div>
      <input type="hidden" value="${loginEmp.empl_no }" name="setleWriter">
      <input type="hidden" value="${loginEmp.dept }" name="writerDepart">
	  </form>
	 <script type="text/javascript">
	 function updateEmpSttusToDisagree(){
	 		var agrContent = document.getElementById('sign-canvas');
	 		 var aggreForm =new FormData();
	 		
	 		aggreForm.append("agrSttus", 2);
	 		
	 		aggreForm.append("emplNo", '${loginEmp.empl_no}');
	 		
	 		aggreForm.append("empNm", '${loginEmp.name}');
	 		
	 		aggreForm.append("setleNo", '${setle.setleNo}');
	 		
	 		aggreForm.append("cotent", $('#disagree-cn').val());
	 		
	 		var request = new XMLHttpRequest();
	 		request.open("post", "<%=request.getContextPath()%>/setle/disagree", false);
	 		
	 		request.onreadystatechange = function (event) { 
	 			const { target } = event; 
	 			if (target.readyState === XMLHttpRequest.DONE) { 
	 				const { status } = target; 
	 				if (status === 0 || (status >= 200 && status < 400)) { // 요청이 정상적으로 처리 된 경우 
	 					location.href="<%=request.getContextPath()%>/setle/setleDetail?setleNo=${setle.setleNo}";
	 				} else {
	 						// 에러가 발생한 경우 
	 						
	 				} 
	 			} 
	 		};

	 	
	 		
	 		request.send(aggreForm);
	 		
	 }
	 
	 	function updateEmpSttusToAgree(){
	 		var canvas = document.getElementById('sign-canvas');
	 		var dataURL = canvas.toDataURL('image/png');
	 		 var aggreForm =new FormData();
	 		
	 		aggreForm.append("agrSttus", 3);
	 		
	 		aggreForm.append("emplNo", '${loginEmp.empl_no}');
	 		
	 		aggreForm.append("empNm", '${loginEmp.name}');
	 		
	 		aggreForm.append("setleNo", '${setle.setleNo}');

	 		
	 		
	 		
	 		
			var data = new DataTransfer();
	 		 
	 		  var fileName = "signImg";
	 		 
	 		  var imgDataUrl = canvas.toDataURL('image/png');
	 		  var binaryData = atob(imgDataUrl.split(',')[1]);
	 		  var array = [];
	 		 
	 		  for (var i = 0; i < binaryData.length; i++) {
	 		  	array.push(binaryData.charCodeAt(i));
	 		  }
	 		 
	 		var aaa = new File([new Uint8Array(array)], fileName, {type: 'image/png'})
	 		
	 		
	 		
	 		aggreForm.append("uploadSign", aaa);
	 		
	 	
	 		var request = new XMLHttpRequest();
	 		request.open("post", "<%=request.getContextPath()%>/setle/agree", false);
	 		
	 		request.onreadystatechange = function (event) { 
	 			const { target } = event; 
	 			if (target.readyState === XMLHttpRequest.DONE) { 
	 				const { status } = target; 
	 				if (status === 0 || (status >= 200 && status < 400)) { // 요청이 정상적으로 처리 된 경우 
	 					location.href="<%=request.getContextPath()%>/setle/setleDetail?setleNo=${setle.setleNo}";
	 				} else {
	 						// 에러가 발생한 경우 
	 						
	 				} 
	 			} 
	 		};

	 	
	 		
	 		request.send(aggreForm);
	 	}
	 		
	 </script>
	  <script type="text/x-handlebars-template"  id="replyList-template" >
		{{#each setleReplyList}}
												<div class="agreement-coment">
	                                                <div class="ag-coment">
	                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
	                                                        <div class="flex al-it-ce">
	                                                            <div class="modi-img"  style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no={{setleReplyWriter}}')" ></div>
	                                                            <div class="nick-name">{{setleReplyWriterNcnm}}</div>
	                                                            {{#VisibleByLoginCheck setleReplyWriter}}<span class="mytip">MY</span>{{/VisibleByLoginCheck}}
	                                                        </div>
	
	                                                        
	                                                        <ul class="flex">
	                                                          	{{#VisibleByLoginCheck setleReplyWriter}}
																<li><i class="fa-solid fa-pen"></i><input type="hidden" value="{{this.setleReplyNo}}"/></li>
	                                                          	<li><i class="fa-solid fa-xmark" onclick="replyRemove(this);"></i><input type="hidden" value="{{this.setleReplyNo}}"/></li>
																{{/VisibleByLoginCheck}}
																
	                                                        </ul>
	                                                    </div>
	
	                                                    <div class="ag-con">
	
	                                                        <div class="ag-result" role='result'>
	                                                            {{setleReplyCn}}
	                                                        </div>
	                                                        <em class="ag-date">{{prettifyDate setleReplyRgdt}}</em>
	                                                    </div>
	                                                </div>
	                                            </div>
		{{/each}}
		
											
		
	</script>
	 <script type="text/x-handlebars-template"  id="evlList-template" >
		{{#each setleEvlList}}
												<div class="agreement-coment">
	                                                <div class="ag-coment">
	                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
	                                                        <div class="flex al-it-ce">
	                                                            <div class="modi-img"  style="background-image: url('/mzgw/user/getPictureEmplNo.do?empl_no={{emplNo}}')" ></div>
	                                                            <div class="nick-name">{{empNcnm}}</div>
	                                                            {{#VisibleByLoginCheck emplNo}}<span class="mytip">MY</span>{{/VisibleByLoginCheck}}
	                                                        </div>
	
	                                                        
	                                                        <ul class="flex">
	                                                          	{{#VisibleByLoginCheck emplNo}}
																<li><i class="fa-solid fa-pen" onclick="evlModify(this);"></i><input type="hidden" value="{{this.evlNo}}"/></li>
	                                                          	<li><i class="fa-solid fa-xmark" onclick="evlRemove(this);"></i><input type="hidden" value="{{this.evlNo}}"/></li>
																<li><i class="fa-solid fa-check-double" onclick="evlModifySend(this)"></i><input type="hidden" value="{{this.evlNo}}"/></li>
																<li><i class="fa-solid fa-arrow-rotate-left" onclick="evlModifyCancel(this)"></i></li>
																{{/VisibleByLoginCheck}}
	                                                        </ul>
	                                                    </div>
	
	                                                    <div class="ag-con">
	                                                        <div class="flex al-it-ce mb-20">
	                                                            {{#ifCond this.evlTy 0}}<span>업무평가</span>{{else}}<span>역량평가</span>{{/ifCond}}
	                                                            <ul class="flex">
																	{{#loopTo 1 this.evlLv}}
	                                                                <li><i role="evlLv-star" onclick="clickstar(this);" class="fa-solid fa-star on"></i></li>
																	{{/loopTo}}
																	{{#loopTos this.evlLv 5}}
	                                                                <li><i role="evlLv-star" onclick="clickstar(this);" class="fa-solid fa-star"></i></li>
																	{{/loopTos}}
	                                                            </ul>
	                                                        </div>
	
	                                                        <div class="ag-result" role='result'>
	                                                            {{evlCn}}
	                                                        </div>
															<textarea name="evlModifyText">{{evlCn}}</textarea>
	                                                        <em class="ag-date">{{prettifyDate evlRegdate}}</em>
	                                                    </div>
	                                                </div>
	                                            </div>
		{{/each}}
		{{#with pageMaker}}
						<div class="page-btn flex ju-sp-ce">
							<a class="p-num prev-first" href="javascript:callEvlList(1);"> <i class="fas fa-angle-double-left"></i>
							</a>


							{{#loop this}}
								<a class="p-num num {{#ifCond this.cri.page this.pageNum}}on{{/ifCond}}" href="javascript:callEvlList('{{this.pageNum}}');">{{this.pageNum}}</a>
							{{/loop}}

							
							<a class="p-num next-last" href="javascript:callEvlList('{{realEndPage}}');"> <i class="fas fa-angle-double-right"></i>
							</a>
						</div>
		{{/with}}
											
		
	</script>
	
    <script>
    
    
  	function registReply(){
  		if($('#reply-content').val()){
	  		$.ajax({
		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "<%=request.getContextPath() %>/setleReply/regist",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		        	setleNo : ${setle.setleNo},
		        	setleReplyWriterNcnm : '${loginEmp.ncnm}',
		        	setleReplyWriter : '${loginEmp.empl_no}',
		        	setleReplyCn	: $('#reply-content').val()
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
    
    
    function callReplyList(page){
	    $.ajax({
	        type : "POST",            // HTTP method type(GET, POST) 형식이다.
	        url : "<%=request.getContextPath() %>/setleReply/list",      // 컨트롤러에서 대기중인 URL 주소이다.
	        data : {
	        	setleNo : ${setle.setleNo},
	        	page : page
	        },            // Json 형식의 데이터이다.
	        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	        	var template = Handlebars.compile($('#replyList-template').html());
	        	$('#replyListDiv').html(template(res));
	        	
	        	
	        	var	pagehtml =`<div class="page-btn flex ju-sp-ce" id="replyPageDiv">
					<a class="p-num prev-first" href="javascript:callReplyList(1);"> <i class="fas fa-angle-double-left"></i>
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
		        	
		        	pagehtml +=`<a class="p-num next-last" href="javascript:callReplyList(`+res.pageMaker.realEndPage+`);"> <i class="fas fa-angle-double-right"></i>
						</a>
						</div>`
		        	
		        	 
		        	 $('#replyListDiv').append(pagehtml);
	        	}
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	            alert("통신 실패.")
	        }
	    });
    }
    
    function replyRemove(obj){
		console.log($(obj).next().val() +"번 삭제");
		$.get('<%=request.getContextPath()%>/setleReply/remove?setleReplyNo='+$(obj).next().val(),function(res){
			
			alert("댓글 삭제 완료");
			callReplyList(1);
		});
	}
    
    callReplyList(1);
    </script>
     <script>
     var evlLv = 1;
     
	  function clickstar(obj){
		  var starIndex = $('i[role="evlLv-star-input"]').index(obj);
		  for(var i = 0 ; i<$('i[role="evlLv-star-input"]').length ; i++){
			  if(i<=starIndex){
				  $('i[role="evlLv-star-input"]').eq(i).attr("class","fa-solid fa-star on");
			  }else{
				  $('i[role="evlLv-star-input"]').eq(i).attr("class","fa-solid fa-star");
			  }
		  }
		  evlLv = starIndex+1;
	  }
	  
	  function registEvl(){
	  		if($('#evlCn').val()){
		  		$.ajax({
			        type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "<%=request.getContextPath() %>/setleEvl/regist",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	setleNo : ${setle.setleNo},
			        	empNcnm : '${loginEmp.ncnm}',
			        	emplNo : '${loginEmp.empl_no}',
			        	evlCn	: $('#evlCn').val(),
			        	evlLv	: evlLv,
			        	evlTy 	: $("#evlTy-selector").val(),
			        	setleNcnm : '${setle.writerEmpVO.ncnm}'
			        },            // Json 형식의 데이터이다.
			        success : function(){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			            // 응답코드 > 0000
			            callEvlList(1);
			            $('#evlCn').val("");
			  
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
	  
	  function callEvlList(page){
		    $.ajax({
		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "<%=request.getContextPath() %>/setleEvl/list",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		        	setleNo : ${setle.setleNo},
		        	page : page
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	var template = Handlebars.compile($('#evlList-template').html());
		        	$('#evlListPrint').html(template(res));
        	
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		            alert("통신 실패.")
		        }
		    });
	    }
	  
	function evlModify(obj){
		console.log($(obj).next().val() +"번 수정");
		var result = $(obj).parent().parent().parent().parent();
		$(obj).css('display','none');
		$(obj).parent().next().children().css('display','none');
		$(obj).parent().next().next().children().css('display','inline');
		$(obj).parent().next().next().next().children().css('display','inline');
		$(result).children().children('div[role="result"]').css('display','none');
		$(result).children().children('textarea[name="evlModifyText"]').css('display','inline');
		
	}
	
	function evlModifySend(obj){
		var evlNo = $(obj).next().val();
		var result = $(obj).parent().parent().parent().parent();
		var evlCn = $(result).children().children('textarea[name="evlModifyText"]').val();
		if(evlCn){
	  		$.ajax({
		        type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "<%=request.getContextPath() %>/setleEvl/modify",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		        	evlNo 	: evlNo,
		        	evlCn	: evlCn
		        },            // Json 형식의 데이터이다.
		        success : function(){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		            // 응답코드 > 0000
		            callEvlList(1);
		          
		  
		            alert("수정 성공");
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		            alert("수정 실패")
		        }
		    });
  		}else{
  			alert("내용을 입력하세요")
  		}
		
	}
	
	function evlModifyCancel(obj){
		var result = $(obj).parent().parent().parent().parent();
		$(obj).css('display','none');
		$(obj).parent().prev().children().css('display','none');
		$(obj).parent().prev().prev().children().css('display','inline');
		$(obj).parent().prev().prev().prev().children().css('display','inline');
		$(result).children().children('div[role="result"]').css('display','inline');
		$(result).children().children('textarea[name="evlModifyText"]').css('display','none');
		$(result).children().children('textarea[name="evlModifyText"]').val($(result).children().children('div[role="result"]').html().trim());
	}
	
	function evlRemove(obj){
		console.log($(obj).next().val() +"번 삭제");
		$.get('<%=request.getContextPath()%>/setleEvl/remove?evlNo='+$(obj).next().val(),function(res){
			
			alert("평가 삭제 완료");
			callEvlList(1);
		});
	}
	callEvlList(1);
	  </script>
	
    <script>
    	var formdoc = "";
		
		var writedoc = "";
		var inputstrArr = [];
		var inputValues;
		
		function jsonToForm(jsonData){
    		writedoc = formdoc;
    		for(var key in jsonData){
    			var namestr = key
    			var valstr = jsonData[key];
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    		}
    		$('#setle-formdiv').html(writedoc);
    	}
    	
		
		$('#setleFormView').on("click",function(){
			$.ajax({
				type : "get",
				url : "formText",
				data : {unityFileNo : ${setle.setleForm.formFile}},
				dataType:"text",
				success: function(data){
					formdoc = data;
					
					jsonToForm(${setle.formInputs});
				},
				error : function(){
					console.log("양식 못가져옴.");
				}
			});
		});
    
    	$('#formPrint').on("click",function(){
    		  let $container = $("#setle-formdiv").clone()    // 프린트 할 특정 영역 복사
    		    let cssText = ""                            // 스타일 복사
    		    for (const node of $("style")) {
    		        cssText += node.innerHTML
    		    }
    		    /** 팝업 */
    		    let innerHtml = $container[0].innerHTML
    		    let popupWindow = window.open("", "_blank", "width=700,height=800")
    		    popupWindow.document.write("<!DOCTYPE html>"+
    		      "<html>"+
    		        "<head>"+
    		        "<style>"+cssText+"</style>"+
    		        "</head>"+
    		        '<body style=" height :297mm; width: 210mm;"><div style="align:center;">'+innerHtml+'</body>'+
    		      "</html>")
    		   
    		    popupWindow.document.close()
    		    popupWindow.focus()

    		    /** 1초 지연 */
    		    setTimeout(() => {
    		        popupWindow.print()         // 팝업의 프린트 도구 시작
    		        popupWindow.close()         // 프린트 도구 닫혔을 경우 팝업 닫기
    		    }, 1000)

    	});
    	
    	
    	
    	function boundarySearch(str){
    		
    		var nowIndex = 0;
    		var searchStr = [];
    			
    		while(true){
    			
    			
    			
    			var sindex = str.indexOf("{{" , nowIndex);
    			nowIndex = sindex;
    			if(nowIndex==-1){
    				break;
    			}
    			var eindex = str.indexOf("}}", nowIndex);
    			nowIndex = eindex;
    			
    			searchStr.push(str.substring(sindex+2,eindex));
    		}
    		
    		var set = new Set(searchStr);
    		searchStr = [...set];
    		
    		return searchStr;
    	}
    	
    	
    	
    	$('#inputToForm').on('click',function(){
    		var input;
    		writedoc = formdoc;
    		for(var str of inputstrArr){
    			input = $("#"+str);
    			var namestr = $(input).attr('name');
    			var valstr = $(input).val();
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    			
    		}
    		
    		$('#setle-formdiv').html(writedoc);
    		
    		var formInputNode = document.querySelectorAll('input[role=formInputValues]');
			if(document.querySelector('input[name="formInputs"]')){
				var formInputValues = document.querySelector('input[name="formInputs"]');
			}else{
	    		var formInputValues = document.createElement("input");
				formInputValues.setAttribute("name","formInputs");
			}
			
			
			console.log(formInputValues.name);
			
			formInputValues.value = JSON.stringify(inputToJsonByName(formInputNode));
			
			$("#submitForm").append(formInputValues);
			
			
			
    		
    	});
    	
    	function checkInputHidden(str){
    		
    		var check = str.indexOf("서명") != -1;
    		check = check || (str.indexOf("서명") != -1);
    		
    		
    		
    		
    		return check;
    	}
    	
    	$('#formselect').on('change',function(){
    		
    		if(this.value == 1){
    			
    			
    			
    			var inputHtml = "";
    			
    			inputstrArr = boundarySearch(formdoc);
    			
    			for(var str of inputstrArr){
    				
    				if(checkInputHidden(str)){
    					inputHtml = inputHtml + "<input type='hidden' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/><br>";
    				}else if(str.indexOf("일자") != -1){
    					inputHtml = inputHtml + "<label>"+str+"</label><input type='date' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/><br>";
    				}else{
    				
    					inputHtml = inputHtml + "<input type='text' id="+str+" name="+str+" placeholder="+str+" role='formInputValues' /><br>"
    				
    				}
    				
    			}
    			
    			
    			
    			$('#formInput').html(inputHtml);
    			
    			
    		}
    	})
    	
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
		{{#each .}}
			<option value={{this.empl_no}} class=appendDepartEmp>{{this.ncnm}}</option>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template" id="selected-dpartEmp-template">
		<span class="seleted-emp-span" onclick='removeSelected(this);'>{{empName}}<i class="fa-solid fa-xmark"></i><input type="hidden" name="setleEmpList" value="{{empNo}}/{{empName}}"></span>
		
	</script>
	
	<script type="text/javascript">
		$('#depart-selector').on('change',function(){
			var depart = $(this).val();
			$.getJSON("<%=request.getContextPath()%>/emp/EmpListByDepart?depart="+depart,function(empList){
				var template=Handlebars.compile($('#deparEmpList-selector-template').html());
				
				var empHtml = template(empList);
				
				$('.appendDepartEmp').remove();
				$('#depart-emp-seletor').append(empHtml);
			});
			
		});
		
		$('#add-setle-emp').on("click", function(){
			console.log("클릭");
			
			var template = Handlebars.compile($('#selected-dpartEmp-template').html());
			var empvalue = {
					empNo : $('#depart-emp-seletor').val() , 
					empName : $('#depart-emp-seletor  option:checked').text() 
			};
			
			
			var empHtml = template(empvalue);
			
			for(var ta of $('input[name=setleEmpList]')){
				if($(ta).val() == empvalue.empNo+"/"+empvalue.empName){
					return;
				}
			}
			
			if($('#depart-emp-seletor').val() == "notSelect"){
				return;
			}
			
			$('#selected-depart-emp').append(empHtml);
		});
		
		function removeSelected(ta){
			
			
			$(ta).remove();
			
		}
	</script>
	

	
	<script>

		function inputToJsonByName(inputs){
			
			var inputJson = {};
			
			for(var tag of inputs){
				inputJson[tag.name] = tag.value;
			}
			
			
			return inputJson;
		}
	
		function backPage(){
			window.history.go(-1);
			
			
			
		}
		
		function checkInputNull(){
			
			var check = true;
			// 조건 추가
			
			
			
			return check;
			
		}
	
		function regist_setle(){
			
			

			
			$("#submitForm").submit();

		}
		
		function modify_setle(){
			
			location.href="<%=request.getContextPath()%>/setle/setleModify?setleNo=${setle.setleNo}"
			
		}
	
	</script>
	
	
	<script type="text/x-handlebars-template" id="attachView-template">
		{{#each fileArr}}
		 <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)">
         	<i class="fa-solid fa-file-lines"></i>
         	<span>{{this.name}}</span>
         	<i class="fa-solid fa-xmark"></i>
         </div>
		{{/each}}

	</script>
	
	
<!-- 	첨부파일스크립트 -->
	
	<script type="text/javascript">
	
	function printFileView(obj){
		var fileList = Array.from(obj.files)
		var template = Handlebars.compile($('#attachView-template').html());
		
		var fileArr = [];
		for(var file of fileList){
			fileArr.push({"name" : file.name})
		}
		
		var updateHtml = template({"fileArr":fileArr});
		
		$('div[role="fileListView"]').remove();
		$('#file-attach-div').after(updateHtml);
		
		
		
		
	}
	
	
	var input = document.createElement("input");	

	function fileAdd(){
		input = document.createElement("input");
		
		input.type = "file";
		input.multiple = "multiple";
		input.click();
		console.log(input.files.length);
		

		input.addEventListener("change", inputChange);
		
		
		
		
	}
	
    function validation(obj){
        const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
        if (obj.name.length > 100) {
            alert("파일명이 100자 이상인 파일은 제외되었습니다.");
            return false;
        } else if (obj.size > (100 * 1024 * 1024)) {
            alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
            return false;
        } else if (obj.name.lastIndexOf('.') == -1) {
            alert("확장자가 없는 파일은 제외되었습니다.");
            return false;
        } else if (!fileTypes.includes(obj.type)) {
            alert("첨부가 불가능한 파일은 제외되었습니다.");
            return false;
        } else {
            return true;
        }
    }
	
	function inputChange(){
		
		
		var data = new DataTransfer();
		var files = document.querySelector('#file').files;
		files = Array.from(files);
		
		for(var file of Array.from(input.files)){
		
			if(validation(file)){
			
				files.push(file);
			}
		
		}
		
		if(files.length > 5){
			alert("첨부파일은 최대 5개입니다.");
			return;
		} 
		for(var file of files){
			 data.items.add(file);
		}
		document.querySelector('#file').files = data.files;
		printFileView(document.querySelector('#file'));
	}
	
	
	
	
	
	var fileRemove = function(fileNum){ //fileNum은 li 의 index 값 
		
		const dataTransfer = new DataTransfer(); 
		let files = $('#file')[0].files; 
		//사용자가 입력한 파일을 변수에 할당 
		let fileArray = Array.from(files); 
		//변수에 할당된 파일을 배열로 변환(FileList -> Array) 
		fileArray.splice(fileNum, 1); 
		//해당하는 index의 파일을 배열에서 제거 
		fileArray.forEach(file => { dataTransfer.items.add(file); }); 
		//남은 배열을 dataTransfer로 처리(Array -> FileList) 
		$('#file')[0].files = dataTransfer.files; 
		//제거 처리된 FileList를 돌려줌 
		

	
		
	}

	function ViewRemove(obj){
		var index = $('div[role="fileListView"]').index(obj);
		
		obj.remove();
		
		fileRemove(index);
		
	}
	
	
	
	</script>
	
	<script type="text/javascript">
	//파일 download
	const downloadBtn = document.querySelector('#downloadBtn');
	const uniflno = document.querySelector('#uniflno');
	const checkMark = document.getElementsByName("chk");

	const dataSetting = function(){
		let dataArr = [];
		let dataObj = {};
		<c:forEach var="attach" items="${setle.setleAttachList }">
		dataObj = {"unityatchmnflno" : ${attach.unityatchmnflno},
				   "ano" :  ${attach.ano} }
		dataArr.push(dataObj);	
		</c:forEach>
		for(let i = 0; i < checkMark.length; i++){
			if(checkMark[i].checked){
				dataObj = {"unityatchmnflno" : uniflno.value,
						   "ano" : checkMark[i].value}
				dataArr.push(dataObj);	
			}		
		}
		
		return dataArr;
	};

	const sendDownloadFile = function(dataArr){
		let data = dataSetting(dataArr);
		let downUrl = "<%=request.getContextPath()%>/pds/restDownload";
		if(data.length > 1){
			downUrl = "<%=request.getContextPath()%>/pds/zipDownload"; 
		}
		
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
		    if (this.readyState == 4 && this.status == 200){
		      
		       let filename = "";
		       let disposition = xhr.getResponseHeader('Content-Disposition');
		         if (disposition && disposition.indexOf('attachment') !== -1) {
		             let filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
		             let matches = filenameRegex.exec(disposition);
		             if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
		         }
		      
		        let a = document.createElement("a");
		        let url = URL.createObjectURL(this.response)
		        a.href = url;
		        a.download = filename;
		        document.body.appendChild(a);
		        a.click();
		        window.URL.revokeObjectURL(url);
		    }
		}
		xhr.open('POST', downUrl);
		xhr.setRequestHeader('Content-type','application/json');
		xhr.responseType = 'blob'; 
		xhr.send(JSON.stringify(data));
		
	}

	const folderUnity = "${m_unityatchmnflno}";
	downloadBtn.addEventListener('click',sendDownloadFile);


		
	</script>
	<script>
		
		function setle_cancel(){
			var data = {
					setleNo : ${setle.setleNo},
					sttusNo : 0
			}
			console.log(data);
			
			$.ajax({
				type : "get",
				url : "sttusChange",
				data : data,
				success: function(){
					location.reload();
					alert("문서를 회수 했습니다.");
				},
				error : function(){
					console.log("문서 회수 실패");
				}
			});
		}
	
	</script>
	<script type="text/javascript">
	Handlebars.registerHelper({
	  	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();
			return year+"/"+month+"/"+date;
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