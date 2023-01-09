<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<div class="page-btn flex">
	<a class="p-num prev" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
	</a> <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
		<i class="fas fa-angle-left"></i>
	</a>

	<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');">${pageNum }</a>
	</c:forEach>

	<a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
		<i class="fas fa-angle-right"></i>
	</a> <a class="p-num next" href="javascript:list_go('${pageMaker.realEndPage}');"> <i class="fas fa-angle-double-right"></i>
	</a>
</div>

<form id="jobForm">
	<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"> 
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
	<input type="hidden" name="nowSort" value="${nowSort }"> 
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	<input type="hidden" name="page">
</form>

<script>
	function list_go(page,url){
		if(!url) url="indivList";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);

		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
	
</script>