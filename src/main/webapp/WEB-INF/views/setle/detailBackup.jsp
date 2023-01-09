<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
        
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
                            <input type="text" class="app-title" name="setleSj">
                        </div>

                        <div class="approval-content flex ju-sp-bt">
                            <div class="app-con con01">
                                <div class="app-tab con01 flex ju-sp-bt al-it-ce">
                                    <ul class="flex">
                                        <li><a href="#tab01" class="active">상세내용</a></li>
                                        <li><a href="#tab02">양식</a></li>
                                    </ul>

                                    <div class="all-down">
                                        <span>전체 다운로드</span>
                                    </div>
                                </div>

                                <div class="app-tabcontent">
                                    <div id="tab01">
                                        <div class="filebox flex mb-20" id="file-attach-div">
                                            <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                                            <label style="cursor: pointer;" onclick="fileAdd()">파일찾기</label> 
                                            <input type="file" id="file" name="uploadFile" multiple="multiple">
                                        </div>

<!--                                         <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)"> -->
<!--                                             <i class="fa-solid fa-file-lines"></i> -->
<!--                                             <span>양식에 따른 첨부파일</span> -->
<!--                                             <i class="fa-solid fa-download"></i> -->
<!--                                             <i class="fa-solid fa-xmark"></i> -->
<!--                                         </div> -->
                                        

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <span>방진호의 결재 합의서</span>
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
                                                                <span><i class="fa-solid fa-envelope"></i>test@naver.com</span>
                                                            </li>

                                                            <li>
                                                                <em>내선번호</em>
                                                                <span><i class="fa-solid fa-phone"></i> 000-0000-0000</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="de-con">
                                                    <div class="wri-info flex ju-sp-bt al-it-ce">
                                                        <div class="de-name">
                                                            <h1>방진호</h1>
                                                            <span>Land Rover</span>
                                                        </div>

                                                        <div class="de-part">
                                                            <span><i class="fa-solid fa-briefcase"></i>경영지원팀</span>
                                                            <em>마케팅1부</em>
                                                        </div>
                                                    </div>

                                                    <div class="re-detail">
                                                        <ul>
                                                            <li>
                                                                <i class="fa-solid fa-pen"></i>
                                                                작성일 : 
                                                                <span>2022. 01. 02</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                평가기한 :
                                                                <input type="date" name="evlStartDate"> ~ <input type="date" name="evlEndDate"> 
                                                            </li>

                                                            
                                                            <li>
                                                                <i class="fa-solid fa-users"></i>
                                                                평가인원 :
                                                                <span>부서전체 (30)</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                합의기한 :
                                                                <input type="date" name="agrStartDate"> ~ <input type="date" name="agrEndDate">
                                                            </li>

                                                            <li>
                                                                <div class="flex al-it-ce mb-10">
                                                                <i class="fa-solid fa-users" style="margin-right: 13px"></i>
                                                                 합의인원 :
                                                                <div class="aggre-mem">
                                                                    <select id="depart-selector">
                                                                        <option>부서</option>
                                                                        <c:forEach items="${departList}" var="depart">
                                                                        	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <select id="depart-emp-seletor">
                                                                        <option value="notSelect">이름</option>
                                                                    </select>

                                                                    <button type="button" id="add-setle-emp"><i class="fa-solid fa-plus"></i></button>
                                                                </div>
                                                                </div>

                                                                <div class="se-mem" id="selected-depart-emp">
<!--                                                                     <span class="seleted-emp-span">방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>방진호 <i class="fa-solid fa-xmark"></i></span> -->
                                                                </div>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <div class="regist-box" id="regist-box">
                                                    <h4>상세내용</h4>

                                                    
                                                        <div class="editor">
                                                            <textarea id="summernote" name="setleCn"></textarea>
                                                        </div>
	                                                    <select id="formselect" name="setleFormNo" onchange="formChange();">
		                                                    <option value="-1" id="">양식선택</option>
		                                                	<option value="1" id="">연차신청서</option>
		                                                	<option value="2" id="">비품신청서</option>
		                                                	<option value="3" id="">지출청구서</option>
		                                                	<option value="4" id="">시말서</option>
		                                                	<option value="5" id="">사후보고서</option>
	                                                	</select>
                                                		<br>
                                                		<div id=formInput>
                                                    		<label>소속</label><input type="text" id="소속" name="소속"/>   
                                                  		</div> 
                                                  		<br>
                                                  		<input type="button" value="적용" id="inputToForm"/>
                                                  	</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div id="tab02">
                                        <div class="file">
                                            <i class="fa-solid fa-file-lines"></i>
                                            <span>양식에 따른 첨부파일</span>
                                            <i class="fa-solid fa-download"></i>
                                        </div>

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <!-- <select id="formselect" onchange="formChange();">
                                                	<option value="form1" id="">연차신청서</option>
                                                	<option value="form2" id="">비품신청서</option>
                                                	<option value="form3" id="">지출청구서</option>
                                                	<option value="form4" id="">시말서</option>
                                                	<option value="form5" id="">사후보고서</option>
                                                </select> -->
                                                <input type="button" id="formPrint" value="인쇄">
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
                    <button type="button" class="regist" onclick="regist_setle();">저장하기</button>
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
    var formdoc = `
		<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style="margin-left: 2pt; border-width: initial; border-style: none;">
		 <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:18.45pt;mso-height-rule:
		  exactly">
		  <td width="238" colspan="2" rowspan="2" style="width: 178.8pt; border-top: none; border-bottom: none; border-left: none; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:18.0pt;line-height:123%;mso-bidi-font-family:굴림체">휴 가 신 청 서</span></b><span lang="EN-US" style="font-size:11.0pt;line-height:123%"><o:p></o:p></span></p>
		  </td>
		  <td width="37" colspan="2" rowspan="2" style="width: 28.05pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom: none; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">결<span lang="EN-US"><o:p></o:p></span></span></p>
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">재<span lang="EN-US"><o:p></o:p></span></span></p>
		  </td>
		  <td width="65" colspan="2" style="width: 48.45pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">담 당<span lang="EN-US"><o:p></o:p></span></span></p>
		  </td>
		  <td width="65" colspan="3" style="width: 48.5pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="2" style="width: 48.4pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="3" style="width: 48.5pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="2" style="width: 48.5pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 18.45pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">사 장<span lang="EN-US"><o:p></o:p></span></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:1;height:49.7pt;mso-height-rule:exactly">
		  <td width="65" colspan="2" style="width: 48.45pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 49.7pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="3" style="width: 48.5pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 49.7pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="2" style="width: 48.4pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 49.7pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="3" style="width: 48.5pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 49.7pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="65" colspan="2" style="width: 48.5pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 49.7pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:2;height:44.1pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-width: 1.5pt 1pt 1pt 1.5pt; border-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 44.1pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">소<span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>속<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="478" colspan="15" style="width: 358.4pt; border-top-width: 1.5pt; border-top-color: windowtext; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 44.1pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;{{소속}}</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:3;height:44.1pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 44.1pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">성<span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>명<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="478" colspan="15" style="width: 358.4pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 44.1pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;{{성명}}</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:4;height:44.15pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom: 2.25pt double windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 44.15pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">직<span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>위<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="478" colspan="15" style="width: 358.4pt; border-top: none; border-left: none; border-bottom: 2.25pt double windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 44.15pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;{{직위}}</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:5;height:48.8pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">휴가 종류<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="119" colspan="2" style="width: 89pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림">□ </span><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">년차 휴가</span><span lang="EN-US" style="font-size:11.0pt;line-height:123%"><o:p></o:p></span></p>
		  </td>
		  <td width="119" colspan="4" style="width: 89pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림">□</span><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체"> 월<span lang="EN-US">&nbsp;&nbsp; </span>차<span lang="EN-US"><o:p></o:p></span></span></p>
		  </td>
		  <td width="119" colspan="5" style="width: 89pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림">□</span><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체"> 특<span lang="EN-US">&nbsp;&nbsp; </span>별<span lang="EN-US"><o:p></o:p></span></span></p>
		  </td>
		  <td width="122" colspan="4" style="width: 91.4pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림">□</span><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체"> 기 타<span lang="EN-US"> (&nbsp;&nbsp;&nbsp; )<o:p></o:p></span></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:6;height:48.8pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">휴가 사유<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="478" colspan="15" style="width: 358.4pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.8pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;{{휴가사유}}<o:p></o:p></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:7;height:48.85pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 48.85pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">휴가 기간<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="305" colspan="9" style="width: 228.75pt; border-top: none; border-right: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; padding: 0cm 0.6pt; height: 48.85pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size: 14.6667px;">{{휴가시작일자}}</span></p>
		  <p class="a" align="center" style="text-align: center;"><span style="font-size: 14.6667px;">{{휴가종료일자}}</span></p>
		  </td>
		  <td width="173" colspan="6" style="width: 129.65pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 48.85pt;">
		  <p class="a" align="center" style="text-align: center;"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">( &nbsp;0</span><span style="font-size:
		  11.0pt;line-height:123%;mso-bidi-font-family:굴림체">일 <span lang="EN-US">&nbsp;)<o:p></o:p></span></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:8;height:44.05pt;mso-height-rule:exactly">
		  <td width="121" style="width: 90.8pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1pt; border-right-color: windowtext; background: rgb(229, 229, 229); padding: 0cm 0.6pt; height: 44.05pt;">
		  <p class="a" align="center" style="text-align: center;"><b><span style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체">비상연락처<span lang="EN-US"><o:p></o:p></span></span></b></p>
		  </td>
		  <td width="478" colspan="15" style="width: 358.4pt; border-top: none; border-left: none; border-bottom-width: 1pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 44.05pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;{{비상연락처}}<o:p></o:p></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:9;height:81.0pt;mso-height-rule:exactly">
		  <td width="599" colspan="16" style="width: 449.2pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom: none; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 81pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size:12.0pt;line-height:123%;mso-bidi-font-family:굴림체">위와 같이 휴가를 신청하오니
		  허락하여 주시기 바랍니<a name="예스폼"></a>다<span lang="EN-US">.<o:p></o:p></span></span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:10;height:64.35pt;mso-height-rule:exactly">
		  <td width="599" colspan="16" style="width: 449.2pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom: none; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 64.35pt;">
		  <p class="a" align="center" style="text-align: center;"><span style="font-size: 14.6667px;">{{신청일자}}</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:11;height:36.5pt;mso-height-rule:exactly">
		  <td width="318" colspan="5" style="width: 238.35pt; border-top: none; border-right: none; border-bottom: none; border-left-width: 1.5pt; border-left-color: windowtext; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="79" colspan="3" style="width: 59.1pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" style="text-indent:11.0pt;mso-char-indent-count:1.0"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">&nbsp;</span></p>
		  </td>
		  <td width="113" colspan="5" style="width: 84.65pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  <p class="a"><span style="font-size:11.0pt;line-height:123%;white-space:nowrap;">소 속<span lang="EN-US">:{{소속}}<o:p></o:p></span></span></p>
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="37" colspan="2" style="width: 28.1pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="52" style="width: 39pt; border-top: none; border-bottom: none; border-left: none; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:12;height:36.5pt;mso-height-rule:exactly">
		  <td width="318" colspan="5" style="width: 238.35pt; border-top: none; border-right: none; border-bottom: none; border-left-width: 1.5pt; border-left-color: windowtext; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="79" colspan="3" style="width: 59.1pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" style="text-indent:11.0pt;mso-char-indent-count:1.0"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:
		  굴림체">&nbsp;</span></p>
		  </td>
		  <td width="113" colspan="5" style="width: 84.65pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt; white-space:nowrap;">
		  <p class="a"><span style="font-size:11.0pt;line-height:123%">성 명<span lang="EN-US">: {{성명}}<o:p></o:p></span></span></p>
		  </td>
		  <td width="37" colspan="2" style="width: 28.1pt; border-width: initial; border-style: none; border-color: initial; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%;mso-bidi-font-family:굴림체;letter-spacing:
		  -.55pt;mso-font-width:90%">{{서명}}<o:p></o:p></span></span></p>
		  </td>
		  <td width="52" style="width: 39pt; border-top: none; border-bottom: none; border-left: none; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 36.5pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		 </tr>
		 <tr style="mso-yfti-irow:13;mso-yfti-lastrow:yes;height:30.8pt;mso-height-rule:
		  exactly">
		  <td width="318" colspan="5" style="width: 238.35pt; border-top: none; border-left-width: 1.5pt; border-left-color: windowtext; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right: none; padding: 0cm 0.6pt; height: 30.8pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="79" colspan="3" style="width: 59.1pt; border-top: none; border-right: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; padding: 0cm 0.6pt; height: 30.8pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="113" colspan="5" style="width: 84.65pt; border-top: none; border-right: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; padding: 0cm 0.6pt; height: 30.8pt;">
		  <p class="a"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="37" colspan="2" style="width: 28.1pt; border-top: none; border-right: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; padding: 0cm 0.6pt; height: 30.8pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		  <td width="52" style="width: 39pt; border-top: none; border-left: none; border-bottom-width: 1.5pt; border-bottom-color: windowtext; border-right-width: 1.5pt; border-right-color: windowtext; padding: 0cm 0.6pt; height: 30.8pt;">
		  <p class="a" align="center" style="text-align:center"><span lang="EN-US" style="font-size:11.0pt;line-height:123%">&nbsp;</span></p>
		  </td>
		 </tr>
		 <!--[if !supportMisalignedColumns]-->
		 <tr height="0">
		  <td width="121" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="117" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="1" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="36" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="42" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="23" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="18" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="38" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="8" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="21" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="44" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="7" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="32" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="25" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="13" style="border-width: initial; border-style: none; border-color: initial;"></td>
		  <td width="52" style="border-width: initial; border-style: none; border-color: initial;"></td>
		 </tr>
		 <!--[endif]-->
		</tbody></table><p>

		</p><p class="a"><span lang="EN-US" style="font-size:11.0pt;
		line-height:123%">&nbsp;</span></p>
</div>`;
		
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
		<span class="seleted-emp-span" onclick='removeSelected(this);'>{{empName}}<i class="fa-solid fa-xmark"></i><input type="hidden" name="setleEmpList" value="{{empNo}},{{empName}}"></span>
		
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
				if($(ta).val() == empvalue.empNo){
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
		console.log(index);
		obj.remove();
		fileRemove(index);
		
	}
	
	
	
	</script>
	
</body>
</html>