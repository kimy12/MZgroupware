<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<!DOCTYPE html>
<html>
<head>
     <meta charset='UTF-8'>
     <title>Main</title>

     

     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core-main.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-01.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-02.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-03.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-04.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/dashboard.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/spectrum.css">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

     <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
     <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
     <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.2.7/pdfobject.min.js" integrity="sha512-g16L6hyoieygYYZrtuzScNFXrrbJo/lj9+1AYsw+0CYYYZ6lx5J3x9Yyzsm+D37/7jMIGh0fDqdvyYkNWbuYuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     
     <link href="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.css" rel="stylesheet">
	 <script src="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.js"></script>
	 
	 <script src="<%=request.getContextPath() %>/resources/summerNote/summernote.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	 <script>
    
</script>	


</head>

