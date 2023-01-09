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
                        <h1>부서 주소록<span>in 부서 주소록(총 <em style="color:#444">54</em>건)</span></h1> 
                       <div class="sear-box flex">
                            <div class="work-state">
                                <div class="select-tog flex ju-sp-bt al-it-ce"><span>선택</span><i class="fa-solid fa-caret-down"></i></div>
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

                    <div class="address-wrap">
                        <div class="mb-30">
                            <div class="add-sear">
                            <ul class="flex">
                                    <li><i class="fa-solid fa-user-tag"></i>주소록 추가</li>
                                    <li><i class="fa-solid fa-id-badge"></i>주소록 변경</li>
                                    <li><i class="fa-solid fa-trash-can"></i>삭제</li>
                                    <li><i class="fa-solid fa-envelope-open-text"></i>메일발송</li>
                                    <li><i class="fa-solid fa-print"></i>인쇄</li>
                            </ul>
                            </div>

                            <div class="address-modi">
                                <span><i class="fa-solid fa-id-badge"></i>주소록 추가</span>
                                <div class="downtab tab1 flex al-it-ce">
                                    <input type="text" placeholder="이름(표시명)">
                                    <input type="text" placeholder="회사">
                                    <input type="text" placeholder="분류">
                                    <input type="text" placeholder="휴대폰">
                                    <input type="text" placeholder="이메일">
                                    <input type="text" placeholder="회사전화">
                                    <button><i class="fa-solid fa-plus"></i></button>
                                </div>
                            </div>

                            
                            <div class="address-modi">
                                <span><i class="fa-solid fa-id-badge"></i>주소록 변경</span>
                                <div class="downtab tab1 flex al-it-ce">
                                    <input type="text" placeholder="이름(표시명)">
                                    <input type="text" placeholder="회사">
                                    <input type="text" placeholder="분류">
                                    <input type="text" placeholder="휴대폰">
                                    <input type="text" placeholder="이메일">
                                    <input type="text" placeholder="회사전화">
                                    <button><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>
                        </div>
                     



                        <div class="add-caption">
                            <ul class="flex">
                                <li class="on">전체</li>
                                <li>ㄱ</li>
                                <li>ㄴ</li>
                                <li>ㄷ</li>
                                <li>ㄹ</li>
                                <li>ㅁ</li>
                                <li>ㅂ</li>
                                <li>ㅅ</li>
                                <li>ㅇ</li>
                                <li>ㅈ</li>
                                <li>ㅊ</li>
                                <li>ㅋ</li>
                                <li>ㅍ</li>
                                <li>ㅎ</li>
                                <li>a-z</li>
                                <li>0-9</li>
                            </ul>
                        </div>
                        <div class="add-table">
                            <table>
                                <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                    <col width="11.25%">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><i class="fa-solid fa-star"></i></td>
                                        <td><i class="fa-solid fa-sort"></i>이름(표시명)</td>
                                        <td><i class="fa-solid fa-sort"></i>회사</td>
                                        <td><i class="fa-solid fa-sort"></i>직급</td>
                                        <td><i class="fa-solid fa-sort"></i>부서</td>
                                        <td><i class="fa-solid fa-sort"></i>팀명</td>
                                        <td>휴대폰</td>
                                        <td>이메일</td>
                                        <td>회사전화</td>
                                    </tr>
                                </thead>

                                <tbody>
                                    
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><i class="fa-solid fa-star"></i></td>
                                        <td>조보맹~</td>
                                        <td>다우오피스</td>
                                        <td>과장</td>
                                        <td>경영지원부</td>
                                        <td>마케팅1팀</td>
                                        <td>010-9999-9999</td>
                                        <td>estse011@ddit.or.kr</td>
                                        <td>070-0000-0000</td>
                                    </tr>

                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><i class="fa-solid fa-star on"></i></td>
                                        <td>별 클릭하면 이거로 바꿔주공</td>
                                        <td>다우오피스</td>
                                        <td>과장</td>
                                        <td>경영지원부</td>
                                        <td>마케팅1팀</td>
                                        <td>010-9999-9999</td>
                                        <td>estse011@ddit.or.kr</td>
                                        <td>070-0000-0000</td>
                                    </tr>

                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><i class="fa-solid fa-star on"></i></td>
                                        <td>즐겨찾기에서도 제거해죠~</td>
                                        <td>다우오피스</td>
                                        <td>과장</td>
                                        <td>경영지원부</td>
                                        <td>마케팅1팀</td>
                                        <td>010-9999-9999</td>
                                        <td>estse011@ddit.or.kr</td>
                                        <td>070-0000-0000</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                        <div class="page-btn flex">
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

<%@ include file="/WEB-INF/include/footer.jsp" %>
