<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
    <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>공용 주소록<span>in 공용 주소록(총 <em id="countOfPll" style="color:#444"></em>건)</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce">
	                                <span id="nowSearchType">선택
	                                	<c:choose>
											<c:when test="${pageMaker.cri.searchType eq 'a'}">이름</c:when> 
											<c:when test="${pageMaker.cri.searchType eq 's'}">직급</c:when>
											<c:when test="${pageMaker.cri.searchType eq 'c'}">부서</c:when> 
										</c:choose>
	                                </span>
	                                <i class="fa-solid fa-caret-down"></i>
                                </div>
                                <ul class="tog-b" style="display: none;">
                                	<li onclick="searchTypeChange(this);"><input type="hidden" value="a" >이름</li> 
									<li onclick="searchTypeChange(this);"><input type="hidden" value="s" >직급</li>
									<li onclick="searchTypeChange(this);"><input type="hidden" value="c" >부서</li> 
                                </ul>
                            </div>
                                
                            <input id="search" type="text" placeholder="Search" value="<c:choose>
									<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
									<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
								</c:choose>" onkeypress="searchEnter(this,event);">
                        </div>
                    </div>

                    <div class="address-wrap">
                        <div class="add-sear">
                           <ul class="flex">
                                <li><i class="fa-solid fa-envelope-open-text"></i>메일발송</li>
                                <!-- <li><i class="fa-solid fa-trash-can"></i>삭제</li> -->
                                <!-- <li><i class="fa-solid fa-user-tag"></i>주소록 이동</li> -->
                                <li><i class="fa-solid fa-print"></i>인쇄</li>
                           </ul>
                        </div>

                        <div class="address-modi">
                            <span><i class="fa-solid fa-id-badge"></i>주소록 이동</span>
                            <div class="downtab tab1 flex al-it-ce">
                                <label>개인 연락처로 이동</label>
                                <!-- <input type="checkbox"> -->

                                <!-- <label>부서 연락처로 이동</label>
                                <input type="checkbox">
 -->
                                <button type="button" onclick="move();"><i class="fa-solid fa-arrow-right-to-bracket"></i></button>
                            </div>
                        </div>

                        <div class="add-caption">
                            <ul class="flex" >
                                <li class="on indexing-go">
                                <input type="hidden" name="firstLetter" value="가" >
                                <input type="hidden" name="lastLetter" value="힣" >
                                전체
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="가" >
                                <input type="hidden" name="lastLetter" value="나" >
                                ㄱ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="나" >
                                <input type="hidden" name="lastLetter" value="다" >
                                ㄴ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="다" >
                                <input type="hidden" name="lastLetter" value="라" >
                                ㄷ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="라" >
                                <input type="hidden" name="lastLetter" value="마" >
                                ㄹ
                                </li >
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="마" >
                                <input type="hidden" name="lastLetter" value="바" >
                                ㅁ
                                </li >
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="바" >
                                <input type="hidden" name="lastLetter" value="사" >
                                ㅂ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="사" >
                                <input type="hidden" name="lastLetter" value="아" >
                                ㅅ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="아" >
                                <input type="hidden" name="lastLetter" value="자" >
                                ㅇ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="자" >
                                <input type="hidden" name="lastLetter" value="차" >
                                ㅈ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="차" >
                                <input type="hidden" name="lastLetter" value="카" >
                                ㅊ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="카" >
                                <input type="hidden" name="lastLetter" value="파" >
                                ㅋ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="파" >
                                <input type="hidden" name="lastLetter" value="하" >
                                ㅍ
                                </li>
                                
                                <li class="indexing-go">
                                <input type="hidden" name="firstLetter" value="하" >
                                <input type="hidden" name="lastLetter" value="힣" >
                                ㅎ
                                </li>
                            </ul>
                        </div>
                        
                        <div class="add-table">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="13%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="11%">
                                    <col width="13%">
                                    <col width="25%">
                                    <col width="13%">
                                </colgroup>

                                <thead id="theadAdress">
                                	
                                    <tr>
                                        <td><input type="checkbox" name="allCk" id="checkAll"/></td>
                                     
                                        <td><i class="fa-solid fa-sort"></i>닉네임(표시명)</td>
                                        <td><i class="fa-solid fa-sort"></i>이름</td>
                                        <td><i class="fa-solid fa-sort"></i>직급</td>
                                        <td><i class="fa-solid fa-sort"></i>부서</td>
                                        <td>휴대폰</td>
                                        <td>이메일</td>
                                        <td>회사전화</td>
                                    </tr>
                                    
                                </thead>

                                <tbody id="tbodyAdress">
                                    <c:forEach items="${empList }" var="emp">
	                                    <tr>
	                                        <td>
	                                        	<input type="checkbox" class="chk" name="chk" value="${emp.empl_no }"/>
	                                        </td>
	                                   
	                                        <td>${emp.ncnm }</td>
	                                        <td>${emp.name }</td>
	                                        <td>${emp.rank }</td>
	                                        <td>${emp.dept }</td>
	                                        <td>${emp.phone }</td>
	                                        <td>${emp.email }</td>
	                                        <td>070-0000-0000</td>
	                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="page-btn flex ju-sp-ce">
                        <a class="p-num prev-first" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
							</a> 

							<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a>
							</c:forEach>

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
		<input type="hidden" name="page">
	</form>
	<script>
	const checkMark = document.getElementsByName("chk");
	var checkBox = document.getElementById("checkAll");
	var checkArr = checkMark.length;
	
	var receCkArr = new Array();
	
	$(checkBox).click(function (){
		if($("input:checkbox[name='allCk']").is(":checked") == true){
			
			$("input:checkbox[name='chk']").prop("checked", true);
			
			for(var i = 0; i < checkArr; i++){
				receCkArr.push($("input:checkbox[name='chk']").eq(i).val());
			}
		}else{
			$("input:checkbox[name='chk']").prop("checked", false);
			
			for(var i = 0; i < checkArr; i++){
				receCkArr.splice(0, checkArr);
			}
		}
	});
	
		//주소록 총 개수
		document.getElementById('countOfPll').innerHTML = $('#tbodyAdress > tr').length;
		
		let isArrayForNcnm = [];
		/* const move = document.querySelector("#move"); */
		function move (){
			receCkArr = new Array();
			let data = {};
			
			for(var i = 0; i < checkArr; i++){
				let ch = $("input:checkbox[name='chk']").eq(i).is(":checked");
				if(ch == true){
					data = {"empl_no" : $("input:checkbox[name='chk']").eq(i).val(),
							"loginempno" : '${loginEmp.empl_no}'
							}
					isArrayForNcnm.push(data);
				}
			}
			
			if(isArrayForNcnm.length == 0){
				alert("이동할 파일을 선택하세요");
			}
			else{
				$.ajax({
					url : '<%=request.getContextPath()%>/address/insertAddress',
					type : 'post',
					data : JSON.stringify(isArrayForNcnm),
					contentType : 'application/json',
					success : function(result){
						if(result == 'success'){
							Swal.fire({
								icon:'success',
								title:'이동하였습니다.',
							})
						}
					},
					error : function(error){
						alert('등록실패!');
					}
				}); 
				isArrayForNcnm = [];
				
			}
			
		}
	</script>
	
	<script>
	function list_go(page,url){
		if(!url) url="publicList";
		
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
	
	const indexing = document.querySelectorAll(".indexing-go");
	let first = "";
	let last = "";

	for(let i =0; i<indexing.length; i++){
		indexing[i].addEventListener("click", function(e){
			const firstLetter = $(this).find('input[name=firstLetter]').val();
			const lastLetter = $(this).find('input[name=lastLetter]').val();
			
// 			$.ajax({
// 		        type : "POST",            
// 		        url : "${pageContext.request.contextPath}/address/getPublicListByIndex",   
// 		        data : {
// 		        	firstLetter : firstLetter,
// 		        	lastLetter : lastLetter
// 		        },            // Json 형식의 데이터이다.
// 		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
// 		        	var template = Handlebars.compile($('#address-list-template').html());
// 		        	$('#theadAdress').remove();
// 		        	$('#theadAdress').append(template(res));
// 		        	list_goo(1);
	 	
// 		        },
// 		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
// 		            alert("통신 실패.")
// 		        }
// 		    });
			first = firstLetter;
			last = lastLetter;
			list_goo(firstLetter, lastLetter, 1);
			
		})
	}
	
	/* function indexing_go(){
		const thisRow = $(this).closest('li');
		const firstL = thisRow.find('input[name=firstLetter]').val();
		alert(thisRow);
		console.log(thisRow);
	} */
</script>	
<script type="text/x-handlebars-template"  id="address-list-template">

	<div class="add-table">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="13%">
                                    <col width="12%">
                                    <col width="13%">
                                    <col width="13%">
                                    <col width="13%">
                                    <col width="13%">
                                    <col width="13%">
                                </colgroup>
			<thead id="theadAdress">
                                	
                                    <tr>
                                        <td><input type="checkbox" name="allCk" id="checkAll"/></td>
                                        <td><i class="fa-solid fa-star"></i></td>
                                        <td><i class="fa-solid fa-sort"></i>닉네임(표시명)</td>
                                        <td><i class="fa-solid fa-sort"></i>이름</td>
                                        <td><i class="fa-solid fa-sort"></i>직급</td>
                                        <td><i class="fa-solid fa-sort"></i>부서</td>
                                        <td>휴대폰</td>
                                        <td>이메일</td>
                                        <td>회사전화</td>
                                    </tr>
                                    
                                </thead>
	<tbody id="tbodyAdress">
                                    {{#each empList}}
	                                    <tr>
	                                        <td>
	                                        	<input type="checkbox" class="chk" name="chk" value="${emp.empl_no }"/>
	                                        </td>
	                                        <td><i class="fa-solid fa-star"></i></td>
	                                        <td>{{ncnm }}</td>
	                                        <td>{{name }} </td>
	                                        <td>{{rank }}</td>
	                                        <td>{{dept }}</td>
	                                        <td>{{phone }}</td>
	                                        <td>{{email }}</td>
	                                        <td>070-0000-0000</td>
	                                    </tr>
									{{/each }} 
                                </tbody>
						</table>
                        </div>
				{{#with pageMaker}}
                        <div class="page-btn flex ju-sp-ce">
                        <a class="p-num prev-first" href="javascript:list_goo(1);"> <i class="fas fa-angle-double-left"></i>
							</a>

							{{#loop this}}
								<a class="p-num num {{#ifCond this.cri.page this.pageNum}}on{{/ifCond}}" href="javascript:list_goo('{{this.pageNum}}');">{{this.pageNum}}</a>
							{{/loop}}

							 <a class="p-num next-last" href="javascript:list_goo('{{realEndPage}}');"> <i class="fas fa-angle-double-right"></i>
							</a>
                    </div>
                 {{/with}}      
</script>

<script>
function list_goo(firstLetter, lastLetter, page){
	
	if(!lastLetter && !page){
		page = firstLetter;
		firstLetter = first;
		lastLetter = last;
	}
	
	console.log(firstLetter)
	console.log(lastLetter)
	console.log(page)
	
	
	/* alert(firstLetter);
	alert(lastLetter); */
		const dataObj = {
	        	"page" : page,
	        	"firstLetter" : firstLetter,
	        	"lastLetter" : lastLetter
	   }
	
	    $.ajax({
	        type : "POST",            
	        url : "${pageContext.request.contextPath}/address/getPublicListByIndex",   
	        data : JSON.stringify(dataObj),            // Json 형식의 데이터이다.
	        contentType : 'application/json',
	        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	        	var template = Handlebars.compile($('#address-list-template').html());
	        	$('.add-table').remove();
	        	$('.page-btn').remove();
	        	$('.address-wrap').append(template(res));
 	
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	            alert("통신 실패.")
	        }
	    });
 }

Handlebars.registerHelper({
	   "prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
	      let dateObj=new Date(timeValue);
	      let year=dateObj.getFullYear();
	      let month=dateObj.getMonth()+1;
	      let date=dateObj.getDate();
	      return year+"-"+month+"-"+date;
	   },
	   "setDate":function(dateValue){ //Handlbars에 날짜출력함수 등록
		  let dateObj=new Date(dateValue);
	  
		  let month = String((dateObj.getMonth() + 1).toString());
		  let mm = month.length >= 2 ? month : new Array(2 - month.length + 1).join("0") + month;
		  let date = String((dateObj.getDate() + 1).toString());
		  let dd = date.length >= 2 ? date : new Array(2 - date.length + 1).join("0") + date;
		  
       let year=dateObj.getFullYear();
	      
	      return year+"-"+mm+"-"+dd;
	   },
	   "openedCheck":function(opened){
	     let result = "공개";
	     if(opened == '0'){
	      	result="비공개";
	     }
	      return result;                    
	   },
	   "workCheck":function(work){
		  let result = "자유 출퇴근으로 설정";
	      if(work == '0') {
	    	  result = "지정된 시간으로 설정";
	      }
	    	return result;
	   },
	   "dayCheck":function(day){
		   let result = "";
		   if(day == 'y'){
			   result = "on";
		   }
		   return result;
	   },
	   "ifCond":function(v1, v2, options) {
		
		  if(v1 == v2) {
		    return options.fn(this);
		  }
		  return options.inverse(this);
		},
	   "worksetCheck": function (options) {
		    if(this.begintime.substring(0,2) != '00'){
		    	return options.fn(this);
		    }
		    return options.inverse(this);
		},
		"loop":function(data, options) {
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
		}

	});
</script>


<%@ include file="/WEB-INF/include/footer.jsp" %>
