<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
    <div class="container flex">
              
            <div class="content">

                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>갤러리 작성<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
                
                
                	 <div class="flex ju-sp-ce">
	                    <button type="button" class="back" onclick="goBack();" class="back"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
	                    <button class="regist" type="button" onclick="regist_go();"><i class="fa-solid fa-floppy-disk"></i>작성하기</button>
	                </div>
                </div>
                
				<form enctype="multipart/form-data" role="form" method="post" id="registForm">
				<input type="hidden" name="club_no" value="${club_no }">
				<input type="hidden" name="clubboardtype_no" value="${clubboardtype_no }">
                <div class="writer-box flex ju-sp-bt">
                    <div class="w-box w01" style="width: 100%;">
                        

                        <div class="w-sec">
                            <table>
                                <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>

                                <tbody>

                                    <tr>
                                        <th>작성자</th>
                                        <td class="name"> 
                                            ${loginEmp.ncnm }
                                            <input type="hidden" name="clubboard_writer" value="${loginEmp.ncnm }"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>작성자 일자</th>
                                        <td class="name"> 
                                            <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
											<c:out value="${now}" />
                                        </td>
                                    </tr>


                                    <tr>
                                        <th>제목</th>
                                        <td> 
                                            <input type="text" name="clubboard_title" autocomplete="off">
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
                                                                <input type="file" id="fileUploadRoot" onchange="addFile(this);" name="uploadFile" multiple>
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

                                                                        <td></td>
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
                                                                <tbody class="upload-box">

                                                				<!-- <tr id="file0" class="filebox">
	                                                				<td>   
	                                                					<p class="name">300MKT-CW2 Brief 18-19.pdf</p>
	                                                				</td>
	                                                				<td>587 KB</td>
	                                                				<td> 일반첨부 </td>
	                                                				<td> 제한없음 </td>
	                                                				<td>   
		                                                				<a class="delete" onclick="deleteFile(0);">
		                                                				<i class="far fa-minus-square" aria-hidden="true"></i></a>
	                                                				</td>
                                                				</tr> -->
                                                				
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

                            <div class="edite-box" style="box-shadow: none;">
                                <div class="editor">
                                    <textarea id="summernote" name="clubboard_cont"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

					</form>
                    
                </div>

             


               
            </div>
       </div>
       
        
       <script>
       summernote_go($('#summernote'),'<%=request.getContextPath()%>');
       </script>
       
       <script>
       
       var fileNo = 0;
       var filesArr = new Array();
       
     
       /* 첨부파일 추가 */
       function addFile(obj){
     	  var maxFileCnt = 10;
     	  var attFileCnt = document.querySelectorAll('.fileArea').length;
     	  var remainFileCnt = maxFileCnt - attFileCnt;
     	  var curFileCnt = obj.files.length;
     	  
     	// 첨부파일 개수 확인
           if (curFileCnt > remainFileCnt) {
               alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
           }
     	
           for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

               const file = obj.files[i];
              
               // 첨부파일 검증
                if (validation(file)) {
            	  
                   let htmlData = '';
                   htmlData += '<tr id="file' + fileNo + '" class="filebox fileArea">';
                   htmlData += '<td>';
                   htmlData += '<p class="name">'+ file.name +'</p>';
                   htmlData += '</td>';
                   htmlData += '<td>'+ bytesToSize(file.size) + '</td>';
                   htmlData += '<td> 일반첨부 </td>';
                   htmlData += '<td> 제한없음 </td>';
                   htmlData += '<td>';
                   htmlData += '<a class="delete" onclick="deleteFileNow(' + fileNo + ');">';
                   htmlData += '<i class="far fa-minus-square" aria-hidden="true"></i></a>';
                   htmlData += '</td>';
                   $('.upload-box').append(htmlData);
                   fileNo++;
                   
                } else {
                   continue;
               } 
           }
       }
       
       
       /* 첨부파일 검증 */
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
       
       /* 첨부파일 삭제 */
       function deleteFileNow(num) {
           document.querySelector("#file" + num).remove();
           //filesArr[num].is_delete == true;
           
           const dataTransfer = new DataTransfer();
           let files = $('#fileUploadRoot')[0].files; 
           let fileArray = Array.from(files);
           fileArray.splice(num, 1);
           fileArray.forEach(file => { dataTransfer.items.add(file); });
           $('#fileUploadRoot')[0].files = dataTransfer.files;

       }
       
       /* 파일 사이즈 */
       function bytesToSize(bytes) {
 		   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
 		   if (bytes == 0) return '0 Byte';
 		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
 		   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
 		};
 		
       function goBack(){
     	  window.history.back();
       }
       
       function regist_go(){
    	   var form = document.querySelector("#registForm");
		      
         	form.action = "<%=request.getContextPath()%>/club/galleryRegist";
   	    	form.submit();  
       }
       </script>
  <%@ include file="/WEB-INF/include/footer.jsp" %>
