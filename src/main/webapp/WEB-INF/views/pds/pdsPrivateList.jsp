<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="pdsAttachList" value="${dataMap.pdsAttachList }" /> --%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<body>
<form method="POST" enctype="multipart/form-data" id="registForm">
 <div id="modal" class="modal-wrap"></div>
                <div class="modal-con modal2">
                    <div class="file-modal">
                        <div class="filebox">
                            <div class="flex al-it-ce">
                                <label for="fileUploadRoot" class="fileUploadRoot"><i class="fa-solid fa-magnifying-glass"></i>파일찾기</label> 
                                <!-- <button class="down"><i class="fa-solid fa-upload"></i>업로드</button>-->
                            </div>
                           
                            <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                            <input type="hidden" name="unityatchmnflno" value="${m_unityatchmnflno}">
                            <input type="hidden" name="m_title" value="${m_title}">
                            <input type="hidden" name="m_writer" value="${m_writer}">
                            <input multiple="multiple" type="file" id="fileUploadRoot" onchange="addFile(this);" name ="uploadFile" multiple>
                            
                        </div>
                        
                        <table>
                            <colgroup>
                                <col width="55%">
                                <col width="35%">
                                <col width="10%">
                            </colgroup>
                            <tbody id="fileBox">
                            </tbody>
                        </table>

                        
                    </div>

                    <div class="modal-btn flex ju-sp-ce">
                        <button type="button" id="close" class="close-core">취소</button>
                        <button type="button" class="regist" onclick="regist_go();">추가</button>
                </div>
            </div>
            </form>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    <div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal11">
         </div>
    </div>
    
    <div id="modal" class="modal-wrap"></div>
        <div class="modal-con modal45 modalSize">
        <div class="viewpdf">
        </div>
         </div>
    </div>
    


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>${m_title }<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1> 
                       <div class="sear-box flex">
                  <div class="work-state">
                     <div class="select-tog flex ju-sp-bt al-it-ce">
                        <span id="nowSearchType">선택
                        <c:choose>
                           <%-- <c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when> --%>
                           <%-- <c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when> --%>
                           <c:when test="${pageMaker.cri.searchType eq 's'}">제목</c:when>
                           <%-- <c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when> --%>
                        </c:choose>
                        </span>
                        <i class="fa-solid fa-caret-down"></i>
                     </div>
                     <ul class="tog-b" style="display: none;">
                        <!-- <li onclick="searchTypeChange(this);"><input type="hidden" value="a" >전체</li> -->
                        <li onclick="searchTypeChange(this);"><input type="hidden" value="s" >제목</li>
                        <!-- <li onclick="searchTypeChange(this);"><input type="hidden" value="c" >내용</li> -->
                     </ul>
                  </div>

                  <input id="search" type="text" placeholder="Search" value="<c:choose>
                           <c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
                           <c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
                        </c:choose>" onkeypress="searchEnter(this,event);">
               </div>
                    </div>

                    <div>
                        <div class="add-sear" style="display: inline-block;">
                        <ul class="flex">
                                <li id="downloadBtn"><i class="fa-solid fa-download"></i>다운로드</li>
                                <!-- <li><i class="fa-solid fa-envelope-open-text"></i>메일발송</li> -->
                                <c:if test="${m_writer eq loginEmp.ncnm }">
                                <li onclick="removeB();" id=removeB><i class="fa-solid fa-trash-can"></i>삭제</li>
                                </c:if>
                        </ul>
                        </div>
                    </div>

                    <div class="archive">
                        <div class="file-list">
                            <div class="arch-info">
                                <div class="caption n-caption flex ju-sp-bt">
    
                                    <div class="flex al-it-ce">
                                        <div class="num-view ">
                                            <div class="num-tog tog01 flex ju-sp-bt al-it-ce">
                                                <span id="perPageView">정렬구분</span>
                                                <i class="fa-solid fa-angle-down"></i>
                                            </div>
    
                                            <ul class="num-b nb01" style="display: none;" id="perPageList">
                                    <li onclick="changePerPage(this);">2개씩<input
                                       type="hidden" value="2"></li>
                                    <li onclick="changePerPage(this);">5개씩<input
                                       type="hidden" value="5"></li>
                                    <li onclick="changePerPage(this);">10개씩<input
                                       type="hidden" value="10"></li>
                                    <li onclick="changePerPage(this);">20개씩<input
                                       type="hidden" value="20"></li>
                                 </ul>
                                        </div>
    
                                        <div class="list-select">
                                 <c:if test="${nowSort eq 'desc'}">
                                 <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
                                    id="sort-Desc-Off" onclick="sortChange(this);" hidden="hidden">
                                 <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
                                    id="sort-Desc-On"> <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
                                    id="sort-Asc-Off" onclick="sortChange(this);"> <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
                                    id="sort-Asc-On" hidden="hidden">
                                 </c:if>
                                 <c:if test="${nowSort eq 'asc'}">
                                 <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
                                    id="sort-Desc-Off" onclick="sortChange(this);">
                                 <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
                                    id="sort-Desc-On"  hidden="hidden"> <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
                                    id="sort-Asc-Off" onclick="sortChange(this);" hidden="hidden"> <img
                                    src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
                                    id="sort-Asc-On" >
                                 </c:if>
                           </div>
                                    </div>
                            <c:if test="${m_writer eq loginEmp.ncnm }">
                                   <div class="file-btn">
                                        <button class="regist">
                                            <a href="javascript:openModal('modal2');" class="button modal-open">
                                                <i class="fa-solid fa-file-arrow-up"></i>파일추가
                                            </a> 
                                        </button>
                                    </div>
                                    </c:if>
                                    
                            </div>
                            </div>

                         <input type="hidden" name="unityatchmnflno" id="uniflno" value="${m_unityatchmnflno }">                                       
                            
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="10%">
                                    <col width="48%">
                                    <col width="10%">
                                    <col width="17%">
                                    <col width="5%">
                                </colgroup>

                                <thead>
                                    <tr>                                        
                                        <td class="txt-c"><input type="checkbox" name="allCk" id="checkAll"/></td>
                                        <td class="txt-c"><i class="fa-solid fa-star on"></i></td>
                                        <td class="txt-c"><i class="fa-solid fa-sort"></i>종류</td>
                                        <td><i class="fa-solid fa-sort"></i>파일명</td>
                                        <td><i class="fa-solid fa-sort"></i>크기</td>
                                        <td><i class="fa-solid fa-sort"></i>등록날짜</td>
                                        <td><i class="fa-solid fa-download"></i></td>
                                    </tr>

                                </thead>

                                <tbody>
                                   <c:if test="${empty pdsAttachList }" >
                           <tr>
                              <td colspan="7" class="notContent">
                                 파일이 존재하지 않습니다.
                              </td>
                           </tr>
                           </c:if>   
                                    <c:forEach items="${pdsAttachList }" var="attach">
                                       <tr>
                                           <td class="txt-c">
                                              <input type="checkbox" class="chk" name="chk" value="${attach.ano }"/>
                                           </td>
                                           <td class="txt-c starChange">
                                              <c:choose>
                                                 <c:when test="${attach.fav eq '1' }">
                                                      <i class="fa-solid fa-star on"></i>                                                       
                                                 </c:when>
                                                 <c:otherwise>
                                                    <i class="fa-solid fa-star off"></i>
                                                 </c:otherwise>
                                             </c:choose>
                                           </td>
                                           <td class="txt-c imageSelect">
                                           </td>
                                           
                                           <td class="o-title flex">
                                              <div>${attach.originalname} 
                                                 <input type="hidden" name="ano" value="${attach.ano }">
                                                 <input type="hidden" name="unityatchmnflno" value="${attach.unityatchmnflno }">
                                                 <input type="hidden" class="fileType" name="fileType" value="${attach.fileType }">
                                              </div>
                                                <!-- <span class="pre-view memberPictureThumb" onclick="javascript:openModal('modal11');">미리보기</span> -->
                                           </td>
                                           <td class="fileSize">${attach.filesize }</td>
                                           
                                           <td><fmt:formatDate value="${attach.regdate }" pattern="yyyy-MM-dd"/></td>
                                           <td onclick="location.href='<%=request.getContextPath()%>/pds/download?ano=${attach.ano }&unityatchmnflno=${attach.unityatchmnflno }';">
                                              <i class="fa-solid fa-download"></i>
                                           </td>
                                       </tr>
                            </c:forEach>

                                </tbody>

                            </table>
                        </div>
                      
                    </div>
                

                    <div class="page-btn flex ju-sp-ce">
                        <a class="p-num prev-first" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
                     </a> 
                     <%-- <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
                        <i class="fas fa-angle-left"></i>
                     </a> --%>

                     <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                        <a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a>
                     </c:forEach>

                     <%-- <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
                        <i class="fas fa-angle-right"></i>
                     </a>  --%>
                     <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');"> <i class="fas fa-angle-double-right"></i>
                     </a>
                       
                    </div>

            </div>
       </div>   
       </div>
       <form id="jobForm">
      <input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"> 
      <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
      <input type="hidden" name="nowSort" value="${nowSort }"> 
      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
      <input type="hidden" name="m_unityatchmnflno" value="${m_unityatchmnflno }">
      <input type="hidden" name="m_title" value="${m_title }">
      <input type="hidden" name="m_writer" value="${m_writer }">
      <input type="hidden" name="page">
   </form>

<script>
   function list_go(page,url){
      if(!url) url="pdsPrivateList";
      
      let jobForm=$('#jobForm');
      
      jobForm.find("[name='page']").val(page);

      jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
   
      jobForm.attr({
         action:url,
         method:'get'
      }).submit();
   }
</script>


<script type="text/javascript">

   window.addEventListener('DOMContentLoaded',()=>{
      $('.modalSize').css('display','none');
   })
   // 페이징 검색을 위한 js
   function sortChange(obj) {

      if (obj == $('#sort-Asc-Off').get(0)) {
         $('#sort-Desc-On').hide();
         $(obj).hide();
         $('#sort-Asc-On').show();
         $('#sort-Desc-Off').show();
         $('input[name="nowSort"]').val("asc");
         list_go('1');
      }

      if (obj == $('#sort-Desc-Off').get(0)) {
         $('#sort-Asc-On').hide();
         $(obj).hide();
         $('#sort-Desc-On').show();
         $('#sort-Asc-Off').show();
         $('input[name="nowSort"]').val("desc");
         list_go('1');
      }

   }

   function searchTypeChange(obj){
      document.querySelector('#nowSearchType').innerText = obj.innerText;
      $(".tog-b").slideToggle();
      $("input[name=searchType]").val($(obj).children("input").val());
      
   }
   
   function changePerPage(obj) {

      document.querySelector('#perPageView').innerText = obj.innerText;
      $(".num-b.nb01").slideToggle();
      $("input[name=perPageNum]").val($(obj).children("input").val());
      list_go('1');
   }
   
   function searchEnter(obj,e){
      
      if(e.keyCode == 13){
         $("input[name=keyword]").val($(obj).val().trim());
         if($("input[name=keyword]").val() == "" 
               || $("input[name=keyword]").val() == null 
               || $("input[name=searchType]").val() == ""
               ||  $("input[name=searchType]").val() == null){
            return;
         }
         list_go('1');
      }
      
   }
</script>   
   

<script>



const fileType = document.querySelectorAll(".fileType");
for(let i=0; i<fileType.length; i++){
   /* alert(fileType[i].value); */
   if(fileType[i].value == "JPG" || fileType[i].value == "PNG" || fileType[i].value == "JFIF"){
      const newSpan = document.createElement('span');
      const text = document.createTextNode("미리보기");
      newSpan.setAttribute("class","pre-view memberPictureThumb");
      newSpan.setAttribute("onclick","javascript:openModal('modal11');");
      newSpan.appendChild(text);
      
      const isTd = document.querySelectorAll(".o-title");
      isTd[i].append(newSpan);
   }   else if(fileType[i].value == "PDF") {
      const newSpan = document.createElement('span');
      const text = document.createTextNode("미리보기");
      newSpan.setAttribute("class","pre-view ifPdfPlace");
      newSpan.setAttribute("onclick","javascript:openModal('modal45');");
      newSpan.appendChild(text);
      
      const isTd = document.querySelectorAll(".o-title");
      isTd[i].append(newSpan);
   }  
}

const imageSelect = document.querySelectorAll(".imageSelect");

for(let i=0; i<imageSelect.length; i++){
   const isFiletype = document.querySelectorAll(".fileType");
   const imageI = document.createElement('i');
   const zipperI = document.createElement('i');
   const videoI = document.createElement('i');
   const fileI = document.createElement('i');
   
   imageI.setAttribute("class","fa-solid fa-image");
   zipperI.setAttribute("class","fa-solid fa-file-zipper");
   videoI.setAttribute("class","fa-solid fa-video");
   fileI.setAttribute("class","fa-solid fa-file-lines");
   if(isFiletype[i].value == "JPG" || isFiletype[i].value == "PNG" || isFiletype[i].value == "JFIF"){
      imageSelect[i].append(imageI);
   } else if (isFiletype[i].value == "MP4"){
      imageSelect[i].append(videoI);
   } else if (isFiletype[i].value == "ZIP"){
      imageSelect[i].append(zipperI);
   } else {
      imageSelect[i].append(fileI);
   }
   
}

/* 파일 사이즈 */
function bytesToSize(bytes) {
      var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
      if (bytes == 0) return '0 Byte';
      var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
      return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
   };
   
   let emp_nickname = [];

const temp = document.querySelectorAll(".fileSize");
for(let i=0; i<temp.length; i++){
   
   let bytes = temp[i].innerText;

function formatBytes(bytes, decimals = 2) {
    if (bytes === 0) return '0 Bytes';

    const k = 1024;
    const dm = decimals < 0 ? 0 : decimals;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}
    temp[i].innerText = formatBytes(bytes);
    
} 

const starChange = document.querySelectorAll(".starChange");

const empNcnm = "${loginEmp.ncnm}";
const starOn = document.querySelectorAll(".fa-star on");


for(let i=0; i<starChange.length ; ++i){
   starChange[i].addEventListener('click', function(e){
      
      //alert("클릭!");
       if(e.target.classList.contains('on')){
         const dataD = {
               "unityatchmnflno" : folderUnity,
               "ano" : ano[i].value,
         }
         
         $.ajax({
            url : '<%=request.getContextPath()%>/pds/deleteFav',
            type : 'post',
            data : JSON.stringify(dataD),
            contentType : 'application/json',
            success : function(result){
               if(result == 'success'){
                  const on = document.querySelectorAll(".on");
                  e.target.remove();
                  const off = document.createElement('i');
                  const starChange = document.querySelectorAll(".starChange");
                  off.setAttribute("class","fa-solid fa-star off")
                  starChange[i].append(off);
               }
            },
            error : function(error){
               alert('등록실패!');
            }
         }); 
         
      } else {
         

         const data = {
               "unityatchmnflno" : folderUnity,
               "ano" : ano[i].value,
               "ncnm" : empNcnm
         }
         
         $.ajax({
            url : '<%=request.getContextPath()%>/pds/addToFav',
            type : 'post',
            data : JSON.stringify(data),
            contentType : 'application/json',
            success : function(result){
               if(result == 'success'){
                  const off = document.querySelectorAll(".off");
                  e.target.remove();
                  const on = document.createElement('i');
                  const starChange = document.querySelectorAll(".starChange");
                  on.setAttribute("class","fa-solid fa-star on")
                  starChange[i].append(on);
               }
            },
            error : function(error){
               alert('등록실패!');
            }
         }); 
         
         
      }
   })
}

const memberPictureThumb = document.querySelectorAll('.memberPictureThumb');
const ifPdfPlace = document.querySelectorAll('.ifPdfPlace');
const ano = document.getElementsByName("ano");
const unityatchmnflno = document.getElementsByName("unityatchmnflno");

for(let i=0; i<memberPictureThumb.length; i++){
   memberPictureThumb[i].addEventListener('click', function(e){
      
      const data = {
            "ano" : ano[i].value,
            "unityatchmnflno" : unityatchmnflno[i].value
      }
      
      $.ajax({
         url : '<%=request.getContextPath()%>/pds/dpsDetail',
         type : 'post',
         data : JSON.stringify(data),
         contentType : 'application/json',
         success : function(result){
               $('.modal11').html("<img src=<%=request.getContextPath()%>/pds/getPicture?ano="+result.ano+"&unityatchmnflno="+result.unityatchmnflno+">");
         },
         error : function(error){
            alert('변경실패!');
         }
         
      });  
   })
}

/* var viewpdf = $("#viewpdf")

PDFObject.embed("",viewpdf) */

 <%-- for(let i=0; i<ifPdfPlace.length; i++){
   ifPdfPlace[i].addEventListener('click', function(e){
      
      const data = {
            "ano" : ano[i].value,
            "unityatchmnflno" : unityatchmnflno[i].value
      }
      
      $.ajax({
         url : '<%=request.getContextPath()%>/pds/dpsDetail',
         type : 'post',
         data : JSON.stringify(data),
         contentType : 'application/json',
         success : function(result){
            var viewpdf = $("#viewpdf")
            PDFObject.embed("<%=request.getContextPath()%>/pds/getPicture?ano="+result.ano+"&unityatchmnflno="+result.unityatchmnflno+"",viewpdf);
         },
         error : function(error){
            alert('변경실패!');
         }
         
      });  
   })
}  --%>

for(let i=0; i<ifPdfPlace.length; i++){
   ifPdfPlace[i].addEventListener('click', function(e){
      
      const data = {
            "ano" : ano[i].value,
            "unityatchmnflno" : unityatchmnflno[i].value
      }
      
      $.ajax({
         url : '<%=request.getContextPath()%>/pds/dpsDetail',
         type : 'post',
         data : JSON.stringify(data),
         contentType : 'application/json',
         success : function(result){
            let temp = "/getPreview/" + result.fileName;
            let tag = "<iframe src='"+temp+ "' style='width:800px; height:600px; border:1px solid #00c;'></iframe>"
            
            
            $('.modal45').html(tag); 
         },
         error : function(error){
            alert('변경실패!');
         }
         
      });  
   })
}

//파일 download
const downloadBtn = document.querySelector('#downloadBtn');
const uniflno = document.querySelector('#uniflno');
const checkMark = document.getElementsByName("chk");

const dataSetting = function(){
   let dataArr = [];
   let dataObj = {};
   
   for(let i = 0; i < checkMark.length; i++){
      if(checkMark[i].checked){
         dataObj = {"unityatchmnflno" : uniflno.value,
                  "ano" : checkMark[i].value}
         dataArr.push(dataObj);   
      }      
   }
   
   return dataArr;
};

const sendDownloadFile = function(dataArr){
   let data = dataSetting(dataArr);
   let downUrl = "restDownload";
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
   xhr.open('POST', downUrl);
   xhr.setRequestHeader('Content-type','application/json');
   xhr.responseType = 'blob'; 
   xhr.send(JSON.stringify(data));
   
}

const folderUnity = "${m_unityatchmnflno}";
downloadBtn.addEventListener('click',sendDownloadFile);





var checkBox = document.getElementById("checkAll");
var checkArr = checkMark.length;

var receCkArr = new Array();

$(checkBox).click(function (){
   if($("input:checkbox[name='allCk']").is(":checked") == true){
      
      $("input:checkbox[name='chk']").prop("checked", true);
      
      for(var i = 0; i < checkArr; i++){
         receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
         //console.log(receCkArr);
      }
   }else{
      $("input:checkbox[name='chk']").prop("checked", false);
      
      for(var i = 0; i < checkArr; i++){
         receCkArr.splice(0, checkArr);
         //console.log(receCkArr);
      }
   }
});

/* const removeCodeUpdate = document.querySelector('#removeB'); */
let isArrayForAtch = [];

//window.addEventListener('DOMContentLoaded', ()=>{   
//})
function removeB(e){
      
      receCkArr = new Array();
      
      for(var i = 0; i < checkArr; i++){
         let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
         if(ch == true){
            const data = {
               "unityatchmnflno" : folderUnity,
               "ano" : $("input:checkbox[name='chk']").eq(i).val()
         }
            isArrayForAtch.push(data);
         }
      }
      
      if(isArrayForAtch.length == 0){
         alert("삭제할 파일을 선택하세요");
      }
      else{
         $.ajax({
            url : '<%=request.getContextPath()%>/pds/updateDelForFiles',
            type : 'post',
            data : JSON.stringify(isArrayForAtch),
            contentType : 'application/json',
            success : function(result){
               if(result == 'success'){
                  Swal.fire({
                     icon:'success',
                     title:'휴지통으로 이동하였습니다.',
                  }).then((result)=>{
                             window.location.reload();
                              })
               }
            },
            error : function(error){
               alert('휴지통 이동이 실패되었습니다');
            }
         });
         isArrayForAtch = new Array();
      }  
   }








function submit_go(url,unityatchmnflno){   
   location.href=url+"?unityatchmnflno="+unityatchmnflno;
}

var fileNo = 0;
var filesArr = new Array();

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
            htmlData += '<tr id="file' + fileNo + '" class="fileArea">';
            htmlData += '<td class="flex"><i class="fa-solid fa-file"></i><div class="private-name">'+ file.name +'</div></td>';
            htmlData += '<td>'+ bytesToSize(file.size)+'</td>';
            htmlData += '<td><i class="fa-solid fa-xmark" onclick="deleteFile(' + fileNo + ');"></i></td>';
            htmlData += '</tr>';
            $('#fileBox').append(htmlData);
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
    //filesArr[num].is_delete = true;
    
    const dataTransfer = new DataTransfer();
          let files = $('#fileUploadRoot')[0].files; 
          let fileArray = Array.from(files);
          fileArray.splice(num, 1);
          fileArray.forEach(file => { dataTransfer.items.add(file); });
          $('#fileUploadRoot')[0].files = dataTransfer.files;
}


  function regist_go(){
 // 폼데이터 담기
   var form = document.querySelector("#registForm");
form.action = "<%=request.getContextPath()%>/pds/addFiles";
    form.submit();
}
   
</script>

  <%@ include file="/WEB-INF/include/footer.jsp" %>