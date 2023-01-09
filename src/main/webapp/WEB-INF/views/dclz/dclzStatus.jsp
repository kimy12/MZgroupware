<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ include file="/WEB-INF/include/header.jsp" %>

<style>
 .att-data{
  display:none;
 }

 .fa-angle-up{
 display:none;
 }
</style>

<body>
    <div id="modal" class="modal-wrap"></div>
            <div class="modal-con modal5">
                <div class="att-modal">
                    <h3>근무 조정 신청</h3>

                    <table>

                        <tbody>
                            <tr>
                                <td class="flex">
                                    <label>이름</label>
                                    <div>${loginEmp.name }</div>
                                    <input type="hidden" id="dclzsn" value=""/>
                                    <input type="hidden" id="loginEmpNo" value="${loginEmp.empl_no }"/>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>부서</label>
                                    <div>${loginEmp.dept }</div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경요청일</label>
                                    <div id="prevDate">
                                        
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="flex">
                                    <label>기존시간</label>
                                    
                                    	<em id="prevStart"></em>&nbsp;&nbsp;~&nbsp;&nbsp;
                                    	<em id="prevEnd"></em>
<!-- 	                                    <input type="hidden" id="prevStart" value=""/> -->
<!-- 	                                    <input type="hidden" id="prevEnd" value=""/>                                         -->
                                    
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>변경요청시간</label>
                                    <div class="flex ju-sp-bt">
                                        <input type="time" id="medstart">
                                        <span>~</span>
                                        <input type="time" id="medend">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td class="flex">
                                    <label>수정 사유 <em style="color:red">*</em></label>
                                    <div>
                                       <textarea id="medreason"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>


                </div>
               
              
                <div class="modal-btn flex ju-sp-ce">
                    <button id="close" class="close-core">취소</button>
                    <button class="regist">신청</button>
                </div>
        </div>



   <div class="wrap">
           <%@ include file="/WEB-INF/include/topbar.jsp" %>

            <div class="container flex">
             
            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>나의 근태현황 <span>근태관리 <i class="fa-solid fa-angle-right"></i> 나의 근태현황</span></h1> 
                    </div>

                    <div class="attendance">
                         <div class="att-top flex al-it-ce">

                            <div class="att-con atcon01">
                                <div class="user-box">
                                
                                     <div class="user-img" data-id="${loginEmp.id }"></div>
        
                                    <div class="user-name">
                                    	<input type="hidden" id="empno" value="${loginEmp.empl_no }"/>
                                        <h4>${loginEmp.ncnm } ${loginEmp.rank }</h4>
                                        <p><i class="fa-solid fa-briefcase"></i>${loginEmp.dept }</p>
                                    </div>
        
                               </div>
                            </div>

                            <div class="att-con atcon02">
                                <div class="at-date flex al-it-ce">
                                    <h3 id="curMonth"></h3>
                                    <span>(총 연장근무시간은 52h 48m 이하로 관리)</span>
                                </div>

                                <div class="flex al-it-ce">

                                <div class="at-box at01">
                                

                                    <div class="at-graphWrap">
                                        <ul class="flex">
                                            <li id="mHour"><em>h</em></li>
                                            <li id="mMin"><em>m</em></li>
                                        </ul>

                                        <div class="at-grap">
                                            <span></span>                                        
                                        </div>

                                        <ul class="min-max flex">
                                            <li id="minWorkTime"></li>
                                            <li><span></span></li>
                                            <li id="maxWorkTime"></li>
                                        </ul>
                                    </div>


                                   <!--  <div class="at-info">
                                        <ul>
                                            <li>남은 근무시간 : <span>최소 00h 00m ~ 최대 00h 00m</span></li>
                                            <li>남은 연장 근무 시간 : <span>00h 00m</span></li>
                                            <li>앞으로 매일 평균 : 00h 00m 필요 (남은 근무일 : 00일)</li>
                                        </ul>
                                    </div> -->
                                </div>

                                <div class="at-box at02">
                                	  <ul>
                                          <li id="rtime">남은 근무시간 : 최소 00h 00m ~ 최대 00h 00m</li>
                                          <li>남은 연장 근무 시간 : 00h 00m</li>
                                          <li>앞으로 매일 평균 : 약 06h 48m 필요 (남은 근무일 : 09일)</li>
                                      </ul>
                                
                                
                                    <!-- <ul>
                                        <li>
                                            <span>선택근무</span>
                                            <em>0h 0m</em>
                                        </li>

                                        <li>
                                            <span>초과근무(연장)</span>
                                            <em>0h 0m</em>
                                        </li>

                                        <li>
                                            <span>승인근무(연장)</span>
                                            <em>0h 0m</em>
                                        </li>
                                    </ul> -->
                                </div>
                                </div>
                            </div>

                        </div>


                        <div class="accum-wrap flex ju-sp-ce">
                            <ul class="accum-date flex">
                                <li>
                                    <em>이번주 누적</em>
                                    <span>24h 37m</span>
                                </li>

                                <li>
                                    <em>이번주 초과</em>
                                    <span>00h 00m</span>
                                </li>

                                <li>
                                    <em>이번주 잔여</em>
                                    <span>15h 23m</span>
                                </li>

                                <li>
                                    <em>이번달 누적</em>
                                    <span id="monthAccu">00h 00m</span>
                                </li>

                                <li>
                                    <em>이번달 연장</em>
                                    <span>00h 00m</span>
                                </li>
                            </ul>

                        </div>


                  
                        <div class="attend-list">
                            <div class="att-caption flex ju-sp-bt al-it-ce">
                                <div class="flex al-it-ce">
                                    <h2>근태상세</h2>
                                    
                                </div>
                                
                                <div class="att-icon">
                                    <ul class="flex">
                                        <!--<li>
                                            <a href="javascript:openModal('modal4');" class="button modal-open">
                                                <i class="fa-solid fa-list"></i>
                                                연장근무신청
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:openModal('modal5');" class="button modal-open">
                                                <i class="fa-solid fa-list"></i>
                                                연차신청
                                            </a>
                                        </li>-->
                                        
                                        <li onclick="location.href='<%=request.getContextPath()%>/dclz/excelDownload?empl_no=${loginEmp.empl_no }';">
                                        	<i class="fa-solid fa-file-arrow-down"></i>엑셀로 내려받기
                                        </li>
                                    </ul>
                                </div>
                            </div>
							
                            <div class="att-box" id="week">
                                
                            </div>


                            <div class="att-caption flex ju-sp-bt">
                                <div class="flex al-it-ce">
                                    <h2>변경내역</h2>
                                </div>
                                
<!--                                 <div class="att-icon"> -->
<!--                                     <ul class="flex"> -->
<!--                                         <li> -->
<!--                                             <a href="javascript:openModal('modal5');" class="button modal-open"> -->
<!--                                                 <i class="fa-solid fa-file-import"></i> -->
<!--                                                		 근무조정 신청 -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
                            </div>

                            <div class="att-relist">
                                <ul>
                                	<c:if test="${empty dclzMediationList }">
                                		<li class="flex al-it-ce">
	                                        <div class="modify-info">
	                                            <span>내역이 없습니다.</span>   
	                                        </div>
	                                    </li>
                                	</c:if>
                                	<c:forEach items="${dclzMediationList }" var="med">
                                		<c:set var="medPrevDate" value="${med.prevdate }" />
	                                    <li class="flex al-it-ce">
	                                        <div class="modify-info">
	                                            <div class="name">${loginEmp.dept }&nbsp;&nbsp;${loginEmp.name }&nbsp;&nbsp;${loginEmp.rank }<em>&nbsp;&nbsp;${fn:substring(medPrevDate,0,10) }</em>
	                                            	<c:if test="${med.progresscode eq 'y' }">
		                                            	<span class="att-status st01">조정완료</span>
	                                            	</c:if>
	                                            	<c:if test="${med.progresscode eq 'n' }">
		                                            	<span class="att-status st02">조정중</span>
	                                            	</c:if>
	                                            	<c:if test="${med.progresscode eq 'x' }">
		                                            	<span class="att-status st02">반려됨</span>
	                                            	</c:if>
	                                            </div>
	                                            <c:choose>
					                        		<c:when test="${med.progresscode eq 'x' }">
			                                        	<div class="modi">
		                                            		[반려내용] : ${med.medreason }
		                                            	</div>
					                            	</c:when>
					                            	
					                                <c:otherwise>
			                                            <div class="modi">
			                                            	[변경내용] : 변경전 출퇴근 : ${fn:substring(medPrevDate,0,10) }&nbsp;&nbsp;${med.prevbegintime } - ${med.prevendtime } 
			                                            		      &nbsp;&nbsp;변경요청 출퇴근 : ${fn:substring(medPrevDate,0,10) }&nbsp;&nbsp;${med.reqbegintime } - ${med.reqendtime } <br>
			                                            		     [변경사유] : ${med.medreason }
			                                            </div>					                                	
					                                </c:otherwise>
					                            </c:choose>   
	                                        </div>
	                                    </li>
                                	</c:forEach>
                                </ul>
                            </div>

                            

                        </div>
                    </div>

                    <div class="page-btn flex ju-sp-ce">
                        <a href="#" class="p-num prev-first"><i class="fas fa-angle-double-left" aria-hidden="true"></i></a>

                        <a href="#" class="p-num num on"><span>1</span></a>

                        <a href="#" class="p-num next-last"><i class="fas fa-angle-double-right" aria-hidden="true"></i></a>
                       
                    </div>

            </div>
       </div>
      </div>
      
      <script type="text/x-handlebars-template"  id="weekList" >
		{{#each .}}
			<div class="mb-10">
			<div class="att-tog flex ju-sp-bt" onclick="boxAccordion(this)">
					<input type="hidden" class="std" value="{{weekStartDate}}">
        				<div class="att-togB"><i class="fa-solid fa-angle-up"></i> <i class="fa-solid fa-angle-down"></i>{{num}}주차</div>
					<input type="hidden" class="wed" value="{{weekEndDate}}">
            		<div class="accnum-time">
                     	누적시간 
                     	<span>{{timechange totalWorkTime}}</span>
                     	<em>(초과 근무시간 {{timechange excessTime}})</em>
                	</div>
			</div>
					
					<div class="att-data">
                        <table>
                            <colgroup>
                                <col width="14%">
                                <col width="12%">
                                <col width="12%">
                                <col width="12%">
                                <col width="35%">
                                <col width="15%">
                            </colgroup>        
                            <thead>
                                <tr>
                                    <td>일자</td>
                                    <td class="txt-ac">업무시작</td>
                                    <td class="txt-ac">업무종료</td>
                                    <td class="txt-ac">총 근무시간</td>
                                    <td>근무시간 상세</td>
                                    <td class="txt-ac">근무조정 신청</td>
                                </tr>
                            </thead>
                            <tbody class="weekWorkTime">
                                   
                           </tbody>
                        
                        </table>
                  
        	</div>
			</div>
		{{/each}}
	  </script>
	  
      <script type="text/x-handlebars-template"  id="weekWorkTimeList" >
		{{#if .}}
		    {{#each .}}
		    	<tr class="workData">
                    <td class="dateData">{{prettifyDate workOn}}</td>
                    <td class="beginData txt-ac">{{beginTime}}</td>
                    <td class="endData txt-ac">{{endTime}}</td>
                    <td class="txt-ac">{{timechange workTime}}</td>
                    <td>기본 08h 00m / 연장 {{timeDiff workTime}}</td>
                    <td class="txt-ac"><button type="button" class="applyBtn" onclick="workMeditation(this)">근무 조정 신청</button></td>
					<input type="hidden" class="dcsn" value="{{dclzSn}}"/>
                </tr>  
		    {{/each}}
 		{{else}}
			<td colspan="6" class="notContent" style="text-align:center;">
					<strong>데이터가 없습니다.</strong>
			</td>
		{{/if}}
	  </script>

             
      
      <script>
    	Handlebars.registerHelper({
    	   "prettifyDate":function(timeValue){ 
    	      let dateObj=new Date(timeValue);
    	      let year=dateObj.getFullYear();
    	      let month=dateObj.getMonth()+1;
    	      let date=dateObj.getDate();
    	      return year+"/"+month+"/"+date;
    	   },
    	   'timechange':function(work,options){         
               let mm = parseInt((work%3600)/60);
               let hh = parseInt(work/3600);
               
               return hh+"h "+mm+"m ";
            },
    	   "timeDiff":function(time){
    		   let diff = parseInt(time-28800);
    		   if(diff < 0){
    			   return 0+"h "+0+"m "
    		   }
    		   
    		   let hour = parseInt(diff/3600);
    		   let min = parseInt((diff%3600)/60);
    		   
    		   return hour+"h "+min+"m ";
    	   },
    	   "worksetCheck": function (options) {
    		    if(this.begintime.substring(0,2) != '00'){
    		    	return options.fn(this);
    		    }
    		    return options.inverse(this);
    		}
    	});
    	
	     // dclz script
      	const curMonth = document.querySelector('#curMonth');
      	const minWorkTime = document.querySelector('#minWorkTime');
      	const maxWorkTime = document.querySelector('#maxWorkTime');
      	const mHour = document.querySelector('#mHour');
      	const mMin = document.querySelector('#mMin');
      	const rextend = document.querySelector('#rextend');
      	const rtime = document.querySelector('#rtime');
      	const empno = document.querySelector('#empno');
      	const regist = document.querySelector('.regist');
      	
      	window.addEventListener('DOMContentLoaded',init());
      	window.addEventListener('DOMContentLoaded',getTotalTime());
      	regist.addEventListener('click', registWorkMediation);
      	
      	function init(){
	      	let date = new Date();
	      	curMonth.innerText = date.getMonth()+1 + '월';
	      	minWorkTime.innerText = '최소' + calcDate()*8 + '시간';
	      	maxWorkTime.innerText = '최대' + calcDate()*10 + '시간';
	
	      	getWeekList();
      	}
      	
      	function registWorkMediation(){
      		const dataObj = {
      				"dclzsn" : $('#dclzsn').val(),
      				"medreason" : $('#medreason').val(),
      				"progresscode" : 'n',
      				"prevdate" : $('#prevDate').text(),
      				"prevbegintime" : $('#prevStart').text(),
      				"prevendtime" : $('#prevEnd').text(),
      				"reqbegintime" : $('#medstart').val(),
      				"reqendtime" : $('#medend').val(),
      				"empl_no": $('#loginEmpNo').val()
      		};
      		
      		$.ajax({
      			url: '<%=request.getContextPath()%>/dclz/regDclzMed',
      			type: 'post',
      			data: JSON.stringify(dataObj),
      			contentType: 'application/json',
      			success: function(response){
      				if(response == 'success'){
      					Swal.fire({
						 	title: "신청되었습니다!",
		                    icon: 'success',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인'
		                }).then((result) => {
		                    if (result.isConfirmed) {
						     	window.location.reload();
		                    }
		             	})
      				}
      			},
      			error: function(xhr){
      				alert(xhr.status);
      			}
      		});
      		
      	}
      	
      	function workMeditation(obj){
      		
      		$('#prevDate').text($(obj).parents('tr.workData').find('td.dateData').text());
      		$('#prevStart').text($(obj).parents('tr.workData').find('td.beginData').text().substring(0,5));
      		$('#prevEnd').text($(obj).parents('tr.workData').find('td.endData').text().substring(0,5));
      		$('#dclzsn').val($(obj).parents('tr.workData').find('input.dcsn').val());
      		openModal('modal5');
      	}
      	
      	
      	function timeSetting(response){
      		let tm = parseInt((response.thisMonthTime%3600)/60);
            let th = parseInt(response.thisMonthTime/3600);
            let minh = Math.floor((parseInt(calcDate()*8*3600) - response.thisMonthTime)/3600);
            let maxh = Math.floor((parseInt(calcDate()*10*3600) - response.thisMonthTime)/3600);
            let minm = Math.floor(((parseInt(calcDate()*8*3600) - response.thisMonthTime)%3600)/60);
            let maxm = Math.floor(((parseInt(calcDate()*10*3600) - response.thisMonthTime)%3600)/60);
            
            rtime.innerText = "남은 근무시간 : 최소 " + minh + "h " + minm + "m ~ " + "최대 " + maxh + "h " + maxm + "m";
            $('#monthAccu').text(th + "h " + tm + "m");
            
            
            mHour.prepend(th);
            mMin.prepend(tm);
            
            
      		
      	}
      	
      	function getTotalTime(){
      		$.ajax({
    			url: '<%=request.getContextPath()%>/dclz/getTotalTime',
    			type:'post',
    			data:{empl_no:empno.value},
    			success: function(response){
    				timeSetting(response);
    			},
    			error: function(xhr){
    				alert(xhr.status);
    			}
    			
    		});
      		
      	}
      	
      	function printWeek(weekArr,target,templateObject){
     	   let template=Handlebars.compile(templateObject.html());
     	   let temp = template(weekArr);   
     	   target.append(temp);
     	}
      	
      	function getWeekList(){
    		let dataArr = searchPeriodCalculation();
    		
    		$.ajax({
    			url: '<%=request.getContextPath()%>/dclz/getWeek',
    			type:'post',
    			data: JSON.stringify(dataArr),
    			contentType: 'application/json',
    			success: function(response){
    				printWeek(response,$('#week'),$('#weekList'));
    			},
    			error: function(xhr){
    				alert(xhr.status);
    			}
    			
    		});

    	}
      	
      	function boxAccordion(obj){
      		if($(obj).find('i.fa-angle-up').css('display') == 'none'){
	      		$(obj).next().slideToggle("fast");
	      		$(obj).find('i.fa-angle-down').css('display','none');
	      		$(obj).find('i.fa-angle-up').css('display','inline-block');
	      		
	      		let wst = $(obj).find('input.std').val();
	      		let wet = $(obj).find('input.wed').val();
	       		let target = $(obj).next().find("tbody.weekWorkTime");
	      		
	       		getWeekWorkTime(wst,wet,target);      			
      		}else{
      			$(obj).next().slideToggle("fast");
	      		$(obj).find('i.fa-angle-up').css('display','none');
	      		$(obj).find('i.fa-angle-down').css('display','inline-block');
	      		
      		}
      	}
      	
      	function printWeekList(weekArr,target,templateObject){
      	   let template=Handlebars.compile(templateObject.html());
      	   let temp = template(weekArr); 
      	   target.empty();
      	   target.append(temp);
      	}
      	
      	function getWeekWorkTime(wst, wet, target){
      		const dataArr = {
      				weekStartDate : wst,
      				weekEndDate : wet,
      				empl_no : $('#empno').val() 
      		}
      			
      		$.ajax({
      			url: '<%=request.getContextPath()%>/dclz/getWeekWorkTime',
      			type: 'post',
      			data: JSON.stringify(dataArr),
      			contentType: 'application/json',
      			success: function(response){
      				printWeekList(response,target,$('#weekWorkTimeList'));
      			},
      			error: function(xhr){
      				alert(xhr.status);
      			}
      		});
      		
      		
      	}
      	   	
    	function searchPeriodCalculation() {
            let date = new Date();
            let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            let lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            let weekObj = null;
            let weekObjArray = new Array();
            let weekStand = 8;  // 월요일 고정
            let firstWeekEndDate = true;
            let thisMonthFirstWeek = firstDay.getDay();
            let loginEmpNo = $('#empno').val()

            for(var num = 1; num <= 6; num++) {
                if(lastDay.getMonth() != firstDay.getMonth()) {
                    break;
                }

                weekObj = {};

                if(firstDay.getDay() <= 1) {
                    if(firstDay.getDay() == 0) { firstDay.setDate(firstDay.getDate() + 1); }
                        weekObj.weekStartDate = firstDay.getFullYear().toString() + "/" + numberPad((firstDay.getMonth() + 1).toString(), 2)+ "/"
                        + numberPad(firstDay.getDate().toString() , 2);
                }

                if(weekStand > thisMonthFirstWeek) {
                    if(firstWeekEndDate) {
                        if((weekStand - firstDay.getDay()) == 1) {
                            firstDay.setDate(firstDay.getDate() + (weekStand - firstDay.getDay()) - 1);
                        }
                        if((weekStand - firstDay.getDay()) > 1) {
                            firstDay.setDate(firstDay.getDate() + (weekStand - firstDay.getDay()) - 1)
                        }
                        firstWeekEndDate = false;
                    } else {
                        firstDay.setDate(firstDay.getDate() + 6);
                    }
                } else {
                    firstDay.setDate(firstDay.getDate() + (6 - firstDay.getDay()) + weekStand);
                }

                if(typeof weekObj.weekStartDate !== "undefined") {
                    weekObj.weekEndDate =
                         firstDay.getFullYear().toString()
                        + "/"
                        + numberPad((firstDay.getMonth() + 1).toString(), 2)
                        + "/"
                        + numberPad(firstDay.getDate().toString(), 2);
                    weekObj.empl_no = loginEmpNo;
                    
                    weekObjArray.push(weekObj);
                }
                firstDay.setDate(firstDay.getDate() + 1);
            }
            
            return weekObjArray;    
        }
    	
    	
        function numberPad(num, width) {
            num = String(num);
            return num.length >= width ? num : new Array(width - num.length + 1).join("0") + num;
        }
      	    	
      	function getWeekDate(d){
      		year = d.getFullYear();
   		    month = d.getMonth()+1;
   		    date = d.getDate();
   		    
   		    return year+"-"+month+"-"+date;
      	}
      	
	    Date.prototype.getWeek = function(start){
	      	        
	    	start = start || 0;
	      	let today = new Date(this.setHours(0, 0, 0, 0));
	      	let day = today.getDay() - start;
	      	let date = today.getDate() - day;
     
	      	let StartDate = new Date(today.setDate(date + 1));
	      	let EndDate = new Date(today.setDate(date + 5));
	      	
	      	let wst = getWeekDate(StartDate);
	      	let wed = getWeekDate(EndDate);
	      	    
	      	return [wst, wed];
	    }
      		
      	function calcDate() {
      	    let date1 = new Date('2022-05-01'); 
      	    let date2 = new Date('2022-05-31'); 

      	  	let count = 0;
	      	while(true) {  
	      		let temp_date = date1;
	      	    if(temp_date.getTime() > date2.getTime()) {
	      	        break;
	      	    } else {
	      	    	let tmp = temp_date.getDay();
	      	        if(tmp == 0 || tmp == 6) {} 
	      	        else{count++;}
	      	        
	      	        temp_date.setDate(date1.getDate() + 1); 
	      	    }
	      	}
	      	
	      	return count;
      	}
      	
      	

      	
      	 

         
         
      	
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
</body>
<%@ include file="/WEB-INF/include/footer.jsp" %>