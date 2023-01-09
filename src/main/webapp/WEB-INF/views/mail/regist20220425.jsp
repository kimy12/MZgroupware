<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="empMailList" value="${dataMap.empMailList }" />

<%@ include file="/WEB-INF/include/header.jsp" %>



<body>
 <div class="wrap">
	<%@ include file="/WEB-INF/include/topbar.jsp" %>
	
            <div class="container flex">
             
            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>메일보내기</h1> 
                </div>
           
	            <!-- <input type="hidden" name="refList" /> -->
                <div class="p-wrap">
                    <div class="mail-send">
                        <div class="mail-sendBtn">
                            <button type="button" onclick="regist_go();"><i class="fa-solid fa-paper-plane"></i>보내기</button>
                            <button type="button" onclick="storage_go();"><i class="fa-solid fa-inbox"></i>임시저장</button>
                        </div>
 				 	<form method="POST" enctype="multipart/form-data" id="registForm">
 				 		 <input type="hidden" name="tempor"	value="" id="tempor"/>
 				 		
			             <input type="hidden" name="empList" value="" id="empList"/>
			             <input type="hidden" name="mailList" value="" id="mailList"/>
			             
			             <input type="hidden" name="refList" value="" id="refList"/>
			             <input type="hidden" name="rmailList" value="" id="rmailList"/>
			             
                        <div class="send-content">
                            <ul>
                                <li class="flex ju-sp-bt">
                                    <label>보내는사람</label>
                                    <input type="text" value="${loginEmp.email }">
                                    <input type="hidden" value="${loginEmp.empl_no }" name="sendEmp" />
                                    <input type="hidden" value="${loginEmp.email }" name="sendEmpMail" />
                                </li>

                                 <li class="flex">
                                    <label>주소록</label>
                                    <div class="search-mailmem flex">
                                        <div class="in-user">
                                            <ul id="sendEmpSelect">
                                            	<c:forEach items="${empMailList }" var="empMail">
	                                                <li class="ckm flex al-it-ce">
	                                                    <input type="checkbox" name="checkMember" value="${empMail.empl_no }" id="checkboxCK"> [${empMail.name}] ${empMail.email}
	                                                   	<input type="hidden" name="receEmail" value="${empMail.email}">
	                                                 </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="add-icon">
                                            <div class="add-i01 i01 flex al-it-ce">
                                                <div>
                                                    <i class="fa-solid fa-angle-left" onClick='leftMailEmp();'></i>
                                                    <i class="fa-solid fa-angle-right" onClick='rightMailEmp();'></i>
                                                </div>
                                            </div>

                                            <div class="add-i01 flex al-it-ce">
                                                <div>
                                                    <i class="fa-solid fa-angle-left" onClick='deleteRefEmp();'></i>
                                                    <i class="fa-solid fa-angle-right" onClick='referenceEmp();'></i>
                                            	</div>
                                            </div>
                                        </div>

                                        <div class="out-user">
                                                <div class="out-box">
                                                    <span>받는사람</span>
                                                    <div class="out-add">
                                                        <ul id="sendEmpList">
                                                            
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="out-box out02">
                                                    <span>참조</span>
                                                    <div class="out-add">
                                                        <ul id="referEmpList">
                                                           
                                                        </ul>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="flex ju-sp-bt">
                                    <label>제목</label>
                                    <input type="text" name="emailSj" />
                                </li>

                                <li class="flex ju-sp-bt">
                                    <label>파일첨부</label>
                                    
                                    <div class="mail-fileList">
                                        <div class="mail-fbtn flex">
                                            <div class="m-file">
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

                                <li class="flex ju-sp-bt">
                                    <textarea id="summernote" name="emailCn"></textarea>
                                </li>
                            </ul>
                        </div>
                         </form>
                    </div>

                </div>
              
			


            </div>
       </div>

    </div>
    
    
     <script>
       var empList = [];
       var mailList = [];
       
       
       var refList = [];
       var rmailList = [];
     
       
       $('.ckm').click(function(){
    	   
    	   if($(this).children('#checkboxCK').is(':checked')){
    		   $(this).children('#checkboxCK').prop('checked',false);
    	   }else{
        	   $(this).children('#checkboxCK').prop('checked',true);  
    	   }
    	   
    	   
    	  
       });
     
       function rightMailEmp(){
	         const sendEmpSelect = document.getElementById("sendEmpSelect").getElementsByTagName("li");
	         const sendEmpList = document.getElementById("sendEmpList");
	         const checkBox = document.getElementsByName("checkMember");
	         const mailPush = document.getElementsByName("receEmail");
	         
	         for(var i = 0; i < sendEmpSelect.length; i++){
	            if(checkBox[i].checked == true){
	            	
	            	console.log("체크확인 : "+checkBox[i].value);
	            	console.log("체크메일확인 : "+mailPush[i].value);
	            	empList.push(checkBox[i].value);
	            	mailList.push(mailPush[i].value);
	           
	            	sendEmpList.append(sendEmpSelect[i]);
	            
	            	console.log("들어가는 메일 확인" + mailList);
	             	console.log("들어가는 배열" + empList);
	             
	            }
	         }		
	 		/* $('input[name=empList]').attr('empList', empList); */
	    }
      
    
       function leftMailEmp(){
    	   const sendEmpList = document.getElementById("sendEmpList").getElementsByTagName("li");
    	   
    	   for(var i = 0; i < sendEmpList.length; i++){
    		   if($(sendEmpList[i]).children("input").is(":checked")){
    			   console.log("체크된애 확인하기" + $(sendEmpList[i]).children("input").val());
    			   
    			   for(let j = 0; j < empList.length; j++){
                       if($(sendEmpList[j]).children("input").val() == $(sendEmpList[i]).children("input").val()){
                    	   empList.splice(j,1);
                    	   mailList.splice(j,1);
                    	   console.log("나가는 배열" + empList);
                    	   console.log("나가는 메일" + mailList);
                    	   
                    	   for(var t = 0; t > j; t++){
       	            			sendEmpList[t].remove();
       	            		}
                           break;
                       }
                   }
    			  
    			   document.getElementById("sendEmpSelect").prepend(sendEmpList[i]);
    		   }
    	   }
    	 
    	   console.log(empList);
    	   console.log(mailList);
       }
       
       
  
       
       function getArrayIndex(arr, value) {
    	   for (var i = 0; i < arr.length; i++) {
    		   if (arr[i] == value) {
    			   return i;
    		   }
    	   }
       }
       
//        function farray(arr){
//     	   for(let i = 0; i < arr.length; i++){
//     		   var mk_input = document.createElement("input");
//     		   mk_input.setAttribute();
//     	   }
    	   
//        }
       
       
       function referenceEmp(){
	         const sendEmpSelect = document.getElementById("sendEmpSelect").getElementsByTagName("li");
	         const referEmpList = document.getElementById("referEmpList");
	         const checkBox = document.getElementsByName("checkMember");
	         const mailPush = document.getElementsByName("receEmail");
	         
	         for(var i = 0; i < sendEmpSelect.length; i++){
		            if(checkBox[i].checked == true){
		            	
		            	console.log("체크확인 : "+checkBox[i].value);
		            	console.log("체크메일확인 : "+mailPush[i].value);
		            	refList.push(checkBox[i].value);
		            	rmailList.push(mailPush[i].value);
		           
		            	referEmpList.append(sendEmpSelect[i]);
		            	
		            	console.log("들어가는 배열" + refList);
		            	console.log("들어가는 메일 확인" + rmailList);
		            }
		    }	
	   }
       
       function deleteRefEmp(){
 		  const referEmpList = document.getElementById("referEmpList").getElementsByTagName("li");
    	   
    	   for(var i = 0; i < referEmpList.length; i++){
    		   if($(referEmpList[i]).children("input").is(":checked")){
    			   console.log("체크된애 확인하기" + $(referEmpList[i]).children("input").val());
    			   
    			   for(let j = 0; j < refList.length; j++){
                       if($(referEmpList[j]).children("input").val() == $(referEmpList[i]).children("input").val()){
                    	   refList.splice(j,1);
                    	   rmailList.splice(j,1);
                    	   console.log("나가는 배열" + refList);
                    	   console.log("나가는 메일" + rmailList);
                    	   
                    	   for(var t = 0; t > j; t++){
                    		   referEmpList[t].remove();
       	            		}
                           break;
                       }
                   }
    			  
    			   document.getElementById("sendEmpSelect").prepend(referEmpList[i]);
    		   }
    	   }
    	   
    	   console.log(refList);
    	   console.log(rmailList);

    	 
	   }
       
       
       
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
           
           // 초기화
          // document.querySelector("input[type=file]").value = "";
           
           
           
       	  /* if(filesArr != null){
       		  document.getElementById('createBtn').style.display = 'block';
       	  }  */
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
       

		
		
		
		function regist_go(){
			
			alert("메일전송을 완료하였습니다.");
			
			var temporData = "0";
		
			
			document.querySelector("input[name=empList]").value=empList;
			document.querySelector("input[name=mailList]").value=mailList;
			
			document.querySelector("input[name=refList]").value=refList;
			document.querySelector("input[name=rmailList]").value=rmailList;
			
			document.querySelector("input[name=tempor]").value=temporData;
			
			console.log(empList.toString());
			console.log(mailList.toString());
			
			console.log(refList.toString());
			console.log(rmailList.toString());
			
			
			 // 폼데이터 담기
		    var form = document.querySelector("#registForm");
		
			
			form.action = "<%=request.getContextPath()%>/mail/regist";
		    form.submit();
		}
		
		
		function storage_go(){
			
			alert("임시저장이 되었습니다.");
			
			var temporData = "1";
		
			
			document.querySelector("input[name=empList]").value=empList;
			document.querySelector("input[name=mailList]").value=mailList;
			
			document.querySelector("input[name=refList]").value=refList;
			document.querySelector("input[name=rmailList]").value=rmailList;
			
			document.querySelector("input[name=tempor]").value=temporData;
			
			
			 // 폼데이터 담기
		    var form = document.querySelector("#registForm");
		    

			
			form.action = "<%=request.getContextPath()%>/mail/regist";
		    form.submit();
		    
		    
		}
	
    </script>
    
 <%@ include file="/WEB-INF/include/footer.jsp" %>