<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/include/topbar.jsp" %>
    
    <div class="container flex">
              

            <div class="content">
                <div class="txt-sear-box flex ju-sp-bt al-it-ce">
                    <h1>동호회<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i> 2서브메뉴</span></h1>
               
                </div>

                  
                    <div class="club-detail">
                      
                        <div class="club-top mb-30">
                            <div class="club-creinfo">
                                <table>
                                    <tbody>

                                        <tr>
                                            <td colspan="2">
                                                <div class="club-bg">
                                                    <i class="fa-solid fa-images"></i>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <label>동호회 명</label>
                                                <input type="text">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>개설 날짜</label>
                                                <input type="text">
                                            </td>

                                            <td>
                                                <label>동호회장</label>
                                                <input type="text">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>최소인원</label>
                                                <input type="text">
                                            </td>

                                            <td>
                                                <label>최대인원</label>
                                                <input type="text">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>동호회 컨셉</label>
                                                <input type="text">
                                            </td>

                                            <td>
                                                <label>대상</label>
                                                <div class="club-sel flex ju-sp-bt al-it-ce">
                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>전체</label>
                                                        <input type="radio">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>부서원</label>
                                                        <input type="radio">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>여자</label>
                                                        <input type="radio">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>남자</label>
                                                        <input type="radio">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>모임 날짜</label>
                                                <ul class="flex al-it-ce">
                                                    <li>
                                                        <label>월간</label>
                                                        <input type="radio">

                                                        <select>
                                                            <option>1</option>
                                                            <option>1</option>
                                                            <option>1</option>
                                                            <option>1</option>
                                                        </select>
                                                        일
                                                    </li>

                                                    <li>
                                                        <label>
                                                            시작
                                                        </label>
                                                        <input type="time">
                                                    </li>

                                                    <li>
                                                        <label>
                                                            종료
                                                        </label>
                                                        <input type="time">
                                                    </li>
                                                </ul>

                                                <ul class="flex al-it-ce">
                                                    <li>
                                                        <label>주간</label>
                                                        <input type="radio">

                                                        <select>
                                                            <option>매주</option>
                                                            <option>첫째</option>
                                                            <option>둘째</option>
                                                            <option>셋째</option>
                                                            <option>넷째</option>
                                                        </select>
                                                        주
                                                    </li>

                                                    <li>
                                                        <label>
                                                            시작
                                                        </label>
                                                        <input type="time">
                                                    </li>

                                                    <li>
                                                        <label>
                                                            종료
                                                        </label>
                                                        <input type="time">
                                                    </li>
                                                </ul>
                                            </td>

                                            <td>
                                                <label>모집 기간</label>
                                              

                                                <ul class="flex al-it-ce">
                                                    <li>
                                                        <label>
                                                            시작
                                                        </label>
                                                        <input type="date">
                                                    </li>

                                                    <li>
                                                        <label>
                                                            종료
                                                        </label>
                                                        <input type="date">
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td class="week">
                                                <ul>
                                                    <li>
                                                        <span class="on">월</span>
                                                        <span class="on">화</span>
                                                        <span class="on">수</span>
                                                        <span class="on">목</span>
                                                        <span class="on">금</span>
                                                        <span>토</span>
                                                        <span>일</span>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>

                                      
                                       
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>

                        <div class="page-btn flex ju-sp-ce">
                            <button class="back">뒤로가기</button>
                            <button class="regist">생성하기</button>
                        </div>
                    </div>
                
				 </div>
            </div>
       </div>
</body>
  <%@ include file="/WEB-INF/include/footer.jsp" %>
