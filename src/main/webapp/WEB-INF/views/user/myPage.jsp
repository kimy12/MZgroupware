<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
 

   <div class="wrap">
   		<div id="modal" class="modal-wrap" style="display: none;"></div>
   		<div class="modal-con modal50" style="display: none;">
            <div class="att-modal">
                <h3>비밀번호 변경</h3>

               <table>		
       	          <tbody>
                        <tr>
                            <td class="flex">
                                <label>현재 비밀번호</label>
                                <div>
                                    <input type="text" name="presentPwd">
                                </div>
                            </td>
                            
                            <td class="flex">
                                <label>새 비밀번호</label>
                                <div>
                                    <input type="text" name="newPwd">
                                </div>
                            </td>
                            
                             <td class="flex">
                                <label>새 비밀번호 확인</label>
                                <div>
                                    <input type="text" name="password">
                                </div>
                            </td>
                        </tr>


                    </tbody>
                </table>


            </div>
        
        
            <div class="modal-btn flex ju-sp-ce">
                <button type="button" id="close" class="close-core">취소</button>
                <button type="button" onClick="password_ch()" class="regist">전송</button>
            </div>
    </div>
   
   
 		<%@ include file="/WEB-INF/include/topbar.jsp" %>


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>User profile</h1> 

                        <div class="mypageBtn" onclick="mypageModiBefore()">
                            <button class="modi"><i class="fa-solid fa-pen"></i>수정하기</button>
                        </div>
                        
                         
                        <div class="mypageModiBtn flex flex-end">
		                    <button type="button" class="back" onClick="window.location.reload()"><i class="fa-solid fa-rotate-left"></i>취소</button>
		                    <button type="button" onclick="regist_go()" class="regist"><i class="fa-solid fa-floppy-disk"></i>저장하기</button>
		                </div>
                       
                    </div>

               
                    <div class="mypage-wrap">
                        <div class="mybox flex">
                           <div class="mb01">
                           		<form id="myImgForm" role="myImgformGo" class="form-horizontal" method="post" enctype="multipart/form-data">		   
                           
	                              	<div class="user-pro" id="myBg" data-id="${myInfo.id }">
	                               		<label for="inputfile"><i id="userImgBg" class="fa-solid fa-gear"></i></label>
	                                	<input id="inputfileName" class="form-control" type="hidden" />
	                                
	                                	<div id="userImgModi" class="modiBgBtn" style="display:none">
			                           		<i class="fa-solid fa-arrows-rotate" onclick="upload_go()" ></i>
			                           		<i class="fa-solid fa-xmark" onClick="window.location.reload()"></i>
		                           		</div>
	                                </div>
	                                <input type="hidden" name="photo" />
                                </form>

                                <h3>${myInfo.ncnm }</h3>
                                
                                <div class="my-score flex al-it-ce ju-sp-ce">
                                    <i class="fa-solid fa-star on"></i>
                                    <i class="fa-solid fa-star on"></i>
                                    <i class="fa-solid fa-star on"></i>
                                    <i class="fa-solid fa-star on"></i>
                                    <i class="fa-solid fa-star on"></i>
                                    <span class="total">Total score 90</span>
                                </div>

                                <div class="feed-like">
                                    <span class="total">Total score 90</span>
                                </div>
                            </div>


							<form id="myPageInforMation" role="form" class="form-horizontal" method="post" enctype="multipart/form-data">
                            <div class="mb02">
                               <div class="mypage-infocontent">
                                  <table>
                                      <colgroup>
	                                        <col width="25%">
                                      </colgroup>
                                      <tbody>
                                          <tr>
                                          	<td>
                                                <div class="flex al-it-ce">
                                                    <label>사원번호 : </label>
                                                    <span>${myInfo.empl_no }</span>
                                                    
                                                </div>
                                            </td>
                                          
                                              <td>
                                                <div class="flex al-it-ce">
                                                    <label>사원명 : </label>
                                                    <span>${myInfo.name }</span>
                                                    <div class="onInfoText">
                                                    	<input type="text" name="name" value="${myInfo.name }"/>
                                                    </div>
                                                </div>
                                              </td>

                                              <td>
                                                <div class="flex al-it-ce">
                                                    <label>생년월일 : </label>
                                                    <span><fmt:formatDate value="${myInfo.birth }" pattern="yyyy년 MM월 dd일" /></span>
                                                    
                                                    <div class="onInfoText">
                                                    	<input type="date" name="birth" value="<fmt:formatDate value="${myInfo.birth }" pattern="yyyy-MM-dd" />"/> 
                                                    </div>
                                                </div>
                                              </td>

                                              <td>
                                                <div class="flex al-it-ce">
                                                    <label>성별 : </label>
                                                    <span>${myInfo.gender }</span>
                                                    <div class="onInfoText">
	                                                    <select name="gender" accesskey="">
	                                                    	<option value="MALE" <c:if test="${myInfo.gender eq 'MALE'}">selected="selected" </c:if>>MALE</option>
	                                                    	<option value="FEMALE" <c:if test="${myInfo.gender eq 'FEMALE'}">selected="selected" </c:if>>FEMALE</option>
	                                                    </select>
                                                    </div>
                                                </div>
                                              </td>

                                          </tr>

                                          <tr>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>기본주소 : </label>
                                                    <span>${myInfo.bassadres }</span>
                                                    <div class="onInfoText">
                                                    	<input type="text" name="bassadres" value="${myInfo.bassadres }"/>
                                                    </div>
                                                </div>
                                               
                                            </td>
                                            
                                            <td colspan="2">
                                            	 
                                                 <div class="flex al-it-ce">
                                                    <label>상세주소1 : </label>
                                                    <span>${myInfo.detailadres }</span>
                                                    <div class="onInfoText">
                                                    	<input type="text" name="detailadres" value="${myInfo.detailadres }"/>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>
                                                 <div class="flex al-it-ce">
                                                    <label>P.H : </label>
                                                    <span><fmt:formatNumber var="phone" value="${myInfo.phone }" pattern="000-00000-0000"/></span>
                                                    <div class="onInfoText">
                                                    	<input type="text" name="phone" value="${myInfo.phone }"/>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>


                                          <tr>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>ID : </label>
                                                    <span>${myInfo.id }</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>PW : </label>
                                                    <span>******</span>
                                                    <input type="hidden" name="mypassword" value="${myInfo.password }"/>
                                                    <a href="javascript:openModal('modal50');">
                                        				<i class="fa-solid fa-pen"></i>
                                       				</a>
                                                </div>
                                            </td>

                                            <td colspan="2">
                                                <div class="flex al-it-ce">
                                                    <label>Email : </label>
                                                    <span>${myInfo.email }</span>
                                                    <div class="onInfoText">
                                                    	<input type="text" name="email" value="${myInfo.email }"/>
                                                    </div>
                                                </div>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>부서 : </label>
                                                    <span>${myInfo.dept }</span>
                                                </div>
                                            </td>


                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>직급 : </label>
                                                    <span>${myInfo.rank }</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>입사일 : </label>
                                                    <span><fmt:formatDate value="${myInfo.encpn }" pattern="yyyy년 MM월 dd일" /></span>
                                                </div>
                                            </td>
                                            
                                             <td>
                                                <div class="flex al-it-ce">
                                                    <label>IP : </label>
                                                    <span>${myInfo.ip }</span>
                                                    
                                                     <div class="onInfoText">
                                                    	<input type="text" name="ip" value="${myInfo.ip }"/>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                      </tbody>
                                  </table>
                               </div>
                             </div>
                             </form>
                        </div>


					
                        <div class="my-pageTab">
                            <ul class="flex">
                                <li><a href="#my01page" class="on">나의 일감</a></li>
                                <!-- <li><a href="#my02page">평가된 워크플로우</a></li>
                                <li><a href="#my03page">내가 올린 게시글</a></li> -->
                            </ul>

                            <div id="my01page" class="project-list">
                                <div class="table-title">
                                   <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="22%">
                                            <col width="18%">
                                            <col width="12%">
                                            <col width="12%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="8%">
                                        </colgroup>
                                       <thead>
                                           <tr>
                                                <td></td>
                                                <td>업무명</td>
                                                <td>업무 생성자</td>
                                                <td>업무 생성일</td>
                                                <td>업무 상태</td>
                                                <td>업무 기간</td>
                                                <td>업무 담당자</td>
                                                <td></td>
                                           </tr>
                                       </thead>
                                    </table>
                                </div>
                                
                                <div class="project-con s-table">
                                    <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="22%">
                                            <col width="18%">
                                            <col width="12%">
                                            <col width="12%">
                                            <col width="20%">
                                            <col width="28%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img us01"></div></td>
                                                <td>근태 시간 스크립트, 버그 마무리, 얼굴인식 스크립트 설계</td>
                                                <td>전산팀 곽수민 대리</td>
                                                <td>2022-05-17</td>
                                                <td><span class="s-tip">진행</span></td>
                                                <td>2022-05-17 ~ 2022-05-14</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
        
                                <div class="project-con n-table">
                                    <table>
                                        <colgroup>
                                             <col width="8%">
                                            <col width="22%">
                                            <col width="18%">
                                            <col width="12%">
                                            <col width="12%">
                                            <col width="20%">
                                            <col width="28%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img us02"></div></td>
                                                <td>파일 업로드 이슈 해결 및 서머노트 이미지 업로드</td>
                                                <td>전산팀 방진호 대리</td>
                                                <td>2022-05-10</td>
                                                <td><span class="n-tip">신규</span></td>
                                                <td>2022-05-10 ~ 2022-05-18</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
        
                                <div class="project-con c-table">
                                    <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="22%">
                                            <col width="18%">
                                            <col width="12%">
                                            <col width="12%">
                                            <col width="20%">
                                            <col width="28%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img us03"></div></td>
                                                <td>시나리오 수정에 대한 대폭 수정 </td>
                                                <td>전산팀 김유신 대리</td>
                                                <td>2022-04-20</td>
                                                <td><span class="c-tip">마감</span></td>
                                                <td>2022-04-20 ~ 2022-04-23</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                           
			                           
                            </div>

                            <%-- <div id="my02page" class="report-list">

                                <div class="list-table">
                                    <div class="caption flex ju-sp-bt">
        
                                        <div class="flex al-it-ce">
                                            <div class="num-view ">
                                                <div class="num-tog tog01 flex ju-sp-bt al-it-ce">
                                                    <span>정렬구분</span>
                                                    <i class="fa-solid fa-angle-down"></i>
                                                </div>
        
                                                <ul class="num-b nb01" style="display: none;">
                                                    <li>2개씩</li>
                                                    <li>5개씩</li>
                                                    <li>10개씩</li>
                                                    <li>20개씩</li>
                                                </ul>
                                            </div>
        
                                            <div class="list-select">
                                                <img src="../img/sort-Asc.png">
                                                <img src="../img/sort-AscOn.png">
                                                <img src="../img/sort-Desc.png">
                                                <img src="../img/sort-DescOn.png">
                                            </div>
                                        </div>
        
                                      
                                      
                                    </div>
        
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="15%">
                                            <col width="25%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
        
                                        <thead>
                                            <tr>
                                                <th><i class="fa-solid fa-star"></i></th>
                                                <th>no</th>
                                                <th>합의신청일</th>
                                                <th>부서</th>
                                                <th>합의상태</th>
                                                <th>합의종류</th>
                                                <th>제목</th>
                                                <th>합의요청자</th>
                                                <th>합의담당자</th>
                                            </tr>
                                        </thead>
        
                                        <tbody>
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>1</td>
                                                <td>2022.02.01<br> 00:00:00</td>
                                                <td class="o-title"><div>대덕그룹</div></td>
                                                <td><span class="b">완료</span></td>
                                                <td class="o-title"><div>실적dddddddddddddddddd보고</div></td>
                                                <td class="t-title">
                                                    <div>
                                                        두줄 되면 ... 처리 되게 해놨어!!!!!!! 정렬버튼 구현 해주고요 리스트 목록은 10개씩으로 해줘~!!
                                                    </div>
                                                </td>
                                                <td class="o-title"><div>전미영, 김유신, 방진호, 한석희, 조보명, 곽수민</div></td>
                                                <td>전미영 팀장</td>
                                            </tr>
        
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>2</td>
                                                <td>2022.02.01<br> 00:00:00</td>
                                                <td class="o-title"><div>대덕그룹</div></td>
                                                <td><span class="y">진행</span></td>
                                                <td class="o-title"><div>실적dddddddddddddddddd보고</div></td>
                                                <td class="t-title">
                                                    <div>
                                                        두줄 되면 ... 처리 되게 해놨어!!!!!!! 정렬버튼 구현 해주고요 리스트 목록은 10개씩으로 해줘~!!
                                                    </div>
                                                </td>
                                                <td class="o-title"><div>전미영, 김유신, 방진호, 한석희, 조보명, 곽수민</div></td>
                                                <td>전미영 팀장</td>
                                            </tr>
        
                                            
                                            <tr>
                                                <td><i class="fa-solid fa-star"></i></td>
                                                <td>3</td>
                                                <td>2022.02.01<br> 00:00:00</td>
                                                <td class="o-title"><div>대덕그룹</div></td>
                                                <td><span class="p">반려</span></td>
                                                <td class="o-title"><div>실적dddddddddddddddddd보고</div></td>
                                                <td class="t-title">
                                                    <div>
                                                        두줄 되면 ... 처리 되게 해놨어!!!!!!! 정렬버튼 구현 해주고요 리스트 목록은 10개씩으로 해줘~!!
                                                    </div>
                                                </td>
                                                <td class="o-title"><div>전미영, 김유신, 방진호, 한석희, 조보명, 곽수민</div></td>
                                                <td>전미영 팀장</td>
                                            </tr>
        
        
                                        </tbody>
                                    </table>
        
                                </div>
                            </div> --%>

                            <div id="my03page" class="notice-table">
                                <div class="caption n-caption flex flex-end">
    
                                    
    
                                  
                                   <button class="regist"><i class="fa-solid fa-pen"></i> 작성하기</button>
                                </div>
                              
                                <table>
                                    <colgroup>
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="8%">
                                        <col width="9%">
                                        <col width="33%">
                                        <col width="10%">
                                        <col width="8%">
                                        <col width="9%">
                                        <col width="6%">
                                        <col width="7%">
                                    </colgroup>
    
                                    <thead>
                                        <tr>
                                            <td class="txt-c"></td>
                                            <td class="txt-c">
                                                <!--<span>no</span>-->
                                                <span>
                                                    <input type="checkbox">
                                                </span>
                                            </td>
                                            <td><i class="fa-solid fa-sort"></i>구분</td>
                                            <td><i class="fa-solid fa-sort"></i>부서</td>
                                            <td><i class="fa-solid fa-sort"></i>제목</td>
                                            <td class="txt-c"><i class="fa-solid fa-sort"></i>첨부파일</td>
                                            <td><i class="fa-solid fa-sort"></i>작성자</td>
                                            <td><i class="fa-solid fa-sort"></i>작성일</td>
                                            <td class="txt-c">댓글</td>
                                            <td class="txt-c">조회수</td>
                                        </tr>
                                    </thead>
    
                                    <tbody>
                                       
                                     
    
                                        <tr>
                                            <td class="txt-c"></td>
                                            <td class="txt-c">
                                                <span>1</span>
                                           <!-- <span>
                                                    <input type="checkbox">
                                                </span>-->
                                            </td>
                                            <td>대덕인재</td>
                                            <td>경영지원부</td>
                                            <td>운영자는 체크박스가 나오게해주고 조회하는 사람들은</td>
                                            <td class="txt-c"><i class="fa-solid fa-file-lines"></i></td>
                                            <td>홍길동</td>
                                            <td>2022.02.01</td>
                                            <td class="txt-c">0</td>
                                            <td class="txt-c">12</td>
                                        </tr>
    
                                        <tr>
                                            <td class="txt-c"></td>
                                            <td class="txt-c">
                                                <span>1</span>
                                           <!-- <span>
                                                    <input type="checkbox">
                                                </span>-->
                                            </td>
                                            <td>대덕인재</td>
                                            <td>경영지원부</td>
                                            <td>운영자는 체크박스가 나오게해주고 조회하는 사람들은</td>
                                            <td class="txt-c"><i class="fa-solid fa-file-lines"></i></td>
                                            <td>홍길동</td>
                                            <td>2022.02.01</td>
                                            <td class="txt-c">0</td>
                                            <td class="txt-c">12</td>
                                        </tr>
    
                                      
    
                                       
                                    </tbody>
    
                                </table>
    
    
                            </div>
                        </div>

                    </div>

                   


            </div>
       </div>
       
       </div>
<form role="imageForm" action="upload/picture" method="post" 
	  enctype="multipart/form-data">
	<input id="inputfile" name="pictureFile" type="file" class="form-control"
		   onchange="picture_go();"	style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>       
       
 <script>
 	function mypageModiBefore(){
 		$('.mypageModiBtn').css('display', 'block');
 		$('.mypageBtn').css('display', 'none');
 		$('.onInfoText').css('display', 'block');
 		$('.onInfoText').siblings('span').css('display', 'none');
 	};
 	
 	function password_ch(){
 		
 		var dbPwd = $('input[name=mypassword]').val();
 		var prPwd = $('input[name=presentPwd]').val();
 		var newPwd = $('input[name=newPwd]').val();
 		var password = $('input[name=password]').val();
 		
 		console.log(dbPwd);
 		console.log(prPwd);
 		console.log(newPwd);
 		console.log(password);
 		
 		
 		var jsonData = {"password" : $('input[name=password]').val()};
 		
 		if(dbPwd == prPwd && newPwd == password){
 			 Swal.fire({
				 	title: "수정하시겠습니까?",
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            confirmButtonText: '확인',
		            cancelButtonColor: '#d33',
		            cancelButtonText: '취소'
		            
			}).then((result) => {
	 			$.ajax({
					url : '<%=request.getContextPath()%>/user/passUpdate',
					type : 'post',
					data : JSON.stringify(jsonData),
					contentType : 'application/json',
					success : function(result){
						Swal.fire({
							   title: "비밀번호 변경을 완료하였습니다.",
				               icon: 'success',
				               confirmButtonColor: '#3085d6',
				               confirmButtonText: '확인'    
						}).then((result) => {
     			        	 window.location.reload();
     			      	});
						
					},
					error : function(error){
						 alert('등록실패');
					}
				});
			}); 
 		}else{
 			Swal.fire({
				   title: "기존비밀번호 또는 신규비밀번호가 일치하지 않습니다. 다시 확인해주세요.",
	               icon: 'success',
	               confirmButtonColor: '#3085d6',
	               confirmButtonText: '확인'    
		    });
 		}
 		
 		
 	}
 	
 	
 </script>
 
 
 <script>
 	function picture_go(){
 		
 		var form = $('form[role="imageForm"]');
		var picture = form.find('[name=pictureFile]')[0];
		
		formData = new FormData($('form[role="imageForm"]')[0]);
		   
		   //이미지 확장자 jpg 확인
		   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
			if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
		   		alert("이미지는 jpg/jpeg/png 형식만 가능합니다.");
		   		picture.value="";      
		   		return;
			} 
		
			//이미지 파일 용량 체크
		   if(picture.files[0].size>1024*1024*1){
		      alert("사진 용량은 1MB 이하만 가능합니다.");
		      picture.value="";
		      return;
		   };
			
		   //업로드 확인변수 초기화 (사진변경)
		   form.find('[name="checkUpload"]').val(0);	
		   /* document.getElementById('inputFileName').value=picture.files[0].name; */
		   
		   
		   if (picture.files && picture.files[0]) {
			
				var reader = new FileReader();
				
				reader.onload = function (e) {
					 $('div#myBg').css({'background-image':'url('+e.target.result+')',
		                 'background-position':'center',
		                 'background-size':'cover',
		                 'background-repeat':'no-repeat'
		                 });
				}
				
				reader.readAsDataURL(picture.files[0]);
		}
		   
		$('#userImgBg').css('display', 'none');
		$('#userImgModi').css('display', 'block');
 	};
 	
 	function upload_go(){
		//alert('upload btn click');
		
	   if(!$('input[name="pictureFile"]').val()){
		  alert("사진을 선택하세요.");
		  $('input[name="pictureFile"]').click();
		  return;
	   	}  
	   if($('input[name="checkUpload"]').val()==1){
	      alert("이미업로드 된 사진입니다.");
	      return;      
		}
	   
	   $.ajax({
		  url: '<%=request.getContextPath()%>/user/picture',
	      data:formData,
	      type:'post',
	      processData:false,
	      contentType:false,
	      success:function(data){
	    	  //업로드 확인변수 세팅
	          $('input[name="checkUpload"]').val(1);
	          //저장된 파일명 저장.
	          $('input#oldFile').val(data); // 변경시 삭제될 파일명	
	          
	          $('form[role="myImgformGo"]  input[name="photo"]').val(data);	   
	          
	          console.log($('input[name="photo"]').val());
	          
	          
	    	  alert("사진이 업로드 되었습니다.");
	    	  imgRegist();
	    	  
	    	  
	      },
	      error:function(error){
	          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	      }
	   });
	   
	   function imgRegist(){
			var form = document.querySelector("#myImgForm");
		 	form.action = "<%=request.getContextPath()%>/user/imgRegist";
		    form.submit();
		}
	}
 	
 	function regist_go(){
 		var form = document.querySelector("#myPageInforMation");
 		
 		Swal.fire({
		 	title: "변경한 정보를 저장하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            confirmButtonText: '확인',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소'
            
		}).then((result) => {
			if (result.isConfirmed) {
			    
				Swal.fire({
					 	title: "저장되었습니다.",
			               icon: 'success',
			               confirmButtonColor: '#3085d6',
			               confirmButtonText: '확인'
			               
				 }).then((result) => {
			        	form.action = "<%=request.getContextPath()%>/user/regist";
			    	form.submit();
			     });
			}
		}); 
	    
 	}
 	
 	
 	MemberProFilePictureThumb('<%=request.getContextPath()%>');
	
	function MemberProFilePictureThumb(contextPath){
		 for(var target of document.querySelectorAll('#myBg')){	
			 var id = target.getAttribute('data-id');
			 
			 target.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?id="+id+"')";
			 target.style.backgroundPosition="center";
			 target.style.backgroundRepeat="no-repeat";
			 target.style.backgroundSize="cover";
		}
	}
	
 </script>
 <%@ include file="/WEB-INF/include/footer.jsp" %>