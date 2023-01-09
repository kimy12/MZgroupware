$(function () {


/*    $('.sub-menu').hide();
    $(".nav-bar").hover(function() {
        $(".sub-menu").stop().slideToggle(500)
    });*/
    
    $('.sub-menu').hide();
    $(".nav-bar").hover(function() {
    	$(".sub-menu").stop().slideDown(500)	
        
    }, function(){
    	$(".sub-menu").stop().slideUp(500)
    });
    

    /*========================= 공지사항 tab ============================*/
   
    $('.tabcontent > div').hide();
    $('.tabnav a').click(function () {
        $('.tabcontent > div').hide().filter(this.hash).fadeIn();
        $('.tabnav a').removeClass('active');
        $(this).addClass('active');
        return false;
    }).filter(':eq(0)').click();


    /*========================= 결재 tab ============================*/
   
    $('.my-pageTab > div').hide();
    $('.my-pageTab ul li a').click(function () {
        $('.my-pageTab > div').hide().filter(this.hash).fadeIn();
        $('.my-pageTab ul li a').removeClass('on');
        $(this).addClass('on');
        return false;
    }).filter(':eq(0)').click();

     /*========================= 내정보 tab ============================*/
   
     $('.app-tabcontent > div').hide();
     $('.app-tab ul li a').click(function () {
         $('.app-tabcontent > div').hide().filter(this.hash).fadeIn();
         $('.app-tab ul li a').removeClass('active');
         $(this).addClass('active');
         return false;
     }).filter(':eq(0)').click();
 

    
    /*========================= 동호회 tab ============================*/
   
    
    $('club-tabContent > div').hide();
    $('.club-tap li a').click(function () {
        $('.club-tabContent > div').hide().filter(this.hash).fadeIn();
        $('.club-tap li a').removeClass('on');
        $(this).addClass('on');
        return false;
    }).filter(':eq(0)').click();


    /*========================= 커스터마이징 tab ============================*/
   
    $('.custom.cus02 > div').hide();
    $('.custom-menu ul li a').click(function () {
        $('.custom.cus02 > div').hide().filter(this.hash).fadeIn();
        $('.custom-menu ul li a').removeClass('on');
     
        $(this).addClass('on');
        return false;
    }).filter(':eq(0)').click();


     /*========================= 상세 tab ============================*/
   
     $('.comment-tab > div').hide();
     $('.app-btntab ul li a').click(function () {
         $('.comment-tab > div').hide().filter(this.hash).fadeIn();
         $('.app-btntab ul li a').removeClass('on');
         $(this).addClass('on');
         return false;
     }).filter(':eq(0)').click();

    /*========================= 뉴스 tab ============================*/

    $('.Mtabcon > div').hide();
    $('.tabMail a').click(function () {
        $('.Mtabcon > div').hide().filter(this.hash).fadeIn();
        $('.tabMail a').removeClass('active');
        $(this).addClass('active');
        return false;
    }).filter(':eq(0)').click();
        

    /*========================= 출퇴근 버튼 ============================*/

    var wb = true;

    $(".w-btn span").click(function(){

        if(wb){
            $(".w-btn span").animate({"top": "+=38px"}, "slow");
            $(".w-btn span").text("퇴근하기");
            wb = false;
        }else{
            $(".w-btn span").animate({"top": "-=38px"}, "slow");
            $(".w-btn span").text("출근하기");
            wb = true;
        }
       
    });

    /*========================= 상태 변경 토글 ============================*/

    /*$(".tog-b").hide();*/
    $(".select-tog").click( function() {
        $(".tog-b").slideToggle();
    });

    /*========================= 상단 토글 알림 ============================*/


     $(".top-modal.top01").hide();
     $(".fa-solid.fa-bell").click(function() {
        $(".top-modal.top02").hide();
        $(".top-modal.top01").slideToggle();
     });


    /*========================= 상단 토글 사용자 ============================*/

     $(".top-modal.top02").hide();
   /*  $(".fa-solid.fa-gear").click( function() {
        $(".top-modal.top01").hide();
        $(".top-modal.top02").slideToggle();
     });*/

     /*========================= 검색 유형 토글 ============================*/

    $(".view-num").hide();
    $(".view-select").click( function() {
        $(".view-num").slideToggle();
    });   

     /*========================= 파일 커스텀 ============================*/

    $("#file").on('change',function(){
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });

    $(".num-b.nb01").hide();
    $(".num-tog.tog01").click( function() {
         $(".num-b.nb01").slideToggle();
    });

    $(".num-b.nb02").hide();
    $(".num-tog.tog02").click( function() {
         $(".num-b.nb02").slideToggle();
    });


        
    $("#modal, .close-core").on('click',function(){
        $("#modal").fadeOut(300);
        $(".modal-con").fadeOut(300);
    });
    


});

function openModal(modalname){
    document.get
    $("#modal").fadeIn(300);
    $("."+modalname).fadeIn(300);
}

function updateLastCheck(contextPath){
	$.get(contextPath+'/emp/updateLastCheck', function(response) {

	});
}
