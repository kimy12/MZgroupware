<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core-main.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-01.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-02.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-03.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-04.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

     
    <link href="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/vendor/css/bootstrap.css">
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/calendar.css">
    
     <script src="<%=request.getContextPath() %>/resources/vendor/js/jquery.min.js"></script>
     <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
     <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
	 <script src="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.js"></script>
	 
</head>


<body>

		<div class="wrap">
			<%@ include file="/WEB-INF/include/topbar.jsp" %>
    		<div class="container flex">    			
	            <div class="content">
	            	<div class="p-wrap">
	            			<input type="hidden" id="loginUser" value="${loginEmp.ncnm }">
	            			<input type="hidden" id="loginUserDept" value="${loginEmp.dept }">
	            			<input type="hidden" id="loginUserAuthority" value="${loginEmp.authority }">
	            			
					        <div id="contextMenu" class="dropdown clearfix">
					            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
					                style="display:block;position:static;margin-bottom:5px;">
					                 <li><a tabindex="-1" href="#">일정 등록</a></li>		                
					                <li class="divider"></li>
					                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
					            </ul>
					        </div>
					
					        <div id="wrapper" class="mb-20">
					            <div id="loading"></div>
					            <div id="calendar"></div>
					        </div>
					
					
					        
					        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
					            <div class="modal-dialog" role="document">
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
					                                aria-hidden="true">&times;</span></button>
					                        <h4 class="modal-title"></h4>
					                    </div>
					                    <div class="modal-body">
					
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-title">일정명</label>
					                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
					                                    required="required" />
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-start">시작</label>
					                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-end">끝</label>
					                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-type">구분</label>
					                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
						                                    <option value="개인">개인</option>
								                            <option value="부서">부서</option>
								                            <option value="회사">회사</option>
					                                </select>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-color">색상</label>
					                                <select class="inputModal" name="color" id="edit-color">
					                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
					                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
					                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
					                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
					                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
					                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
					                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
					                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
					                                    <option value="#495057" style="color:#495057;">검정색</option>
					                                </select>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-desc">설명</label>
					                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
					                                    id="edit-desc"></textarea>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="modal-footer modalBtnContainer-addEvent">
					                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
					                    </div>
					                    <div class="modal-footer modalBtnContainer-modifyEvent">
					                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
					                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
					                    </div>
					                </div>
					            </div>
					        </div>
					
					        <div class="panel panel-default">
					
					            <div class="panel-heading">
					                <h3 class="panel-title">필터</h3>
					            </div>
					
					            <div class="panel-body">
					
					                <div class="col-lg-6">
					                    <label for="calendar_view">등록자별</label>
					                    <div class="input-group">
					                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="개인"
					                                checked>개인</label>
					                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="부서"
					                                checked>부서</label>
					                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="회사"
					                                checked>회사</label>
					                        
					                    </div>
					                </div>
					
					            </div>
					        </div>
	            	</div>
	            </div>
            </div>
         </div>
    
    <script src="<%=request.getContextPath() %>/resources/vendor/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/js/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/js/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/js/ko.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/calendar/main.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/calendar/addEvent.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/calendar/editEvent.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/calendar/etcSetting.js"></script>
	
	
<%@ include file="/WEB-INF/include/footer.jsp" %>