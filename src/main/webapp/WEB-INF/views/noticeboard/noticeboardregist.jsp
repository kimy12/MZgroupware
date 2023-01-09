






<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>" />
<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<div class="wrap">
			<%@ include file="/WEB-INF/include/topbar.jsp"%>
			<div class="container flex">

				
				<div class="content">
					<form action="${pageContext.request.contextPath }/noticeboard/regist" method="post" enctype="multipart/form-data">
					<div class="txt-sear-box flex ju-sp-bt al-it-ce">
						<h1>
							공지사항 작성<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
								2서브메뉴
							</span>
						</h1>
						
						<div class="flex flex-end">
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
													placeholder="제목을 쓰세요." autocomplete="off"></td>
											</tr>
											<tr>
												<th>작성자</th>
												<td class="name">${loginEmp.ncnm } <input type="hidden"
													name="board_writer" value="${loginEmp.empl_no }">
	
												</td>
											</tr>
	
											<tr>
												<th>작성 일자</th>
												<td id="registDate"><c:set var="todayDate">
														<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
													</c:set> <c:out value="${todayDate }" /></td>
											</tr>
	
											<tr>
												<th>기능설정</th>
												<td>
													<div>
														<input type="checkbox" id="settings"> 
														<input type="hidden" name="pin" id="pin" value="n"/>
														<label for="settings">상단 고정 여부</label>	
														<em>(현재: <span id="pinCount">${pinCount }</span>개)</em>						
													</div> 
												</td>
											</tr>
	
	
											<tr>
												<th>메인팝업 여부</th>
												<td><input type="checkbox" id="popupStatus"> <label for="popupStatus">메인 팝업
														노출은 3개까지 가능합니다. <em>(현재: <span id="popupCount">${popupCount }</span>개)</em>
												</label></td>
											</tr>
	
											<tr id="popup">
												<th>팝업 기간 설정</th>
												<td>
													<div>
														<label>팝업 시작</label> <input type="date" name="start_date">
														<label>팝업 마감</label> <input type="date" name="end_date">
													</div>
													<div>
													</div>
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

					
				</form>
				</div>
				
				
			</div>

		</div>
	<script>
	   summernote_go($('#summernote'),'<%=request.getContextPath()%>');
	   		
	/*    
	   $(function(){
		   
		   $('#settings').on('click',function(){
			   
			   if($('#settings'))
			   
		   })
		   
		   
	   }) */
		// 처음 시작할 때 팝업 날짜 선택화면 안보이게
		$(function() {
			$('#popup').hide()
		})
		// 팝업 노출 여부
		$('#popupStatus').on('click', function() {
			if ($('#popup').css('display') == 'none') {
				if($('#popupCount').text() >= 3){
					 Swal.fire({
						  text: "팝업은 최대 3개까지 등록 가능합니다",
						  icon: "warning",
						  button: "확인",
					});
					 
					$(this).prop('checked',false);
					
				}else{				
					$('#popup').show()
				}
			} else {
				$('#popup').hide()
			}
		});
		
		let flag = false;
		$('#settings').on('click', function() {
			if($('#pinCount').text() >= 5){
				Swal.fire({
				 	title: "상단고정은 최대 5개 까지 등록 가능합니다!",
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
						$(this).prop('checked',false);
						$('#pin').val('n');
						flag = false;							                       
                    }
                })				
			}
			
			if(!flag){
				$(this).prop('checked',true);
				$('#pin').val('y');
				flag = true;
			}else{
				$(this).prop('checked',false);
				$('#pin').val('n');
				flag = false;
			}
					
		});
	
		
		//return false하면 이벤트 동작을 막아줌 
		$("form").submit(function() {
			if ($('#title').val() == '') {
				alert("제목을 입력하세요.")
				return false;
			} 
		
			return true;
		})
		
		
	</script>
	<script>
	
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