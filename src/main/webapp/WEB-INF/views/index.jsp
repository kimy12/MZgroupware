<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>

	if('${loginEmp.name}'){
		location.href="index";
	}else{
		location.href="common/loginForm";
	}
</script>