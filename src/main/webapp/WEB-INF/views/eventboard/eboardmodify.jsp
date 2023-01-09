<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>" />

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
	<form action="<%=request.getContextPath()%>/eventboard/modify"
		method="post">
       <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
              

            <div class="content">

                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                	<div>
                    	<h1>경조사 수정<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
                    </div>
                    
	                <div class="flex ju-sp-ce">
						<button type="button" class="back" onclick="window.history.back()"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
						<button type="submit" class="regist"><i class="fa-solid fa-floppy-disk"></i>수정하기</button>
					</div>
                </div>

                <div class="writer-box">
                    <div class="w-box w01">
                        

                        <div class="w-sec">
                            <table>
                                <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>

                                <tbody>
                                    <tr>
                                        <th>구분</th>
										<td><select name="eboard_status">
												<option value="0">부고</option>
												<option value="1">결혼</option>
												<option value="2">생일</option>
												<option value="3">돌잔치</option>
												<option value="4">기타</option>
										</select></td>
                                    </tr>

                                    <tr>
                                        <th>제목</th>
                                        <td> 
                                           <input type="text" id="title" name="board_title"
												placeholder="제목을 쓰세요." value="${eboard.board_title }">
                                        </td>
                                    </tr>
                                    <tr>
										<th>일 시</th>
										<td>
											 <div>
	                             		       <input type="date" name="eboard_date" id="eboard_date">
	                            		    </div>
										</td>
                                    </tr>

                                    <tr>
                                        <th>작성 일자</th> 
                                        <td>
                                   		     <div>
	                             		       <input type="text" value="${eboard.eboard_date}" id="eboard_date">
	                            		    </div>
	                            		    </td>
                                    </tr>

                                    <tr>
                                        <th>기능설정</th>
                                        <td> 
                                            <div>
                                                 <input type="checkbox" id="getPin" name="pin" value="y" ${eboard.pin =="y"  ? 'checked':'' }>
                                                <label>상단 고정 여부</label>
                                            </div>

                                       <!--      <div>
                                                <input type="checkbox">
                                                <label>전체직원 메일전송</label>
                                            </div> -->
                                        </td>
                                    </tr>


                                    <tr>
                                       <!--  <th>참조자</th>
                                        <td> 
                                           <select>
                                              <option>경영지원</option>
                                               <option>홍보부</option>
                                               <option>전산실</option>
                                               <option>총무부</option>
                                            </select> 

                                            <select>
                                                 <option>꽉수멘</option>
                                                 <option>조보맹</option>
                                                 <option>진호방</option>
                                                 <option>김유신씨</option>
                                                 <option>한서키</option>
                                              </select> 

                                            <button class="add-mem">
                                                <i class="fa-solid fa-user-plus"></i>  추가
                                            </button>

                                           <em>참조자는 10명까지 가능합니다.</em>
                                        </td> -->
                                    </tr>

                                    <tr>
                                        <th></th>
                                        <td> 
                                            <!-- <span class="add-m">경영1팀 곽수민 <i class="fa-solid fa-xmark"></i></span>
                                            <span class="add-m">경영1팀 곽수민 <i class="fa-solid fa-xmark"></i></span>
                                            <span class="add-m">경영1팀 곽수민 <i class="fa-solid fa-xmark"></i></span> -->
                                        </td>
                                    </tr>
                                    
                                    <tr>
										<th>첨부파일</th>
		                                    <td>
											<ul style="width:100%">
												<li class="flex ju-sp-bt">

														<div class="mail-fileList" style="width:100%">
															<div class="mail-fbtn flex">
																<div class="m-file mb-10">
																	<label for="fileUploadRoot"><i class="fa-solid fa-computer"></i> 내 PC</label> 
																	<input type="file" id="fileUploadRoot" onchange="addFile(this);" name="uploadFile" multiple />
																</div>
																<!-- <button id="createBtn" style="display:none;" onClick="file_go();"><i class="fa-solid fa-cloud-arrow-up"></i>파일 업로드</button> -->
															</div>

															<div class="filehead">
																<table>
																	<colgroup>
																		<col width="61%">
																		<col width="10%">
																		<col width="10%">
																		<col width="15%">
																		<col width="4%">
																	</colgroup>
																	
																	<thead>
																		<tr>
																			<td>파일명</td>

																			<td>용량</td>

																			<td>일반첨부</td>

																			<td>다운로드 가능기간</td>
																		</tr>
																	</thead>
																</table>
																
															 </div>

															 <div class="f-list" id="preview">
																<table>
																	<colgroup>
																		<col width="61%">
																		<col width="10%">
																		<col width="10%">
																		<col width="15%">
																		<col width="4%">
																	</colgroup>
																	<tbody><c:if test="${eboard.unityatchmnflno eq '-1'}">
                                        									<span>첨부된 파일이 없습니다</span>
                                        										</c:if>
                                        								<c:if test="${eboard.unityatchmnflno ne '-1'}">
																		<c:forEach items="${upFileList }" var="upf">
																	    <c:if test="${eboard.unityatchmnflno eq upf.unityatchmnflno}">													
																			<tr>
																				<td>${upf.originalname }</td>
																				<td>${upf.ano }</td>
																				<td>${upf.unityatchmnflno }</td>
																				<td>${upf.filesize }</td>
																				<td> <i class="far fa-minus-square" <%-- onclick="location.href='<%=request.getContextPath()%>/mail/download?ano=${upf.ano }&unityatchmnflno=${upf.unityatchmnflno }';" --%>></i></td>
																			</tr>
																		 </c:if>
																	     </c:forEach>
																	     </c:if>
																	</tbody>
																</table>
														    </div>
														</div>
													 </li>
											 	</ul>
											 </td>
		                                </tr>
                                </tbody>
                            </table>
                        </div>

						<div class="editor">
	                       <textarea id="summernote" name="board_cont">${eboard.board_cont }</textarea>
	                   </div>
                    </div>

  				
                    
                </div>

                 
          
                


            </div>
       </div>
       </div>
       </form>
       <script>
       summernote_go($('#summernote'),'<%=request.getContextPath()%>');
       
       
       </script>
</body>
</html>