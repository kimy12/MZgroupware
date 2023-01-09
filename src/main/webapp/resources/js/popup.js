
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	let winleft = window.screenLeft + (document.body.clientWidth - WinWidth) / 2;
	let wintop = window.screenTop + (document.body.clientHeight - WinHeight) / 2;

	let win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	
}

//팝업창 닫기
function CloseWindow(){
	
	window.opener.location.reload(true);		
	window.close();
}


//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		alert("세션이 만료되었습니다.\n로그인 하세요.");
		location.reload();

	}else if(status == "403"){
		alert("권한이 유효하지 않습니다.");
		history.go(-1);		
	}else {
		alert("시스템장애로 실행이 불가합니다.");
		history.go(-1);
	}

}






