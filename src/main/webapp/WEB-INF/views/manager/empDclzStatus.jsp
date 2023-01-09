<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<style>
#menu {
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#menu div {
    position: relative;
    display: inline-block;
}

.hov{
    display: block;
    cursor: pointer;
}

.dclz-hovBox{
	position:relative;
}

.arrow_box {
    display: none;
    position: absolute;
    top: 35px;
    left: 0;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    background: #46C6C6;
    color: #fff;
    font-size: 14px;
    padding: 8px 10px 5px 10px;
    width: 110px;
    z-index: 99;
}

.arrow_box li{
color: #fff !important;
}

.arrow_box:after {
      position: absolute;
    bottom: 100%;
    left: 13%;
    width: 0;
    height: 0;
    margin-left: -10px;
    border: solid transparent;
    border-color: rgba(51, 51, 51, 0);
    border-bottom-color: #46C6C6;
    border-width: 10px;
    pointer-events: none;
    content: " ";
}

.hov:hover + ul.arrow_box {
  display: block;
}
.hov:hover + td.arrow_box {
  display: block;
}



</style>
<body>
	<c:set var="empList" value="${dataMap.empList }" />
	<c:set var="dclzList" value="${dataMap.dclzList }" />
	<c:set var="totalwork" value="${dataMap.totalwork }" />
	<c:set var="pageMaker" value="${dataMap.pageMaker }" />
	<c:set var="weekList" value="${dataMap.weekList }" />
	<c:set var="departList" value="${dataMap.departList }" />
	<c:set var="cri" value="${dataMap.pageMaker.cri }" />





	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>
		<div class="container flex">
			<div class="content">
				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<h1>
						전사근태현황<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
							2서브메뉴
						</span>
					</h1>
				</div>

				<div class="members-att">
					<div class="matt-top">
						<h2 id="today">0</h2>
						<div class="matt-box">
							<ul class="flex ju-sp-ce">
								<li><em>출근 현황</em> <span>26</span></li>

								<li><em>퇴근</em> <span>0</span></li>

								<li><em>출근 미체크</em> <span>0</span></li>
								<li><em>퇴근 미체크</em> <span>30</span></li>


								<li><em>이른 퇴근</em> <span> 0</span></li>

								<li><em>휴가</em> <span>4</span></li>




							</ul>
						</div>
					</div>

					<div class="matt-cal">
						<div class="matt-date">
							<div class="sel-date flex al-it-ce ju-sp-ce">
								<i class="fa-solid fa-angle-left" id="down"></i> <span
									id="selectedCount">0</span> <i class="fa-solid fa-angle-right"
									id="up"></i>
							</div>

							<div class="date-btn">
								<ul class="flex ju-sp-ce" id="ttt">
									<li id="week" class="on">주간</li>
									<li id="month">월간</li>
								</ul>
							</div>
						</div>

						<div class="matt-list">
							<div class="matt-caption flex ju-sp-bt al-it-ce">
								<div class="flex al-it-ce">
									<select name="searchType" id="searchType">
											<option value="" ${cri.searchType eq '' ? 'selected':''}>부서 검색</option>
											
											<c:forEach items="${departList}" var="depart">
												<option value="${ depart.dept_nm }"
                                    ${ depart.dept_nm == cri.searchType ? "selected" :""}>
                                    ${ depart.dept_nm }</option>
											
											</c:forEach>
									</select>

								    <div>
                                      <button onclick="list_go(1);"><i class="fa fa-fw fa-search"></i></button>
                                   </div>
								</div>

								<div class="ex-down">
									<i class="fa-solid fa-file-arrow-down"></i> 엑셀로 다운받기
								</div>
							</div>

							<div id="wTable">
								<table id="weekTable">
									<colgroup>
										<col width="12%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
										<col width="11%">
									</colgroup>

									<thead>

									</thead>


									<tbody class="week12">

										<c:if test="${empty empList }">
											<tr>
												<td class="flex">해당내용이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty empList }">
											<c:forEach items="${empList }" var="emp">
												<tr>
													<td class="flex">
														<div class="modi-img" data-id="${emp.id }"></div>
														<div class="user-info">
															<h4>${emp.name }</h4>

															<input type="hidden" id="empId" value="${emp.empl_no }" />
															<ul>
																<li>${emp.dept }</li>
															</ul>
														</div>
													</td>



													<td>
														<div class="dclz-hovBox">
														<c:forEach items="${totalwork }" var="work">
															<c:if test="${emp.empl_no eq work.empl_no }">

																<c:set var="totalss"
																	value="${work.totalwork-(work.totalwork-(work.totalwork%60))}" />
																<c:set var="totalmm"
																	value="${((work.totalwork-totalss)/60)%60}" />
																<c:set var="totalhh"
																	value="${(((work.totalwork-totalss)/60)-totalmm)/60}" />

																<fmt:formatNumber value="${totalhh }" var="totaltimehh"
																	pattern="00" />

																<fmt:formatNumber value="${totalmm }" var="totaltimemm"
																	pattern="00" />
																<fmt:formatNumber value="${totalss }" var="totaltimess"
																	pattern="00" />

																<span class="hov"> 
																<h4>${totaltimehh}h${totaltimemm}m${totaltimess}s</h4>
																</span>
																<ul class="arrow_box">
																	<li>기본 0h 0m 0s</li>
																	<li>연장 0h 0m 0s</li>

																</ul>

															</c:if>
														</c:forEach>
														</div>
													</td>





													<c:forEach items="${dclzList }" var="dclz">

														<c:if test="${emp.empl_no eq dclz.empl_no }">
																			
												
																			
															<td>
															<div class="dclz-hovBox">
															<c:choose>
																	<c:when test="${dclz.workTime>0}">

																		<c:set var="workss"
																			value="${dclz.workTime-(dclz.workTime-(dclz.workTime%60))}" />
																		<c:set var="workmm"
																			value="${((dclz.workTime-workss)/60)%60}" />
																		<c:set var="workhh"
																			value="${(((dclz.workTime-workss)/60)-workmm)/60}" />

																		<fmt:formatNumber value="${workhh }" var="worktimehh"
																			pattern="00" />
																		<fmt:formatNumber value="${workmm }" var="worktimemm"
																			pattern="00" />
																			
																			
												<span class="hov"><h4>${worktimehh }h ${worktimemm }m ${workss }s</h4></span>


																		<ul class="arrow_box">
																			<c:choose>
																				<c:when test="${worktimehh>8}">
																					<li>기본 8h 00m 00s</li>
																					<li>연장 ${worktimehh-8 }h ${worktimemm }m
																						${workss }s</li>
																				</c:when>
																				<c:otherwise>
																					<li>기본 ${worktimehh }h ${worktimemm }m
																						${workss }s</li>
																					<li>연장 0h 0m 0s</li>
																				</c:otherwise>

																			</c:choose>

																		</ul>

																	</c:when>
																	<c:otherwise>
																	<span class="hov"><h4>0 h 0m 0s</h4></span>
																		<ul class="arrow_box">
																			<li>기본 0h 0m 0s</li>
																			<li>야간 0h 0m 0s</li>
																		</ul>
																	</c:otherwise>
																</c:choose>
																</div>
															</td>
														</c:if>
													</c:forEach>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</div>

							<div id="mTable" style="display: none;">
								<table id="monthTable" class="mTable">
									<colgroup>
										<col width="16%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
									</colgroup>

									<thead>
										<tr>
											<th>이름</th>
											<th>누적근무시간</th>
											<th>1주</th>
											<th>2주</th>
											<th>3주</th>
											<th>4주</th>
											<th>5주</th>
										</tr>
									</thead>


									<tbody class="month12">



									</tbody>



								</table>
							</div>

						</div>


					</div>

				</div>

<div class="page-btn flex ju-sp-ce">
   <a class="p-num prev-first" href="javascript:list_go(1);">
   		<i class="fas fa-angle-double-left"></i>
   </a>
   
  
   
   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
		<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
	</c:forEach>
	
   
   <a class="p-num next-last" href="javascript:list_go('${pageMaker.realEndPage}');">
		<i class="fas fa-angle-double-right"></i>
   </a>
</div>

<form id="jobForm" name="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
</form>

<script>
	function list_go(page,url){
		if(!url) url="list";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val(10);
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
		console.log(jobForm);
	}
</script>
			</div>
		</div>
	</div>


	<script>
	
	
	let curr= new Date();
	let curr1= new Date();

	var first = new Date(curr.setDate(curr.getDate() - curr.getDay()+1));
	var last = new Date(curr1.setDate(curr1.getDate() - curr1.getDay()+7));

      var first1 = first.toLocaleDateString();
      var last1 = last.toLocaleDateString();
      var firstday = first1.slice(0, -1);
      var lastday = last1.slice(0, -1);
      var j = 1;
      
      var i = 0;
      
      var f ='';
      //week 전역변수 초기화
      function weekreset(){
       curr = new Date();
       curr1 = new Date();

  	 	 first = new Date(curr.setDate(curr.getDate() - curr.getDay()+1));
		 last = new Date(curr1.setDate(curr1.getDate() - curr1.getDay()+7));
 	
       first1 = first.toLocaleDateString(); 
       last1 = last.toLocaleDateString();
        firstday = first1.slice(0, -1);
       lastday = last1.slice(0, -1);
      
      }
      
      function weekup() {
    	 first = new Date(curr.setDate(curr.getDate() - curr.getDay()+8));
         last = new Date(curr1.setDate(curr1.getDate() - curr1.getDay()+7));
    	    
         first1 = first.toLocaleDateString();
         last1 = last.toLocaleDateString();
         firstday = first1.slice(0, -1);
         lastday = last1.slice(0, -1);

         weekajax();
         getDateRangeData();
         
         
      }
      function weekdown() {
         first = new Date(curr.setDate(curr.getDate() - curr.getDay()-6));
         last = new Date(curr1.setDate(curr1.getDate() - curr1.getDay()-7));
         first1 = first.toLocaleDateString();
         last1 = last.toLocaleDateString();
         firstday = first1.slice(0, -1);
         lastday = last1.slice(0, -1);
         weekajax();
         getDateRangeData();
      }

      function getDateRangeData() { //param1은 시작일, param2는 종료일이다.
         

         $('#selectedCount').text(firstday + " ~ " + lastday);
         var res_day = [];
         /*     var ss_day = new Date(first);
               var ee_day = new Date(last);        */

         while (first.getTime() <= last.getTime()) {
            var _mon_ = (first.getMonth() + 1);
            _mon_ = _mon_ < 10 ? '0' + _mon_ : _mon_;
            var _day_ = first.getDate();
            _day_ = _day_ < 10 ? '0' + _day_ : _day_;
            res_day.push(first.getFullYear() + '-' + _mon_ + '-' + _day_);
            first.setDate(first.getDate() + 1);
         }

         let htmlData = '';

         htmlData += '<tr>';
         htmlData += '<th> 이름 </th>';
         htmlData += '<th>  누적근무시간 </th>';
         htmlData += '<th>' + res_day[0].split('-')[2] + ' 월' + '</th>';
         htmlData += '<th>' + res_day[1].split('-')[2] + ' 화' + '</th>';
         htmlData += '<th>' + res_day[2].split('-')[2] + ' 수' + '</th>';
         htmlData += '<th>' + res_day[3].split('-')[2] + ' 목' + '</th>';
         htmlData += '<th>' + res_day[4].split('-')[2] + ' 금' + '</th>';
         htmlData += '<th>' + res_day[5].split('-')[2] + ' 토' + '</th>';
         htmlData += '<th>' + res_day[6].split('-')[2] + ' 일' + '</th>';

         htmlData += '</tr>';
         $('#weekTable>thead').html(htmlData);
         return res_day;

      }
      getDateRangeData();

      $("#up").on("click", function() {
         var v_week = document.querySelector("#week");
         if (v_week.getAttribute("class") == "on") {
            weekup();
         } else {
            monthup();
         }

      })

      $("#down").on("click", function() {
         var v_week = document.querySelector("#week");
         if (v_week.getAttribute("class") == "on") {
            weekdown();
         } else {
            monthdown();
         }
      })

      $("#week").on("click", function() {
         $(this).attr("class", "on");
         $("#month").removeClass("on");
         weekdisplay();
         weekreset();
         monthdiplayreset();
         getDateRangeData();
         monthreset();
          weekajax();
         
      })

      $("#month").on("click", function() {
         $(this).attr("class", "on");
         $("#week").removeClass("on");
         monthdisplay();
         weekreset();
         monthdiplayreset();
         monthreset();
         searchPeriodCalculation();
         monthajax();
      })

      //오늘 날짜 가져오기
      var current = new Date;
      var curre = current.toLocaleDateString();
      var today = curre.slice(0, -1);
      $(document).ready(function() {
         $('#today').text(today);
      });
      
      //주간일때 주간테이블
      function monthdisplay() {
         var md = document.getElementById("wTable");
         var wd = document.getElementById("mTable");
         md.style.display = "none";
         wd.style.display = "block";
      }
      //원간일때 월간테이블
      function weekdisplay() {
         var md = document.getElementById("wTable");
         var wd = document.getElementById("mTable");
         md.style.display = "block";
         wd.style.display = "none";
      }
            
      function month() {

         firstDate1 = firstDate.toLocaleDateString();
         
         f = firstDate1.slice(0, -4);

         $('#selectedCount').text(f);
         searchPeriodCalculation();
      }

      function monthup() {
         i = i + 1;

         firstDate = new Date(now.getFullYear(), now.getMonth() + 1 * i);
         month();
         monthajax();
      }
      function monthdown() {
         i = i - 1;
         j = j - 1;
         firstDate = new Date(now.getFullYear(), now.getMonth() + 1 * i, 1);
         month();
         monthajax();
      }

      function getDateRangeDatareset() { //param1은 시작일, param2는 종료일이다.

         var curr = new Date;
         var first = new Date(curr.setDate(curr.getDate() - curr.getDay()));
         var last = new Date(curr
               .setDate(curr.getDate() - curr.getDay() + 6));

         var first1 = first.toLocaleDateString();
         var last1 = last.toLocaleDateString();
         var firstday = first1.slice(0, -1);
         var lastday = last1.slice(0, -1);

         $('#selectedCount').text(firstday + " ~ " + lastday);
         var res_day = [];

         while (first.getTime() <= last.getTime()) {
            var _mon_ = (first.getMonth() + 1);
            _mon_ = _mon_ < 10 ? '0' + _mon_ : _mon_;
            var _day_ = first.getDate();
            _day_ = _day_ < 10 ? '0' + _day_ : _day_;
            res_day.push(first.getFullYear() + '-' + _mon_ + '-' + _day_);
            first.setDate(first.getDate() + 1);
         }
         let htmlData = '';

         htmlData += '<tr>';
         htmlData += '<th> 이름 </th>';
         htmlData += '<th> 누적근무시간 </th>';
         htmlData += '<th>' + res_day[0].split('-')[2] + ' 일' + '</th>';
         htmlData += '<th>' + res_day[1].split('-')[2] + ' 월' + '</th>';
         htmlData += '<th>' + res_day[2].split('-')[2] + ' 화' + '</th>';
         htmlData += '<th>' + res_day[3].split('-')[2] + ' 수' + '</th>';
         htmlData += '<th>' + res_day[4].split('-')[2] + ' 목' + '</th>';
         htmlData += '<th>' + res_day[5].split('-')[2] + ' 금' + '</th>';
         htmlData += '<th>' + res_day[6].split('-')[2] + ' 토' + '</th>';

         htmlData += '</tr>';
         $('#weekTable>thead').html(htmlData);
         return res_day;
      }


      var now = new Date;
      firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
      lastDate = new Date(now.getFullYear(), now.getMonth() + 1, 0);

      
      function monthdiplayreset() {

          now = new Date;
         firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
          i = 0;
            firstDate1 = firstDate.toLocaleDateString();
            
            f = firstDate1.slice(0, -4);

            $('#selectedCount').text(f);
      }
      
      function monthreset() {
         now = new Date;
         firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
         lastDate = new Date(now.getFullYear(), now.getMonth() + 1, 0);

         firstDate1 = firstDate.toLocaleDateString();
         lastDate1 = lastDate.toLocaleDateString();
         i = 0;
         j = 1;

      }
      
      function weekajax(){
               let startday = (firstday.replaceAll(".","/")).replaceAll(" ","");   
               let endday = (lastday.replaceAll(".","/")).replaceAll(" ","");   
               
               var data={"beginTime" : startday,
                     "endTime" : endday
               }
               
         $.ajax({
             url : '<%=request.getContextPath()%>/dclzmanager',
            type : "post",
            data : JSON.stringify(data),
            contentType : 'application/json',
            success : function(data) {
            	console.log(data);
               var v_datas = {};
               var s_arr = [];
               
               /* for(var i=0; i< data.weekList.length/7; i++){
                  var obj = {};
                  var p_start=i*7;
                  var v_arr = data.weekList.slice(p_start,p_start+7);
                  var f_val = v_arr[0];
                  obj["emp"] = {"name" : f_val["name"],
                        "rank" : f_val["rank"],
                        "dept" : f_val["dept"]};
                  
                  obj["list"] = v_arr;
                  s_arr.push(obj);
                  
               } */
               var f_name = "";
               var obj = {};
               var v_arr = [];
               for(var i=0; i< data.weekList.length; i++){
                  
                  
                  
                  var f_val = data.weekList[i];
                  
                  if(i != 0){
                     if(f_name != f_val["name"]){
                        
                        obj["list"] = v_arr;
                        s_arr.push(obj);
                        obj = {};
                        v_arr = [];
                        obj["emp"] = {"name" : f_val["name"],
                              "rank" : f_val["rank"],
                              "dept" : f_val["dept"],
                		"id" :f_val["id"]
                        };
                     }
                  }else{
                     obj["list"] = v_arr;
                     obj["emp"] = {"name" : f_val["name"],
                           "rank" : f_val["rank"],
                           "dept" : f_val["dept"],
                   		"id" :f_val["id"]};
                  }
                  
                  
                  v_arr.push(f_val);
                  
                  if(i == data.weekList.length-1){
                     
                     obj["list"] = v_arr;
                     s_arr.push(obj);
                  }
                  
                  f_name = f_val["name"];
               }
               
               v_datas = {"weekList" : s_arr};
               console.log(s_arr);
               
               /* 
               var i = 0;
               var weekList = [];
               for(var a of data["weekList"]){
                  var obj = {};
                  var list = [];
                  if(i%7 == 0){
                     obj["emp"] = {"name" : a["name"],
                                 "rank" : a["rank"],
                                 "dept" : a["dept"]}
                  }
                  list.push(   {"dclzSn" : a["dclzSn"],
                           "workOn" : a["workOn"],
                               "empl_no" : a["empl_no"],
                               "beginTime" : a["beginTime"],
                               "endTime" : a["endTime"],
                               "workTime" : a["workTime"],
                               "workstleCode" : a["workstleCode"],
                               "encpn" : a["encpn"],
                               "totalwork" : a["totalwork"]
                           }
                           );
                  
                  
                  i++;
                  if(i%7 == 0){
                     obj["list"] = list;
                     weekList.push(obj);
                  }
               }
                data["weekList"] =weekList; */
                  
               printData1(v_datas,$('.week12'), $('#week-list-template'));

            }
         
      });
      
      }

      let monthStart1 = "";
      let monthEnd2 = "";
      
      function searchPeriodCalculation() {
         
           // 날짜형으로 데이트 포맷
           let date = new Date(f);

           // 월요일을 중심으로한 주차 구하기( JS기준 : 일요일 0 월요일 1 ~ 토요일 6 )

           let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);

           let lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

           let weekObj = null;

           let weekObjArray = new Array();

           let weekStand = 8;  // 월요일 고정

           let firstWeekEndDate = true;

           let thisMonthFirstWeek = firstDay.getDay();



           for(var num = 1; num <= 6; num++) {

               // 마지막월과 첫번째월이 다른경우 빠져나온다.

               if(lastDay.getMonth() != firstDay.getMonth()) {

                   break;

               }



               weekObj = new Object();

               // 한주의 시작일은 월의 첫번째 월요일로 설정

               if(firstDay.getDay() <= 1) {

                   // 한주의 시작일이 일요일이라면 날짜값을 하루 더해준다.

                   if(firstDay.getDay() == 0) { firstDay.setDate(firstDay.getDate() + 1); }

                   weekObj.weekStartDate =

                         firstDay.getFullYear().toString()+ "-" 
                         + numberPad((firstDay.getMonth() + 1).toString(), 2) + "-"+ numberPad(firstDay.getDate().toString() , 2);

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

               // 월요일로 지정한 데이터가 존재하는 경우에만 마지막 일의 데이터를 담는다.

               if(typeof weekObj.weekStartDate !== "undefined") {

                   weekObj.weekEndDate =

                         firstDay.getFullYear().toString() + "-"

                       + numberPad((firstDay.getMonth() + 1).toString(), 2) + "-"

                       + numberPad(firstDay.getDate().toString(), 2);

                        weekObjArray.push(weekObj);
               }

         firstDay.setDate(firstDay.getDate() + 1);
           }

         monthStart1 = weekObjArray[0].weekStartDate;
           
           if(weekObjArray.length=4){
               monthEnd2 = weekObjArray[3].weekEndDate ;
           }else{
              monthEnd2 = weekObjArray[4].weekEndDate;
           }
           
       }
      
       function numberPad(num, width) {

           num = String(num);
         
           return num.length >= width ? num : new Array(width - num.length + 1).join("0") + num;
       }
      
       

		let jobForm=$('#jobForm');
		function Form(){
			jobForm=$('#jobForm');	
			
			jobForm.find("[name='page']").val('select[name="page"]');
			jobForm.find("[name='perPageNum']").val(10);
			jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		}
		
       var queryString = $("form[name=jobForm]").serialize() ;
		
	

       
      function monthajax(){
    	  Form();
         
         var data={"beginTime" : monthStart1,
                     "endTime" : monthEnd2,
                     "formData":queryString
                     
         }
         
         $.ajax({
              url : '<%=request.getContextPath()%>/dclzmanager',
            type : "post",
            data : JSON.stringify(data),
            contentType : 'application/json',
            success : function(data) {
            	console.log(data);
               var v_datas = {};
               var s_arr = [];
                  
                  var f_name = "";
                  var obj = {};
                  var v_arr = [];
                  for(var i=0; i<data.weekList.length; i++){
                     
                     var f_val = data.weekList[i];
                     
                     if(i != 0){
                        if(f_name != f_val["name"]){
                           
                           obj["list"] = v_arr;
                           s_arr.push(obj);
                           obj = {};
                           v_arr = [];
                           obj["emp"] = {"name" : f_val["name"],
                                 "rank" : f_val["rank"],
                                 "dept" : f_val["dept"],
                         		"id" : f_val["id"]
                           };
                        }
                     }else{
                        obj["list"] = v_arr;
                        obj["emp"] = {"name" : f_val["name"],
                              "rank" : f_val["rank"],
                              "dept" : f_val["dept"],
                        		"id" : f_val["id"]};
                     }
                     
                     v_arr.push(f_val);
                     
                     if(i == data.weekList.length-1){
                        
                        obj["list"] = v_arr;
                        s_arr.push(obj);
                     }
                     
                     f_name = f_val["name"];
                  }
               v_datas = {"weekList" : s_arr};
               
               console.log(v_datas);
               
               printData1(v_datas,$('.month12'), $('#month-list-template'));
               
               
            }
         });
      }
      
      function printData1(data,target,templateObject){

            var template=Handlebars.compile(templateObject.html());
            var html = template(data);   
            target.html(html);
      }

       Handlebars.registerHelper({
          'times': function(n, block) {
                   let temp = '';
                   for(let i = 0; i < n; ++i)
                      temp += block.fn(i);
                   return temp;
               },
          'workTimeCheck': function(v1, options) {
                   if(v1 === '0') {
                     return options.fn(this);
                   }
                   
                   return options.inverse(this);
               },
          'test': function(n, block) {
                    let temp = '';
                    for(let i = 0; i < n; ++i)
                       temp += block.fn(i);
                    return temp;
             },
             'timechange':function(work,options){
                var time = work;
                var ss = time-(time-(time%60));
                var mm = ((time-ss)/60)%60;
                var hh = ((time-ss)/60-mm)/60;
                
                
                
                return hh+"h "+mm+"m "+ss+"s";
             },
             'basictime':function(work,options){
                var time = work;
                var sss = time-(time-(time%60));
                var mmm = ((time-sss)/60)%60;
                var hhh = ((time-sss)/60-mmm)/60;
                var hh = Number(hhh);
                var mm = Number(mmm);
                var ss = Number(sss);
                if (hh<8&& mm<=59 && ss<=59){
                    return hh+"h "+mm+"m "+ss+"s";
                }else {
                   var basictime = '8h 0m 0s'; 
                   return basictime;
                }
                
             },
              'addtime':function(work,options){
                var addtimeno = '0h 0m 0s'; 
                var time = work;
                var sss = time-(time-(time%60));
                var mmm = ((time-sss)/60)%60;
                var hhh = ((time-sss)/60-mmm)/60;
                
                var hh = Number(hhh);
                var mm = Number(mmm);
                var ss = Number(sss);
                if (hh<8&& mm<=59 && ss<=59){
                    return addtimeno;
                }else {
                    var h = hh-8; 
    	
                	
                    return h+"h "+mm+"m "+ss+"s";
                }
                
             },
             
             'dd':function(list,options){
               var addTime1=0;
           	   var total1 = 0;   
               for(var work of list){
            	var time1 = Number(work.workTime);
                var time = work.workTime;
                   var sss = time-(time-(time%60));
                   var mmm = ((time-sss)/60)%60;
                   var hhh = ((time-sss)/60-mmm)/60;
                  
                var hh = Number(hhh);
                var mm = Number(mmm);
                var ss = Number(sss);
                if (hh<8&& mm<=59 && ss<=59){
                	
                   
                  total1+=time1;
               }else {
                   addTime1+=(time1-28800);
                   total1+=28800;
               }
                  
                   var ss = total1-(total1-(total1%60));
                   var mm = ((total1-ss)/60)%60;
                   var hh = ((total1-ss)/60-mm)/60;
                   
                   var total = hh+"h "+mm+"m "+ss+"s ";
                
                   var s = addTime1-(addTime1-(addTime1%60));
                   var m = ((addTime1-s)/60)%60;
                   var h = ((addTime1-s)/60-m)/60;
                   
                   var addTime = h+"h "+m+"m "+s+"s ";

             }
               var result = options.fn({"total" : total,
                                       "addTime" :addTime});
                
                return result;
             },
             
             'userImg':function(dataId){
    			 let contextPath = '<%=request.getContextPath()%>';
    			 let path = "url('"+contextPath+"/user/getPicture.do?id="+dataId+"')";
    			 
    			 
    			 return path;
    			
    		},
             
             
             
     
             'monthCheck':function(list,options){
            	 	var oneweek=0;
            	 	var twoweek=0;
            	 	var threeweek=0;
            	 	var fourweek=0;
            	 	var fiveweek=0;
            	 	
            	 	
                    var addTime1=0;
                    var total1 = 0;   
                    var addTime2=0;
                    var total2 = 0;   
                    var addTime3=0;
                    var total3 = 0;   
                    var addTime4=0;
                    var total4 = 0;   
                    var totalAll = 0;
            	 	var addAll =0;

            		if(list.length==28){
            			for(var i =0; i<7; i++){
            				
            				var time = Number(list[i].workTime);
            				oneweek+=time;

            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
            				
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                            
                              total1+=time;
                              totalAll+=time;
                           }else {
                               addTime1+=(time-28800);
                           	addAll+=(time-28800);
                               total1+=28800;
                               totalAll+=28800;
                           }
            			}
            			
            			for(var i =7; i<14; i++){
            				var time = Number(list[i].workTime);
            				
            				twoweek+=time;
            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
            				
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                        	   total2+=time;
                               totalAll+=time;
                           }else {
                            	addTime2+=(time-28800);
                            	addAll+=(time-28800);
                            	total2+=28800;
                                totalAll+=28800;
                           }
            			}
            			
            			for(var i =14; i<21; i++){

            				var time = Number(list[i].workTime);
            				threeweek+=time;
            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
                            
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                        	   total3+=time;
                               totalAll+=time;
                           }else {
                            	addTime3+=(time-28800);
                            	addAll+=(time-28800);
                            	total3+=28800;
                                totalAll+=28800;
                           }
            			}
             
            			for(var i =21; i<list.length; i++){
            				

            				var time = Number(list[i].workTime);
                    	 	fourweek += time;
            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
            				
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                        	   total4+=time;
                               totalAll+=time;
                           }else {
                            	addTime4+=(time-28800);
                            	addAll+=(time-28800);
                            	total4+=28800;
                                totalAll+=28800;
                           }
            			}

             			var monthwork=totalAll+addAll;
                        var result = options.fn({"addTime1":addTime1,
                        							"total1":total1,
                        							"oneweek":oneweek,
                        							
                        							"total2":total2,
                        							"addTime2":addTime2,
                        							"twoweek":twoweek,
                        							
                        							
                        							"total3":total3,
                        							"addTime3":addTime3,
                        							"threeweek":threeweek,
                        							
                        							
                        							
                        							"total4":total4,
                        							"addTime4":addTime4,
                        							"fourweek":fourweek,
                        							
                        							"totalAll":totalAll,
                        							"addAll":addAll,
                        							
                        							"monthwork":monthwork
                        							});
                        return result;

            		}else{
            			
            			
							for(var i =0; i<7; i++){
            				
            				var time = Number(list[i].workTime);
            				oneweek+=time;

            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
            				
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                            
                              total1+=time;
                              totalAll+=time;
                           }else {
                               addTime1+=(time-28800);
                           	addAll+=(time-28800);
                               total1+=28800;
                               totalAll+=28800;
                           }
            			}
            			
            			for(var i =7; i<14; i++){
            				var time = Number(list[i].workTime);
            				
            				twoweek+=time;
            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
            				
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                        	   total2+=time;
                               totalAll+=time;
                           }else {
                            	addTime2+=(time-28800);
                            	addAll+=(time-28800);
                            	total2+=28800;
                                totalAll+=28800;
                           }
            			}
            			
            			for(var i =14; i<list.length; i++){

            				var time = Number(list[i].workTime);
            				threeweek+=time;
            				var sss = time-(time-(time%60));
                            var mmm = ((time-sss)/60)%60;
                            var hhh = ((time-sss)/60-mmm)/60;
                            
                            var hh = Number(hhh);
                            var mm = Number(mmm);
                            var ss = Number(sss);
                            
                            if (hh<8&& mm<=59 && ss<=59){
                        	   total3+=time;
                               totalAll+=time;
                           }else {
                            	addTime3+=(time-28800);
                            	addAll+=(time-28800);
                            	total3+=28800;
                                totalAll+=28800;
                           }
            			}
             
             			var monthwork=totalAll+addAll;
                        var result = options.fn({"addTime1":addTime1,
                        							"total1":total1,
                        							"oneweek":oneweek,
                        							
                        							"total2":total2,
                        							"addTime2":addTime2,
                        							"twoweek":twoweek,
                        							
                        							
                        							"total3":total3,
                        							"addTime3":addTime3,
                        							"threeweek":threeweek,
                        							
                        							
                        							"total4":0,
                        							"addTime4":0,
                        							"fourweek":0,
                        							
                        							"totalAll":totalAll,
                        							"addAll":addAll,
                        							
                        							"monthwork":monthwork
                        							});
                        return result;

            		
            			
            			
            			
            		}
            		
            			
             }
       });  
             

    
   </script>

	<script type="text/x-handlebars-template" id="week-list-template">
{{#each weekList}}  
<tr>      
<td class="flex">
     <div class="modi-img" style="background:{{userImg this.emp.id}}; 
	background-position: center center; background-repeat: no-repeat; background-size: cover;"></div>
      <div class="user-info">
         <h4>{{this.emp.name}}</h4>

         <ul>
            <li>{{this.emp.dept }}</li>
         </ul>
      </div>
   </td>
   <td>
      <div class="dclz-hovBox"> 
		<span class="hov"> <h4>{{#timechange this.list.0.totalwork}}{{/timechange}}</h4></span>
      

      <ul class="arrow_box">
		{{#dd this.list}}
      	   <li>기본 {{total}}</li>
     	    <li>연장 {{addTime}}</li>
		{{/dd}}
      </ul>
	</div>
   </td>
    {{#each this.list}}
<div id="menu">

      <td>
      <div class="dclz-hovBox"> 
		<span class="hov"> <h4>{{#timechange workTime}}{{/timechange}}</h4></span>
      	 <ul class="arrow_box">
          <li>기본 {{#basictime workTime}}{{/basictime}}</li>
          <li>연장 {{#addtime workTime}}{{/addtime}}</li>
        </ul>
	  </div>
			
      </td>

</div>
   {{/each}}
</tr>
   {{/each}}               



                              
</script>


	<script type="text/x-handlebars-template" id="month-list-template">
{{#each weekList}}  
<tr>      
<td class="flex">
 <div class="modi-img" style="background:{{userImg this.emp.id}}; 
	background-position: center center; background-repeat: no-repeat; background-size: cover;"></div>
      <div class="user-info">
         <h4>{{this.emp.name}}</h4>

         <ul>
            <li>{{this.emp.dept }}</li>
         </ul>
      </div>
   </td>


{{#monthCheck ./list}} 
   <td>
   <div class="dclz-hovBox"> 
  <span class="hov"> <h4>{{#timechange monthwork}}{{/timechange}}</h4></span>
      <ul class="arrow_box">
          <li>기본 {{#timechange totalAll}}{{/timechange}} </li>
          <li>연장 {{#timechange addAll}}{{/timechange}} </li>
      </ul>
	</div>
</td>


<div id="menu">
<td>
    <div class="dclz-hovBox"> 
   		   <span class="hov"> <h4>{{#timechange oneweek}}{{/timechange}}</h4></span>
      	 <ul class="arrow_box">
   	  	     <li>기본 {{#timechange total1}}{{/timechange}}</li>
     	     <li>연장 {{#timechange addTime1}}{{/timechange}}</li>
    	  </ul>
	</div>
</td>
  <td>
    <div class="dclz-hovBox"> 
      <span class="hov"> <h4>{{#timechange twoweek}}{{/timechange}}</h4></span>
      	 <ul class="arrow_box">
          <li>기본 {{#timechange total2}}{{/timechange}}</li>
          <li>연장 {{#timechange addTime2}}{{/timechange}}</li>
      </ul>
	</div>
</td>
  <td>
    <div class="dclz-hovBox"> 
       <span class="hov"><h4>{{#timechange threeweek}}{{/timechange}}</h4></span>
  	 <ul class="arrow_box">
          <li>기본 {{#timechange total3}}{{/timechange}}</li>
          <li>연장 {{#timechange addTime3}}{{/timechange}}</li>
      </ul>
	</div>
</td>


  <td>
    <div class="dclz-hovBox"> 
       <span class="hov"> <h4>{{#timechange fourweek}}{{/timechange}}</h4> </span>
  	 <ul class="arrow_box">
          <li>기본 {{#timechange total4}}{{/timechange}}</li>
          <li>연장 {{#timechange addTime4}}{{/timechange}}</li>
      </ul>
	</div>
</td>


  <td>
      <h4>{{total55}}</h4>
      <ul>
          <li> {{total5}}</li>
          <li> {{addTime5}}</li>
      </ul>
</td>
</div>
{{/monthCheck}}
 		
      
   </td
   
</tr>
   {{/each}} 
                              
</script>

	<script type="text/x-handlebars-template" id="image-pagination-template">

   <a class="p-num prev prev-first" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">
   		<i class="fas fa-angle-double-left"></i>
   </a>
   
  
   
{{#each pageNum}}
		<a var="pageNum" class="p-num num {{signActive2 this}}" href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0">{{this}}</a>	
{{/each}}

  
   <a class="p-num next-last" href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
		<i class="fas fa-angle-double-right"></i>
   </a>
</script>

	<script>
		MemberProFilePictureThumb('<%=request.getContextPath()%>');
		
		function MemberProFilePictureThumb(contextPath){
			 for(var target of document.querySelectorAll('.modi-img')){	
				 var id = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
	
	</script>

	<%@ include file="/WEB-INF/include/footer.jsp"%>