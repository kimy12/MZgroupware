<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="empList" value="${dataMap.empList }" />

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>


            <div class="container flex">
              

           <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>수정하기<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                    </div>


              <form enctype="multipart/form-data" role="form" method="post" id="registForm">
                <input type="hidden" name="emp_nickname" value="" id="emp_nickname"/>
                
                <div class="p-wrap">
                    <div class="archive-regite">
                        <div class="archive-info">
                            <table>
                                <colgroup>
                                    <col width="15%">
                                    <col width="35%">
                                    <col width="15%">
                                    <col width="35%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>폴더명</td>
                                        <td colspan="3">
                                        	<input type="hidden" id="e_title" name="e_title">
                                        	<input type="hidden" id="d_title" name="d_title">
                                            <input type="text" id="m_title" name="m_title" placeholder="새폴더" autocomplete="off">
                                        </td>
                                    </tr>


                                    <tr>
                                       <!--  <td>공개 범위 설정</td>
                                        <td>
                                            <ul class="public">
                                                <li>
                                                    <span><i class="fa-solid fa-unlock-keyhole"></i>전체공개</span> 
                                                    <input type="checkbox" data-toggle="checkbox" name="range1" value="pds_public">
                                                </li>
                                                <li>
                                                    <span><i class="fa-solid fa-building-user"></i>부서공개</span> 
                                                    <input type="checkbox" data-toggle="checkbox" name="range2" value="pds_dep">
                                                </li>
                                                <li>
                                                    <span><i class="fa-solid fa-user-lock"></i>비공개(개인자료실)</span> 
                                                </li>
                                                <li style="color: #dd4b39;">
                                                	※ 개인자료실은 자동업로드됩니다.
                                                 </li>
	
                                            </ul>
                                        </td> -->


                                        <td>폴더 생성자</td>
                                        <td>
                                            <ul>
                                                <li>
                                                <input type="hidden" name="e_writer" value="${loginEmp.ncnm }">
                                                <input type="hidden" name="d_writer" value="${loginEmp.ncnm }">
                                                <input type="text" id="m_writer" readonly name="m_writer" class="form-control" value="${loginEmp.ncnm }">
                                                    
                                                </li>
                                                 <li>
                                                    ${loginEmp.dept }
                                                    <input type="hidden" id="dept" readonly name="dept" class="form-control" value="${loginEmp.dept }">
                                                </li> 
                                            </ul>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>참조자 설정</td>
                                        <td>
                                            <div class="r02 flex ju-sp-bt">
                                                <select id="depart-selector">
                                                    <option>부서</option>
												    <c:forEach items="${departList}" var="depart">
                                                   	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                                   </c:forEach>
                                                </select>
            
                                                <select id="depart-emp-seletor">
                                                	<!-- <option id = "notSelect" value="notSelect">선택</option> -->
                                                </select>
            
                                                <button id="add-setle-emp" class="add-mem" type="button">
                                                    <i class="fa-solid fa-user-plus"></i>  추가
                                                </button>
                                        </div>
                                        </td>


                                         
                                        <td>폴더 생성 날짜</td>
                                        <td>
                                        	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
											<c:out value="${now}" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="3">
                                            <div id="nickBox" class="r02 flex flex-wrap">
                                            </div>
                                        </td>
                                    </tr>


                                
                                </tbody>
                            </table>
                        </div>

                      
                        <div class="archive-upload">
                            <div class="arc-upbox">
                                <div class="m-file">
                                    <div class="center">
                                        <img src="<%=request.getContextPath() %>/resources/images/ac_upload.png">
                                        <label for="fileUploadRoot">Browse Files</label> 
                                        <div>
                                           
                                            <input class="upload-name">
                                        </div>
                                    </div>
                                    <input multiple="multiple" type="file" id="fileUploadRoot" onchange="addFile(this);" name ="uploadFile" multiple/>
                                </div>
                            </div>
    
                        </div>
                       
                    </div>

                    <div class="page-btn flex ju-sp-ce">
                        <button type="button" onclick="goBack();" class="back">뒤로가기</button>
                        <button class="regist" type="button" onclick="regist_go();">생성하기</button>
                    </div>
                </div>
                
                </form>
            
            </div>
       </div>
      </div>
      
      
       <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
			<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
				{{#each .}}
					<option value={{this.ncnm}} class=appendDepartEmp>{{this.ncnm}}</option>
				{{/each}}
			</script>
			
			<script type="text/javascript">
				$('#depart-selector').on('change',function(){
					var depart = $(this).val();
					$.getJSON("<%=request.getContextPath()%>/emp/EmpListByDepart?depart="+depart,function(empList){
						var template=Handlebars.compile($('#deparEmpList-selector-template').html());
						
						var empHtml = template(empList);
						
						$('.appendDepartEmp').remove();
						
						/* const selectOption = document.getElementById("depart-emp-seletor");
						 selectOption = selectOption.options[selectOption] 
						 
						if(${loginEmp.ncnm} != )  */
						$('#depart-emp-seletor').append(empHtml);
					});
					
				});
				
				let referno = 0;
				const addEmp = document.querySelector("#add-setle-emp");
				console.log(addEmp);
                	
				addEmp.addEventListener("click", function(){
					const nickBox = document.querySelector("#nickBox");
					const checkedValue = $('#depart-emp-seletor option:selected').text(); 
					const addid = document.getElementById(checkedValue);
					if(!addid){ 
					console.log(checkedValue);	
						
					const span = document.createElement("span");
					const icon = document.createElement("i");
                    const txt = document.createTextNode("checkedValue");
                    const newInput = document.createElement("input");
                    newInput.setAttribute("type","hidden");
                    newInput.setAttribute("value",checkedValue);
                    newInput.setAttribute("id",checkedValue);
                    newInput.setAttribute("name","ccEmpList");
					span.setAttribute("class","add-m");
					icon.setAttribute("class","fa-solid fa-xmark");
					//span.append(txt);
					span.innerHTML = checkedValue;
					span.append(icon);
					span.append(newInput);
					nickBox.append(span);
					} 
					
					
				});
				
				
				const deleteemp = document.querySelector("#nickBox");
				
				deleteemp.addEventListener("click", function(e){
					if(e.target.parentNode.classList.contains("add-m")){
					e.target.parentNode.remove();
					
					}
					
				});
				
				
			</script>
      
      
      <script>
      
      var fileNo = 0;
      var fileArr = new Array();
      
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
             /*  if (validation(file)) { */
           	  
                  let htmlData = '';
                  htmlData += '<div id="file' + fileNo + '" class="reference-list fileArea">';
                  htmlData += '<div class="refer-con flex">';
                  htmlData += '<div class="refo refo01"><i class="fa-solid fa-file-lines"></i></div>';
                  htmlData += '<div class="refo refo02">';
                  htmlData += '<div class="refocon flex ju-sp-bt">';
                  htmlData += '<span class="fileN">'+ file.name +'</span>';
                  htmlData += '<button onclick="deleteFile(' + fileNo + ');">CANCEL</button>';
                  htmlData += '</div>';
                  htmlData += '<div class="refocon roding-bar"></div>';
                  htmlData += '<div class="file-size">'+ bytesToSize(file.size) ;
                  htmlData += '<em>' + "%78 upload" + '</em>';
                  htmlData += '</div>';
                  htmlData += '</div>'; 	 
                  htmlData += '</div>'; 
                  htmlData += '</div>'; 
                  $('.archive-upload').append(htmlData);
                  fileNo++;
             /*  } else {
                  continue;
              } */
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
          filesArr[num].is_delete = true;
      }
      
      /* 파일 사이즈 */
      function bytesToSize(bytes) {
		   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
		   if (bytes == 0) return '0 Byte';
		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
		};
		
		let emp_nickname = [];
		
      function regist_go(){
    	   
		  const selectedEmp = document.getElementsByName("ccEmpList");
		 for(var i = 0; i < selectedEmp.length; i++){
		  	emp_nickname.push(selectedEmp[i].value) ;
		}	     
		 
		 document.querySelector("input[name=emp_nickname]").value=emp_nickname;
		console.log(emp_nickname.toString()); 
		console.log(emp_nickname); 
		  
      	let m_title = document.getElementById("m_title").value;
      	
      	document.getElementById("e_title").value = m_title;
      	document.getElementById("d_title").value = document.getElementById("e_title").value;
      	
      	
      	var form = document.querySelector("#registForm");
		      
      	form.action = "<%=request.getContextPath()%>/pds/regist";
	    form.submit();   
      	
      }
      
      function goBack(){
    	  window.history.back();
      }
	      
	      
	      </script>
		
		
		
		
      
      
  <%@ include file="/WEB-INF/include/footer.jsp" %>