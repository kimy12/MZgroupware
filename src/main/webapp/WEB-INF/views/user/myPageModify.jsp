<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
 

   <div class="wrap">
 


            <div class="container flex">
              

            <div class="content">
                    <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                        <h1>User profile</h1> 

                        <div class="mypageBtn">
                            <button class="modi">수정</button>
                        </div>
                    </div>

               
                    <div class="mypage-wrap">
                        <div class="mybox flex">
                           <div class="mb01">
                               <div class="user-pro">
                                </div>

                                <h3>엘리자베스</h3>
                                
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
                                                    <label>사원명 : </label>
                                                    <span><input type="text"></span>
                                                </div>
                                              </td>

                                              <td>
                                                <div class="flex al-it-ce">
                                                    <label>생년월일 : </label>
                                                    <span><input type="date"></span>
                                                </div>
                                              </td>

                                              <td>
                                                <div class="flex al-it-ce">
                                                    <label>생년월일 : </label>
                                                    <span>
                                                        <select>
                                                            <option>남</option>
                                                            <option>여</option>
                                                        </select>
                                                    </span>
                                                </div>
                                              </td>

                                              <td>
                                                
                                              </td>
                                          </tr>

                                          <tr>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>기본주소 : </label>
                                                    <span><input type="text"></span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>상세주소1 : </label>
                                                    <span><input type="text"></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>상세주소2 : </label>
                                                    <span><input type="text"></span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>P.H : </label>
                                                    <span><input type="text"></span>
                                                </div>
                                            </td>
                                        </tr>


                                          <tr>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>사원번호 : </label>
                                                    <span>tsetf0001</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>ID : </label>
                                                    <span>tsetf0001</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>PW : </label>
                                                    <span>******</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>Email : </label>
                                                    <span>tesdddddt@mail.or.kr</span>
                                                </div>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>부서 : </label>
                                                    <span>경영지원</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>부서 : </label>
                                                    <span>마케팅1팀</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>직급 : </label>
                                                    <span>대리</span>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="flex al-it-ce">
                                                    <label>입사일 : </label>
                                                    <span>2022-02-01</span>
                                                </div>
                                            </td>
                                        </tr>
                                      </tbody>
                                  </table>
                               </div>
                             </div>
                        </div>

                        <div class="my-pageTab">
                            <ul class="flex">
                                <li><a href="#my01page" class="on">나의 일감</a></li>
                                <li><a href="#my02page">평가된 워크플로우</a></li>
                                <li><a href="#my03page">내가 올린 게시글</a></li>
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
                                            <col width="20%">
                                            <col width="8%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img"></div></td>
                                                <td>ai프로젝트 </td>
                                                <td>경영지원부 전미영 부장</td>
                                                <td>0000-00-00</td>
                                                <td><span class="s-tip">진행</span></td>
                                                <td>0000-00-00 ~ 0000-00-00</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                                <td>
                                                    <i class="fa-solid fa-pen"></i>
                                                    <i class="fa-solid fa-xmark"></i>
                                                </td>
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
                                            <col width="20%">
                                            <col width="8%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img"></div></td>
                                                <td>ai프로젝트 </td>
                                                <td>경영지원부 전미영 부장</td>
                                                <td>0000-00-00</td>
                                                <td><span class="n-tip">신규</span></td>
                                                <td>0000-00-00 ~ 0000-00-00</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                                <td>
                                                    <i class="fa-solid fa-pen"></i>
                                                    <i class="fa-solid fa-xmark"></i>
                                                </td>
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
                                            <col width="20%">
                                            <col width="8%">
        
                                        </colgroup>
        
                                        <tbody>
                                            <tr>
                                                <td><div class="modi-img"></div></td>
                                                <td>ai프로젝트 </td>
                                                <td>경영지원부 전미영 부장</td>
                                                <td>0000-00-00</td>
                                                <td><span class="c-tip">마감</span></td>
                                                <td>0000-00-00 ~ 0000-00-00</td>
                                                <td>곽수민, 전미영, 조보명, 방진호, 한석희, 김유신</td>
                                                <td>
                                                    <i class="fa-solid fa-pen"></i>
                                                    <i class="fa-solid fa-xmark"></i>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div id="my02page" class="report-list">

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
        
                                    <div class="page-btn flex">
                                        <a href="#" class="p-num prev"><span>prev</span></a>
        
                                        <a href="#" class="p-num num on"><span>1</span></a>
                                        <a href="#" class="p-num num"><span>2</span></a>
                                        <a href="#" class="p-num num"><span>3</span></a>
        
                                        <a href="#" class="p-num next"><span>next</span></a>
                                       
                                    </div>
                                </div>
                            </div>

                            <div id="my03page" class="notice-table">
                                <div class="caption n-caption flex ju-sp-bt">
    
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
                                            <td class="txt-c"><img src="../img/warning.png"></td>
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
                                            <td class="txt-c"><img src="../img/warning.png"></td>
                                            <td class="txt-c">
                                                <!--<span>1</span>-->
                                                <span>
                                                    <input type="checkbox">
                                                </span>
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
    
    
                                <div class="page-btn n-pbtn flex">
                                    <a href="#" class="p-num prev"><span>prev</span></a>
    
                                    <a href="#" class="p-num num on"><span>1</span></a>
                                    <a href="#" class="p-num num"><span>2</span></a>
                                    <a href="#" class="p-num num"><span>3</span></a>
    
                                    <a href="#" class="p-num next"><span>next</span></a>
                                   
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="page-btn flex ju-sp-ce">
                        <a href="#" class="p-num prev"><span>prev</span></a>

                        <a href="#" class="p-num num on"><span>1</span></a>
                        <a href="#" class="p-num num"><span>2</span></a>
                        <a href="#" class="p-num num"><span>3</span></a>

                        <a href="#" class="p-num next"><span>next</span></a>
                       
                    
                    </div>


            </div>
       </div>
       
       </div>
</body>
</html>