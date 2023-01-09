<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<body>
   <div class="wrap">
       <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
       
        <div class="dashboard dashboard2">
            <div class="p-wrap">
                <div class="dash-wrap">
                    <div class="dash-top tbg01">
                        <div class="dashmain-title">
                            <h4>Data Room</h4>
                            <p>개인/팀/전사 간 공유하고 있는 다양한 자료를
                                폴더 단위로 자유롭게 공유할 수 있습니다.</p>
                        </div>

                            
                      

                        <div class="top-bg">
                            <img src="<%=request.getContextPath() %>/resources/images/topbg02.png">
                        </div>
                    </div>

                    <div class="dataGraph flex ju-sp-bt mb-30">
                        <div class="data-gr flex al-it-ce">
                        	<canvas id="myChart" width="200" height="200"></canvas>
                        	<div class="data-sizeG flex">
                        		<h4>23%</h4><span>/ 100%</span>
                        	</div>
                        </div>
                        
                        <div class="data-gr flex al-it-ce">
                        	<canvas id="myChart2" width="200" height="200"></canvas>
                        	<div class="data-sizeG flex">
                        		<h4>39%</h4><span>/ 100%</span>
                        	</div>
                        </div>
                    </div>

                   

                    <div class="dash-list">
                        <div class="flex ju-sp-bt flex-wrap">
                            
                            <div class="dash-con mb-20">
                                <div class="dash-header dhe01 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-database"></i> 최근 전사 자료실 목록
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
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>폴더명</td>
                                                <td>작성자</td>
                                                <td>생성일자</td>
                                                <td>최종갱신일</td>
                                            </tr>
                                        </thead>

                                        <tbody id="publicPds-tobody">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con mb-20">
                                <div class="dash-header dhe02 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-database"></i> 최근 나의 자료실 목록
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
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>폴더명</td>
                                                <td>작성자</td>
                                                <td>생성일자</td>
                                                <td>최종갱신일</td>
                                            </tr>
                                        </thead>
                                        <tbody id="privatePds-tobody">
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe04 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-database"></i> 최근 부서 자료실 목록
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
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>폴더명</td>
                                                <td>작성자</td>
                                                <td>생성일자</td>
                                                <td>최종갱신일</td>
                                            </tr>
                                        </thead>

                                        <tbody id ="departPds-tobody">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe03 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-database"></i>즐겨찾기 목록
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
                                                <td><i class="fa-solid fa-file"></i></td>
                                                <td>파일명</td>
                                                <td>작성자</td>
                                                <td>생성일자</td>
												<td><i class="fa-solid fa-download"></i></td>
                                            </tr>
                                        </thead>

                                        <tbody id="fav-List-tbody">
                                            
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
					{{#each pdsPublicList}}
											<tr  onclick="location.href='pdsPublicList?e_unityatchmnflno={{e_unityatchmnflno}}&e_title={{e_title}}&e_writer={{e_writer}}'">
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>{{e_title}}</td>
                                                <td>{{e_writer}}</td>
                                                <td>{{#prettifyDate e_regdate}}{{/prettifyDate}}</td>
                                                <td>{{#prettifyDate e_updatedate}}{{/prettifyDate}}</td>
                                            </tr>
					{{/each}}
											
    </script>
    <script type="text/x-handlebars-template" id="dashBoard-priList-template">
					{{#each pdsPrivateList}}
											<tr onclick="location.href='pdsPrivateList?m_unityatchmnflno={{m_unityatchmnflno}}&m_title={{m_title}}&m_writer={{m_writer}}'">
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>{{m_title}}</td>
                                                <td>{{m_writer}}</td>
                                                <td>{{#prettifyDate m_regdate}}{{/prettifyDate}}</td>
                                                <td>{{#prettifyDate m_updatedate}}{{/prettifyDate}}</td>
                                            </tr>
					{{/each}}
											
    </script>
    <script type="text/x-handlebars-template" id="dashBoard-depList-template">
					{{#each pdsDepList}}
											<tr  onclick="location.href='pdsDepList?d_unityatchmnflno={{d_unityatchmnflno}}&d_title={{d_title}}&d_writer={{d_writer}}'">
                                                <td><i class="fa-solid fa-folder"></i></td>
                                                <td>{{d_title}}</td>
                                                <td>{{d_writer}}</td>
                                                <td>{{#prettifyDate d_regdate}}{{/prettifyDate}}</td>
                                                <td>{{#if d_updatedate}}{{#prettifyDate d_updatedate}}{{/prettifyDate}}{{/if}}</td>
                                            </tr>
					{{/each}}
											
    </script>
    <script type="text/x-handlebars-template" id="dashBoard-favList-template">
					{{#each pdsAttachList}}
											<tr>
                                                <td><i class="fa-solid fa-file"></i></td>
                                                <td>{{originalname}}</td>
                                                <td>{{#changeFilSize filesize}}{{/changeFilSize}}</td>
                                                <td>{{#prettifyDate regdate}}{{/prettifyDate}}</td>
                                                <td><i class="fa-solid fa-download" onclick='location.href="{{downloadURL uploadPath fileName}}"'></i></td>
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
    
   list_load("/PdsRest/pdsFolders","publicPds-tobody","dashBoard-List-template");
   list_load("/PdsRest/pdsPrivateFolders","privatePds-tobody","dashBoard-priList-template");
   list_load("/PdsRest/pdsDepFolders","departPds-tobody","dashBoard-depList-template");
   list_load("/PdsRest/fav","fav-List-tbody","dashBoard-favList-template"); 
    
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
		},
		'changeFilSize':function(fileSize){
			
			if(fileSize/1024 > 1 && fileSize/1024 < 1024){
				return (fileSize/1024).toFixed(2) +"KB";
			}
			
			if(fileSize/1024/1024 > 1 && fileSize/1024/1024 < 1024){
				return (fileSize/1024/1024).toFixed(2) +"MB";
			}
			return "잘못된 값";
		},
		'downloadURL':function(uploadPath,fileName){
			
			
			return "location.href='<%=request.getContextPath() %>/setle/download?uploadPath="+uploadPath+"&fileName="+fileName+"'";
		}
    });
	</script>
	
	<script>
	
	const data = {
			  labels: [
			    '개인자료실 용량'
			  ],
			  datasets: [{
			    label: 'My First Dataset',
			    data: [200, 300],
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      '#858E92'
			      /* 'rgb(54, 162, 235)', */
			    ],
			    hoverOffset: 4
			  }],
	
			};
	const config = {
			  type: 'doughnut',
			  data: data,
			  options: {
					responsive: false
				}
			};
	
	let myChart = new Chart(
			document.getElementById('myChart'),
			config
	);
	
	const data2 = {
			labels: [
			    '부서자료실 용량'
			  ],
			  datasets: [{
			    label: 'My First Dataset',
			    data: [300, 200],
			    backgroundColor: [
			      /* 'rgb(255, 99, 132)' */
			      'rgb(54, 162, 235)',
			      '#858E92'
			    ],
			    hoverOffset: 4
			  }],
	
			};
	const config2 = {
			  type: 'doughnut',
			  data: data2,
			  options: {
					responsive: false
				}
			};
	
	myChart = new Chart(
			document.getElementById('myChart2'),
			config2
	);
	
	</script>
 <%@ include file="/WEB-INF/include/footer.jsp" %>