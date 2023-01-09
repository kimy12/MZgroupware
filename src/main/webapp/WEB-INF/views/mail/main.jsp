<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
  <div class="wrap">
      <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
       
        <div class="dashboard dashboard2">
            <div class="p-wrap">
                <div class="dash-wrap">
                    <div class="dash-top tbg01">
                        <div class="dashmain-title">
                            <h4>Mail</h4>
                            <p>대용량의 메일도 신속하게 처리할 수 있으며 다양한 편의/관리 기능을 제공합니다.</p>
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
                                <h3><i class="fa-solid fa-envelope"></i>전체메일</h3>
                                <p>${ALL_COUNT } <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-envelope-open-text"></i>받은메일</h3>
                                <p>${RECV_COUNT } <span>건</span></p>
                            </li>

                            <li>
                                <h3><i class="fa-solid fa-paper-plane"></i>보낸메일</h3>
                                <p>${SEND_COUNT } <span>건</span></p>
                            </li>
                            
                            <li>
                                <h3><i class="fa-solid fa-trash-can"></i>휴지통</h3>
                                <p>${TRASH_COUNT } <span>건</span></p>
                            </li>
                        </ul>
                    </div>

                    <div class="dash-list">
                        <div class="flex ju-sp-bt flex-wrap">
                            <div class="dash-con mb-20">
                                <div class="dash-header dhe01 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-envelope"></i> 전체메일
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="32%">
                                            <col width="30%">
                                            <col width="20%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>제목</td>
                                                <td>보낸사람</td>
                                                <td>날짜</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                        </thead>

                                        <tbody id="allList-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                            
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con mb-20">
                                <div class="dash-header dhe02 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-envelope-open-text"></i> 받은메일
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                           	<col width="8%">
                                            <col width="32%">
                                            <col width="30%">
                                            <col width="20%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>제목</td>
                                                <td>보낸사람</td>
                                                <td>날짜</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                        </thead>

                                        <tbody id="receivedMail-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                            
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe04 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-paper-plane"></i>보낸메일
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                           	<col width="8%">
                                            <col width="32%">
                                            <col width="30%">
                                            <col width="20%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>제목</td>
                                                <td>보낸사람</td>
                                                <td>날짜</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                        </thead>

                                        <tbody id="sendList-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                            
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe03 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-trash-can"></i>휴지통
                                    </div>
                                
                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="13%">
                                            <col width="27%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>제목</td>
                                                <td>보낸사람</td>
                                                <td>날짜</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>
                                        </thead>

                                        <tbody id="trashList-tobody">
                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
                                            </tr>

                                            <tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td>메일제목</td>
                                                <td>베베</td>
                                                <td>2022-00-00</td>
                                                <td><i class="fa-solid fa-paperclip on"></i></td>
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
	<script type="text/x-handlebars-template" id="dashBoard-List-template">
					{{#each mailList}}
											<tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td id="els">{{emailSj}}</td>
                                                <td id="els">{{sendEmpMail}}</td>
                                                <td>{{#prettifyDate writngOn}}{{/prettifyDate}}</td>
                                                <td><i class="fa-solid fa-paperclip {{#ifCond unityNo -1}}{{else}}on{{/ifCond}}"></i></td>
                                            </tr>
					{{/each}}
    </script>
    <script type="text/x-handlebars-template" id="dashBoard-sendMailList-template">
					{{#each sendMailList}}
											<tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td id="els">{{emailSj}}</td>
                                                <td id="els">{{sendEmpMail}}</td>
                                                <td>{{#prettifyDate writngOn}}{{/prettifyDate}}</td>
                                                <td><i class="fa-solid fa-paperclip {{#ifCond unityNo -1}}{{else}}on{{/ifCond}}"></i></td>
                                            </tr>
					{{/each}}
    </script>
     <script type="text/x-handlebars-template" id="dashBoard-receMailList-template">
					{{#each receMailList}}
											<tr>
                                                <td><i class="fa-solid fa-envelope"></i></td>
                                                <td id="els">{{emailSj}}</td>
                                                <td id="els">{{sendEmpMail}}</td>
                                                <td>{{#prettifyDate writngOn}}{{/prettifyDate}}</td>
                                                <td><i class="fa-solid fa-paperclip {{#ifCond unityNo -1}}{{else}}on{{/ifCond}}"></i></td>
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
			
			var empHtml = template(res);
			$('#'+id).html(empHtml);
    	});
    }
    
    list_load('mailMain/sendMail','sendList-tobody','dashBoard-sendMailList-template');
    list_load('mailMain/receivedMail','receivedMail-tobody','dashBoard-receMailList-template');
    list_load('mailMain/getdashboardTrash','trashList-tobody');
    list_load('mailMain/getdashboardAll','allList-tobody');
    
    
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