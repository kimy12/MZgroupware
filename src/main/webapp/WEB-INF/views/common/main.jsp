<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<head>
<script src="<%=request.getContextPath() %>/resources/js/mainCalendar.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/popup.js" ></script>
</head>
<body>
	<div class="noticePopup-wrap" id="pop">
		<div class="mainpop-box">
			<div class="popClose mb-10 flex flex-end">
				<div onClick="popRemove()" id="close">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</div>
			<div class="flex mb-30">
				<c:forEach items="${popups }" var="pop">
					<div class="m-popC" style="display:none" data-stdate="2022-05-17" data-dedate="2022-05-20">
						<h2>${pop.boardTitle }</h2>
						<div class="popConDetail">
							${pop.boardContent }
						</div>
					</div>
				 </c:forEach>
			</div>
			
				
			<div class="today-close">
				<span id="check">
					<input type="checkbox" value="checkbox" name="chkbox" id="chkday"/>
					<label for="chkday">오늘 하루 보지 않기</label>
				</span>
               
			</div>
		</div>
	</div>



		
       <div class="wrap">
           <div class="main">

			<%@ include file="/WEB-INF/include/topbar.jsp" %>
			
            <div class="container flex">
              

                <div class="content flex ju-sp-bt">
                   
                   <div class="section sec01">
                       <div class="user-box">
                            <div class="user-img" data-id="${loginEmp.id }"></div>

                            <div class="user-name">
                            	<input type="hidden" id="empIp" value="${loginEmp.ip }">
                            	<input type="hidden" id="empNo" value="${loginEmp.empl_no }">
                                <h4>${loginEmp.ncnm } ${loginEmp.rank }</h4>
                                <p><i class="fa-solid fa-briefcase"></i>${loginEmp.dept }</p>
                            </div>

                            <div class="user-btn flex ju-sp-bt">
                                <button class="my-page">마이페이지</button>
                                <button class="logout">로그아웃</button>
                            </div>

                       </div>

                       <div class="work-box">
                        <div class="work-info">
                        	<div class="flex ju-sp-bt al-it-ce mb-10">
	                            <span class="today"></span>
	                            
	                            <div class="timer">
		                            <i class="fa-solid fa-clock"></i>
		                            <em class="clock"></em>
		                        </div>
                            </div>

                            <div class="time-graph  mb-30">
                                <div class="g-time">
                                    <em id="workHour">00</em><span>h</span>
                                    <em id="workMinute">00</em><span>m</span>
                                    <em id="workSec"></em>
                                </div>

                                <div class="g-stick">
                                    <span class="percent"></span>

                                    <div class="max-chr">
<!--                                         <ul> -->
<!--                                             <li>최대 10h</li> -->
<!--                                             <li><span></span></li> -->
<!--                                             <li>최소 8h</li> -->
<!--                                         </ul> -->
                                    </div>
                                </div>
                            </div>
                           
                        </div>

                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce"><span id="workState">선택</span><i class="fa-solid fa-caret-down"></i></div>
                                <ul class="tog-b" style="display: none;">
                                    <li class="wst" value="1">근무중</li>
                                    <li class="wst" value="2">조퇴</li>
                                </ul>
                            </div>

                            <div class="work-btn flex ju-sp-bt">
                                <button id="workStart">출근하기</button>
                                <button id="workEnd">퇴근하기</button>
                            </div>

                            <div class="work-time">
                                <ul>
                                    <li class="flex ju-sp-bt al-it-ce">
                                        <em>출근시간</em>
                                        <span id="workStartTime">00:00:00</span>
                                        
                                    </li>

                                    <li class="flex ju-sp-bt al-it-ce">
                                        <em>퇴근시간</em>
                                        <span id="workEndTime">00:00:00</span>
                                    </li>
                                </ul>
                            </div>
                        
                        </div>

                        <div class="bot-pa">
                            <div class="sec_cal">
                                <div class="cal_nav">
                                <a href="javascript:;" class="nav-btn go-prev">prev</a>
                                <div class="year-month"></div>
                                <a href="javascript:;" class="nav-btn go-next">next</a>
                                </div>
                                <div class="cal_wrap">
                                <div class="days">
                                    <div class="day">MON</div>
                                    <div class="day">TUE</div>
                                    <div class="day">WED</div>
                                    <div class="day">THU</div>
                                    <div class="day">FRI</div>
                                    <div class="day">SAT</div>
                                    <div class="day">SUN</div>
                                </div>
                                <div class="dates"></div>
                                </div>
                            </div>
                        </div>
                   </div>

                   <div class="section sec02">
                      <div class="con con01">
                          <div class="con-title">
                            <i class="fa-solid fa-signature"></i> Quick
                          </div>

                          <div class="appro-quick ">
                                <ul class="flex ju-sp-bt flex-wrap">
                                    <li>
                                        <i class="fa-solid fa-envelope" onclick="location.href='${pageContext.request.contextPath}/mail/main'"></i>
                                        <span>메일</span>
                                       <!--  <em>1</em> -->
                                    </li>
                                    
                                    <li>
                                        <i class="fa-solid fa-heart" onclick="location.href='${pageContext.request.contextPath}/feed/feedPage?emp=E0006'"></i>
                                        <span>피드</span>


                                       <!--  <em>1</em> -->

                                    </li>

                                    <li>
                                        <i class="fa-solid fa-stamp" onclick="location.href='${pageContext.request.contextPath}/setle/main'"></i>
                                        <span>워크플로우</span>

                                    


                                    </li>

                                    <li>
                                        <i class="fa-solid fa-calendar-days" onclick="location.href='${pageContext.request.contextPath}/schedule/calendar'"></i>
                                        <span>일정</span>

                                        <!--  <em>1</em> -->

                                    </li>

                                    <li>
                                        <i class="fa-solid fa-address-card" onclick="location.href='${pageContext.request.contextPath}/address/privateList'"></i>
                                        <span>주소록</span>
                                       <!--  <em>1</em> -->
                                    </li>

                                    <li>
                                        <i class="fa-solid fa-clipboard-user" onclick="location.href='${pageContext.request.contextPath}/dclz/dclzStatus'"></i>
                                        <span>근태</span>
                                        <!--  <em>1</em> -->
                                    </li>
                                </ul>
                          </div>
                      </div>

                      <div class="con con02">
                         <div class="con-title">
                            <i class="fa-solid fa-stamp"></i> 결재할문서
                          </div>

                          <div class="approval">
                            <table>
                              <colgroup>
                                  <col width="10%">
                                  <col width="70%">
                                  <col width="20%">
                              </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="modi-img" data-id="bomeng"></div>
                                        </td>
                                        <td>
                                            <h5>연차휴가 신청 건</h5>
                                            <span>전산팀 / 조보명 대리</span>
                                            <p><i class="fa-solid fa-signature"></i> 조보명 <i class="fa-solid fa-angle-right"></i> <em>한석희</em> </p>
                                        </td>
                                        <td class="date">2022-04-25</td>
                                    </tr>

                                    <tr>
                                      <td>
                                          <div class="modi-img" data-id="test2"></div>
                                      </td>
                                      <td>
                                          <h5>비품구입 신청 건</h5>
                                          <span>전산팀 / 김유신 대리</span>
                                          <p><i class="fa-solid fa-signature"></i> 김유신 <i class="fa-solid fa-angle-right"></i> <em>한석희</em> </p>
                                      </td>
                                      <td class="date" >2022-04-29</td>
                                  </tr>

                                  <tr>
                                      <td>
                                          <div class="modi-img" data-id="sumin"></div>
                                      </td>
                                      <td>
                                          <h5>시말서</h5>
                                          <span>전산팀 / 곽수민 대리</span>
                                          <p><i class="fa-solid fa-signature"></i> 곽수민 <i class="fa-solid fa-angle-right"></i> <em>한석희</em> </p>
                                      </td>
                                      <td class="date">2022-05-06</td>
                                  </tr>

                                </tbody>
                            </table>
                        </div>
                      </div>

                      <div class="con con03">
                        <div class="con-title">
                            <i class="fa-solid fa-briefcase"></i> 나의 일감
                          </div>

                          <div class="work-table">
                              <table>
                                <colgroup>
                                    <col width="70%">
                                    <col width="30%">
                                </colgroup>

                                  <tbody>
                                      <tr>
                                          <td>
                                              <p>회의록 제출</p>
                                              <div class="work-day">
                                                <i class="fa-solid fa-stopwatch"></i> 2022-05-18 ~ 2022-05-18
                                              </div>
                                          </td>

                                          <td class="tip">
                                           <span class="s">진행중</span>
                                           <em><i class="fa-solid fa-user-pen"></i>${loginEmp.name }</em>
                                          </td>
                                      </tr>

                                      <tr>
                                        <td>
                                            <p>워크샵 보고서 제출</p>
                                            <div class="work-day">
                                              <i class="fa-solid fa-stopwatch"></i> 2022-05-16 ~ 2022-05-17
                                            </div>
                                        </td>

                                        <td class="tip">
                                         <span class="n">진행중</span>
                                         <em><i class="fa-solid fa-user-pen"></i>${loginEmp.name }</em>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <p>근무조정신청</p>
                                            <div class="work-day">
                                              <i class="fa-solid fa-stopwatch"></i> 2022-05-15 ~ 2022-05-15
                                            </div>
                                        </td>

                                        <td class="tip">
                                         <span class="d">불가</span>
                                         <em><i class="fa-solid fa-user-pen"></i>${loginEmp.name }</em>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <p>일일업무 보고 제출</p>
                                            <div class="work-day">
                                              <i class="fa-solid fa-stopwatch"></i> 2022-05-14 ~ 2022-05-14
                                            </div>
                                        </td>

                                        <td class="tip">
                                         <span class="i">완료</span>
                                         <em><i class="fa-solid fa-user-pen"></i>${loginEmp.name }</em>
                                        </td>
                                    </tr>
                                  </tbody>
                              </table>
                          </div>
                       
                     </div>
                    </div>

                    <div class="section sec03">
                       <div class="main-banner">
                        <video autoplay loop muted width="100%">
                            <source src="<%=request.getContextPath() %>/resources/images/meeting.mp4"
                                    type="video/mp4">
                        </video>
                        </div>

                        <div class="tab">
                            <div class="link"><i class="fa-solid fa-plus"></i></div>
                            <ul class="tabnav">
                                <li><a href="#tab01" class="active">결재</a></li>
                                <li><a href="#tab02">게시판</a></li>
                            </ul>

                            <div class="tabcontent">
                                <div id="tab01">
                                    <table>
                                        <colgroup>
                                            <col width="60%">
                                            <col width="8%">
                                            <col width="13%">
                                            <col width="19%">
                                        </colgroup>
    
                                        <tbody>
    
                                             <tr>
                                                <td>연차신청 결재</td>
                                                <td><div class="n-icon">N</div></td>
                                                <td><span class="name">전미영</span></td>
                                                <td><span class="date">2022-05-19</span></td>
                                             </tr>
    
                                             <tr>
                                                <td>비품 구매 신청 결재</td>
                                                <td></td>
                                                <td><span class="name">한석희</span></td>
                                                <td><span class="date">2022-05-17</span></td>
                                             </tr>
    
                                             <tr>
                                                <td>연장근무 승인 요청 결재</td>
                                                <td></td>
                                                <td><span class="name">조보명</span></td>
                                                <td><span class="date">2022-05-17</span></td>
                                             </tr>
    
                                             <tr>
                                                <td>병가 승인 요청</td>
                                                <td></td>
                                                <td><span class="name">김유신</span></td>
                                                <td><span class="date">2022-05-06</span></td>
                                             </tr>
    
                                             <tr>
                                                <td>일일업무보고 결재 올립니다</td>
                                                <td></td>
                                                <td><span class="name">곽수민</span></td>
                                                <td><span class="date">2022-05-04</span></td>
                                             </tr>
    
                                        </tbody>
    
                                    </table>
                            </div>

                            
                            <div id="tab02" style="display: none;">
                                <table>
                                    <colgroup>
                                        <col width="68%">
                                        <col width="7%">
                                        <col width="10%">
                                        <col width="15%">
                                    </colgroup>

                                    <table>
                                        <colgroup>
                                            <col width="60%">
                                            <col width="8%">
                                            <col width="13%">
                                            <col width="19%">
                                        </colgroup>

                                        <tbody>
                                             <tr>
                                                <td>게시판 돌려줘 .... 맴에 드는 게시판으루 .....그랒그라즈락ㄷ자라즈ㅏㅡ랒라즈라ㅡ잘</td>
                                                <td></td>
                                                <td><span class="name">홍길동</span></td>
                                                <td><span class="date">2022-01-01</span></td>
                                             </tr>

                                             <tr>
                                                <td>파일 td는 없애지말구 ...스크립트로 아이콘 너어죠 ....</td>
                                                <td><i class="fa-solid fa-file"></i></td>
                                                <td><span class="name">홍길동</span></td>
                                                <td><span class="date">2022-01-01</span></td>
                                             </tr>

                                             <tr>
                                                <td>파일 td는 없애지말구 ...스크립트로 아이콘 너어죠 .....</td>
                                                <td></td>
                                                <td><span class="name">홍길동</span></td>
                                                <td><span class="date">2022-01-01</span></td>
                                             </tr>

                                             <tr>
                                                <td>파일 td는 없애지말구 ...스크립트로 아이콘 너어죠 .....</td>
                                                <td></td>
                                                <td><span class="name">홍길동</span></td>
                                                <td><span class="date">2022-01-01</span></td>
                                             </tr>

                                             <tr>
                                                <td>파일 td는 없애지말구 ...스크립트로 아이콘 너어죠 .....</td>
                                                <td></td>
                                                <td><span class="name">홍길동</span></td>
                                                <td><span class="date">2022-01-01</span></td>
                                             </tr>

                                        </tbody>

                                    </table>

                                </table>

                            </div>

                           
                            </div>
                        </div>
                        
                        <div class="slid-txt">
                            <div class="top-slid flex ju-sp-bt">
                                <div>
                                    <i class="fa-solid fa-volume-high"></i> 중요공지
                                </div>

                                <div class="slid-page">
<!--                                     <i class="fa-solid fa-angle-left"></i>  -->
<!--                                     <span><em>1</em> &nbsp; /&nbsp;  3</span> -->
<!--                                     <i class="fa-solid fa-angle-right"></i> -->
                                </div>
                            </div>

                            <div class="slid-con">
                               <div class="notice-title">
                                   [긴급공지] 전사원 안전교육 및 안전점검 시행
                               </div>

                               <div class="wri-date flex ju-sp-bt">
                                    <div><i class="fa-solid fa-stopwatch"></i> 2022-05-09 ~ 2022-05-10</div>
                                    <div>경영기획팀 하재관</div>
                              </div>
                            </div>
                        </div>

                        <div class="mem-event">
                            <div class="top-slid flex ju-sp-bt">
                                <div>
                                    <i class="fa-solid fa-wifi"></i> 임직원 소식
                                </div>

                                <div class="slid-page">
<!--                                     <i class="fa-solid fa-angle-left"></i>  -->
<!--                                     <span><em>1</em> &nbsp; /&nbsp;  3</span> -->
<!--                                     <i class="fa-solid fa-angle-right"></i> -->
                                </div>
                            </div>

                            
                            <div class="slid-con">
                                <ul class="flex ju-sp-bt">
                                    <li>
                                        <span class="f-work"><i class="fa-solid fa-clipboard-user"></i></span>
                                        <span class="f-txt">입사</span>
                                        <div class="modi-img" data-id="bomeng"></div>
                                        <div class="user-name">조나단</div>
                                    </li>
                                    
                                    <li>
                                        <span class="f-work"><i class="fa-solid fa-cake-candles"></i></span>
                                        <span class="f-txt">생일</span>
                                        <div class="modi-img" data-id="test2"></div>
                                        <div class="user-name">김유신</div>
                                    </li>

                                    <li>
                                        <span class="f-work"><i class="fa-solid fa-clipboard-user"></i></span>
                                        <span class="f-txt">입사</span>
                                        <div class="modi-img" data-id="test8"></div>
                                        <div class="user-name">문명진</div>
                                    </li>

                                    <li>
                                        <span class="f-work"><img src="${pageContext.request.contextPath }/resources/images/icon_d.jpg" /></span>
                                        <span class="f-txt">부고</span>
                                        <div class="modi-img" data-id="test17"></div>
                                        <div class="user-name">구건회</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                     </div>
                </div>
        </div>
       </div>
      </div>
       
       <script>			       
       		const logout = document.querySelector('.logout');
       		const clock = document.querySelector('.clock');
       		const today = document.querySelector('.today');
       		const empIp = document.querySelector('#empIp');
       		const empNo = document.querySelector('#empNo');
       		const workStart = document.querySelector('#workStart');
       		const workEnd = document.querySelector('#workEnd');
       		const workHour = document.querySelector('#workHour');
       		const workMinute = document.querySelector('#workMinute');
       		const workStartTime = document.querySelector('#workStartTime');
       		const workEndTime = document.querySelector('#workEndTime');
       		const percent = document.querySelector('.percent');
       		const workState = document.querySelector('#workState');
       		const workSec = document.querySelector('#workSec');
       		const wst = document.querySelectorAll('.wst');
       		
       		
       		[].forEach.call(wst, (w)=>{
       			w.addEventListener('click', setWorkState);       			
       		});
       		
       		MemberProFilePictureThumb('${pageContext.request.contextPath}');
    		
    	   	function MemberProFilePictureThumb(contextPath){
    	   		
    	   		 for(let target of document.querySelectorAll('.modi-img')){	
    	   			 let id = target.getAttribute('data-id');
    	   			 
    	   			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
    	   			 target.style.backgroundPosition="center";
    	   			 target.style.backgroundRepeat="no-repeat";
    	   			 target.style.backgroundSize="cover";
    	   			 target.style.width="45px";
    	   			 target.style.height="45px";
    	   		}
    	   	}
       		
       		function setWorkState(){
     			this.parentNode.style.display = 'none';
     			workState.innerText = this.innerText;  			
       		}
       		
	       
       		setClock();
       		setInterval(setClock,1000);
       		
       		function timeSetting(){
       			const dateInfo = new Date(); 
       		    
       		    const timeSet = {
       		    		week : ['일', '월', '화', '수', '목', '금', '토'],
       		    		dateInfo : dateInfo,
		       		    year : dateInfo.getFullYear(),
		       		    month : dateInfo.getMonth()+1, 
		       		    date : dateInfo.getDate(),
       		    		hour : modifyNumber(dateInfo.getHours()),
       		    		min : modifyNumber(dateInfo.getMinutes()),
       		    		sec : modifyNumber(dateInfo.getSeconds()),
      		    }
       		    
       		    return timeSet;
       		}
       		
       		function setClock(){       			
       		    const timeData = timeSetting();
       		    
       		 	today.innerHTML = timeData.year + "년 " + timeData.month + "월 " + timeData.date + "일[" + timeData.week[timeData.dateInfo.getDay()] + "]";
       		    clock.innerHTML = timeData.hour + ":" + timeData.min  + ":" + timeData.sec;
       		    
       		    return timeData;
       		}
       		
       		function modifyNumber(time){
       		    if(parseInt(time)<10){
       		        return "0"+ time;
       		    }
       		    else
       		        return time;
       		}
       		
       		
       		
       		//근무시간 계산
       		let timer;
       		function workingTime(){
	       		let time = 0; 
       			let hour = 0;
       		  	let min = 0;
       		 	let sec = 0;
       		 	
	       		timer = setInterval(()=>{
	       	        time++;
	       	        min = Math.floor(time/60);
	       	        hour = Math.floor(min/60);
	       	        sec = time%60;
	       	        min = min%60;
	
	       	        let th = hour;
	       	        let tm = min;
	       	        let ts = sec;
	       	        th < 10 ? th = "0" + hour : '' 
	       	        tm < 10 ? tm = "0" + min : '' 
	       	        ts < 10 ? ts = "0" + sec : '' 
	       	        		
	       	        workMinute.innerHTML = tm;
	       	        workHour.innerHTML = th;
	       	     	workSec.innerHTML = ts;
	       	    }, 1000);
       		}
       		
       		
       		let workInterval;
       		function workPercent(){
	       		let cnt = 1;
	       		workInterval = setInterval(()=>{
	       			cnt<=80 ? percent.style.width = 1.25*cnt++ + '%' : clearInterval(workInterval); 
	       			
	       		},360000);
       			
       		}
       		
       		function getIpAddress(){
       			let ipchk = false;
       			let ipvalue = empIp.value.trim();
	       		$.ajax({
	   				url:'<%=request.getContextPath()%>/dclz/getIpAddr',
	   				type:'get',
	   				async: false,
	   				success:function(ip){
	   					if(ipvalue === ip){
	   						ipchk = true;
	   					}
	   				}
       			});
       			return ipchk;
       		}
       		
       		//출근버튼 클릭시
       		function setWorkStart(){
       			let time = getTodayWorkTime();
       			
       			if(!getIpAddress()){
       				Swal.fire({
					  icon: 'warning',
					  title: '허용되지 않은 IP입니다!'
					});
       				return;
       			}
       			if(time.beginTime){
       				Swal.fire({
					  icon: 'warning',
					  title: '오늘 출근 이력이 존재합니다!'
					});
       				return;
       			}
       			
       			OpenWindow("http://localhost:3000/dclzfaceRecognition","출퇴근 얼굴인식",800,600);
       			
       			
       		}
       		
       		function goToWork(){
   			workStart.style.background = '#1A9CE4';
   			workStart.style.color = '#fff';
   			
   			workPercent();
   			workingTime();
   			let start = setClock();
   			let setTime = start.hour + ":" + start.min  + ":" + start.sec;
   			workStartTime.innerHTML = setTime;
   			
   			const workData = {
   					empl_no : empNo.value,
   					beginTime : setTime,
   					workstleCode : '1'
   			}
   			// 출근 시간 데이터베이스 저장
   			registWorkTime(workData);
   			workState.innerText = wst[0].innerText;
   		}
   		
   		//출근
   		function registWorkTime(wdata){
   			$.ajax({
       				url : '<%=request.getContextPath()%>/dclz/insertWorkTime',
   				type : 'post',
   				data : JSON.stringify(wdata),
   				contentType : 'application/json',
   				success : function(result){
   					if(result == "success"){
   						history.replaceState({}, null, location.pathname);
   					}
   					
   				},
   				error : function(xhr){
   					alert(xhr.status);
   				}
   			});
       	}
       		
       		//오늘 출근 시간 가져오기
       		function getTodayWorkTime(){
       			let time = "";
       			$.ajax({
       				url : '<%=request.getContextPath()%>/dclz/todayWorkTime',
       				type : 'post',
       				data : empNo.value,
       				async: false,
       				contentType : 'application/json',
       				success : function(result){
       					time = result;
       				},
       				error : function(xhr){
       					alert(xhr.status);
       				}
       			});
       			
       			return time;
       		}
       		
       		//퇴근 버튼 클릭시
       		function setWorkEnd(){
       			let time = getTodayWorkTime();
       			
       			if(!time.beginTime){
       				Swal.fire({
  					  icon: 'warning',
  					  title: '출근을 먼저 하셔야합니다!'
  					});
         				return;
       			}
       			if(!getIpAddress()){
       				Swal.fire({
					  icon: 'warning',
					  title: '허용되지 않은 IP입니다!'
					});
       				return;
       			}
       			if(time.endTime){
       				Swal.fire({
					  icon: 'warning',
					  title: '이미 퇴근 하셨습니다!'
					});
       				return;
       			}
       			
       			Swal.fire({
					 	title: "정말 퇴근하시겠습니까?",
	                    icon: 'warning',
	                    showCancelButton: true,
           				confirmButtonColor: '#3085d6',
           				cancelButtonColor: '#d33',
           				confirmButtonText: '확인',
           				cancelButtonText: '취소'
	                }).then((result) => {
	                    if (result.isConfirmed) {
	                    	OpenWindow("http://localhost:3000/workEndfaceRecognition","출퇴근 얼굴인식",800,600);
	                    }
	                })
       			
       		}
       		
       		function endToWork(){
       			workStart.style.background = 'none';
       			workStart.style.color = '#ddd';
       			workEnd.style.background = '#1A9CE4';
       			workEnd.style.color = '#fff';
       			
       			clearInterval(workInterval);
       			clearInterval(timer);
       			let end = setClock();
       			let setTime = end.hour + ":" + end.min  + ":" + end.sec;
       			workEndTime.innerHTML = setTime;
       			
       			let workTimeDiff = timeCalculate();
       			const workData = {
       					empl_no : empNo.value,
       					endTime : setTime,
       					workstleCode : '0',
       					workTime : workTimeDiff
       			}
       			
       			if(workState.innerText == '조퇴'){
       				workData.workstleCode = '2'
       			}
       			
       			registWorkEnd(workData);
       		}
       		
       		//근무시간 구하기
       		function timeCalculate(){
       			const now = new Date();
       			let time = getTodayWorkTime();
       			
           		const workStart = new Date(now.getFullYear(),
			           				 now.getMonth()+1,
			           				 now.getDate(),
           							 time.beginTime.substring(0,2),
           							 time.beginTime.substring(3,5),
           							 time.beginTime.substring(6,8));
           		
           		const workEnd = new Date(now.getFullYear(),
			           				 now.getMonth()+1,
			           				 now.getDate(),
			           				 modifyNumber(now.getHours()),
			           				 modifyNumber(now.getMinutes()),
			           				 modifyNumber(now.getSeconds()));
           		
           		let timeDiff = workEnd.getTime() - workStart.getTime();
           		let hh = String(Math.floor((timeDiff/ (1000 * 60 *60 )) % 24 )).padStart(2, "0");
           		let mm = String(Math.floor((timeDiff/ (1000 * 60  )) % 60 )).padStart(2, "0");
           		let ss = String(Math.floor((timeDiff/ (1000 )) % 60 )).padStart(2, "0");
           		console.log(hh +':'+ mm + ':' + ss);
           		
           		return timeDiff;
       		}
       		
       		// 퇴근 기록
       		function registWorkEnd(wdata){
       			$.ajax({
       				url : '<%=request.getContextPath()%>/dclz/insertWorkEnd',
       				type : 'post',
       				data : JSON.stringify(wdata),
       				contentType : 'application/json',
       				success : function(result){
       					if(result == "success"){
       						history.replaceState({}, null, location.pathname);
       					}
       				},
       				error : function(xhr){
       					alert(xhr.status);
       				}
       			});
       		}
       		
       		
       		
       		workStart.addEventListener('click',setWorkStart);
       		workEnd.addEventListener('click',setWorkEnd);
       		
       		
       		logout.addEventListener('click', function(){
       			location.href = '<%=request.getContextPath()%>/common/logout';
       		});
       </script>
       
       <script>
       MemberProFilePictureThumb('<%=request.getContextPath()%>');
   	
	   	function MemberProFilePictureThumb(contextPath){
	   		 for(var target of document.querySelectorAll('.user-img')){	
	   			 var id = target.getAttribute('data-id');
	   			 
	   			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
	   			 target.style.backgroundPosition="center";
	   			 target.style.backgroundRepeat="no-repeat";
	   			 target.style.backgroundSize="cover";
	   		}
	   	}
       </script>
       
       <c:if test="${param.success eq 'true' }">
	  	<script>
	  		goToWork();
	  	</script>
	  </c:if>
       <c:if test="${param.wEnd eq 'true' }">
	  	<script>
	  		endToWork();
	  	</script>
	  </c:if>



	<script>
		var ptodate = new Date();
		
		var popupSt = document.querySelectorAll('[data-stdate]');
		var popupDe = document.querySelectorAll('[data-dedate]');
		
		var	std = new Date();
		var	ded = new Date();
	
		
		
		var popupCon = document.querySelectorAll('.m-popC');
		
		for (var i = 0, size = popupCon.length; i < size; i++) {
			
			std = new Date(popupSt[i].getAttribute('data-stdate'));
			ded = new Date(popupDe[i].getAttribute('data-dedate'));
			
			
			console.log(ptodate);
			console.log(std);
			console.log(ded);
			console.log("오늘날짜 / 시작날짜 / 마감날짜");
			
			if (ptodate <= ded && ptodate >= std) {
				popupCon[i].style.display = 'block';
			}else{
				popupCon[i].remove();
			}
			
		}
		
		
	

        var cookiedata = document.cookie;
        
        var couponClose = function(){
	        if($("input[name='chkbox']").is(":checked") == true){
	            setCookie("close","Y",1);   //기간( ex. 1은 하루, 7은 일주일)
	        }
	        $("#pop").hide();
		}
        
        if(cookiedata.indexOf("close=Y")<0){
            $("#pop").show();
        }else{
            $("#pop").hide();
        }
        
        $("#close").click(function(){
            couponClose();
        });
		    
		
		var setCookie = function (cname, cvalue, exdays) {
	        var todayDate = new Date();
	        todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));    
	        var expires = "expires=" + todayDate.toUTCString(); // UTC기준의 시간에 exdays인자로 받은 값에 의해서 cookie가 설정 됩니다.
	        document.cookie = cname + "=" + cvalue + "; " + expires;
	    }
		
		
		
		
		function popRemove(){
			
			$('.noticePopup-wrap').css('display', 'none');
			
		}
	
	
	</script>
<%@ include file="/WEB-INF/include/footer.jsp" %>