<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>



<body>
   <div class="wrap">
 
		<%@ include file="/WEB-INF/include/topbar.jsp" %>
            <div class="container flex">
             
            <div class="content">
               <!--  <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>메일상세</h1> 
                </div> -->
  		<form method="POST" id="registForm">
  			<input type="hidden" name="eno" value="${mail.emailNo }" />
        </form>          
                <div class="p-wrap">
                  <div class="mail-detail">
                        <div class="mail-sendBtn flex ju-sp-bt al-it-ce">
                        	
                        	<div class="maib m01">
                        		<span class="mail-title">${mail.emailSj } </span>
                        	</div>
                        	
                        	<div class="maib m02">
                        	
                        	 <c:choose>
                        		<c:when test="${loginEmp.empl_no eq mail.sendEmp}">
                        	
                            	</c:when>
                            	
                                <c:otherwise>
                                	<button><i class="fa-solid fa-paper-plane"></i>답장</button>
                                </c:otherwise>
                            </c:choose>
                            
                               <!--  <button><i class="fa-solid fa-trash-can"></i>삭제</button> -->
                                
                              
	                                <c:if test="${mail.tempor eq 1}">
	                                	<button type="button" onClick="temporCh_go()"><i class="fa-solid fa-paper-plane"></i>보내기</button>
	                                </c:if>
                             
                                
                                <c:if test="${mail.tempor eq 1}">
                                	 <button><i class="fa-solid fa-pen"></i>수정</button>
                                </c:if>
                                
                 
                            </div>
                        </div>
                       

                        <div class="m-detail">
                            <table>
                                <tbody>
                                    <tr>
                                        <td colspan="2">
                                            <label class="sendListMem">보낸사람</label>
                                            <div>
	                                            <em class="userPhone" data-id="${mail.id }"></em>
	                                            <span class="mtxt">[${mail.ncnm }] ${mail.sendEmpMail } </span>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <label class="sendListMem">받은사람</label>
                                            
                                            <div class="flex flex-wrap">
                                            <c:forEach items="${receEmpList }" var="rEmp">
	                                            <c:if test="${mail.emailNo eq rEmp.emailNo}">
	                                            	<div class="flex al-it-ce sendUserMail">
		                                             	<em class="userPhone" data-id="${rEmp.id }"></em>
		                                            	<span class="receEmp mtxt"> [${rEmp.ncnm }] ${rEmp.receEmail } </span>
	                                            	</div>
	                                          	</c:if>
                                          	</c:forEach>
                                          	</div>
                                          	
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="2">
                                            <label>참조자</label>
                                            
                                            <c:forEach items="${referEmpList }" var="refEmp">
                                            	<c:if test="${mail.emailNo eq refEmp.emailNo}">
                                             		<span class="receEmp"> [${refEmp.refeName }] ${refEmp.refeEmail } </span>
                                             	</c:if>
                                            </c:forEach>
                                            
                                             <%-- <c:forEach items="${referEmpList }" var="refEmp">
	                                            <c:if test="${mail.emailNo eq refEmp.emailNo}">
	                                            	<span class="receEmp"> [${refEmp.refeName }] ${refEmp.refeEmail } </span>
	                                          	</c:if>
                                          	</c:forEach> --%>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    	 <td colspan="2">
                                            <label>날짜</label>
                                            <span class="receEmp"> ${mail.writngOn } </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="mail-view">
                        
                         <c:choose>
                        	<c:when test="${mail.unityNo eq -1}">
                        	
                        	</c:when>
                        	
                        	<c:otherwise>
	                            <div class="mfile-list">
	                                <div class="flex al-it-ce mb-20">
	                                    <span><i class="fa-solid fa-paperclip"></i>일반 첨부파일 
	                                    	<em id="fileCount"></em>
	                                    </span>
	                                   <!--  <button type="button" class="all-save" id="downloadBtn">모두 저장</button> -->
	                                </div>
	
	                                <div>
	                                    <ul id="fileListResult">
	                                   
	                                    	<%-- <c:forEach items="${upFileList }" var="upf">
		                                      <li class="flex ju-sp-bt">
		                                            <div>
		                                                <i class="fa-solid fa-download"></i>
		                                                <div>${upf.originalname }</div>
		                                                <span>142KB</span>
		                                            </div>
		
		                                            <div>
		                                                <i class="fa-solid fa-xmark"></i>
		                                            </div>
		                                        </li>
	                                    	</c:forEach> --%>
	                                    	
	                                    	
	                                    	  <c:forEach items="${upFileList }" var="upf">
											 	<c:if test="${mail.unityNo eq upf.unityatchmnflno}">
	                                        	  <li class="flex ju-sp-bt" onclick="location.href='<%=request.getContextPath()%>/mail/download?ano=${upf.ano }&unityatchmnflno=${upf.unityatchmnflno }';">
			                                            <div>
			                                            	<input type="hidden" name="ano" id="ano" value="${upf.ano }">
			                                                <i class="fa-solid fa-download"></i>
				                                              	${upf.originalname }	
				                                            <input type="hidden" name="unityatchmnflno" id="uniflno" value="${upf.unityatchmnflno }">
			                                            </div>
			
			                                            <div>
			                                            	<span>${upf.filesize } </span>
			                                            </div>
			                                            
			                                            
			                                             
			                                        </li>
		                                        </c:if>
	                                         </c:forEach>
	                                    </ul>
	                                </div>
	                            </div>
	                            </c:otherwise>
                            </c:choose>

                            <div class="mdetail-con">
                              ${mail.emailCn }
                              	
                            </div>
                        </div>
                  </div>

                </div>
              



            </div>
       </div>
</div>

<script>
	MemberProFilePictureThumb('<%=request.getContextPath()%>');
	
	function MemberProFilePictureThumb(contextPath){
		for(var target of document.querySelectorAll('.userPhone')){	
			 var id = target.getAttribute('data-id');
			 
			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
			 target.style.backgroundPosition="center";
			 target.style.backgroundRepeat="no-repeat";
			 target.style.backgroundSize="cover";
		}
	}
</script>

	<script>
		var fileList = [];
		
		
		function fileSizeResult(){
			var spanList = document.querySelectorAll('#fileListResult > li > div > span');
			var fcount = document.querySelector('#fileCount');
			
			var total = 1;
			var totalSize = "";
			
			var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
			
			for(var i = 0; i < spanList.length; i++){
				var result = bytesToSize(spanList[i].innerText);
				
				console.log(result);
				
				total += i;
				totalSize += result;
				console.log(total);
				
				spanList[i].innerText = result;
				
				fcount.innerText = total + "개";
			}
			
		}
		
	 	function bytesToSize(bytes) {
		   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
		   if (bytes == 0) return '0 Byte';
		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
		};
		
		
		fileSizeResult();
		
		
		function temporCh_go(){
			if (confirm('메일을 전송 하시겠습니까?')) {
			 var form = document.querySelector("#registForm");
			 
			 form.action = "<%=request.getContextPath()%>/mail/storageSend";
			 form.submit();
			}else{
				alert('취소되었습니다.');
			}
			 
		}
		
		
		
		//파일 download
		const downloadBtn = document.querySelector('#downloadBtn');
		const fileListArray = document.getElementById("fileListResult").getElementsByTagName("li");
		
		const uniflno = document.querySelector('#uniflno');
		const ano = document.querySelectorAll('#ano');
		
		
		console.log(fileListArray.length + "배열 수");
		
		
		const dataSetting = function(){
			var dataArr = [];
			var dataObj = {};
			
			for(let i = 0; i < fileListArray.length; i++){
					dataObj = {"unityatchmnflno" : uniflno.value,
							   "ano" : ano[i].value}
					dataArr.push(dataObj);
				console.log(dataObj.unityatchmnflno + "찍히나요?");
				console.log(dataObj.ano + "찍히나요?");
						
			}
			
			return dataArr;
		};
		
		
		
		const sendDownloadFile = function(dataArr){
			let data = dataSetting(dataArr);
			if(data.length > 1){
				downUrl = "zipDownload"; 
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
			
			console.log(data);
			xhr.open('POST', downUrl);
			xhr.setRequestHeader('Content-type','application/json');
			xhr.responseType = 'blob'; 
			xhr.send(JSON.stringify(data));
			
		}
		
		downloadBtn.addEventListener('click',sendDownloadFile);
		
		
	</script>

   
 <%@ include file="/WEB-INF/include/footer.jsp" %>