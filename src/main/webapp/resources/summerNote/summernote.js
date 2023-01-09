		
	
var contextPath = "";
var mheight = 350;
function summernote_go(target,context,customheight){
	  if(target == null){
	  	target= $('#summernote');
	  }
	  
	  if(customheight){
	  	mheight= customheight;
	  }
	  
	  contextPath = context;
	  
      $('#summernote').summernote({
        placeholder: '여기에 내용을 입력하세요.',
        tabsize: 2, 
        height: mheight,
        lang: 'ko-KR',
        disableResizeEditor: true,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ],
        callbacks:{
        	
        	onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					//alert(file.name);
					
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
						alert("JPG 이미지형식만 가능합니다.");
						return;
					}
					if(file.size > 1024*1024*5){
						alert("이미지는 5MB 미만입니다.");
						return;
					}		
				}
				
				//alert("선택된 파일은 유효합니다.");
				
				for (var file of files) {
					sendFile(file,this);
				}
			},
			onMediaDelete : function(target) {
				//alert("image delete");
				//alert(target[0].src);
				//alert(target.attr("src"));
				deleteImgFile(target[0].src);	
			}
        }
      });
}
      function sendFile(file, el) {
    		var form_data = new FormData();
    		form_data.append("file", file); 
    		$.ajax({
    	    	url: contextPath+'/summernote/uploadImg',
    	    	data: form_data,
    	    	type: "POST",	    	
    	    	contentType: false,	    	
    	    	processData: false,
    	    	success: function(img_url) {
    	    		//alert(img_url);
    	      		$(el).summernote('editor.insertImage', img_url);
    	    	},
    	    	error:function(){
    	    		alert(file.name+" 업로드에 실패했습니다.");
    	    	}
    	  	});
    	}

    	function deleteImgFile(src) {		
    		var splitSrc= src.split("=");
    		var fileName = splitSrc[splitSrc.length-1];
    		
    		var fileData = {fileName:fileName};
    		
    		$.ajax({
    			url:contextPath+"/summernote/deleteImg",
    			data : JSON.stringify(fileData),
    			type:"post",
    			contentType:"application/json",
    			success:function(res){
    				console.log(res);
    			},
    			error:function(){
    				alert("이미지 삭제가 불가합니다.");
    			}
    		});
    	 }