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
            <form method="POST" enctype="multipart/form-data" id="modifyForm">
            
            
            	<input type="hidden" name="upEmp" value="${loginEmp.name}"/>
            	<input type="hidden" name="jobCode" value="${work.jobCode }" />
            	
            	
            	<div class="txt-sear-box flex ju-sp-bt al-it-ce">
            		 <h1></h1> 
                	<div class="flex flex-end">
	                     <button type="button" class="back" onClick="javascript:history.go(-1)"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
                         <button type="button" class="regist" onClick="modify_submit()"><i class="fa-solid fa-floppy-disk"></i>수정하기</button>
	                </div>
                </div>
            	
            	
                    <div class="work-regist">

                        <div class="detail-title">
                            <div class="txt flex ju-sp-bt al-it-ce">
                                <h2 class="wre">
                                    <label>일감제목</label>
                                    <input type="text" name="jobNm" value="${work.jobNm }">
                                </h2>
                            </div>
                            <div class="user flex">
                                <div class="user-img"></div>
                                <div class="user-name">
                                    <p>${work.empName }</p>
                                    <span><i class="fa-solid fa-briefcase"></i>${work.empDept } <em>${work.empRank } </em></span>
                                </div>
                            </div>
                        </div>

                        <table>
                            <tbody>
                                <tr>

                                    <td>
                                        <label>작성날짜</label>
                                        <input type="text" value="${work.jobUpdde }" disabled>
                                    </td>
                                    
                                    <td>
                                        <label>수정날짜</label>
                                        <input type="text" id="tDate" disabled>
                                    </td>

                                  

                                    <td>
                                        <label>일감 기간</label>
                                        <div class="flex al-it-ce">
                                            <input type="date" value="${work.jobBgnde }" name="jobBgnde">
	                                            <span class="date-bet">~</span>
                                            <input type="date" value="${work.jobEndde }" name="jobEndde">
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label>할당자</label>
                                     	<div class="flex">
                                            <select id="depart-selector">
                                            		<option>---선택---</option>
                                                <c:forEach items="${departList}" var="depart">
                                                 	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                                </c:forEach>
                                            </select>
                                            
                                           	<select id="depart-emp-seletor">
                                                <option value="notSelect">---선택---</option>
                                            </select>

                                            <button class="workMem" type="button" id="add-setle-emp">추가</button>
                                        </div>
                                    </td>
                                    <td>
                                        <label>일감상태</label>
                                        <select name="jobSttus">
                                            <option value="0">신규</option>
                                            <option value="1">진행</option>
                                            <option value="2">마감</option>
                                            <option value="3">불가</option>
                                        </select>
                                    </td>
                                    
                                    <td>
                                       <label>담당부서</label>
                                        <select name="jobDept">
                                           <c:forEach items="${departList}" var="depart">
                                              <option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                           </c:forEach>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <div class="report-mem">
                                            <ul class="flex flex-wrap" id="selected-depart-emp">
                                            	<c:forEach items="${assignList}" var="asslist">
		                                        	<c:if test="${work.jobCode eq asslist.jobCode}">
		                                        		  <li class="flex al-it-ce" id="reMem">
	                                                    	<input type="hidden" name="jobMemCode" value="${asslist.jobMemCode}" disabled />
		                                                    <input type="hidden" name="jobNo" value="${asslist.jobCode}" disabled />
			                                        		  
		                                                    <div class="re-memImg" data-id="${asslist.empId }"></div>
		                                                    <div class="re-memName flex al-it-ce">
		                                                        <div>
		                                                         <h4>${asslist.empName } ${asslist.empRank }</h4>
		                                                         <span>${asslist.empDept }</span>
		                                                         </div>
		                                                      
		                                                      
		                                                    </div>
		                                                    <div class="xmarK" id="xmarK">
		                                                        <i class="fa-solid fa-xmark"></i>
		                                                    </div>
		                                                </li>
		                                        	</c:if>
	                                        	</c:forEach>
	                                        	
                                            </ul>
                                         </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                      <label>업무내용</label>
                                      
                                      <textarea id="summernote" name="jobCn">${work.jobCn }</textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label>첨부파일</label>
                                       	<div class="m-file">
                                              <label for="fileUploadRoot"><i class="fa-solid fa-computer"></i> 내 PC</label> 
                                              <input type="file" id="fileUploadRoot" onchange="addFile(this);" name="uploadFile" multiple />
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

                                        <div class="f-list work-file" id="preview">
                                            <table>
                                                <colgroup>
                                                    <col width="61%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="15%">
                                                    <col width="4%">
                                                </colgroup>
                                                <tbody>
													 <c:forEach items="${upFileList }" var="upf">
				                                      		<c:if test="${work.unitNo eq upf.unityatchmnflno}">
			                                           			<tr id="oriFile">
			                                           				<td>${upf.originalname }</td>
			                                           				<td>${upf.filesize }</td>
			                                           				<td>일반첨부</td>
			                                           				<td>제한없음</td>
			                                           				<td onclick="deleteOriFile(${upf.unityatchmnflno});"><i class="far fa-minus-square"></i></td>
			                                           			</tr>
				                                           </c:if>
													</c:forEach>
													
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                  
                 
                   
                  </form>
            </div>
       </div>
       </div>
       
	<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
		{{#each .}}
			<option value={{this.empl_no}} class=appendDepartEmp role="{{this.id}}">{{this.ncnm}}</option>
		{{/each}}
	</script>
	
	<script type="text/x-handlebars-template" id="selected-dpartEmp-template">
		<li class="seleted-emp-span flex al-it-ce" onclick='removeSelected(this);'>
           <div class="re-memImg" data-id="{{empId}}" style="background:{{userImg empId}}; 
		background-position: center center; background-repeat: no-repeat; background-size: cover;"></div>
                <div class="re-memName flex al-it-ce">
                   <div>
                     <h4>{{empName}} </h4>
                     <span>{{empDept}}</span>

                   </div>
                </div>
           <div class="inIcon" onclick='removeSelected(this);'>
			 <input type="hidden" name="setleEmpList" value="{{empNo}}">
             <i class="fa-solid fa-xmark"></i>
           </div>
       </li>
	</script> 
	  

	<script>
	
	  function removeSelected(ta){
			$(ta).remove();
		}
	//==========썸머노트
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
	
	
	</script>
	
	
	<script>
	
	//==========부서 불러오는 핸들러
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
						empName : $('#depart-emp-seletor  option:checked').text(),
						empId : $('#depart-emp-seletor  option:checked').attr("role"),
						empDept : $('#depart-selector  option:checked').text() 
				};
				
				
				var empHtml = template(empvalue);
				
				for(var ta of $('input[name=setleEmpList]')){
					if($(ta).val() == empvalue.empNo){
						return;
					}
				}
				
				if($('#depart-emp-seletor').val() == "notSelect"){
					return;
				}
				
				$('#selected-depart-emp').append(empHtml);
			});
	
	  //==========기본 오늘 날짜 넣어 놓기
		function autoDate () {
			var tDay = new Date();
			var tMonth = tDay.getMonth()+1;
			var tDate = tDay.getDate();
			if ( tMonth < 10) tMonth = "0"+tMonth;
			if ( tDate < 10) tDate = "0"+tDate;
			document.getElementById("tDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
		 }
	
		function addLoadEvent(func) {
		  var oldonload = window.onload;
		  if (typeof window.onload != 'function') {
		    window.onload = func;
		  } else {
		    window.onload = function() {
		      if (oldonload) {
		        oldonload();
		      }
		      func();
		    }
		  }
		}
	
		addLoadEvent(function() {
		  autoDate();
		});
		
	//==========첨부파일
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
		
		
		//========재할당
		 $('.xmarK').click(function(){
			 
			if (window.confirm("할당자를 삭제 하시겠습니까? 삭제 시 해당 할당자 삭제 되며 할당자의 복구로는 재선택을 해야합니다.")) {
			var jobMemCode = $(this).closest("li").find('input[name=jobMemCode]').val();
			var jobNo = $(this).closest("li").find('input[name=jobNo]').val();
			 
			
			var addData = { "jobCode" : jobNo,
							"jobMemCode" : jobMemCode};
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/work/assdeleteMem',
				type : 'post',
				data : JSON.stringify(addData),
				contentType : 'application/json',
				success : function(result){
					/* if(result == 'success'){
						alert('삭제성공');
					} */
				},
				error : function(error){
					/* alert('삭제실패'); */
				}
			});
			
			$(this).closest("li").remove();
			 console.log(jobMemCode+ "확인");
			 console.log(jobNo+ "확인");
			 }
		 });
		
		
		 function modify_submit(){
			 
			 
			 var form = document.querySelector("#modifyForm");
			 
			 
			//제목 유효성확인
			if($("input[name='jobNm']").val()==""){
				alert(input.name+"은 필수입니다.");
				$("input[name='jobNm']").focus();
				return;
			}
			
			//파일 첨부확인
			var files = $('input[name="uploadFile"]');
			for(var file of files){
				console.log(file.name+" : "+file.value);
				if(file.value==""){
					alert("파일을 선택하세요.");
					file.focus();
					return false;
				}
			}	
			 
			 Swal.fire({
				 	title: "수정하시겠습니까?",
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            confirmButtonText: '확인',
		            cancelButtonColor: '#d33',
		            cancelButtonText: '취소'
		            
				}).then((result) => {
		  		
		  		if (result.isConfirmed) {	
		  			 form.action = "<%=request.getContextPath()%>/work/modify";
					 form.submit();
		  			}
				}); 
		 }
		 
		 MemberProFilePictureThumb('<%=request.getContextPath()%>');
			
			function MemberProFilePictureThumb(contextPath){
				 for(var target of document.querySelectorAll('.re-memImg')){	
					 var id = target.getAttribute('data-id');
					 
					 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
					 target.style.backgroundPosition="center";
					 target.style.backgroundRepeat="no-repeat";
					 target.style.backgroundSize="cover";
				}
			}
		  	
		
		
	</script>
	
<script type="text/javascript">
	Handlebars.registerHelper({
		'userImg':function(id){
			 let contextPath = '<%=request.getContextPath()%>';
			 let path = "url('"+contextPath+"/user/getPicture.do?id="+id+"')";
			 
			 
			 return path;
			
		}
	});


</script>

<%@ include file="/WEB-INF/include/footer.jsp" %>