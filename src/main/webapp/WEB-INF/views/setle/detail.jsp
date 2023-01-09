<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.css" rel="stylesheet">
    	<script src="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
        <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
        
   </head>
<script>
  

</script>

<body >
	<form action="<%=request.getContextPath() %>/setle/regist" method="post" id="submitForm" enctype="multipart/form-data">
       <div class="wrap">
        <div class="top-bar flex ju-sp-bt al-it-ce">
            <%@ include file="/WEB-INF/include/topbar.jsp" %>
        </div>

            <div class="container flex">
             

            <div class="content">
                <div class="approval-wrap">
                    <div class="approval-regist">
                        <div class="approval-title flex al-it-ce">
                            <i class="fa-solid fa-file-pen"></i>
                            ${setle.setleSj }
                        </div>

                        <div class="approval-content flex ju-sp-bt">
                            <div class="app-con con01">
                                <div class="app-tab con01 flex ju-sp-bt al-it-ce">
                                    <ul class="flex">
                                        <li><a href="#tab01" class="active">상세내용</a></li>
                                        <li><a href="#tab02" id="setleFormView">양식</a></li>
                                    </ul>

                                    <div class="all-down">
                                        <span>전체 다운로드</span>
                                    </div>
                                </div>

                                <div class="app-tabcontent">
                                    <div id="tab01">
                                       
										<c:forEach var="attach" items="${setle.setleAttachList }">
                                        <div class="file flex al-it-ce" role="fileListView" >
                                            <i class="fa-solid fa-file-lines"></i>
                                            <span>${attach.originalname }</span>
                                            <i class="fa-solid fa-download"></i>
                                            
                                        </div>
                                        </c:forEach>
                                        

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <span>${setle.writerEmpVO.name }의 결재 합의서</span>
                                            </div>

                                            <div class="de-bot flex">
                                                <div class="de-userinfo">
                                                <div class="user-img">
                                                    </div>

                                                    <div class="user-detail">
                                                        <h4>
                                                            작성자와의 소통
                                                        </h4>

                                                        <ul>
                                                            <li>
                                                                <em>Feed</em>
                                                                <span><i class="fa-solid fa-heart"></i>피드로 이동하기</span>
                                                            </li>

                                                            <li>
                                                                <em>Email</em>
                                                                <span><i class="fa-solid fa-envelope"></i>${setle.writerEmpVO.email }</span>
                                                            </li>

                                                            <li>
                                                                <em>내선번호</em>
                                                                <span><i class="fa-solid fa-phone"></i> ${setle.writerEmpVO.phone }</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="de-con">
                                                    <div class="wri-info flex ju-sp-bt al-it-ce">
                                                        <div class="de-name">
                                                            <h1>${setle.writerEmpVO.name }</h1>
                                                            <span>${setle.writerEmpVO.ncnm }</span>
                                                        </div>

                                                        <div class="de-part">
                                                            <span><i class="fa-solid fa-briefcase"></i>${setle.writerEmpVO.dept }</span>
<!--                                                             <em>마케팅1부</em> -->
                                                        </div>
                                                    </div>

                                                    <div class="re-detail">
                                                        <ul>
                                                            <li>
                                                                <i class="fa-solid fa-pen"></i>
                                                                작성일 : 
                                                                <span><fmt:formatDate value="${setle.writngOn }" pattern="yyyy.MM.dd"/></span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                평가기한 :
                                                                <fmt:formatDate value="${setle.evlStartDate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${setle.evlEndDate }" pattern="yyyy.MM.dd"/> 
                                                            </li>

                                                            
                                                            <li>
                                                                <i class="fa-solid fa-users"></i>
                                                                평가인원 :
                                                                <span>부서전체 (30)</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                합의기한 :
                                                                <fmt:formatDate value="${setle.agrStartDate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${setle.agrEndDate }" pattern="yyyy.MM.dd"/>
                                                            </li>

                                                            <li>
<!--                                                                 <div class="flex al-it-ce mb-10"> -->
<!--                                                                 <i class="fa-solid fa-users" style="margin-right: 13px"></i> -->
                                                                
<!--                                                               합의인원 :   <div class="aggre-mem"> -->
<!--                                                                     <select id="depart-selector"> -->
<!--                                                                         <option>부서</option> -->
<%--                                                                         <c:forEach items="${departList}" var="depart"> --%>
<%--                                                                         	<option value="${depart.dept_nm }">${depart.dept_nm }</option> --%>
<%--                                                                         </c:forEach> --%>
<!--                                                                     </select> -->

<!--                                                                     <select id="depart-emp-seletor"> -->
<!--                                                                         <option value="notSelect">이름</option> -->
<!--                                                                     </select> -->

<!--                                                                     <button type="button" id="add-setle-emp"><i class="fa-solid fa-plus"></i></button> -->
<!--                                                                 </div> -->
<!--                                                                 </div> -->

                                                                <div class="se-mem" id="selected-depart-emp">
                                                               합의인원 :      
                                                               <c:forEach var="setleEmp" items="${setle.setleEmpList }">
                                                               <span class="seleted-emp-span">${setleEmp.empNm}</span>
                                                               </c:forEach>
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
                                                                </div>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <div class="regist-box" id="regist-box">
                                                    <h4>상세내용</h4>

                                                    
                                                        <div class="editor">
                                                            ${setle.setleCn }
                                                        </div>
	                                                    
                                                  	</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div id="tab02">
                                       <c:forEach var="attach" items="${setle.setleAttachList }">
                                        <div class="file flex al-it-ce" role="fileListView" >
                                            <i class="fa-solid fa-file-lines"></i>
                                            <span>${attach.originalname }</span>
                                            <i class="fa-solid fa-download"></i>
                                        </div>
                                        </c:forEach>
                                        

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
                                                <div class="print">
                                                	<i class="fa-solid fa-print"></i>
                                                	<input type="button" id="formPrint" value="인쇄" >
                                                </div>
                                                
                                            </div>

                                            <div class="de-bot flex" style="overflow: scroll;" >
                                                <div id="setle-formdiv" style="heimin-height :297mm; min-width: 210mm;"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="app-con con02">
                                <div class="app-btntab">
                                    <ul class="flex ju-sp-bt">
                                        <li><a href="#agreTab01" class="on">평가</a></li>
                                        <li><a href="#agreTab02">댓글</a></li>
                                    </ul>
                                </div>

                                <div class="comment-tab">
                                    <div id="agreTab01">
                                        <div class="agree-create">
                                            <button>평가 작성</button>
                                        </div>

                                        <div class="agreement-btn flex ju-sp-bt">
                                            <button class="ag"><i class="fa-solid fa-handshake"></i> 합의</button>
                                            <button class="bk"><i class="fa-solid fa-arrow-rotate-left"></i>반려</button>
                                        </div>

                                        <div class="agree-cowrap">
                                            <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"></div>
                                                            <div class="nick-name">조나단</div>
                                                            <span class="mytip">MY</span>
                                                        </div>

                                                        
                                                        <ul class="flex">
                                                            <li><i class="fa-solid fa-pen"></i></li>
                                                            <li><i class="fa-solid fa-xmark"></i></li>
                                                        </ul>
                                                    </div>

                                                    <div class="ag-con">
                                                        <div class="flex al-it-ce mb-20">
                                                            <span>업무평가</span>
                                                            <ul class="flex">
                                                                <li><i class="fa-solid fa-star on"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                            </ul>
                                                        </div>

                                                        <div class="ag-result">
                                                            평가 내용 넣어주세요옹~
                                                        </div>
                                                        <em class="ag-date">2022. 01. 01</em>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"></div>
                                                            <div class="nick-name">조나단</div>
                                                            <span class="mytip">MY</span>
                                                        </div>

                                                    </div>

                                                    <div class="ag-con">
                                                        <div class="flex al-it-ce mb-20">
                                                            <select>
                                                                <option>업무평가</option>
                                                                <option>역량평가</option>
                                                            </select>
                                                            <ul class="flex">
                                                                <li><i class="fa-solid fa-star on"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                                <li><i class="fa-solid fa-star"></i></li>
                                                            </ul>
                                                        </div>

                                                        <div>
                                                            <textarea></textarea>
                                                        </div>

                                                

                                                        <div class="ag-btn">
                                                            <button>작성하기</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div id="agreTab02">
                                        <div class="agree-cowrap-s">
                                            <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"></div>
                                                            <div class="nick-name">조나단</div>
                                                            <span class="mytip">MY</span>
                                                        </div>

                                                        
                                                        <ul class="flex">
                                                            <li><i class="fa-solid fa-pen"></i></li>
                                                            <li><i class="fa-solid fa-xmark"></i></li>
                                                        </ul>
                                                    </div>

                                                    <div class="ag-con">

                                                        <div class="ag-result">
                                                            평가 내용 넣어주세요옹~
                                                        </div>
                                                        <em class="ag-date">2022. 01. 01</em>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="agreement-coment">
                                                <div class="ag-coment">
                                                    <div class="ag-mem flex al-it-ce ju-sp-bt">
                                                        <div class="flex al-it-ce">
                                                            <div class="modi-img"></div>
                                                            <div class="nick-name">조나단</div>
                                                            <span class="mytip">MY</span>
                                                        </div>

                                                    </div>

                                                    <div class="ag-con">

                                                        <div>
                                                            <textarea></textarea>
                                                        </div>

                                                

                                                        <div class="ag-btn">
                                                            <button>작성하기</button>
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
                </div>

                
                <div class="page-btn flex ju-sp-ce">
                    <button type="button" class="back" onclick="backPage();">뒤로가기</button>
                    <button type="button" class="regist" onclick="regist_setle();">수정하기</button>
                </div>
            </div>

       </div>
      </div>
      <input type="hidden" value="${loginEmp.empl_no }" name="setleWriter">
      <input type="hidden" value="${loginEmp.dept }" name="writerDepart">
	  </form>
     <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
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
    	var formdoc = "";
		
		var writedoc = "";
		var inputstrArr = [];
		var inputValues;
		
		function jsonToForm(jsonData){
    		writedoc = formdoc;
    		for(var key in jsonData){
    			var namestr = key
    			var valstr = jsonData[key];
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    		}
    		$('#setle-formdiv').html(writedoc);
    	}
    	
		
		$('#setleFormView').on("click",function(){
			$.ajax({
				type : "get",
				url : "formText",
				data : {unityFileNo : ${setle.setleForm.formFile}},
				dataType:"text",
				success: function(data){
					formdoc = data;
					
					jsonToForm(${setle.formInputs});
				},
				error : function(){
					console.log("양식 못가져옴.");
				}
			});
		});
    
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
    			var valstr = $(input).val();
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    			
    		}
    		
    		$('#setle-formdiv').html(writedoc);
    		
    		var formInputNode = document.querySelectorAll('input[role=formInputValues]');
			if(document.querySelector('input[name="formInputs"]')){
				var formInputValues = document.querySelector('input[name="formInputs"]');
			}else{
	    		var formInputValues = document.createElement("input");
				formInputValues.setAttribute("name","formInputs");
			}
			
			
			console.log(formInputValues.name);
			
			formInputValues.value = JSON.stringify(inputToJsonByName(formInputNode));
			
			$("#submitForm").append(formInputValues);
			
			
			
    		
    	});
    	
    	function checkInputHidden(str){
    		
    		var check = str.indexOf("서명") != -1;
    		check = check || (str.indexOf("서명") != -1);
    		
    		
    		
    		
    		return check;
    	}
    	
    	$('#formselect').on('change',function(){
    		
    		if(this.value == 1){
    			
    			
    			
    			var inputHtml = "";
    			
    			inputstrArr = boundarySearch(formdoc);
    			
    			for(var str of inputstrArr){
    				
    				if(checkInputHidden(str)){
    					inputHtml = inputHtml + "<input type='hidden' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/><br>";
    				}else if(str.indexOf("일자") != -1){
    					inputHtml = inputHtml + "<label>"+str+"</label><input type='date' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/><br>";
    				}else{
    				
    					inputHtml = inputHtml + "<input type='text' id="+str+" name="+str+" placeholder="+str+" role='formInputValues' /><br>"
    				
    				}
    				
    			}
    			
    			
    			
    			$('#formInput').html(inputHtml);
    			
    			
    		}
    	})
    	
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
		{{#each .}}
			<option value={{this.empl_no}} class=appendDepartEmp>{{this.ncnm}}</option>
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
				inputJson[tag.name] = tag.value;
			}
			
			
			return inputJson;
		}
	
		function backPage(){
			window.history.go(-1);
			
			
			
		}
		
		function checkInputNull(){
			
			var check = true;
			// 조건 추가
			
			
			
			return check;
			
		}
	
		function regist_setle(){
			
			

			
			$("#submitForm").submit();

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
	
</body>
</html>