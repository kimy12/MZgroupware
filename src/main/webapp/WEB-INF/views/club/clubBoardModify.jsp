<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>" />

<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<form method="POST" enctype="multipart/form-data" id="modifyForm">
		<div class="wrap">
			<%@ include file="/WEB-INF/include/topbar.jsp"%>


			<div class="container flex">


				<div class="content">

					<div class="txt-sear-box flex ju-sp-bt al-it-ce">
						<h1 onclick="location.href='<%=request.getContextPath() %>/club/${cboard.club_no}';" style="cursor:pointer;">자유게시판<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
								2서브메뉴
							</span>
						</h1>
						
						<div class="flex ju-sp-ce">
							<button type="button" class="back" onclick="window.history.back()"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
							<button type="button" class="regist" id="modifyBtn"
								onclick="modify_go();"><i class="fa-solid fa-floppy-disk"></i>수정하기</button>
						</div>
					</div>

					<div class="writer-box flex ju-sp-bt">
						<div class="w-box w01">


							<div class="w-sec">
								<table>
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>

									<tbody>
										<tr>
											<th>제목</th>
											<td><input type="text" id="title" name="clubboard_title" placeholder="제목을 쓰세요." 
												value="${cboard.clubboard_title }"></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td class="name">${loginEmp.ncnm }
											<input type="hidden" name="clubboard_writer" value="${loginEmp.empl_no }"> 
											<input type="hidden" name="clubboard_no" value="${cboard.clubboard_no }">
											<input type="hidden" name="clubboardtype_no" value="${cboard.clubboardtype_no }">
											</td>
										</tr>
										<tr>
											<th>구분</th>
											<td><select>
													<option>웹사이트 피드백</option>
													<option>업무관련</option>
													<option>고민</option>
													<option>기타</option>
											</select></td>
										</tr>


										<tr>
											<th>작성자 일자</th>
											<td id="registDate"><c:set var="todayDate">
													<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
												</c:set> <c:out value="${todayDate }" /></td>
										</tr>



										<tr>
											<th>
												<!-- 익명여부 -->
											</th>
											<td>
												<!-- <input type="checkbox">  -->
												<span>
													<!-- 익명설정 시
													비밀번호를 설정하여 수정 등 삭제를 할 수 있습니다. -->
													</em>
											</span>
												<div>
													<!-- <i class="fa-solid fa-lock"></i><input type="text"
														class="pwd-box"> -->
												</div>
											</td>
										</tr>

										<tr>
											<th>첨부파일</th>
											<td>
												<ul style="width: 100%">
													<li class="flex ju-sp-bt">

														<div class="mail-fileList" style="width: 100%">
															<div class="mail-fbtn flex">
																<div class="m-file mb-10">
																	<label for="fileUploadRoot"><i class="fa-solid fa-computer"></i> 내 PC</label> <input
																		type="file" id="fileUploadRoot"
																		onchange="addFile(this);" name="uploadFile" multiple />
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
																	<tbody>
																		<c:forEach items="${dataMap.upFileList }" var="upf">
																			<tr id="oriFile">
																				<td>${upf.originalname }</td>
																				<td>${upf.filesize }</td>
																				<td>일반첨부${upf.ano }</td>
																				<td>제한없음</td>
																				<td onclick="deleteOriFile(${upf.unityatchmnflno});"><i
																					class="far fa-minus-square"></i></td>
																			</tr>
																		</c:forEach>
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

								<div class="editor">
									<textarea id="summernote" name="clubboard_cont">${cboard.clubboard_cont }</textarea>
								</div>

							</div>
						</div>



					</div>




					
				</div>
			</div>
		</div>
	</form>
	<script>
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
       
	 var fileNo = 0;
     var filesArr = new Array();
     
     /* 첨부파일 추가 */
     function addFile(obj){
         var maxFileCnt = 5;   // 첨부파일 최대 개수
         var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
         var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
         var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

         // 첨부파일 개수 확인
         if (curFileCnt > remainFileCnt) {
             alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
         }

         for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

             const file = obj.files[i];
            

             // 첨부파일 검증
             if (validation(file)) {
          	  
                 // 파일 배열에 담기
                 /* var reader = new FileReader();
                 reader.onload = function () {
                     filesArr.push(file);
                 };
                 reader.readAsDataURL(file); */

                 // 목록 추가
                 let htmlData = '';
                 htmlData += '<tr id="file' + fileNo + '" class="filebox">';
                 htmlData += '<td>';
                 htmlData += '   <p class="name">' + file.name + '</p>';
                 htmlData += '</td>';
                 htmlData += '<td>'+ bytesToSize(file.size) +'</td>';
                 htmlData += '<td> 일반첨부 </td>';
                 htmlData += '<td> 제한없음 </td>';
                 htmlData += '<td>';
                 htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                 htmlData += '</td>'
                 htmlData += '</tr>';
                 $('#preview>table>tbody').append(htmlData);
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
     function deleteFile(num) {
         document.querySelector("#file" + num).remove();
         fileRemove(num);
     }
   
	       
     var fileRemove = function(fileNum){ //fileNum은 li 의 index 값 
    		
    		const dataTransfer = new DataTransfer(); 
    		let files = $('#fileUploadRoot')[0].files; 
    		//사용자가 입력한 파일을 변수에 할당 
    		let fileArray = Array.from(files); 
    		//변수에 할당된 파일을 배열로 변환(FileList -> Array) 
    		fileArray.splice(fileNum, 1); 
    		//해당하는 index의 파일을 배열에서 제거 
    		fileArray.forEach(file => { dataTransfer.items.add(file); }); 
    		//남은 배열을 dataTransfer로 처리(Array -> FileList) 
    		$('#fileUploadRoot')[0].files = dataTransfer.files; 
    		//제거 처리된 FileList를 돌려줌 
        }
     
     
     /* 파일 사이즈 */
     function bytesToSize(bytes) {
		   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
		   if (bytes == 0) return '0 Byte';
		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
		};
		
		  
		/* 원본파일삭제 */
     function deleteOriFile(num) {
  	   var veList = document.getElementById("oriFile");
  	   veList.remove();
  	   fileRemove(num);
     }	
		
		
	 function modify_go(){
		 
		 var form = document.querySelector("#modifyForm");
		 
		 form.action = "<%=request.getContextPath()%>/club/modify";
		 
		 form.submit();
	 }

	
	
       </script>
</body>
</html>