var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var loginUser = $('#loginUser'); 
var loginUserDept = $('#loginUserDept'); 
let authority = $('#loginUserAuthority');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: loginUser.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            dept: loginUserDept.val()
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        
        if (eventData.type === '회사') {
        	if(authority.val() == 'ROLE_USER'){
	            alert('권한이 없습니다.');
	            return false;        	
        	}
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

       $.ajax({
            url: "registSchedule",
            type: "post",
            data : JSON.stringify(eventData),
            contentType : 'application/json',
            success: function (response) {
            	if(response == 'success'){
	                alert('등록 성공');
	                $('#calendar').fullCalendar('removeEvents');
	                $('#calendar').fullCalendar('refetchEvents');            	
            	}
            	
            },
            error : function(xhr){
            	alert(xhr.status);
            }
        });
    });
};