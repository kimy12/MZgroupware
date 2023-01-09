<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today" value="<%=new Date() %>"/>
<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<form action="<%=request.getContextPath()%>/noticeboard/modify" method="post" enctype="multipart/form-data">
       <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
               

            <div class="content">

                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>공지사항 수정<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
                
                
	                <div class="flex ju-sp-ce">
	                    <button type="button" onclick="history.go(-1);" class="back"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
	                    <button type="submit"  class="regist"><i class="fa-solid fa-floppy-disk"></i>수정하기</button>
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
                                        <td> 
                                            <input type="text" id="title" name="board_title" placeholder="제목을 쓰세요." value="${notice.board_title }">
                                        </td>
                                    </tr>
                                      <tr>
                                        <th>작성자</th>
                                        <td class="name"> 
                                            ${loginEmp.ncnm }
                                            <input type="hidden" name="board_writer" value="${loginEmp.empl_no }">
                                            <input type="hidden" name="board_no" value="${notice.board_no }">
                                            <input type="hidden" name="boardtype_no" value="${notice.boardtype_no }">
                                            <input type="hidden" name="unityatchmnflno" value="${notice.unityatchmnflno }">
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>기능설정</th>
                                        <td> 
                                            <div>
												<input type="hidden" name="pin" id="pin" value="${notice.pin == 'y'  ? 'y':'n' }"/>
                                                <input type="checkbox" id="settings" ${notice.pin == 'y'  ? 'checked':'' }>
                                                <label for="settings">상단 고정 여부</label>
												<em>(현재: <span id="pinCount">${pinCount }</span>개)</em>	
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>메인팝업 여부</th>
                                        <td> 
                                            <input type="checkbox" id="popupCheck" ${notice.start_date != null ? 'checked':''}> 
                                            <span><label for="popupCheck">메인 팝업 노출은 3개까지 가능합니다.</label><em>(현재: <span id="popupCount"></span>개)</em></span>
                                        </td>
                                    </tr>
                                    
                                    <tr id="popup">
                                        <th>팝업 기간 설정</th>
                                        <td> 
                                            <div>
                                                <label>팝업 시작</label>
	                                                <input type="date" id="pstart" value="${notice.start_date }">
	                                                <input type="hidden" id="popupStart" name="start_date">
                                                <label>팝업 마감</label>
	                                                <input type="date" id="pend" value="${notice.end_date }">
	                                                <input type="hidden" id="popupEnd" name="end_date">
                                            </div>
                                        </td>
                                    </tr>
									

                                    <tr>
                                        <th>작성 일자</th>
                                        <td id="registDate"> 
                                        
                                          <c:set var="todayDate"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
                                      	  <c:out value="${todayDate }" />
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

															<input type="hidden" id="isAtch" name="isAtch" value=""/>
															<div class="f-list" id="preview">
																<table>
																	<colgroup>
																		<col width="61%">
																		<col width="10%">
																		<col width="10%">
																		<col width="15%">
																		<col width="4%">
																	</colgroup>
																	
																	<tbody id="filesArea">
																		<c:if test="${notice.unityatchmnflno eq '-1'}">
																			<span>첨부된 파일이 없습니다</span>
																		</c:if>
																		<c:if test="${notice.unityatchmnflno ne '-1'}">
																			<c:forEach items="${attachList }" var="atch">
																				<c:if test="${notice.unityatchmnflno eq atch.unityatchmnflno}">		
																					<tr>
																						<td>${atch.originalname }</td>
																						<td class="fileSize">${atch.filesize }</td>
																						<td>일반첨부</td>
																						<td>제한없음</td>
																						<td>
																							<input type="hidden" class="unity" value="${atch.unityatchmnflno}"/>
																							<i class="far fa-minus-square"></i>
																							<input type="hidden" class="ano" value="${atch.ano}"/>
																						</td>
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
	                        <textarea id="summernote" name="board_cont">${notice.board_cont }</textarea>
	                    </div>
                    </div>
                </div>
                
             
            </div>
       </div>
    </div>
</form>

       <script>
       const fileSize = document.querySelectorAll('.fileSize');
       const minus = document.querySelectorAll('.fa-minus-square');
       
       [].forEach.call(minus, (m)=>{
    	   m.addEventListener('click', removeFile);
       });
       
       let mLength = minus.length;
       function removeFile(){        
           this.parentNode.parentNode.remove();
         	     	   	   
    	   const dataObj = {
    			   "unityatchmnflno":$(this).prev().val(),
    			   "ano":$(this).next().val()
    	   }
    	     	   
    	   $.ajax({
    		   url:'${pageContext.request.contextPath}/noticeboard/removeFiles',
    		   type:'post',
    		   data:JSON.stringify(dataObj),
    		   contentType:'application/json',
    		   success: function(response){},
    		   error: function(xhr){
    			   alert(xhr.stauts);
    		   }
    	   })
    	   
    	   mLength--; 	
    	   
    	   console.log(mLength);
    	   if(mLength == 0){
    		   $('#isAtch').val('n');
    	   }
    	   console.log($('#isAtch').val())
       }
       
       summernote_go($('#summernote'),'<%=request.getContextPath()%>');
       	
       	// 현재 팝업의 갯수 불러오기
       	$(function() {
       		$.get('/mzgw/noticeboard/popupCount', function (data) {
       			let count = data.popupCount
       			$('#popupCount').text(count)
       			if (count >= 3) {
					$('#popupCheck').attr("disabled",true)
				}
       			if ($('#popupCheck').is(':checked')) {
       				$('#popupCheck').attr("disabled",false)
       			}
       		})
       		
       		$('#popupStart').val($("#pstart").val());
    		$('#popupEnd').val($("#pend").val());
    		
    		$('#pstart').on('change', function(){
	       		$('#popupStart').val($("#pstart").val());    			
    		})
    		$('#pend').on('change', function(){
    			if($('#pend').val() < $('#pstart').val()){
    				Swal.fire({
						  text: "마감날짜가 시작날짜보다 앞설수 없습니다!",
						  icon: "warning"
					});
    				$('#pend').val('');
    			}
    			
	       		$('#popupEnd').val($("#pend").val());    			
    		})
    		
       		$('#popupCheck').on('click', function () {
    			if ($('#popup').css('display') == 'none') {
    				$('#popup').show();
    				$('#popupStart').val($("#pstart").val());
    				$('#popupEnd').val($("#pend").val());
    			} else {
    				$('#popup').hide()
    				$('#popupStart').val('');
    				$('#popupEnd').val('');
    			}
    			
       		})
    			console.log($('#pstart').val())
    			console.log($('#pend').val())
    			console.log($('#popupStart').val())
    			console.log($('#popupEnd').val())
       		
       		if ($('#popupCheck').is(':checked')) {
       			$('#popup').show()
       		} else {
       			$('#popup').hide()
       		}
       		
       		for(let i = 0; i < fileSize.length; i++){
        		fileSize[i].innerText = bytesToSize(fileSize[i].innerText);
        	}
       	})
       	

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
			
			if($('#pin').val() == 'y'){
				$(this).prop('checked',false);
				$('#pin').val('n');	
			}else{
				$(this).prop('checked',true);
				$('#pin').val('y');
			}
					
		});
       	
       	function bytesToSize(bytes) {
      	   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
      	   if (bytes == 0) return '0 Byte';
      	   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
      	   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
      	};
       	
           
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