<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%--         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/dashboard.css"> --%>
<%--         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/spectrum.css"> --%>
<!--     <script src="https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js"></script> -->

<body>

    <div class="wrap">
        
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
       
        
       
    
       
        <div class="dashboard dashboard2">
            <div class="p-wrap">
                <div class="dash-wrap">
                    <div class="dash-top tbg01">
                        <div class="dashmain-title">
                            <h4>Workflows</h4>
                            <p>워크플로우를 통해 문서를 체계적으로
                                관리하고 업무 역할을 명확히 할 수 있습니다.</p>
                        </div>

                        <!--     
                        <div class="main-btn">
                            메인으로 돌아가기 <i class="fa-solid fa-angle-right"></i>
                        </div> -->

                        <div class="top-bg">
                            <img src="<%=request.getContextPath() %>/resources/images/topbg02.png">
                        </div>
                    </div>

                    <div class="state-re">
                        <ul class="flex ju-sp-bt">
                            <li>
                                <h3><i class="fa-solid fa-file-circle-exclamation"></i>대기 문서</h3>
                                <p>${lateDocCount } <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-file-circle-plus"></i>진행 문서</h3>
                                <p>${procDocCount } <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-file-circle-xmark"></i>반려 문서</h3>
                                <p>${cancDocCount } <span>건</span></p>
                            </li>
                            
                            <li>
                                <h3><i class="fa-solid fa-file-circle-check"></i>완료 문서</h3>
                                <p>${compDocCount } <span>건</span></p>
                            </li>
                        </ul>
                    </div>

                    <div class="dash-list">
                        <div class="flex ju-sp-bt flex-wrap">
                            <div class="dash-con mb-20">
                                <div class="dash-header dhe01 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-file-circle-exclamation"></i> 합의 대기 문서 목록
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square" onclick='location.href="<%=request.getContextPath()%>/setle/setleAccept?perPageNum=5"'></i>
                                        <i class="fa-solid fa-arrow-rotate-left" onclick="list_load('setleMain/acceptList','accept-tobody');"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="25%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>합의 신청일</td>
                                                <td>부서</td>
                                                <td>합의상태</td>
                                                <td>합의종류</td>
                                                <td>합의요청자</td>
                                            </tr>
                                        </thead>

                                        <tbody id="accept-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-star on"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star on"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star on"></i></td>
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
                                        <i class="fa-solid fa-file-pen"></i> 내 문서 목록
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square" onclick='location.href="<%=request.getContextPath()%>/setle/setleMyList?perPageNum=5"'></i>
                                        <i class="fa-solid fa-arrow-rotate-left" onclick="list_load('setleMain/myList','myList-tobody');"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="25%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>합의 신청일</td>
                                                <td>부서</td>
                                                <td>합의상태</td>
                                                <td>합의종류</td>
                                                <td>합의요청자</td>
                                            </tr>
                                        </thead>

                                        <tbody id="myList-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">완료</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
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
                                        <i class="fa-solid fa-users"></i>부서 문서 목록
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square" onclick='location.href="<%=request.getContextPath()%>/setle/setlePartList?perPageNum=5"'></i>
                                        <i class="fa-solid fa-arrow-rotate-left" onclick="list_load('setleMain/depart','depart-tobody');"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                           <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="25%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>합의 신청일</td>
                                                <td>부서</td>
                                                <td>합의상태</td>
                                                <td>합의종류</td>
                                                <td>합의요청자</td>
                                            </tr>
                                        </thead>

                                        <tbody id="depart-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">완료</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
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
                                        <i class="fa-solid fa-trash-can"></i> 휴지통 목록
                                    </div>
                                
                                    <div>
                                        <i class="fa-solid fa-up-right-from-square" onclick='location.href="<%=request.getContextPath()%>/setle/setleMyTrash?perPageNum=5"'></i>
                                        <i class="fa-solid fa-arrow-rotate-left" onclick="list_load('setleMain/trash','trash-tobody');"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="25%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>합의 신청일</td>
                                                <td>부서</td>
                                                <td>합의상태</td>
                                                <td>합의종류</td>
                                                <td>합의요청자</td>
                                            </tr>
                                        </thead>

                                        <tbody id="trash-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="b">완료</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>
 
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="y">진행</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="g">대기</span></td>
                                                <td>주간보고서</td>
                                                <td>베베</td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2022-02-01</td>
                                                <td>인사</td>
                                                <td><span class="p">반려</span></td>
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
    <script type="text/x-handlebars-template" id="dashBoard-myList-template">
					{{#each setleList}}
											<tr onclick='location.href="<%=request.getContextPath()%>/setle/setleDetail?setleNo={{setleNo}}"'>
                                               
                                                <td>{{#prettifyDate writngOn}}{{/prettifyDate}}</td>
                                                <td>{{writerDepart}}</td>
                                                <td>{{#ifCond sttusNo 0}}<span class="y ">대기</span>{{/ifCond}}
													{{#ifCond sttusNo 1}}<span class="g">진행</span>{{/ifCond}}
													{{#ifCond sttusNo 2}}<span class="p">반려</span>{{/ifCond}}
													{{#ifCond sttusNo 3}}<span class="b">완료</span>{{/ifCond}}
												</td>	
                                                <td>{{setleForm.formCn}}</td>
                                                <td>{{writerEmpVO.ncnm}}</td>
                                            </tr>
					{{/each}}
    </script>
    <script>
    
    function list_load(url,id){
    	
    	$.get('<%=request.getContextPath()%>/'+url,function(res){
    		var template=Handlebars.compile($('#dashBoard-myList-template').html());
			
			var empHtml = template(res);
			
			$('#'+id).html(empHtml);
    	});
    }
    

    list_load('setleMain/myList','myList-tobody');
    list_load('setleMain/trash','trash-tobody');
    list_load('setleMain/depart','depart-tobody');
    list_load('setleMain/acceptList','accept-tobody');
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
</body>





</html>