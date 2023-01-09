<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>동호회 명</label>
     <input type="text" id="clubName" autocomplete="off">
     
     <label>동호회장</label>
      <input type="text" id="clubMaster" autocomplete="off">
      
      <label>개설 날짜</label>
       <input type="text">
       
      
       <label>최소인원</label>
       <input type="text" id="minMember" autocomplete="off">
   

   
       <label>최대인원</label>
       <input type="text" id="maxMember" autocomplete="off">
     
        
        <label>동호회 컨셉</label>
        <input type="text"  id="clubConcept" autocomplete="off">
        
        <div class="flex ju-sp-bt al-it-ce">
            <label>전체</label>
            <input type="radio" name="target" value="a">
        </div>

        <div class="flex ju-sp-bt al-it-ce">
            <label>부서원</label>
            <input type="radio" name="target" value="a">
        </div>

        <div class="flex ju-sp-bt al-it-ce">
            <label>여자</label>
            <input type="radio" name="target" value="a">
        </div>

        <div class="flex ju-sp-bt al-it-ce">
            <label>남자</label>
            <input type="radio" name="target" value="a">
        </div>
        
        <label>
              	시작
          </label>
          <input type="date" id="startDate" autocomplete="off">
      
          <label>
             	 종료
          </label>
          <input type="date" id="endDate" autocomplete="off">
      
</body>
</html>