<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <div class="top-bar flex ju-sp-bt al-it-ce" id="topbarColor">
                <div class="flex">
                    <div class="logo flex al-it-ce">
                        <a href="/mzgw/index" class="flex"><img src="<%=request.getContextPath()%>/resources/images/logo2.png" alt="로고" /></a>
                    </div>

                    <div class="nav-bar">
                        <ul class="flex al-it-ce ju-sp-bt">
                            <li class="main-m flex al-it-ce">
                                <a href="/mzgw/setle/main">
                                    <span><i class="fa-solid fa-signature"></i>워크플로우</span>
                                </a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="<%=request.getContextPath()%>/dclz/dclzStatus"><span><i class="fa-solid fa-clipboard-user"></i>근태관리</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="/mzgw/work/main"><span><i class="fa-solid fa-briefcase"></i>업무관리</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="/mzgw/mail/main"><span><i class="fa-solid fa-envelope"></i>메일</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="/mzgw/pds/main"><span><i class="fa-solid fa-folder-open"></i>자료실</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="#"><span><i class="fa-solid fa-comment"></i>커뮤니티</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="#"><span><i class="fa-solid fa-bullhorn"></i>정보</span></a>
                            </li>

                            <li class="main-m flex al-it-ce">
                                <a href="#"><span><i class="fa-solid fa-gear"></i>운영자</span></a>
                            </li>
                        </ul>

                                            
                          <div class="sub-menu">
                            <div class="sub-mwrap flex">
                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/setle/setleWrite">워크플로우작성</a></li>
                                    <li><a href="<%=request.getContextPath()%>/setle/setleAccept?perPageNum=5">워크플로우목록</a></li>
                                    <li><a href="<%=request.getContextPath()%>/setle/setleMyList?perPageNum=5">나의문서보관함</a></li>
                                    <li><a href="<%=request.getContextPath()%>/setle/setlePartList?perPageNum=5">부서문서보관함</a></li>
                                    <li><a href="<%=request.getContextPath()%>/setle/setleMyTrash?perPageNum=5">휴지통</a></li>
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/dclz/dclzStatus">나의근태현황</a></li>
                                    <li><a href="<%=request.getContextPath()%>/dclz/annualList">나의연차내역</a></li>
                                    <!-- <li><a href="#">급여조회</a></li> -->
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/work/registForm">업무등록</a></li>
                                    <li><a href="<%=request.getContextPath()%>/work/commonList">공통업무</a></li>
                                    <li><a href="<%=request.getContextPath()%>/work/indivList">개인업무</a></li>
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/mail/registForm">메일보내기</a></li>
                                    <%-- <li><a href="<%=request.getContextPath()%>/mail/fullMail">전체메일함</a></li> --%>
                                    <li><a href="<%=request.getContextPath()%>/mail/receivedMail">받은메일함</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mail/sendMail">보낸메일함</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mail/storageMail">임시보관함</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mail/removeMail">휴지통</a></li>
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/pds/fav">즐겨찾기</a></li>
                                    <li><a href="<%=request.getContextPath()%>/pds/registForm">자료생성</a></li>
                                    <li><a href="<%=request.getContextPath()%>/pds/pdsFolders">전사자료실</a></li>
                                    <li><a href="<%=request.getContextPath()%>/pds/pdsDepFolders">부서자료실</a></li>
                                    <li><a href="<%=request.getContextPath()%>/pds/pdsPrivateFolders">개인자료실</a></li>
                                    <li><a href="<%=request.getContextPath()%>/pds/pdsPrivateBin">휴지통</a></li>
                                </ul>

                                <ul id="board">
									<li><a href="<%=request.getContextPath()%>/noticeboard/list?btno=1">공지사항</a></li>
                                    <li><a href="<%=request.getContextPath()%>/freeboard/list?btno=2">자유게시판</a></li>
                                    <li><a href="<%=request.getContextPath()%>/faqboard/list">FAQ</a></li>
                                    <li><a href="<%=request.getContextPath()%>/eventboard/list?btno=4">경조사게시판</a></li>
                                    <li><a href="<%=request.getContextPath()%>/feed/feedPage?emp=${loginEmp.empl_no}">피드</a></li>	
                                    <li><a href="<%=request.getContextPath()%>/club/list">동호회</a></li>	
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/address/publicList">공용주소록</a></li>
                                   <%--  <li><a href="<%=request.getContextPath()%>/address/deptList">부서주소록</a></li> --%>
                                    <li><a href="<%=request.getContextPath()%>/address/privateList">개인주소록</a></li>
                                    <li><a href="<%=request.getContextPath()%>/schedule/calendar">나의일정</a></li>
                                </ul>

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/dclzmanager/list">전사근태현황</a></li>
                                    <li><a href="<%=request.getContextPath()%>/dclzmanager/empAnnualStatus">전사연차현황</a></li>
                                    <li><a href="<%=request.getContextPath()%>/dclzmanager/mdatReqst">근태조정신청현황</a></li>
                                    <li>
                                    	<a href = "<%=request.getContextPath() %>/manager/list" >사원관리</a>
                                    </li>
                                    <li><a href="<%=request.getContextPath()%>/evl/result">전사평가결과조회</a></li>
                                    <li>
                                    	<a href="<%=request.getContextPath()%>/ctmzManager/customizing">커스터마이징</a>
                                    </li>

                                </ul>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="user flex al-it-ce">
                    <i class="num fa-solid fa-bell" id="push-num"><span>1</span></i>
                    <a href="<%=request.getContextPath()%>/user/myPage" class="flex"><i class="fa-solid fa-user"></i></a>
                    <i class="fa-solid fa-right-from-bracket" onclick="location.href='<%=request.getContextPath()%>/common/logout'"></i>
                </div>

                <div class="top-modal top01" id="push-list">
                    
                </div>
				<div class="top-modal top02">
				  <ul>
                        <li class="flex ju-sp-bt">
                            <div>
                                <i class="num fa-solid fa-bell"></i> 새 알림이 도착했습니다.
                            </div>

                            <div class="mi-txt">
                                
                            </div>
                        </li>
                  </ul>
				</div>
            </div>



<script type="text/x-handlebars-template"  id="customBoard-list-template" >
{{#each .}}
	<li class="bmenu"><a href="javascript:getCustomBoard('{{boardtype_no}}');">{{boardName}}</a></li>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="customTopbarColorScript" >
<scr{{!}}ipt>
	$('#topbarColor').css('background-color','{{color}}');
	 $('.sub-mwrap').children('ul').hover(function() {
		$(this).css('background-color','{{color}}');
            }, function(){
                $(this).css('background-color','white');
            });
	$('.topbarColor').val('{{color}}');
	$('.sp-colorize').css('background-color','{{color}}')
</scr{{!}}ipt>
</script>

<script>
	
	window.addEventListener('DOMContentLoaded',getPage("<%=request.getContextPath()%>/common/getCustom"));
	
	function getPage(pageInfo){    
	   $.getJSON(pageInfo,function(data){   
	      printData(data.boardMenuList,$('#board'),$('#customBoard-list-template'));
	      printTopbarColor(data.topbar,$('#customTopbarColorScript'));
	   });
	}

	function printData(bmenuArr,target,templateObject){
	   let template=Handlebars.compile(templateObject.html());
	   let temp = template(bmenuArr);   
	   $('.bmenu').remove();
	   target.append(temp);
	}
	
	function printTopbarColor(color,templateObject){
		let template=Handlebars.compile(templateObject.html());
		let temp = template(color);   
		$('body').append(temp);
	}



	
	function getCustomBoard(bno){
		location.href = '<%=request.getContextPath()%>/customBoard/'+bno;

	}

</script>
<script>
   var socket = null;
   connect();

   function connect() {
      
      // egov-com-sevlet.xml에서 mapping path에 걸려 웹소켓 핸들러가 요청을 처리
      var ws = new WebSocket('ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket');		   
      socket = ws;
      
      // 연결 성공시
      ws.onopen = function() {
         console.log('Info: connection opened.');
         <c:if test="${from eq 'regist'}">
         sendPush();
         </c:if>
      };

      // 응답 메세지 수진 부분 
      ws.onmessage = function(event) {
         
         var gUserId = $("#userSessionId").val();
         var sm = event.data;
         console.log("안녕");
         console.log(event.data);
         pushPrint();
         
         $(".top-modal.top02").fadeIn(300);

          setTimeout(function(){$(".top-modal.top02").fadeOut(300); }, 3000);
          
          updateLastCheck('<%=request.getContextPath()%>');
      };
      // 연결 종료시 
      ws.onclose = function(event) {
         console.log('Info: connection closed');
      };
      // 에러 발생시
      ws.onerror = function(err) {
         console.log('Error:', err);
      };
   }
	function sendPush(){
		 
        // 현재 로그인 한 sessionId를 가져오기 위함.
        var gUserId = $("#userSessionId").val();
       
        // form 안에 있는 input 등 전송할 수 있는 동작을 중단
       
        
        // readyState 1일때 webSocket객체 이벤트를 발생시킨다.
        if (socket.readyState !== 1){
           console.log("준비안됨");return;
        }
        // 세션값을 보낸다. 
        socket.send("안녕하세요요요요.");
	}
   
   // 제일 먼저 실행 되는 부분.
   $(document).ready(function() {
      // 버튼을 클릭 시 이벤트 
      $('#alertQnaOk').on('click', function(evt) {
      
    	 
         // 현재 로그인 한 sessionId를 가져오기 위함.
         var gUserId = $("#userSessionId").val();
        
         // form 안에 있는 input 등 전송할 수 있는 동작을 중단
         evt.preventDefault();
         
         // readyState 1일때 webSocket객체 이벤트를 발생시킨다.
         if (socket.readyState !== 1)
            return;
            
         // 세션값을 보낸다. 
         socket.send("안녕하세요요요요.");
        

      });
      
   });
   
  
   function pushPrint(){
		$.get('<%=request.getContextPath()%>/push/list', function(response) {
			if(response.length != 0){
				$('#push-num').html("<span>"+response.length+"</span>");
				var htmltext = "<ul>";
				for(var pu of response){
					console.log(pu.pushCn);
					if(pu.pushType == "mail"){
						htmltext +=`<li class="flex ju-sp-bt" onclick='readpush(`+pu.pushNo+`);location.href="<%=request.getContextPath()%>`+pu.pushUrl+`"'>
					                <div>
					                <i class="fa-solid fa-envelope"></i>`+pu.pushCn+`
						            </div>
						
						            <div class="mi-txt">
						            `+displayedAt(pu.pushRgdate)+`
						            </div>
						        </li>`;
					}else if(pu.pushType == "work"){
						htmltext +=`<li class="flex ju-sp-bt" onclick='readpush(`+pu.pushNo+`); location.href="<%=request.getContextPath()%>`+pu.pushUrl+`"'>
		                <div>
		                <i class="fa-solid fa-calendar-check"></i>`+pu.pushCn+`
			            </div>
			
			            <div class="mi-txt">
			            `+displayedAt(pu.pushRgdate)+`
			            </div>
			        </li>`;
					}else if(pu.pushType == "setle"){
						htmltext +=`<li class="flex ju-sp-bt" onclick='readpush(`+pu.pushNo+`);location.href="<%=request.getContextPath()%>`+pu.pushUrl+`"'>
		                <div>
		                <i class="fa-solid fa-file"></i>`+pu.pushCn+`
			            </div>
			
			            <div class="mi-txt">
			                `+displayedAt(pu.pushRgdate)+`
			            </div>
			        </li>`;
					}
				}
				htmltext+= "</ul>"
			
				$('#push-list').html(htmltext);
				
			}else{
				
				$('#push-num').html("<span>"+response.length+"</span>");
				
			}
			
		});
   }
   
   function readpush(pushNo){
	   $.get('<%=request.getContextPath()%>/push/read?pushNo='+pushNo, function(response) {
		   
	   });
   }
	
   pushPrint();
</script>

<script>
/* 데이트 객체 포맷 함수 */
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};
function displayedAt(createdAt) {
	
	const milliSeconds = new Date().getTime() - createdAt;
	
	const seconds = milliSeconds / 1000;
	if (seconds < 60) return `방금 전`;
	
	const minutes = Math.floor(seconds / 60);
	if (minutes < 60) return minutes+"분 전";
	
	const hours = Math.floor(minutes / 60);
	if (hours < 24) return hours+"시간 전";
	
	const days = Math.floor(hours / 24);
	if (days < 7) return days+"일 전";
	
	return new Date(createdAt).format("yyyy.MM.dd");
	
	/* 핸들바스일때는 백틱이 에러가 나네..... 변수를 못가져와
	const weeks = days / 7;
	if (weeks < 5) return `${Math.floor(weeks)}주 전`;
	
	const months = days / 30
	if (months < 12) return `${Math.floor(months)}개월 전`;
	
	const years = days / 365;
	return `${Math.floor(years)}년 전`; */
	
}
</script>
