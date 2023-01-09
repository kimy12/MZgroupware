<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>" />
<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>
		<div class="container flex">


			<div class="content">

			<form action="<%=request.getContextPath()%>/eventboard/regist" method="POST">
				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<div>
						<h1>
							경조사 작성<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
								2서브메뉴
							</span>
						</h1>
					</div>
					
					<div class="flex ju-sp-ce">
							<button type="button" class="back" onclick="window.history.back()"><i class="fa-solid fa-rotate-left"></i>뒤로가기</button>
						<button type="submit" class="regist"><i class="fa-solid fa-floppy-disk"></i>작성하기</button>
					</div>
				</div>

				<div class="writer-box flex ju-sp-bt">
					<div class="w-box w01">


						<div class="w-sec">
							<table>
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>

								<tbody>
									<tr>
										<th>구분</th>
										<td><select name="eboard_status">
												<option value="0">부고</option>
												<option value="1">결혼</option>
												<option value="2">생일</option>
												<option value="3">돌잔치</option>
												<option value="4">기타</option>
										</select></td>
									</tr>

									<tr>
										<th>제목</th>
										<td><input type="text" id="title" name="board_title"
											placeholder="제목을 쓰세요.">
										</td>
									</tr>
									<tr>
										<th>일 시</th>
										<td>
											 <div>
	                             		       <input type="date" name="eboard_date" id="eboard_date">
	                            		    </div>
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td class="name">${loginEmp.name } 
										<input type="hidden" name="board_writer" value="${loginEmp.empl_no }"> 
										
										
										</td>
									</tr>


									<tr>
										<th>기능설정</th>
										<td>
											<div style="margin-bottom:0;">
													<input type="checkbox" id="settings" name="pin" > <label for="settings">상단 고정 여부</label>
											</div> 
										</td>
									</tr>

									
								
								</tbody>
							</table>


							<div class="editor mt-10">
								<textarea id="summernote" name="board_cont"></textarea>
							</div>
						</div>


					</div>




				</div>


			</form>
			</div>
			</div>
		</div>
		
		
		
		<script>
			summernote_go($('#summernote'),'<%=request.getContextPath()%>');
		
			
		</script>
		
		
		

</body>
</html>