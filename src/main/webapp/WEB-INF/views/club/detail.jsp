<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="clubDetail" value="${dataMap.clubDetail }" />
<c:set var="clubMemList" value="${dataMap.clubMemList }" />
<c:set var="conceptList" value="${dataMap.conceptList }" />



<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>
		
		<div id="modal" class="modal-wrap"></div>
	        <div class="modal-con modal49">
	        	<div class="club-creinfo clubModify-modal">
	                <h3>동호회 수정</h3>
	
	               <table class="club-detail">		
	       	          <tbody>
	       	          	<form id="club-modify-form" method="POST" enctype="multipart/form-data" >
	       	          	<c:forEach items="${clubDetail }" var="detail">
	                        <tr>
	                            <td>
                                    <div class="club-bg">
                                    	<label for="fileUploadRoot"><i class="fa-solid fa-images"></i></label>
	                                    <input type="file" id="fileUploadRoot" name="uploadPicture" hidden="hidden"/>
	                                    <input type="hidden" name="club_unity" value="${detail.club_unity }">
                                    </div>
                                </td>
	                        </tr>
	
							<tr>
                                <td class="flex">
                                	<input type="hidden" name="club_no" value="${detail.club_no }">
                                    <label>동호회 명</label>
                                    <div>
                                    <input type="text" name="club_nm" value="${detail.club_nm }">
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="flex">
                                    <label>동호회 컨셉</label>
                                    <div>
                                    <input type="text" name="content" value='<c:forEach items="${conceptList }" var="concept">${concept.content },</c:forEach>'>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="flex">
                                    <label>대상</label>
                                    <div class="club-sel flex ju-sp-bt al-it-ce">
                                        <div class="flex ju-sp-bt al-it-ce">
                                            <label>전체</label>
                                            <input type="radio" name="target" value="a" <c:if test="${detail.target eq 'a'}">checked="checked"</c:if> />
                                        </div>

                                        <div class="flex ju-sp-bt al-it-ce">
                                         
                                            <label>부서원</label>
                                            <input type="radio" name="target" value="d" <c:if test="${detail.target eq 'd'}"> checked="checked" </c:if> />
                                        </div>

                                        <div class="flex ju-sp-bt al-it-ce">
                                            <label>여자</label>
                                            <input type="radio" name="target" value="f" <c:if test="${detail.target eq 'f'}">checked="checked"</c:if>/>
                                        </div>

                                        <div class="flex ju-sp-bt al-it-ce">
                                            <label>남자</label>
                                            <input type="radio" name="target" value="m" <c:if test="${detail.target eq 'm'}">checked="checked"</c:if>/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
	
	                        <tr>
	                            <td class="flex">
		                   		<label>모임 날짜</label>
                                   <ul>
<!--                                        <li> -->
<!--                                            <label>주간</label> -->
<!--                                            <input type="radio"> -->

<!--                                            <select> -->
<!--                                                <option>1</option> -->
<!--                                                <option>2</option> -->
<!--                                                <option>3</option> -->
<!--                                                <option>4</option> -->
<!--                                                <option>5</option> -->
<!--                                            </select> -->
<!--                                            일 -->
<!--                                        </li> -->

                                       <li>
                                       	  <div class="flex al-it-ce">
	                                           <label>
	                                               시작
	                                           </label>
	                                           <input type="time" id="meetingstart" style="margin-right: 20px;" onchange="changetime()">
	                                           
	                                           <label>
	                                               종료
	                                           </label>
	                                           <input type="time"  id="meetingend" onchange="changetime()">
                                          </div>
                                       </li>

                                   </ul>
	                            </td>
	                        </tr>
	                        
	                        <tr>
                               <td class="week">
                                   <ul style="text-align: center;">
                                       <li style="margin-right:0;">
                                           <span name="meetingWeek" onclick="selectWeek(this)">월</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">화</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">수</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">목</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">금</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">토</span>
                                           <span name="meetingWeek" onclick="selectWeek(this)">일</span>
                                       </li>
                                   </ul>
                               </td>
                           </tr>
							<tr>
	                      		<td>
	                      			<div class="flex al-it-ce">
                                    <label>모집 기간</label>
                                     <ul class="flex al-it-ce">
                                         <li>
                                          <div class="flex al-it-ce">
                                             <label>
                                                 시작
                                             </label>
                                             <input type="date"  style="margin-right: 20px;" name="startdate" value="${fn:replace(detail.startdate , '/', '-') }">
                                           
                                             
                                             <label>
                                                 종료
                                             </label>
                                             <input type="date" name="enddate" value="${fn:replace(detail.enddate , '/', '-') }">
                                           </div>
                                         </li>

                                     </ul>
                                     </div>
                                </td>
                           </tr>
                           </c:forEach>
                           </form>
	                    </tbody>
	                </table>
	
	
	            </div>
	        
	        
	            <div class="modal-btn flex ju-sp-ce">
	                <button id="close" class="close-core">취소</button>
	                <button class="regist" onclick="rClick();">전송</button>
	            </div>
	            
	    </div>

		<div class="container flex">


			<div class="content">

				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<h1>
						동호회<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
							2서브메뉴
						</span>
					</h1>

				</div>

				<div class="p-wrap">


					<div class="club-detail">
						<c:forEach items="${clubDetail }" var="detail">
							<div class="club-info mb-30">
								<div class="top-club">
									<div class="info-c flex ju-sp-bt al-it-ce">
										<div class="mem-c flex al-it-ce">
											<div class="club-bg" style="background-image: url('<%=request.getContextPath()%>/club/getPicture?unityatchmnflno=${detail.club_unity }')"></div>
		
											<ul>
												<li>
													<div class="isClubName">
													<h3>${detail.club_nm }</h3>
													</div>
													<button type="button" onclick="javascript:openModal('modal49');" class="modiBtn"><i class="fa-solid fa-gear"></i></button>
												</li>

												<li><span>동호회장 : </span> ${detail.president }</li>

												<li><span>개설날짜 : </span> ${detail.regdate }</li>

<%-- 												<li><span>개설날짜 : </span> <fmt:formatDate --%>
<%-- 														value="${detail.regdate }" pattern="yyyy-MM-dd" /></li> --%>

												<li><span>모집기간 : </span> 상시모집</li>

												<li><span>컨셉 : </span> <c:forEach
														items="${conceptList }" var="concept"> 
                                                	#${concept.content }
                                                </c:forEach></li>

												<li><span>대상 : </span> 전체</li>
											</ul>
										</div>

										<div class="mem-u">
											<h3>모집중</h3>
											<em>${detail.cntOfCurrentMem } / <span>${detail.max_ppl }</span></em>
										</div>
									</div>

									<ul class="club-tap flex">
										<li><a href="#ctab01" class="on">멤버</a></li>
										<li><a href="#ctab02" onclick="noticereset()">공지사항</a></li>
										<li><a href="#ctab03" onclick="freeBoardreset()">자유게시판</a></li>
										<li><a href="#ctab04" onclick="imagereset()">갤러리</a></li>
									</ul>
								</div>
							</div>


							<div class="club-joinBtn flex">
								<c:if test="${loginEmp.ncnm ne detail.president}">
									<button class="regist">가입하기</button>
								</c:if>
								<a href="<%=request.getContextPath()%>/club/list"><button
										class="back">목록으로</button></a>
							</div>
						</c:forEach>
						<div class="club-tabContent">
							<div id="ctab01" class="c-tabcon01">

								<table>
									<colgroup>
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
										<col width="12%">
										<col width="10%">
										<col width="10%">
										<col width="18%">
									</colgroup>

									<thead>
										<tr>
											<th><i class="fa-solid fa-sort"></i>이름</th>
											<th>부서명</th>
											<th>가입신청일</th>
											<th>생년월일</th>
											<th>성별</th>
											<th>H.P</th>
											<th>가입상태</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${clubMemList }" var="mem">
											<tr>
												<td>${mem.ncnm }</td>
												<td>${mem.dept }</td>
												<td><fmt:formatDate value="${mem.joindate }"
														pattern="yyyy-MM-dd" /></td>
												<td>${mem.birth }</td>
												<td>${mem.gender }</td>
												<td>${mem.hp }</td>
												<td><c:choose>
														<c:when test="${mem.state eq 'N' }">
		                                            승인대기
		                                            </c:when>
														<c:when test="${mem.state eq 'Y' }">
		                                            승인완료
		                                            </c:when>
													</c:choose></td>
												<c:forEach items="${clubDetail }" var="detail">
													<td class="flex"><input type="hidden" class="memno"
														value="${mem.memno }"> <%-- <c:if test=""></c:if> --%>
														<c:if test="${mem.state eq 'N' }">
															<c:if test="${loginEmp.ncnm eq detail.president}">
																<button type="button" class="im-c approval">가입승인</button>
																<input type="hidden" class="memno"
														value="${mem.memno }">
																<button type="button" class="de-c">가입거절</button>
															</c:if>
														</c:if></td>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<div id="ctab02" class="c-tabcon02">

								<div class="notice-table">
									<div class="caption n-caption flex ju-sp-bt">
										<div class="flex al-it-ce">

											<div class="num-view ">


												<div class="num-tog tog01 flex ju-sp-bt al-it-ce">
													<span id="perPageView">정렬구분</span> <i
														class="fa-solid fa-angle-down"></i>
												</div>

												<ul class="num-b nb01" style="display: none;"
													id="perPageList">
													<li onclick="changePerPage(this);">2개씩<input
														type="hidden" value="2"></li>
													<li onclick="changePerPage(this);">5개씩<input
														type="hidden" value="5"></li>
													<li onclick="changePerPage(this);">10개씩<input
														type="hidden" value="10"></li>
													<li onclick="changePerPage(this);">20개씩<input
														type="hidden" value="20"></li>
												</ul>
											</div>

											<div class="list-select">
												<img
													src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
													id="sort-Desc-Off" onclick="sortNoticeChange(this);"
													hidden="hidden"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
													id="sort-Desc-On"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
													id="sort-Asc-Off" onclick="sortNoticeChange(this);"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
													id="sort-Asc-On" hidden="hidden">
											</div>
										</div>
										<input type="hidden" name="nowNoticeSort" value="desc"> <input
											type="hidden" name="perPageNum" value="5">

										<button class="regist"
											onclick="location.href='<%=request.getContextPath()%>/club/registform?club_no=${clubDetail[0].club_no }&clubboardtype_no=1'">
											<i class="fa-solid fa-pen"></i> 작성하기
										</button>
									</div>

									<table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="47%">
                                    <col width="8%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                </colgroup>

                                <thead>
                                    <tr>
                                      
                                        <td class="txt-c">
                                            <span>no</span>
                                        </td>
                                        <td>제목</td>
                                        <td class="txt-c">첨부파일</td>
                                        <td class="txt-c">작성자</td>
                                        <td class="txt-c">작성일</td>
                                       <!--  <td class="txt-c">댓글</td> -->
                                        <td class="txt-c">조회수</td>
                                    </tr>
                                </thead>

										<tbody id="noticeL">


										</tbody>

									</table>

									<div class="page-btn flex" id="noticePage">
									
									</div>
								</div>
							</div>

							<div id="ctab03" class="c-tabcon03">
								<div class="notice-table">
									<div class="caption n-caption flex ju-sp-bt">

										<div class="flex al-it-ce">
											<div class="num-view ">
												<div class="num-tog tog01 flex ju-sp-bt al-it-ce">
													<span id="perPageViewBoard">정렬구분</span> <i class="fa-solid fa-angle-down"></i>
												</div>

												<ul class="num-b nb01" style="display: none;"
													id="perPageList">
													<li onclick="changePerPageBoard(this);">2개씩<input
														type="hidden" value="2"></li>
													<li onclick="changePerPageBoard(this);">5개씩<input
														type="hidden" value="5"></li>
													<li onclick="changePerPageBoard(this);">10개씩<input
														type="hidden" value="10"></li>
													<li onclick="changePerPageBoard(this);">20개씩<input
														type="hidden" value="20"></li>
												</ul>
											</div>

											<div class="list-select">
												<img
													src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
													id="1sort-Desc-Off" onclick="sortBoardChange(this);"
													hidden="hidden"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
													id="1sort-Desc-On"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
													id="1sort-Asc-Off" onclick="sortBoardChange(this);"> <img
													src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
													id="1sort-Asc-On" hidden="hidden">
											</div>
										</div>
										<input type="hidden" name="nowBoardSort" value="desc">
										<input type="hidden" name="perPageNumBoard" value="5">	

										<button class="regist"
											onclick="location.href='<%=request.getContextPath()%>/club/registform?club_no=${clubDetail[0].club_no }&clubboardtype_no=2'">
											<i class="fa-solid fa-pen"></i> 작성하기
										</button>
									</div>

									<table>
  								 <colgroup>
                                    <col width="5%">
                                    <col width="7%">
                                    <col width="8%">
                                    <col width="13%">
                                    <col width="37%">
                                    <col width="9%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="7%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td></td>
                                        <td class="txt-c">
                                            <!--<span>no</span>-->
                                            <span>
                                               <span>no</span>
                                            </span>
                                        </td>
                                        
                                       <td>구분</td> 
                                        <td>작성자</td>
                                        <td>제목</td>
                                       
                                        <td>작성일</td>
                                        <td class="txt-c">댓글수</td>
                                        <td class="txt-c">조회수</td>
                                        <td class="txt-c">좋아요</td>
                                    </tr>
                                </thead>

										<tbody id="boardL">

										</tbody>

									</table>


									<div class="page-btn n-pbtn flex" id="boardPage">
									
									
									</div>
								</div>
							</div>












							<div id="ctab04" class="c-tabcon04">
								<div class="notice-table">
									<div class="caption n-caption flex ju-sp-bt">

										<div class="flex al-it-ce">
											<div class="num-view ">
												<div class="num-tog tog01 flex ju-sp-bt al-it-ce">
													<span>정렬구분</span> <i class="fa-solid fa-angle-down"></i>
												</div>

												<ul class="num-b nb01" style="display: none;">
													<li>2개씩</li>
													<li>5개씩</li>
													<li>10개씩</li>
													<li>20개씩</li>
												</ul>
											</div>

<%-- 											<div class="list-select">
												<img
													src="<%=request.getContextPath() %>/resources/images/sort-Asc.png">
												<img
													src="<%=request.getContextPath() %>/resources/images/sort-AscOn.png">
												<img
													src="<%=request.getContextPath() %>/resources/images/sort-Desc.png">
												<img
													src="<%=request.getContextPath() %>/resources/images/sort-DescOn.png">
											</div> --%>
										</div>
										<button class="regist"
											onclick="location.href='<%=request.getContextPath()%>/club/registform?club_no=${clubDetail[0].club_no }&clubboardtype_no=3'">
											<i class="fa-solid fa-pen"></i> 작성하기
										</button>
									</div>
									<ul class="gallery flex flex-wrap mb-30" id="imageL">

									</ul>

								</div>

								<div class="page-btn flex ju-sp-ce" id="imagePage">
								
								
								
								</div>
							</div>
						</div>


					</div>
				</div>

			
			</div>
			
	<c:if test="${from eq 'remove' }">
       		<script>
	      		Swal.fire({
			 	title: "삭제되었습니다.",
	               icon: 'success',
	               confirmButtonColor: '#3085d6',
	               confirmButtonText: '확인'
	           }).then((result) => {
	               if (result.isConfirmed) {
			        window.location.reload()													                       
	               }
	           })	
       		</script>	
    </c:if>
    
	<c:if test="${from eq 'regist' }">
       		<script>
		       	Swal.fire({
				 	title: "등록되었습니다.",
	                icon: 'success',
	                confirmButtonColor: '#3085d6',
	                confirmButtonText: '확인'
	            }).then((result) => {
	                if (result.isConfirmed) {
				        window.location.reload()													                       
	                }
	            })	
       		</script>	
    </c:if>
			
		</div>
	</div>
	<script type="text/javascript">
	function rClick(){
		var formData = new FormData(document.querySelector('#club-modify-form'));
		formData.append("meetingtime",JSON.stringify(meetingtime));
// 		console.log(formData);
// 		for (var pair of formData.entries()) {
// 			  console.log(pair[0]+ ', ' + pair[1]);
// 			}
		
// 		if(true){ 
// 			console.log(form);
// 			return;
// 		}
		$.ajax({             
	    	type: "post",
	        url: "option/modify",        
	        data: formData,   
	        processData: false,
	        contentType: false,

	        success: function (res) { 
	   
	        	Swal.fire({
						icon: 'success',
	                    title: '수정이 완료되었습니다.',
				}).then((result)=>{
	                       window.location.reload();
	                   });          
	        	    
	        },          
	        error: function (e) {  
	        	Swal.fire({
					icon: 'error',
                    title: '수정이 실패했습니다.',
			});      
	         }     
		});  
		
	};
	<c:if test="${!empty clubDetail[0].meetingtime }">
	var meetingtime = ${clubDetail[0].meetingtime};
	</c:if>
	<c:if test="${empty clubDetail[0].meetingtime }">
	var	meetingtime = {
				"월" : false,
				"화" : false,
				"수" : false,
				"목" : false,
				"금" : false,
				"토" : false,
				"일" : false,
				"meetingstart": $('#meetingstart').val(),
				"meetingend": $('#meetingend').val()
	};
	</c:if>
	function settingMTime(){
		
		
		var meetArr = document.querySelectorAll('[name="meetingWeek"]');
		
		for(var meet of meetArr){
			if($(meet).text() != "meetingstart" && $(meet).text() != "meetingend"){
				if(meetingtime[$(meet).text()]){
					$(meet).attr("class","on");
				}
			}
		}
		$('#meetingstart').val(meetingtime["meetingstart"]);
		$('#meetingend').val(meetingtime["meetingend"]);
	}
	settingMTime();
	
	function selectWeek(obj){
		meetingtime["meetingstart"] =$('#meetingstart').val();
		meetingtime["meetingend"] = $('#meetingend').val();
		if($(obj).attr("class")=="on"){
			$(obj).attr("class","");
			meetingtime[$(obj).text()]=false;
		}else{
			$(obj).attr("class","on");
			meetingtime[$(obj).text()]=true;
		}
		console.log(meetingtime);
	}
	function changetime(){
		meetingtime["meetingstart"] =$('#meetingstart').val();
		meetingtime["meetingend"] = $('#meetingend').val();
	}
</script>
	<script>

   	function sortNoticeChange(obj) {

		if (obj == $('#sort-Asc-Off').get(0)) {
			$('#sort-Desc-On').hide();
			$(obj).hide();
			$('#sort-Asc-On').show();
			$('#sort-Desc-Off').show();
			$('input[name="nowNoticeSort"]').val("asc");
			noticereset();
			
		}

		if (obj == $('#sort-Desc-Off').get(0)) {
			$('#sort-Asc-On').hide();
			$(obj).hide();
			$('#sort-Desc-On').show();
			$('#sort-Asc-Off').show();
			$('input[name="nowNoticeSort"]').val("desc");
			noticereset();
		}
	}
	function changePerPage(obj) {

		document.querySelector('#perPageView').innerText = obj.innerText;
		$(".num-b.nb01").slideToggle();
		$("input[name=perPageNum]").val($(obj).children("input").val());

		noticereset();
	}
  
    function detail_go(url,clubboard_no,clubboardtype_no){
 	   location.href=url+"?clubboard_no="+clubboard_no+"&clubboardtype_no="+clubboardtype_no+"&from=list";
    }

       function detail_goo(url,clubboard_no,unityatchmnflno){
    	   location.href=url+"?clubboard_no="+clubboard_no+"&unityatchmnflno="+unityatchmnflno;
       }
      
       //갤러리 이미지
       MemberPictureThumb('<%=request.getContextPath()%>');
		
		function MemberPictureThumb(contextPath){
			 for(var target of document.querySelectorAll('.gallery-img')){	
				 var unity = target.getAttribute('data-id');
				 
				 target.style.backgroundImage="url('"+contextPath+"/club/getPicture?unityatchmnflno="+unity+"')";
				 target.style.backgroundPosition="center";
				 target.style.backgroundRepeat="no-repeat";
				 target.style.backgroundSize="cover";
			}
		}
       
		// 동호회 가입 승인
 		const approval = document.querySelectorAll('.approval');
		// 가입 거절
 		const reject = document.querySelectorAll('.de-c');
 		for(let i=0; i<reject.length; i++){
 			reject[i].addEventListener('click', function(){
 				
 				Swal.fire({
					title: '가입거절 하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소'
				}).then((result)=> {
					if (result.isConfirmed){
						const data = {
		       					memno : $(this).prev().val()
		       			}
						
						/* console.log(data); */
		       				$.ajax({
		       					url : '<%=request.getContextPath()%>/club/deleteMem',
		       					type : 'post',
		       					data : JSON.stringify(data),
		       					contentType : 'application/json',
		       					success : function(result){
		       						if(result == 'success'){
		       						Swal.fire({
	       								icon: 'success',
	       			                    title: '가입거절이 완료되었습니다.',
	       						}).then((result)=>{
		       	 	                       window.location.reload();
		       	 	                   })
		       							/* window.location.reload(); */
		       						}
		       					},
		       					error : function(error){
		       					Swal.fire({
								  text: "현재 거절이 불가합니다.",
								  icon: "error",
								  button: "확인",
							});
		       					}
		       				});  
						
					}
				})
 			})
 		}
 		
       	
       	/* alert(approval.length); */
       	for (let i=0; i<approval.length; i++){
       		approval[i].addEventListener('click', function(){
       			//alert($(this).prev().val());
       			
       			Swal.fire({
					title: '가입승인 하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소'
				}).then((result)=> {
					if (result.isConfirmed){
						const data = {
		       					memno : $(this).prev().val()
		       			}
		       				$.ajax({
		       					url : '<%=request.getContextPath()%>/club/updateStatus',
		       					type : 'post',
		       					data : JSON.stringify(data),
		       					contentType : 'application/json',
		       					success : function(result){
		       						if(result == 'success'){
		       						Swal.fire({
		       								icon: 'success',
		       			                    title: '가입승인이 완료되었습니다.',
		       						}).then((result)=>{
		       	 	                       window.location.reload();
		       	 	                   })
		       						}
		       					},
		       					error : function(error){
		       					Swal.fire({
								  text: "현재 승인이 불가합니다.",
								  icon: "error",
								  button: "확인",
							});
		       					}
		       				}); 
						
					}
				})
       		})
       	}
       	
       
       	
		var replyPage2=1;
		function imagereset(){
			 replyPage2=1;
			 image();
		}
		
		function image(){
			replyPage2=1;
			console.log(replyPage2);
			getPage2("<%=request.getContextPath()%>/club/image/${clubDetail[0].club_no }/"+replyPage2);
		}
			$("#imagePage").on('click','a',function(event){		
				/*  alert($(this).attr("href"));   */
				 replyPage2=$(this).attr("href");
			getPage2("<%=request.getContextPath()%>/club/image/${clubDetail[0].club_no }/"+replyPage2);
				return false;
			});
       	
		function getPage2(pageInfo){	 
			$.getJSON(pageInfo,function(data){	
				console.log(data);
 				printData2(data.clubGalleryList.selectGalleryListByClubNo,$("#imageL"),$('#image-list-template'));
 				printImagePagination(data.clubGalleryList.pageMaker,$("#imagePage"),$('#image-pagination-template')); 
			});
		} 	
       	
        function printData2(data,target,templateObject){

            var template=Handlebars.compile(templateObject.html());
            var html = template(data);   
            target.html(html);
      }
        function printImagePagination(pageMaker,target,templateObject){
        	console.log(pageMaker);
        	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
        	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
        		pageNumArray[i]=pageMaker.startPage+i;
        	}	
        	pageMaker.pageNum=pageNumArray;  
        	pageMaker.prevPageNum=pageMaker.startPage-1;
        	pageMaker.nextPageNum=pageMaker.endPage+1;
        	
        	var template=Handlebars.compile(templateObject.html());	
        	var html = template(pageMaker);	
        	target.html("").html(html);
        }
		
        
        

        
		
 		var nowBoardSort;
		var boardPage=1;
		var perPageNumBoard;
		function freeBoardreset(){
			
			perPageNumBoard=($('input[name="perPageNumBoard"]').val());
			console.log(perPageNumBoard);
			nowBoardSort=($('input[name="nowBoardSort"]').val());
			boardPage=1;
			 board();
		}
		
		function board(){
			perPageNumBoard=($('input[name="perPageNumBoard"]').val());
			nowBoardSort=($('input[name="nowBoardSort"]').val());
			getFreeBoardPage("<%=request.getContextPath()%>/club/board/${clubDetail[0].club_no }/"+boardPage+"/"+nowBoardSort+"/"+perPageNumBoard);
			
		}

			$('#boardPage').on('click','a',function(event){		
				perPageNumBoard=($('input[name="perPageNumBoard"]').val());
				nowBoardSort=($('input[name="nowBoardSort"]').val());
				/* alert($(this).attr("href")); */
 				boardPage=$(this).attr("href");
				
 				getFreeBoardPage("<%=request.getContextPath()%>/club/board/${clubDetail[0].club_no }/"+boardPage+"/"+nowBoardSort+"/"+perPageNumBoard);
				
				
				return false;
			});
       	
		function getFreeBoardPage(pageInfo){	 			
			$.getJSON(pageInfo,function(data){	
				printFreeBoardData(data.clubFreeBoardMap.selectClubBoardList,$("#boardL"),$('#board-list-template'));
				printFreeBaordPagination(data.clubFreeBoardMap.pageMaker,$("#boardPage"),$('#board-pagination-template')); 
			});
		}
       	
        function printFreeBoardData(data,target,templateObject){

            var template=Handlebars.compile(templateObject.html());
            var html = template(data);   
            target.html(html);
      }
		
        function printFreeBaordPagination(pageMaker,target,templateObject){
        	console.log(pageMaker);
        	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
        	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
        		pageNumArray[i]=pageMaker.startPage+i;
        	}	
        	pageMaker.pageNum=pageNumArray;  
        	pageMaker.prevPageNum=pageMaker.startPage-1;
        	pageMaker.nextPageNum=pageMaker.endPage+1;
        	
        	var template=Handlebars.compile(templateObject.html());	
        	var html = template(pageMaker);	
        	target.html("").html(html);
        }
		
       	function sortBoardChange(obj) {

    		if (obj == $('#1sort-Asc-Off').get(0)) {
    			$('#1sort-Desc-On').hide();
    			$(obj).hide();
    			$('#1sort-Asc-On').show();
    			$('#1sort-Desc-Off').show();
    			$('input[name="nowBoardSort"]').val("asc");
    			freeBoardreset();
    		}

    		if (obj == $('#1sort-Desc-Off').get(0)) {
    			$('#1sort-Asc-On').hide();
    			$(obj).hide();
    			$('#1sort-Desc-On').show();
    			$('#1sort-Asc-Off').show();
    			$('input[name="nowBoardSort"]').val("desc");
    			freeBoardreset();
    		}
    	}
    	function changePerPageBoard(obj) {

    		document.querySelector('#perPageViewBoard').innerText = obj.innerText;
    		$(".num-b.nb01").slideToggle();
    		$("input[name=perPageNumBoard]").val($(obj).children("input").val());

    		freeBoardreset();
    	}
        
        
        
        

        

		var noticePage=1;
		var nowNoticeSort="";
		var perPageNum=0;

       	function noticereset(){
			perPageNum=($('input[name="perPageNum"]').val());
			nowNoticeSort=($('input[name="nowNoticeSort"]').val());
			noticePage=1;
       		notice();
       	}
		function notice(){
			perPageNum=($('input[name="perPageNum"]').val());
			nowNoticeSort=($('input[name="nowNoticeSort"]').val());
			getNoticePage("<%=request.getContextPath()%>/club/notice/${clubDetail[0].club_no }/"+noticePage+"/"+nowNoticeSort+"/"+perPageNum);
			
		}
		$('#noticePage').on('click','a',function(event){		
			nowSort=($('input[name="nowNoticeSort"]').val());
			perPageNum=($('input[name="perPageNum"]').val());
			/* alert($(this).attr("href")); */
				noticePage=$(this).attr("href");
				console.log(nowSort);
				getNoticePage("<%=request.getContextPath()%>/club/notice/${clubDetail[0].club_no }/"+noticePage+"/"+nowNoticeSort+"/"+perPageNum);
			
			return false;
		});
		
		function getNoticePage(pageInfo){	 
			$.getJSON(pageInfo,function(data){	
				printNoticeData(data.clubNoticeBoardMap.clubNoticeBoardList,$("#noticeL"),$('#notice-list-template'));
				printNoticePagination(data.clubNoticeBoardMap.pageMaker,$("#noticePage"),$('#notice-pagination-template'));
			});
		}

		
		
		
        function printNoticeData(data,target,templateObject){

            var template=Handlebars.compile(templateObject.html());
            var html = template(data);   
            target.html(html);
      }
        
        function printNoticePagination(pageMaker,target,templateObject){
        	console.log(pageMaker);
        	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
        	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
        		pageNumArray[i]=pageMaker.startPage+i;
        	}	
        	pageMaker.pageNum=pageNumArray;  
        	pageMaker.prevPageNum=pageMaker.startPage-1;
        	pageMaker.nextPageNum=pageMaker.endPage+1;
        	
        	var template=Handlebars.compile(templateObject.html());	
        	var html = template(pageMaker);	
        	target.html("").html(html);
        }
        
        
        
        
        
        
        
        
        Handlebars.registerHelper({
        	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
        		var dateObj=new Date(timeValue);
        		var year=dateObj.getFullYear();
        		var month=dateObj.getMonth()+1;
        		var date=dateObj.getDate();
        		return year+"-"+month+"-"+date;
        	},
        	"VisibleByLoginCheck":function(replyer){
        		var result="none";		
        		if(replyer == "${loginUser.id}") result="visible";		
        		return result;						  
        	},
        	"signActive":function(pageNum){
        		if(pageNum == noticePage) return 'on';
        	},
        	"signActive1":function(pageNum){
        		if(pageNum == boardPage) return 'on';
        	},
        	"signActive2":function(pageNum){
        		if(pageNum == replyPage2) return 'on';
        	},
        	'userImg':function(dataId){
   			 let contextPath = '<%=request.getContextPath()%>';
   			 let path = "url('"+contextPath+"/club/getPicture?unityatchmnflno="+dataId+"')";
   			 
   			 
   			 return path;
   			
   			}
        	
        });
       
        
       </script>
	<script type="text/x-handlebars-template" id="image-list-template">
{{#each .}}  
				<input type="hidden" name="clubboard_no" value={{clubboard_no}}>
				<input type="hidden" name="unityatchmnflno" value={{unityatchmnflno}}>
                   <li onclick="detail_goo('galleryDetail',{{clubboard_no}},{{unityatchmnflno}})">
                      <div class="g-bg gallery-img" style="background:{{userImg unityatchmnflno}}; 
		background-position: center center; background-repeat: no-repeat; background-size: cover;">
                      </div>

                      <div class="g-title">
                       <p>{{clubboard_title }}</p>
                       <span value={{clubboard_rgdt }}></span>
                      </div>
                 </li>
                                          
{{/each}}               
                              
</script>
	<script type="text/x-handlebars-template" id="notice-list-template">
{{#each .}}  
			 <tr onclick=" detail_go('detail',{{clubboard_no}},{{clubboardtype_no}})">>
				
			   <td class="txt-c"><span>1</span></td>
			 <td>{{clubboard_title }}</td>
			 <td class="txt-c"><i class="fa-solid fa-file-lines"></i></td>
			   <td class="txt-c">{{ncnm }}</td>
	         <td class="txt-c">{{#prettifyDate clubboard_rgdt }} {{/prettifyDate}}</td>
			
			 <td class="txt-c">{{clubboard_cnt }}</td>
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



	<script type="text/x-handlebars-template" id="notice-pagination-template">


   <a class="p-num prev prev-first" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">
   		<i class="fas fa-angle-double-left"></i>
   </a>
   

   
{{#each pageNum}}
		<a var="pageNum" class="p-num num {{signActive this}}" href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0">{{this}}</a>	
{{/each}}

   
   <a class="p-num next-last" href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
		<i class="fas fa-angle-double-right"></i>
   </a>

</script>
	<script type="text/x-handlebars-template" id="board-pagination-template">

<div class="page-btn flex ju-sp-ce">
   <a class="p-num prev prev-first" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0">
   		<i class="fas fa-angle-double-left"></i>
   </a>
   
   
{{#each pageNum}}
		<a var="pageNum" class="p-num num {{signActive1 this}}" href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0">{{this}}</a>	
{{/each}}

   
   <a class="p-num next-last" href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
		<i class="fas fa-angle-double-right"></i>
   </a>
</div>
</script>

	<script type="text/x-handlebars-template" id="board-list-template">
{{#each .}}  
			 <tr onclick=" detail_go('detail',{{clubboard_no}},{{clubboardtype_no}})">>
			   <td class="txt-c"></td>
			   <td class="txt-c">
			  <span>1</span>
			                     
			 </td>
		     <td>업무관련</td>
			 <td>{{ncnm}}</td>
			 <td>{{clubboard_title }}</td>
	         <td>{{#prettifyDate clubboard_rgdt }} {{/prettifyDate}}</td>
		     <td class="txt-c">{{clubreply_count}}</td>
			 <td class="txt-c">{{clubboard_cnt }}</td>
			 <td class="txt-c">{{clubboard_like }}</td>
			</tr>
                                          
{{/each}}

</script>
	<%@ include file="/WEB-INF/include/footer.jsp"%>