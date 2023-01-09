<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
    <div class="club-top">
                            <div class="club-creinfo mb-30">
                                <table class="club-detail">
                                    <tbody>
                                        <tr>
                                            <td colspan="2">
                                                <label>동호회 명</label>
                                                <input type="text" id="clubName" autocomplete="off">
                                            </td>
                                            
                                            <td colspan="2">
                                                <label>동호회장</label>
                                                <input type="text" id="clubMaster" autocomplete="off">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>개설 날짜</label>
                                                <c:set var="todayDate"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
                                            	<input type="text" id="today" value="${todayDate }" disabled/>
                                            	
                                            </td>
                                            
                                            <td>
                                                <label>최소인원</label>
                                                <input type="text" id="minMember" autocomplete="off">
                                            </td>

                                            <td>
                                                <label>최대인원</label>
                                                <input type="text" id="maxMember" autocomplete="off">
                                            </td>
                                            
                                             <td>
                                                <label>동호회 컨셉</label>
                                                <input type="text" id="clubConcept" autocomplete="off" placeholder="ex)코딩,자바,파이썬">
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td colspan="2">
                                                <label>대상</label>
                                                <div class="club-sel flex ju-sp-bt al-it-ce">
                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>전체</label>
                                                        <input type="radio" name="target" value="a">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>부서원</label>
                                                        <input type="radio" name="target" value="d">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>여자</label>
                                                        <input type="radio" name="target" value="f">
                                                    </div>

                                                    <div class="flex ju-sp-bt al-it-ce">
                                                        <label>남자</label>
                                                        <input type="radio" name="target" value="m">
                                                    </div>
                                                </div>
                                            </td>
                                            
                                             <td colspan="2">
                                                <label>모집 기간</label>
                                              

                                                <ul class="club-date flex al-it-ce">
                                                    <li>
                                                        <label>
                                                            	시작
                                                        </label>
                                                        <input type="date" id="startDate" autocomplete="off">
                                                    </li>

                                                    <li>
                                                        <label>
                                                           	 종료
                                                        </label>
                                                        <input type="date" id="endDate" autocomplete="off">
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                                
                            </div>
                            
                            <div id="customClubArea">
                            
                            </div>
                     
    		</div>
      