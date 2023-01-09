<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="conceptList" value="${dataMap.conceptList }" />

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>


            <div class="container flex">
              

            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>동호회<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
                <div class="sear-box flex">
                        <div class="work-state">
                            <div class="select-tog flex ju-sp-bt al-it-ce">
	                            <span>선택</span>
	                            <i class="fa-solid fa-caret-down"></i>
                            </div>
                            <ul class="tog-b" style="display: none;">
                                <li>전체</li>
                                <li>제목</li>
                                <li>내용</li>
                                <li>작성자</li>
                            </ul>
                        </div>
                            
                        <input id="search" type="text" placeholder="Search">
                    </div>
                </div>

                    <div class="club-wrap flex flex-wrap">
                        
                   <c:forEach items="${clubList }" var="club">     
					<div class="club-box">
                            <div class="club-bg"<c:if test="${club.club_unity ne -1 }"> style="background-image: url('<%=request.getContextPath()%>/club/getPicture?unityatchmnflno=${club.club_unity }')" </c:if> ></div>

                            <div class="club-credate flex ju-sp-bt al-it-ce">
                               <div role="meetingtime" mtime='${club.meetingtime }'><i class="fa-solid fa-clock"></i>
<!--                                 매주 일요일 저녁 6시 -->
                                </div> 
								<c:choose>
								<c:when test="${club.cntOfCurrentMem ne club.max_ppl }">
	                                <div class="mem-t">
	                                    모집중
	                                </div>
	                            </c:when>
	                            <c:otherwise>
	                                <div class="mem-d">
	                                    모집마감
	                                </div>
	                            </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="club-title">
                                ${club.club_nm }
                                
                            </div>

                            <div class="club-concept">
                                <c:forEach items="${conceptList }" var="concept">
                            <c:if test="${concept.club_no eq club.club_no }">
                                <span>#${concept.content }</span>
                            </c:if>
                                </c:forEach>
                            </div>

                            <div class="club-person flex ju-sp-bt al-it-ce">
                            	<input type="hidden" class="club_no" value="${club.club_no}">
	                            <c:choose>
	                            	<c:when test="${club.clubMember eq '1' }">
		                                <button type="button"  onclick="detail_go('${club.club_no}')" class="club-btn visit">
		                                    방문하기
		                                </button>
	                                </c:when>
	                                <c:otherwise>
	                                	<button type="button" class="club-btn join">
	                                	<!-- <button type="button" class="club-btn join"> -->
		                                    가입하기
		                                </button>
	                                </c:otherwise>
	                            </c:choose>

                                <div class="club-user">
                                    <i class="fa-solid fa-users"></i> ${club.cntOfCurrentMem } / ${club.max_ppl}
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    
				 </div>
				 <div class="page-btn flex ju-sp-ce" id="noticePage">


				   <a class="p-num prev prev-first" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">
				   		<i class="fas fa-angle-double-left" aria-hidden="true"></i>
				   </a>
				   
				
				   <a var="pageNum" class="p-num num on" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a>	
				
				   
				   <a class="p-num next-last" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">
						<i class="fas fa-angle-double-right" aria-hidden="true"></i>
				   </a>
				</div>
				
				</div>
            </div>
       </div>
       <script>
       		function meetingTimeFormat(data){
       			console.log(data.length);
       			if(data.length != 0){
	       			var ndata = JSON.parse(data);
// 	       			console.log(ndata);
	       			var arr = [];
	       			var meetTime = "";
	       			var outText = "";
	       			for(var key in ndata){
	       				if(ndata[key] == true){
	       					arr.push(key);
	       				}
	       				if(key=="meetingstart"){
	       					meetTime =ndata["meetingstart"];
	       				}
	       			}
// 	       			console.log(arr);
	       			outText = arr.join();
	       			outText += " "+meetTime;
// 	       			console.log(outText);
					return outText;
       			}
       		}
       		var mtimearr =  document.querySelectorAll("[role='meetingtime']")
			for (var mtt of mtimearr){
				var mttText = meetingTimeFormat($(mtt).attr("mtime"));
				if(mttText == null){
					mttText = "미정";
				}
				$(mtt).append(mttText);
			}
       </script>
       <script>
       
       		function detail_go(clubNo){
       			location.href=clubNo;
       		}
       		
       		const userEmplno = "${loginEmp.empl_no}";
       		const userNcnm = "${loginEmp.ncnm}";
       		const userDept = "${loginEmp.dept}";
       		const userBirth = "<fmt:formatDate value="${loginEmp.birth }" pattern="yyyy-MM-dd"/>";
       		const userGender = "${loginEmp.gender}";
       		const userHp = "${loginEmp.phone}";
       		
       		const clubNo = document.querySelectorAll(".club_no");
       		const joinBtn = document.querySelectorAll(".join");
       		
       		for(let i=0; i<clubNo.length; i++){
       			joinBtn[i].addEventListener('click', function(e){
       				
       				/* alert($(this).prev().val()); */
       				
       				const dataNo = {
       						"ncnm" : userNcnm,
       						"club_no" : $(this).prev().val()
       				}
       				
       				const data = {
	       					"club_no": $(this).prev().val(),
	       					"ncnm" : userNcnm,
	       					"empl_no" : userEmplno,
	       					"dept" : userDept,
	       					"birth" : userBirth,
	       					"gender" : userGender,
	       					"hp" : userHp
	       				}
       				$.ajax({
       					url : '<%=request.getContextPath()%>/club/countMem',
       					type : 'post',
       					data : JSON.stringify(dataNo),
       					contentType : 'application/json',
       					success : function(result){
       						if(result != 0){
       							Swal.fire({
       			                    icon: 'warning',
       			                    title: '이미 가입신청이 완료되었습니다.',
       			                    text: '동호회장의 승인을 기다려주세요.',
       			                })
       			                
       						} else {
       							joiningProcess(data);
       						}
       					},
       					error : function(error){
       						alert('실패되었습니다');
       					}
       				});
       				
       				  
       				 
       			});
       		}
       		
       		
       		
        	function joiningProcess (data){
       		Swal.fire({
					title: '동호회에 가입 하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '가입',
                cancelButtonText: '취소'
				}).then((result)=> {
					if (result.isConfirmed){
						
		       				
		       				$.ajax({
		       					url : '<%=request.getContextPath()%>/club/joiningClub',
		       					type : 'post',
		       					data : JSON.stringify(data),
		       					contentType : 'application/json',
		       					success : function(result){
		       						if(result == 'success'){
		       						Swal.fire(
		       	                            '가입요청이 완료되었습니다.',
		       	                            '동호회장의 승인이 필요합니다.',
		       	                            'success'
		       	                        )
		       							/* window.location.reload(); */
		       						}
		       					},
		       					error : function(error){
		       					Swal.fire({
								  text: "현재 가입이 불가합니다.",
								  icon: "error",
								  button: "확인",
							});
		       					}
		       				}); 
						
					}
				})
       	} 
       	
       </script>
  <%@ include file="/WEB-INF/include/footer.jsp" %>