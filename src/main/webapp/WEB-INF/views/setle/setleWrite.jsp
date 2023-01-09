<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />

<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <title>Main</title>
        <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core-main.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-01.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-02.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-03.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-04.css">
        <link href="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.css" rel="stylesheet">
    	<script src="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.js"></script>
    	<script src="<%=request.getContextPath() %>/resources/summerNote/summernote.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
        <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	#formPrint{
        		cursor: pointer;
        	} 
        	
        	
	        #formselect {
	        	    border: 1px solid #ddd;
				    border-radius: 3px;
				    padding: 5px 15px 5px 10px;
				    width: 100%;
	        }
	        
	        #formInput {
    			padding: 15px 15px;
			}
			
			#formInput-ul li{
				padding: 5px;	
			}
			
			input[role='formInputValues']{
				border: 1px solid #ddd;
			    border-radius: 3px;
			    padding: 5px 15px 5px 10px;
			    width: 90%;

			}
			.detail-con .de-bot .de-con {
			    width: 100%;
			    padding: 30px 30px;
			}
			
			#summernote {
				border: 1px;
			}
			
        </style>
   </head>
<script>


</script>

<body >
	<form action="<%=request.getContextPath() %>/setle/regist" method="post" id="submitForm" enctype="multipart/form-data">
       <div class="wrap">
        <div class="top-bar flex ju-sp-bt al-it-ce">
            <%@ include file="/WEB-INF/include/topbar.jsp" %>
        </div>

	<div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal23">
        	
			   <select id="formselect" name="setleFormNo" required="required">
				 <option value="-1" id="" selected="selected">양식선택</option>
				 <c:forEach items="${formList }" var="form">
				 	 <option value="${form.setleFormNo }" id="">${form.formNm }</option>
				 </c:forEach>
			   </select>
	       
            <div id=formInput>
<!--                             		<label>소속</label><input type="text" id="소속" name="소속"/>    -->
                                </div> 
            
            <div class="modal-btn flex ju-sp-ce">
            	<button type="button" class="close-core" >취소</button>
                <button type="button" class="regist" id="inputToForm">확인</button>
            </div>
          </div>
            <div class="container flex">
             

            <div class="content">
             	<div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>워크플로우 작성</h1> 
              		
                	<div class="flex flex-end">
	                    <button type="button" class="back" onclick="backPage();"><i class="fa-solid fa-rotate-left"></i>임시저장</button>
	                    <button type="button" class="regist" onclick="regist_setle();"><i class="fa-solid fa-floppy-disk"></i>결재진행</button>
	                </div>
               </div>
               
                <div class="approval-wrap">
                
                
                
                    <div class="approval-regist">
                        <div class="approval-title flex al-it-ce">
                            <i class="fa-solid fa-file-pen"></i>
                            <input type="text" class="app-title" name="setleSj">
                        </div>

                        <div class="approval-content flex ju-sp-bt">
                            <div class="app-con con01">
                                <div class="app-tab con01 flex ju-sp-bt al-it-ce">
                                    <ul class="flex">
                                        <li><a href="#tab01" class="active">상세정보</a></li>
                                        <li><a href="#tab02" onclick="javascript:openModal('modal23');">입력양식</a></li>
                                    </ul>

                                    <!-- <div class="all-down">
                                        <span>전체 다운로드</span>
                                    </div> -->
                                </div>

                                <div class="app-tabcontent">
                                    <div id="tab01">
                                      

<!--                                         <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)"> -->
<!--                                             <i class="fa-solid fa-file-lines"></i> -->
<!--                                             <span>양식에 따른 첨부파일</span> -->
<!--                                             <i class="fa-solid fa-download"></i> -->
<!--                                             <i class="fa-solid fa-xmark"></i> -->
<!--                                         </div> -->
                                        

                                        <div class="detail-con mb-20">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <span>${loginEmp.name}의 결재 합의서</span>
                                            </div>

                                            <div class="de-bot flex">
                                            

                                                <div class="de-con">
                                                    <div class="wri-info flex ju-sp-bt al-it-ce">
                                                        <div class="de-name">
                                                            <h1>${loginEmp.name}</h1>
                                                            <span>${loginEmp.ncnm}</span>
                                                        </div>

                                                        <div class="de-part">
                                                            <span><i class="fa-solid fa-briefcase"></i>${loginEmp.dept }</span>
                                                            <em></em>
                                                        </div>
                                                    </div>

                                                    <div class="re-detail">
                                                    
                                                    
                                                    
                                                    
                                                        <ul class="flex flex-wrap">
                                                            <li>
                                                                <i class="fa-solid fa-pen"></i>
                                                                작성일 : 
                                                                <span>${today }</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                평가기한 :
                                                                <input type="date" name="evlStartDate" class="evlDate" required="required"> ~ <input type="date" name="evlEndDate" class="evlDate" required="required"> 
                                                            </li>

                                                            
                                                            <li>
                                                                <i class="fa-solid fa-users"></i>
                                                                평가인원 :
                                                                <span>부서전체 (${departEmpCount })</span>
                                                            </li>


                                                            <li>
                                                                <div class="flex al-it-ce mb-10">
                                                                <i class="fa-solid fa-users" style="margin-right: 13px"></i>
                                                                 합의인원 :
                                                                <div class="aggre-mem">
                                                                    <select id="depart-selector">
                                                                        <option>----부서----</option>
                                                                        <c:forEach items="${departList}" var="depart">
                                                                        	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <select id="depart-emp-seletor">
                                                                        <option value="notSelect">----이름----</option>
                                                                    </select>

                                                                    <button type="button" id="add-setle-emp"><i class="fa-solid fa-plus"></i></button>
                                                                </div>
                                                                </div>

                                                                <div class="se-mem" id="selected-depart-emp">
                                                                		<span class="seleted-emp-span">${leaderEmp.ncnm	}<input type="hidden" name="setleEmpList" value="${leaderEmp.empl_no }/${leaderEmp.ncnm }"></span>
<!--                                                                     <span class="seleted-emp-span">방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
                                                                </div>
                                                            </li>


                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                합의기한 :
                                                                <input type="date" name="agrStartDate" class="evlDate" required="required"> ~ <input type="date" name="agrEndDate" class="evlDate" required="required">
                                                            </li>

                                                        </ul>
                                                    </div>

                                                    <div class="regist-box" id="regist-box">
                                                    <h4>내용</h4>

                                                    
                                                        <div class="editor">
                                                            <textarea id="summernote" name="setleCn"></textarea>
                                                        </div>

                                                  	</div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="filebox flex" id="file-attach-div">
                                            <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                                            <label class="mb-10"style="cursor: pointer;" onclick="fileAdd()">파일찾기</label> 
                                            <input type="file" id="file" name="uploadFile" multiple="multiple">
                                        </div>

                                    </div>

                                    <div id="tab02">
                                        

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce ju-sp-bt">
                                                <i class="fa-solid fa-list"></i> 
                                                <!-- <select id="formselect" onchange="formChange();">
                                                	<option value="form1" id="">연차신청서</option>
                                                	<option value="form2" id="">비품신청서</option>
                                                	<option value="form3" id="">지출청구서</option>
                                                	<option value="form4" id="">시말서</option>
                                                	<option value="form5" id="">사후보고서</option>
                                                </select> -->
                                                <div class="print"  id="formPrint" >
                                                	<i class="fa-solid fa-print"></i>
                                                	<input type="button" value="인쇄" >
                                                </div>
                                                
                                            </div>

                                            <div class="de-bot report-wrap flex" style="overflow: scroll;" >
                                                <div id="setle-formdiv" style="heimin-height :297mm; min-width: 210mm;"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                       
                    </div>
                </div>

                
                
            </div>

       </div>
      </div>
      <input type="hidden" value="${loginEmp.empl_no }" name="setleWriter">
      <input type="hidden" value="${loginEmp.dept }" name="writerDepart">
      <input type="hidden" id="sttusNo" name="sttusNo">
	  </form>
     <script>
     summernote_go($('#summernote'),"<%=request.getContextPath() %>");
    </script>
    
    
    <script>
    	var formdoc = ``;
		var inputJsonNull = true;
		var writedoc = "";
		var inputstrArr = [];
    
    	$('#formPrint').on("click",function(){
    		  let $container = $("#setle-formdiv").clone()    // 프린트 할 특정 영역 복사
    		    let cssText = ""                            // 스타일 복사
    		    for (const node of $("style")) {
    		        cssText += node.innerHTML
    		    }
    		    /** 팝업 */
    		    let innerHtml = $container[0].innerHTML
    		    let popupWindow = window.open("", "_blank", "width=700,height=800")
    		    popupWindow.document.write("<!DOCTYPE html>"+
    		      "<html>"+
    		        "<head>"+
    		        "<style>"+cssText+"</style>"+
    		        "</head>"+
    		        '<body style=" height :297mm; width: 210mm;"><div style="align:center;">'+innerHtml+'</body>'+
    		      "</html>")
    		   
    		    popupWindow.document.close()
    		    popupWindow.focus()

    		    /** 1초 지연 */
    		    setTimeout(() => {
    		        popupWindow.print()         // 팝업의 프린트 도구 시작
    		        popupWindow.close()         // 프린트 도구 닫혔을 경우 팝업 닫기
    		    }, 1000)

    	});
    	
    	function boundarySearch(str){
    		
    		var nowIndex = 0;
    		var searchStr = [];
    			
    		while(true){
    			
    			
    			
    			var sindex = str.indexOf("{{" , nowIndex);
    			nowIndex = sindex;
    			if(nowIndex==-1){
    				break;
    			}
    			var eindex = str.indexOf("}}", nowIndex);
    			nowIndex = eindex;
    			
    			searchStr.push(str.substring(sindex+2,eindex));
    		}
    		
    		var set = new Set(searchStr);
    		searchStr = [...set];
    		
    		return searchStr;
    	}
    	
    	
    	
    	
    	
    	$('#inputToForm').on('click',function(){
    		var input;
    		writedoc = formdoc;
    		for(var str of inputstrArr){
    			input = $("#"+str);
    			var namestr = $(input).attr('name');
    			var valstr = $(input).val().replaceAll("\n","<br>");
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    			
    		}
    		
    		$('#setle-formdiv').html(writedoc);
    		
    		var formInputNode = document.querySelectorAll('*[role=formInputValues]');
			if(document.querySelector('input[name="formInputs"]')){
				var formInputValues = document.querySelector('input[name="formInputs"]');
			}else{
	    		var formInputValues = document.createElement("input");
	    		formInputValues.type = "hidden";
				formInputValues.setAttribute("name","formInputs");
			}
			
			
			
			formInputValues.value = JSON.stringify(inputToJsonByName(formInputNode));
			console.log(formInputValues.vlaue);
			
			$("#submitForm").append(formInputValues);
			
			if($('#formInput').children().length != 0){
				inputJsonNull = false;
			}
			
			$("#modal").fadeOut(300);
		    $(".modal-con").fadeOut(300);
    	});
    	
    	function checkInputHidden(str){
    		
    		var check = str.indexOf("서명") != -1;
    		check = check || (str.indexOf("서명") != -1);
    		
    		
    		
    		
    		return check;
    	}
    	
    	$('#formselect').on('change',function(){
    		
    		if($(this).val() != -1){
    		
    			$.ajax({
    				type : "get",
    				url : "formTextByNo",
    				data : {FormNo : $(this).val()},
    				dataType:"text",
    				success: function(data){
    					formdoc = data;
    					
    					var inputHtml = "<ul id='formInput-ul'>";
    	    			
    	    			inputstrArr = boundarySearch(formdoc);
    	    			
    	    			for(var str of inputstrArr){
    	    				
    	    				if(checkInputHidden(str)){
    	    					inputHtml = inputHtml + "<li><input type='hidden' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/></li>";
    	    				}else if(str.indexOf("일자") != -1){
    	    					inputHtml = inputHtml + "<li><label>"+str+"</label><input type='date' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/></li>";
    	    				}else if(str.indexOf("내용") != -1){
    	    					inputHtml = inputHtml + "<li><textarea id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/></textarea></li>";
    	    				}else{
    	    				
    	    					inputHtml = inputHtml + "<li><input type='text' id="+str+" name="+str+" placeholder="+str+" role='formInputValues' /></li>"
    	    				
    	    				}
    	    				
    	    			}
    	    			
    	    			inputHtml = inputHtml + "</ul>"
    	    			
    	    			$('#formInput').html(inputHtml);
    	    			
    	    			
    				},
    				error : function(){
    					console.log("양식 못가져옴.");
    					
    					alert("양식파일에 문제가 발생했습니다. 다시 선택해 주세요");
    				}
    			});
    			
    		
    		}else{
    			$('#formInput').html("");
    		}
    			
    		
    	});
    	
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
		{{#each .}}
			{{#VisibleByLoginCheck this.empl_no}}
			{{else}}
			<option value={{this.empl_no}} class=appendDepartEmp>{{this.ncnm}}</option>
			{{/VisibleByLoginCheck}}
		{{/each}}
	</script>
	<script type="text/x-handlebars-template" id="selected-dpartEmp-template">
		<span class="seleted-emp-span" onclick='removeSelected(this);'>{{empName}}<i class="fa-solid fa-xmark"></i><input type="hidden" name="setleEmpList" value="{{empNo}}/{{empName}}"></span>
		
	</script>
	
	<script type="text/javascript">
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
			
			if($('#depart-emp-seletor').val() == '${loginEmp.empl_no }'){
				alert("자신은 합의인원에 추가할수 없습니다.");
				return;
			}
			
			
			var template = Handlebars.compile($('#selected-dpartEmp-template').html());
			var empvalue = {
					empNo : $('#depart-emp-seletor').val() , 
					empName : $('#depart-emp-seletor  option:checked').text() 
			};
			
			
			var empHtml = template(empvalue);
			
			for(var ta of $('input[name=setleEmpList]')){
				if($(ta).val() == empvalue.empNo+"/"+empvalue.empName){
					return;
				}
			}
			
			if($('#depart-emp-seletor').val() == "notSelect"){
				return;
			}
			
			$('#selected-depart-emp').append(empHtml);
		});
		
		function removeSelected(ta){
			
			
			$(ta).remove();
			
		}
	</script>
	

	
	<script>

		function inputToJsonByName(inputs){
			
			var inputJson = {};
			
			for(var tag of inputs){
				console.log(tag.value.replaceAll("\\n","<br>"));
				inputJson[tag.name] = tag.value.replaceAll("\\n","<br>");
				
			}
			
			
			return inputJson;
		}
	
		function backPage(){
			var check = checkInputNull();
			if(check){ 
				alert("필수 값들이 없습니다.");
				return;
			}else{
				var cn = $('.note-editable').html();
				if(cn.length > 4000){
					alert("내용이 너무 많습니다.");
					 return;
				}
				$('#sttusNo').val(0);
				$("#submitForm").submit();
			}
			
		}
		
		
		// null 체크크크크크크크크크크
		function checkInputNull(){
			
			var check = false;
			// 조건 추가
			
			// 양식 input 확인
			check = check || ($('#formInput').children().length == 0);
			check = check || inputJsonNull;
			
			
// 			for(var input in $('input[type=date]')){
				
// 				check = check || ($(input).val());
// 			}
			// 합의 날짜, 평가 날짜 확인
			for(var input of $('input[type="date"][required="required"]')){
				check = check || !$(input).val();
				
			}
			
			check = check || !$("input[name=setleSj]").val()
			
			
			
			return check;
			
		}
	
		function regist_setle(){
			
			var check = checkInputNull();
			if(check){ 
				alert("필수 값들이 없습니다.");
				return;
			}else{
				var cn = $('.note-editable').html();
				if(cn.length > 4000){
					alert("내용이 너무 많습니다.");
					 return;
				}
				
				$('#sttusNo').val(1);
				$("#submitForm").submit();
			}
		}
	
	</script>
	
	
	<script type="text/x-handlebars-template" id="attachView-template">
		{{#each fileArr}}
		 <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)">
         	<i class="fa-solid fa-file-lines"></i>
         	<span>{{this.name}}</span>
         	<i class="fa-solid fa-xmark"></i>
         </div>
		{{/each}}

	</script>
	
	
<!-- 	첨부파일스크립트 -->
	
	<script type="text/javascript">
	
	function printFileView(obj){
		var fileList = Array.from(obj.files)
		var template = Handlebars.compile($('#attachView-template').html());
		
		var fileArr = [];
		for(var file of fileList){
			fileArr.push({"name" : file.name})
		}
		
		var updateHtml = template({"fileArr":fileArr});
		
		$('div[role="fileListView"]').remove();
		$('#file-attach-div').after(updateHtml);
		
		
		
		
	}
	
	
	var input = document.createElement("input");	

	function fileAdd(){
		input = document.createElement("input");
		
		input.type = "file";
		input.multiple = "multiple";
		input.click();
		console.log(input.files.length);
		

		input.addEventListener("change", inputChange);
		
		
		
		
	}
	
    function validation(obj){
        const fileTypes = ['text/plain','application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
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
	
	function inputChange(){
		
		
		var data = new DataTransfer();
		var files = document.querySelector('#file').files;
		files = Array.from(files);
		
		for(var file of Array.from(input.files)){
		
			if(validation(file)){
			
				files.push(file);
			}
		
		}
		
		if(files.length > 5){
			alert("첨부파일은 최대 5개입니다.");
			return;
		} 
		for(var file of files){
			 data.items.add(file);
		}
		document.querySelector('#file').files = data.files;
		printFileView(document.querySelector('#file'));
	}
	
	
	
	
	
	var fileRemove = function(fileNum){ //fileNum은 li 의 index 값 
		
		const dataTransfer = new DataTransfer(); 
		let files = $('#file')[0].files; 
		//사용자가 입력한 파일을 변수에 할당 
		let fileArray = Array.from(files); 
		//변수에 할당된 파일을 배열로 변환(FileList -> Array) 
		fileArray.splice(fileNum, 1); 
		//해당하는 index의 파일을 배열에서 제거 
		fileArray.forEach(file => { dataTransfer.items.add(file); }); 
		//남은 배열을 dataTransfer로 처리(Array -> FileList) 
		$('#file')[0].files = dataTransfer.files; 
		//제거 처리된 FileList를 돌려줌 
		

	
		
	}

	function ViewRemove(obj){
		var index = $('div[role="fileListView"]').index(obj);
		
		obj.remove();
		
		fileRemove(index);
		
	}
	
	
	
	</script>
	<script type="text/javascript">
	Handlebars.registerHelper({
	  	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();
			return year+"/"+month+"/"+date;
		},
		"VisibleByLoginCheck":function(replyer,opts){
			if (replyer == '${loginEmp.empl_no}') {
		        return opts.fn(this)
		    } else {
		        return opts.inverse(this)
		    }					  
		},
    	'ifCond':function(v1, v2, options) {
    		
		  if(v1 == v2) {
		    return options.fn(this);
		  }
		  return options.inverse(this);
		},
		'loop':function(data, options) {
			var to = data.endPage;
			var from = data.startPage;
			
			if(to == 0){
				to=1;
			}
		    var accum = '';
		    for(var i = from; i <= to; i++){
		    	data.pageNum = i;
		        accum += options.fn(data);
			}
		    return accum;
		},
		'loopTo':function(from, to ,options) {
			
		    var accum = '';
		    for(var i = from; i <= to; i++)
		        accum = accum + options.fn(i);
		    return accum;
		},
		'loopTos':function(from,to ,options) {
			
		    var accum = '';
		    for(var i = from; i < to; i++)
		        accum += options.fn(i);
		    return accum;
		}
    });
	</script>
</body>
</html>