<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/include/topbar.jsp"%>

		<div class="container flex">

			<div class="content">
				<div class="txt-sear-box flex ju-sp-bt al-it-ce">
					<h1>
						경조사 게시판<span>1메인메뉴 <i class="fa-solid fa-angle-right"></i>
							2서브메뉴
						</span>
					</h1>
					<div class="sear-box flex">
						<div class="work-state">
							<div class="select-tog flex ju-sp-bt al-it-ce">
								<span id="nowSearchType"> <c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}">선택</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'a'}">전체</c:when>
										<c:when test="${pageMaker.cri.searchType eq 't'}">제목</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'c'}">내용</c:when>
										<c:when test="${pageMaker.cri.searchType eq 'w'}">작성자</c:when>
									</c:choose>
								</span><i class="fa-solid fa-caret-down"></i>
							</div>
							<ul class="tog-b" style="display: none;">
								<li onclick="searchTypeChange(this);"><input type="hidden"
									value="a">전체</li>
								<li onclick="searchTypeChange(this);"><input type="hidden"
									value="t">제목</li>
								<li onclick="searchTypeChange(this);"><input type="hidden"
									value="c">내용</li>
								<li onclick="searchTypeChange(this);"><input type="hidden"
									value="w">작성자</li>
							</ul>
						</div>

						<input id="search" type="text" placeholder="Search"
							value="
		                        	<c:choose>
										<c:when test="${pageMaker.cri.searchType eq ''}"></c:when>
										<c:otherwise>${pageMaker.cri.keyword }</c:otherwise>
									</c:choose>"
							onkeypress="searchEnter(this,event);">
					</div>
				</div>

				<div class="notice-list">
					<div class="list-info flex al-it-ce">
						<div>
							<img
								src="<%=request.getContextPath()%>/resources/images/icon_infobox.png">
						</div>

						<div>
							<h2>경조사 알림 안내</h2>
							<p class="eventTxt">
								경조사가 있으신 회원님께서는 경조사 게시판 하단 오른쪽 글쓰기 버튼을 눌러 내용을 작성 완료해 주시면 게재되며, 
								그 외의 <u>불필요한 정보가 담긴 작성 글은 자동 삭제</u>가 될 수 있는 점 유의하시길 바랍니다. 
								사내 행사는 되도록 참여 부탁드리며 불참 시 각 팀의 장에게 보고 부탁드립니다.
							</p>
							<ul>
								<li>※ 경조사 관련 문의 연락처</li>
								<li><i class="fa-solid fa-phone"></i> 경영기획팀 : 사무실
									070-5526-5851</li>
								<li><i class="fa-solid fa-phone"></i> 인사팀 : 사무실
									070-6555-5851</li>
							</ul>
						</div>
					</div>

					<div class="notice-table">
						<div class="caption n-caption flex ju-sp-bt">
							<div class="flex al-it-ce">
								<div class="num-view ">
									<div class="num-tog tog01 flex ju-sp-bt al-it-ce">
										<span id="perPageView">정렬개수</span> <i
											class="fa-solid fa-angle-down"></i>
									</div>
									<ul class="num-b nb01" style="display: none;" id="perPageList">
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
									<c:if test="${nowSort eq 'desc'}">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
											id="sort-Desc-Off" onclick="sortChange(this);"
											hidden="hidden">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
											id="sort-Desc-On">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
											id="sort-Asc-Off" onclick="sortChange(this);">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
											id="sort-Asc-On" hidden="hidden">
									</c:if>
									<c:if test="${nowSort eq 'asc'}">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-Desc.png"
											id="sort-Desc-Off" onclick="sortChange(this);">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-DescOn.png"
											id="sort-Desc-On" hidden="hidden">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-Asc.png"
											id="sort-Asc-Off" onclick="sortChange(this);" hidden="hidden">
										<img
											src="<%=request.getContextPath()%>/resources/images/sort-AscOn.png"
											id="sort-Asc-On">
									</c:if>
								</div>
							</div>
							<button class="regist"
								onclick="location.href='<%=request.getContextPath()%>/eventboard/registform';">
								<i class="fa-solid fa-pen"></i> 작성하기
							</button>
						</div>

						<table class="eventListTb mb-20">
							<colgroup>
								<col width="7%">
								<col width="10%">
								<col width="55%">
								<col width="8%">
								<col width="10%">
								<col width="10%">
							</colgroup>

							<thead>
								<tr>
									<td class="txt-c"><span> NO </span></td>
									<td>
										<!-- <i class="fa-solid fa-sort"></i> -->구분
									</td>
									<td>
										<!-- <i class="fa-solid fa-sort"></i> -->제목
									</td>
									<td class="txt-c" colspan="2">
										<!-- <i class="fa-solid fa-sort"></i> -->일시
									</td>
									<td class="txt-c">
										<!-- <i class="fa-solid fa-sort"></i> -->조회수
									</td>
								</tr>
							<tbody>
								<c:if test="${empty boardList }">
									<tr>
										<td colspan="10"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>

								<c:if test="${not empty boardList }">
									<c:forEach items="${boardList }" var="eboard" varStatus="status">
										<c:if test="${eboard.pin eq 'y' }">
											<tr
												onclick="location.href='<%=request.getContextPath()%>/eventboard/detail?board_no=${ eboard.board_no}'">


												<td class="txt-c"><span>${pageMaker.totalCount - ((pageMaker.cri.page-1) * pageMaker.cri.perPageNum + status.index) }</span></td>

												<td>
													<c:choose>
															<c:when test="${eboard.eboard_status eq 0}">
																부고
															</c:when>

															<c:when test="${eboard.eboard_status eq 1}">
																결혼
															</c:when>

															<c:when test="${eboard.eboard_status eq 2}">
																생일
															</c:when>

															<c:when test="${eboard.eboard_status eq 3}">
																돌잔치
															</c:when>

															<c:when test="${eboard.eboard_status eq 4}">
																기타
															</c:when>
														</c:choose>
												
												</td>

												<td>
													<div class="flex">
														<c:choose>
															<c:when test="${eboard.eboard_status eq 0}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_d.jpg">
															</c:when>

															<c:when test="${eboard.eboard_status eq 1}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_c.png">
															</c:when>

															<c:when test="${eboard.eboard_status eq 2}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_w.jpg">
															</c:when>

															<c:when test="${eboard.eboard_status eq 3}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_b.png">
															</c:when>

															<c:when test="${eboard.eboard_status eq 4}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_n.png">
															</c:when>
														</c:choose>


														<span class="tx">${eboard.board_title }</span>
													</div>
												</td>

		

												<td colspan="2" id="registDate">
													<div class="flex al-it-ce ju-sp-ce">
													
													
													
													
														<div class="flex al-it-ce">
															<fmt:formatDate value="${eboard.eboard_date }"
																pattern="yyyy.MM.dd" />
														</div>
														<fmt:parseNumber
															value="${eboard.eboard_date.time / (1000*60*60*24)}"
															integerOnly="true" var="sdate" scope="request" /> <fmt:parseNumber
															value="${today.time / (1000*60*60*24)}" integerOnly="true"
															var="tdate" scope="request" /> <c:choose>
															<c:when test="${(sdate-tdate+1) gt 0}"><div class="deadlineTime eventB">
																	<span>D-${sdate-tdate+1 }일</span>
																</div>
															</c:when>
															
															<c:when test="${(sdate-tdate+1) eq 0}">
																<div class="deadlineTime eventB"><span>D-Day</span>
																</div>
															</c:when>
															
															<c:when test="${(sdate-tdate+1) lt 0}">
																<div class="deadlineTime eventB"><span>마감</span></div>
																</c:when>
														</c:choose>
													</div>
													
												</td>
												<td class="txt-c">${eboard.board_cnt }</td>
											</tr>
										</c:if>
									</c:forEach>

									<c:forEach items="${boardList }" var="eboard" varStatus="status">
										<c:if test="${eboard.pin eq 'n' }">
											<tr
												onclick="location.href='<%=request.getContextPath()%>/eventboard/detail?board_no=${ eboard.board_no}'">
												
												<td class="txt-c"><span>${pageMaker.totalCount - ((pageMaker.cri.page-1) * pageMaker.cri.perPageNum + status.index) }</span></td>

												<td>
													<c:choose>
															<c:when test="${eboard.eboard_status eq 0}">
																부고
															</c:when>

															<c:when test="${eboard.eboard_status eq 1}">
																결혼
															</c:when>

															<c:when test="${eboard.eboard_status eq 2}">
																생일
															</c:when>

															<c:when test="${eboard.eboard_status eq 3}">
																돌잔치
															</c:when>

															<c:when test="${eboard.eboard_status eq 4}">
																기타
															</c:when>
														</c:choose>
												
												</td>



												<td>
													<div class="flex">
														<c:choose>
															<c:when test="${eboard.eboard_status eq 0}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_d.jpg">
															</c:when>

															<c:when test="${eboard.eboard_status eq 1}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_c.png">
															</c:when>

															<c:when test="${eboard.eboard_status eq 2}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_w.jpg">
															</c:when>

															<c:when test="${eboard.eboard_status eq 3}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_b.png">
															</c:when>

															<c:when test="${eboard.eboard_status eq 4}">
																<img
																	src="<%=request.getContextPath()%>/resources/images/icon_n.png">
															</c:when>
														</c:choose>

														<span class="tx">${eboard.board_title }</span>
													</div>
												</td>




												<td colspan="2" id="registDate">
													<div class="flex al-it-ce ju-sp-ce">
														<div class="flex al-it-ce">
															<fmt:formatDate value="${eboard.eboard_date }"
																pattern="yyyy.MM.dd" />
														</div>
														<fmt:parseNumber
															value="${eboard.eboard_date.time / (1000*60*60*24)}"
															integerOnly="true" var="sdate" scope="request" /> <fmt:parseNumber
															value="${today.time / (1000*60*60*24)}" integerOnly="true"
															var="tdate" scope="request" /> <c:choose>
															<c:when test="${(sdate-tdate+1) gt 0}"><div class="deadlineTime eventB">
																	<span>D-${sdate-tdate+1 }일</span>
																</div>
															</c:when>
															
															<c:when test="${(sdate-tdate+1) eq 0}">
																<div class="deadlineTime eventB"><span>D-Day</span>
																</div>
															</c:when>
															
															<c:when test="${(sdate-tdate+1) lt 0}">
																<div class="deadlineTime eventB"><span>마감</span></div>
																</c:when>
														</c:choose>
													</div>
													
												</td>
													
												<td class="txt-c">${eboard.board_cnt }</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

						<div class="page-btn n-pbtn flex ju-sp-ce">
							<a class="p-num prev-first" href="javascript:list_go(1);"> <i
								class="fas fa-angle-double-left"></i>
							</a>

							<c:forEach var="pageNum" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}"
									href="javascript:list_go('${pageNum}');">${pageNum }</a>
							</c:forEach>

							<a class="p-num next-last"
								href="javascript:list_go('${pageMaker.realEndPage}');"> <i
								class="fas fa-angle-double-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form id="jobForm">
		<input type="hidden" name="searchType"
			value="${pageMaker.cri.searchType }"> <input type="hidden"
			name="perPageNum" value="${pageMaker.cri.perPageNum }"> <input
			type="hidden" name="nowSort" value="${nowSort }"> <input
			type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="page"> <input type="hidden"
			name="btno" value="${btno}">
	</form>

	<script>
		function list_go(page, url) {
			if (!url)
				url = "list";

			let jobForm = $('#jobForm');

			jobForm.find("[name='page']").val(page);

			jobForm.find("[name='keyword']").val(
					$('input[name="keyword"]').val());

			jobForm.attr({
				action : url,
				method : 'get'
			}).submit();
		}
	</script>

	<script>
		function sortChange(obj) {
			if (obj == $('#sort-Asc-Off').get(0)) {
				$('#sort-Desc-On').hide();
				$(obj).hide();
				$('#sort-Asc-On').show();
				$('#sort-Desc-Off').show();
				$('input[name="nowSort"]').val("asc");
				list_go('1');
			}
			if (obj == $('#sort-Desc-Off').get(0)) {
				$('#sort-Asc-On').hide();
				$(obj).hide();
				$('#sort-Desc-On').show();
				$('#sort-Asc-Off').show();
				$('input[name="nowSort"]').val("desc");
				list_go('1');
			}

		}
		function searchTypeChange(obj) {
			document.querySelector('#nowSearchType').innerText = obj.innerText;
			$(".tog-b").slideToggle();
			$("input[name=searchType]").val($(obj).children("input").val());
		}
		function changePerPage(obj) {
			document.querySelector('#perPageView').innerText = obj.innerText;
			$(".num-b.nb01").slideToggle();
			$("input[name=perPageNum]").val($(obj).children("input").val());
			list_go('1');
		}
		function searchEnter(obj, e) {
			if (e.keyCode == 13) {
				$("input[name=keyword]").val($(obj).val().trim());
				if ($("input[name=keyword]").val() == ""
						|| $("input[name=keyword]").val() == null
						|| $("input[name=searchType]").val() == ""
						|| $("input[name=searchType]").val() == null) {
					return;
				}
				list_go('1');
			}
		}
	</script>
</body>
</html>