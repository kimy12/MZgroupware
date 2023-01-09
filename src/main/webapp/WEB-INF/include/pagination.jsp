<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<div class="page-btn flex ju-sp-ce">
   <a class="p-num prev" href="javascript:list_go(1);">
   		<i class="fas fa-angle-double-left"></i>
   </a>
   
   <a class="p-num prev" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
		<i class="fas fa-angle-left"></i>
   </a>
   
   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >			
		<a class="p-num num ${pageMaker.cri.page == pageNum?'on':''}" href="javascript:list_go('${pageNum}');" >${pageNum }</a>	
	</c:forEach>
	
   <a class="p-num next" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
		<i class="fas fa-angle-right" ></i>
   </a>
   
   <a class="p-num next l-next" href="javascript:list_go('${pageMaker.realEndPage}');">
		<i class="fas fa-angle-double-right"></i>
   </a>
</div>

<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>

<script>
	function list_go(page,url){
		if(!url) url="list";
		
		let jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
</script>