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
            	<div class="p-wrap">
            
            
            
            	 <div class="backPage"
					onClick="location.href='<%=request.getContextPath()%>/eventboard/list'">
					<i class="fa-solid fa-arrow-rotate-left"></i> 리스트로 돌아가기
				</div>
            
               <div class="detail">
                    <div class="de-con con01">

                        <div class="detail-title">
                            <div class="txt flex ju-sp-bt al-it-ce">
                                <h2>${eboard.board_title }</h2>
                                <c:if test="${loginEmp.empl_no eq eboard.board_writer }">
                                <div class="de-btn">
                                    <button class="modi" onclick="location.href='<%=request.getContextPath()%>/eventboard/modifyform?board_no=${eboard.board_no }&boardtype_no=${eboard.boardtype_no }&from=modify'">수정</button>
                                    <button class="remo" onclick="location.href='<%=request.getContextPath()%>/eventboard/remove?board_no=${eboard.board_no }'">삭제</button>
                                </div>
                                </c:if>
                            </div>
                            <div class="user flex">
									<div class="user-img" data-id="${eboard.id}"></div>
                                <div class="user-name">
                                    <p>${writer }</p>
                                    <span><i class="fa-solid fa-briefcase"></i>${eboard.dept}</span>
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
                                    <th>구분</th>
                                    
                                    <td> 
                            
                                    <c:choose >
                                    	<c:when test="${eboard.eboard_status eq 0 }">부고</c:when>
                                    	<c:when test="${eboard.eboard_status eq 1 }">결혼</c:when>
                                    	<c:when test="${eboard.eboard_status eq 2 }">생일</c:when>
                                    	<c:when test="${eboard.eboard_status eq 3 }">돌잔치</c:when>
                                    	<c:when test="${eboard.eboard_status eq 4 }">기타</c:when>
                                    	<c:otherwise>잘못된 정보입니다.</c:otherwise>
                                    </c:choose>
                                    </td>
                                    </tr>
                                    
									<tr>
                                      <th>이벤트 일시</th>
                                    	<td>
                                    	 	<div class="eventDate">
                                    	 		<img src="<%=request.getContextPath()%>/resources/images/edate.png">
                                    	 		<span><fmt:formatDate value="${eboard.eboard_date }" pattern="yyyy-MM-dd"/></span>
                                    	 	</div>
                                        </td> 
                                    <th>작성 일자</th>
                                    <td id="registDate"> 
                                        <fmt:formatDate value="${eboard.board_rgdt  }" pattern="yyyy-MM-dd"/>
                                    </td>
                                	</tr>
								<tr>
									<th>첨부파일</th>
										
										
										<c:choose>
											<c:when test="${eboard.unityatchmnflno eq '-1'}">
												<td colspan="2">첨부된 파일이 없습니다.</td>
											</c:when>
											
											<c:otherwise>
												<td colspan="2">
													<ul>
														<c:forEach items="${attachList }" var="atch">
															<c:if test="${eboard.unityatchmnflno eq atch.unityatchmnflno}">
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
											</c:otherwise>
										</c:choose>
								</tr>
                                <tr>
                                    <th>내용</th>
                                    <td colspan="3"> 
                                    ${eboard.board_cont }
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                   </div>
               </div>
			</div>
       </div>
  </div>
  
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
</body>

</html>