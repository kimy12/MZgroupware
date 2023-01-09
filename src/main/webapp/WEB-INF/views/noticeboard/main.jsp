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
                            <h4>Community</h4>
                            <p>주요 공지사항에 대해 공유할 수 있는 공간으로 입니다.</p>
                        </div>

                            
                     

                        <div class="top-bg">
                            <img src="<%=request.getContextPath() %>/resources/images/topbg02.png">
                        </div>
                    </div>


                    <h3 class="club-title"><i class="fa-solid fa-volume-high"></i> 베스트 커뮤니티</h3>
                    <div class="club-wrap flex flex-wrap">
                       

                        <div class="club-box">
                                 <div class="club-bg"></div>
     
                                 <div class="club-credate flex ju-sp-bt al-it-ce">
                                    <div><i class="fa-solid fa-clock"></i>
                                     매주 일요일 저녁 6시
                                     </div> 
     
                                     <div class="mem-t">
                                         모집중
                                     </div>
                                 </div>
     
                                 <div class="club-title">
                                     석희의 코딩교실<input type="hidden" class="club_no" value="1">
                                 </div>
     
                                 <div class="club-concept">
                                     <span>#코딩</span>
                                 <span>#스터디</span>
                                 </div>
     
                                 <div class="club-person flex ju-sp-bt al-it-ce">
                                     <button type="button" class="club-btn">
                                         가입하기
                                     </button>
     
                                     <div class="club-user">
                                         <i class="fa-solid fa-users"></i> 0 / 13</div>
                                 </div>
                             </div>
                             <div class="club-box">
                                 <div class="club-bg"></div>
     
                                 <div class="club-credate flex ju-sp-bt al-it-ce">
                                    <div><i class="fa-solid fa-clock"></i>
                                     매주 일요일 저녁 6시
                                     </div> 
     
                                     <div class="mem-t">
                                         모집중
                                     </div>
                                 </div>
     
                                 <div class="club-title">
                                     음악 동호회<input type="hidden" class="club_no" value="2">
                                 </div>
     
                                 <div class="club-concept">
                                     <span>#음악</span>
                                 <span>#기타</span>
                                 <span>#노래</span>
                                 </div>
     
                                 <div class="club-person flex ju-sp-bt al-it-ce">
                                     <button type="button" class="club-btn">
                                         가입하기
                                     </button>
     
                                     <div class="club-user">
                                         <i class="fa-solid fa-users"></i> 0 / 15</div>
                                 </div>
                             </div>

                             <div class="club-box">
                                <div class="club-bg"></div>
    
                                <div class="club-credate flex ju-sp-bt al-it-ce">
                                   <div><i class="fa-solid fa-clock"></i>
                                    매주 일요일 저녁 6시
                                    </div> 
    
                                    <div class="mem-t">
                                        모집중
                                    </div>
                                </div>
    
                                <div class="club-title">
                                    음악 동호회<input type="hidden" class="club_no" value="2">
                                </div>
    
                                <div class="club-concept">
                                    <span>#음악</span>
                                <span>#기타</span>
                                <span>#노래</span>
                                </div>
    
                                <div class="club-person flex ju-sp-bt al-it-ce">
                                    <button type="button" class="club-btn">
                                        가입하기
                                    </button>
    
                                    <div class="club-user">
                                        <i class="fa-solid fa-users"></i> 0 / 15</div>
                                </div>
                            </div>

                            <div class="club-box">
                                <div class="club-bg"></div>
    
                                <div class="club-credate flex ju-sp-bt al-it-ce">
                                   <div><i class="fa-solid fa-clock"></i>
                                    매주 일요일 저녁 6시
                                    </div> 
    
                                    <div class="mem-t">
                                        모집중
                                    </div>
                                </div>
    
                                <div class="club-title">
                                    음악 동호회<input type="hidden" class="club_no" value="2">
                                </div>
    
                                <div class="club-concept">
                                    <span>#음악</span>
                                <span>#기타</span>
                                <span>#노래</span>
                                </div>
    
                                <div class="club-person flex ju-sp-bt al-it-ce">
                                    <button type="button" class="club-btn">
                                        가입하기
                                    </button>
    
                                    <div class="club-user">
                                        <i class="fa-solid fa-users"></i> 0 / 15</div>
                                </div>
                            </div>
                    </div>

                    <div class="dash-list">
                        <div class="flex ju-sp-bt flex-wrap">

                            <div class="dash-con mb-20">
                                <div class="dash-header dhe01 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-list"></i> 중요 공지
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td>부서</td>
                                                <td>제목</td>
                                                <td>작성자</td>
                                                <td>작성일</td>
                                                <td>조회수</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/warning.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/warning.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/warning.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/warning.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>


                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/warning.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>


                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con mb-20">
                                <div class="dash-header dhe02 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-list"></i> 최근 경조사
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td>부서</td>
                                                <td>제목</td>
                                                <td>작성자</td>
                                                <td>작성일</td>
                                                <td>조회수</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/icon_d.jpg"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/icon_d.jpg"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/icon_d.jpg"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/icon_d.jpg"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>


                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/icon_d.jpg"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe04 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-paper-plane"></i> 최근 자유게시판 게시물
                                    </div>

                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                
                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td>부서</td>
                                                <td>제목</td>
                                                <td>작성자</td>
                                                <td>작성일</td>
                                                <td>조회수</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/new.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/new.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/new.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>

                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/new.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>


                                            <tr>
                                                <td><img src="<%=request.getContextPath() %>/resources/images/new.png"></td>
                                                <td>인사</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="dash-con">
                                <div class="dash-header dhe03 flex ju-sp-bt">
                                    <div>
                                        <i class="fa-solid fa-trash-can"></i> 최근 생성된 동호회
                                    </div>
                                
                                    <div>
                                        <i class="fa-solid fa-up-right-from-square"></i>
                                        <i class="fa-solid fa-arrow-rotate-left"></i>
                                    </div>
                                </div>

                                <div class="dash-list-table">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="22%">
                                            <col width="13%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td>대상</td>
                                                <td>제목</td>
                                                <td>생성자</td>
                                                <td>생성일</td>
                                                <td>가입인원</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td><img src="../img/club.png"></td>
                                                <td>전체</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12/20</td>
                                            </tr>

                                            <tr>
                                                <td><img src="../img/club.png"></td>
                                                <td>전체</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12/20</td>
                                            </tr>

                                            <tr>
                                                <td><img src="../img/club.png"></td>
                                                <td>전체</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12/20</td>
                                            </tr>

                                            <tr>
                                                <td><img src="../img/club.png"></td>
                                                <td>전체</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12/20</td>
                                            </tr>

                                            <tr>
                                                <td><img src="../img/club.png"></td>
                                                <td>전체</td>
                                                <td>제목</td>
                                                <td>베베</td>
                                                <td>2022-01-01</td>
                                                <td>12/20</td>
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
    
 <%@ include file="/WEB-INF/include/footer.jsp" %>