<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>" />

<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<form action="<%=request.getContextPath()%>/freeboard/regist"
		method="post" enctype="multipart/form-data">
		<div class="wrap">
			<%@ include file="/WEB-INF/include/topbar.jsp"%>


			<div class="container flex">
	

				<div class="content">

					<div class="txt-sear-box flex ju-sp-bt al-it-ce">
						<div>
							<h1>
								자유게시판 작성<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
									2서브메뉴
								</span>
							</h1>
						</div>
						
						<div class="flex ju-sp-ce">
							<button type="button" class="back" onclick="window.history.back()"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
							<button type="submit" class="regist"><i class="fa-solid fa-floppy-disk"></i>작성하기</button>
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
											<th>제목</th>
											<td><input type="text" id="title" name="board_title"
												placeholder="제목을 쓰세요."></td>
										</tr>
										<tr>
											<th>작성자</th>
												<td><input type="text" id="title" name="boardncnm"
												placeholder="작성자를 쓰세요."></td>
										</tr>

									<tr>
										<th>구분</th>
										<td><select name="board_head">
												<option value="업무관련">업무관련</option>
												<option value="고민">고민</option>
												<option value="추천">추천</option>
												<option value="기타">기타</option>
										</select></td>
									</tr>



										<tr>
											<th>작성자 일자</th>
											<td id="registDate"><c:set var="todayDate">
													<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
												</c:set> <c:out value="${todayDate }" /></td>
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


								<div class="editor mt-10">
									<textarea id="summernote" name="board_cont"></textarea>
								</div>

							</div>
						</div>


					</div>



											<input type="hidden" name="board_writer" value="${loginEmp.empl_no }">
											<input type="hidden" name="name" value="${loginEmp.ncnm }">				
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
    let leaveFiles = [];
    
    function addLeaveFile(fileList){ 
        const dataTransfer = new DataTransfer(); 
        let files = $('#fileUploadRoot')[0].files;    
        
        let fileArray = Array.from(files); 
        
        for(let i = 0; i < fileList.length; i++){
	         fileArray.push(fileList[i]);         	 
        }
     
        fileArray.forEach(file => { dataTransfer.items.add(file); }); 
   
        $('#fileUploadRoot')[0].files = dataTransfer.files; 
        
      }
    
    /* 첨부파일 추가 */
    function addFile(obj){
        var maxFileCnt = 5;   // 첨부파일 최대 개수
        var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
        var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
        var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
       
        addLeaveFile(leaveFiles);
          
        // 첨부파일 개수 확인
        if (curFileCnt > remainFileCnt) {
            alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
        }

        for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

            const file = obj.files[i];       

            // 첨부파일 검증
            if (validation(file)) {
              
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                    leaveFiles.push(file);
                };
                reader.readAsDataURL(file); 
                

                // 목록 추가
                let htmlData = '';
                htmlData += '<tr id="file' + fileNo + '" class="filebox">';
                htmlData += '<td>';
                htmlData += '   <p class="fileName">' + file.name + '</p>';
                htmlData += '</td>';
                htmlData += '<td>'+ bytesToSize(file.size) +'</td>';
                htmlData += '<td> 일반첨부 </td>';
                htmlData += '<td> 제한없음 </td>';
                htmlData += '<td>';
                htmlData += '   <a class="delete" name="deletebtn" onclick="deleteFile(this);"><i class="far fa-minus-square"></i></a>';
                htmlData += '</td>'
                htmlData += '</tr>';
                $('#preview>table>tbody').append(htmlData);
                fileNo++;
         
            } else {
                continue;
            }
  
        }
        console.log('test');
        console.log(leaveFiles);
       //document.querySelector("input[type=file]").value = "";

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
    function deleteFile(obj) {
   	 let idx = $('a[name=deletebtn]').index(obj);
   	 
   	 $(obj).parent().parent().remove();
   	 
        fileRemove(idx);       
    }
    
    
    var fileRemove = function(fileNum){ 
      const dataTransfer = new DataTransfer(); 
      
      let files = $('#fileUploadRoot')[0].files; 
      
      let fileArray = Array.from(files); 
         
      leaveFiles.splice(fileNum, 1);
      fileArray.splice(fileNum, 1); 		       

      leaveFiles.forEach(file => { dataTransfer.items.add(file); }); 

      $('#fileUploadRoot')[0].files = dataTransfer.files; 

      
    }
    
    
    
    /* 파일 사이즈 */
    function bytesToSize(bytes) {
      var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
      if (bytes == 0) return '0 Byte';
      var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
      return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
   };
        
	</script>
</body>
</html>