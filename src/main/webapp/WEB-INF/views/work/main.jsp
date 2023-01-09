<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<div class="wrap">
	<%@ include file="/WEB-INF/include/topbar.jsp" %>

        <div class="dashboard dashboard2">
            <div class="p-wrap">
                <div class="dash-wrap">
                    <div class="dash-top tbg01">
                        <div class="dashmain-title">
                            <h4>Works</h4>
                            <p>업무를 원활하게 진행하기 위한 커뮤니케이션 기능을 제공합니다.</p>
                        </div>

                            
                       <!--  <div class="main-btn">
                            메인으로 돌아가기 <i class="fa-solid fa-angle-right"></i>
                        </div> -->

                        <div class="top-bg">
                            <img src="<%=request.getContextPath() %>/resources/images/topbg02.png">
                        </div>
                    </div>

                    <div class="state-re">
                        <ul class="flex ju-sp-bt">
                            <li>
                                <h3><i class="fa-solid fa-briefcase"></i>신규 업무</h3>
                                <p>32 <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-briefcase"></i>진행중인 업무</h3>
                                <p>10 <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-briefcase"></i>불가처리 업무</h3>
                                <p>12 <span>건</span></p>
                            </li>
                            
                            <li>
                                <h3><i class="fa-solid fa-briefcase"></i>마감된 업무</h3>
                                <p>40 <span>건</span></p>
                            </li>
                        </ul>
                    </div>

                    <div class="dash-list">
                        <div class="flex ju-sp-bt flex-wrap">
                            <div class="dash-con mb-20">
                                <div class="dash-header dhe01 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-briefcase"></i> 최근 신규 업무
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="27%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>업무명</td>
                                                <td>생성자</td>
                                                <td>업무 상태</td>
                                                <td>생성일</td>
                                                <td>마감일</td>
                                            </tr>
                                        </thead>

                                        <tbody id="dashboard-newList-tbody">
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con mb-20">
                                <div class="dash-header dhe02 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-briefcase"></i> 최근 진행중인 업무
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="27%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>업무명</td>
                                                <td>생성자</td>
                                                <td>업무 상태</td>
                                                <td>생성일</td>
                                                <td>마감일</td>
                                            </tr>
                                        </thead>

                                        <tbody id="dashboard-proList-tbody">
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">마감</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">신규</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">불가</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">마감</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe03 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-briefcase"></i>최근 불가처리 업무
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="27%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>업무명</td>
                                                <td>생성자</td>
                                                <td>업무 상태</td>
                                                <td>생성일</td>
                                                <td>마감일</td>
                                            </tr>
                                        </thead>

                                        <tbody id="dashboard-stoList-tbody">
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">완료</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">불가</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe04 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-briefcase"></i> 최근 마감된 업무
                                    </div>
                                
                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="27%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>업무명</td>
                                                <td>생성자</td>
                                                <td>업무 상태</td>
                                                <td>생성일</td>
                                                <td>마감일</td>
                                            </tr>
                                        </thead>

                                        <tbody id="dashboard-comList-tbody">
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">완료</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">불가</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/x-handlebars-template" id="dashBoard-workList-template">
					{{#each workList}}
					 						<tr>
                                                <td>{{jobNm}}</td>
                                                <td>{{empNcnm}}</td>
                                                
												<td>{{#ifCond jobSttus 0}}<span class="y">신규</span>{{/ifCond}}
													{{#ifCond jobSttus 1}}<span class="b">진행</span>{{/ifCond}}
													{{#ifCond jobSttus 2}}<span class="g">마감</span>{{/ifCond}}
													{{#ifCond jobSttus 3}}<span class="p">불가</span>{{/ifCond}}
												</td>
                                                
												
                                                <td>{{#prettifyDate jobRedde}}{{/prettifyDate}}</td>
                                                <td>{{#prettifyDate jobEndde}}{{/prettifyDate}}</td>
                                            </tr>
                             {{/each}}               
                                            
    </script>
    
    <script>
    
    function list_load(url,id,temp){
    	if(temp == null){
    		temp="dashBoard-List-template";
    	}
    	
    	$.get('<%=request.getContextPath()%>/'+url,function(res){
			console.log(res);
    		var template=Handlebars.compile($('#'+temp).html());
			console.log($('#'+id))
			var empHtml = template(res);
			$('#'+id).html(empHtml);
    	});
    }
    
    list_load('workMain/newList','dashboard-newList-tbody','dashBoard-workList-template');
    list_load('workMain/proList','dashboard-proList-tbody','dashBoard-workList-template');
    list_load('workMain/comList','dashboard-comList-tbody','dashBoard-workList-template');
    list_load('workMain/stoList','dashboard-stoList-tbody','dashBoard-workList-template');
    
    
    </script>
    
    <script type="text/javascript">
	Handlebars.registerHelper({
	  	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			month = month +"";
			console.log(month.length);
			if(month.length == 1){
				month = "0"+month;
			}
			var date=dateObj.getDate();
			return year+"-"+month+"-"+date;
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
<%@ include file="/WEB-INF/include/footer.jsp" %>