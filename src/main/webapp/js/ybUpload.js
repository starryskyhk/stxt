/**
 * 作者：谭学锋
 * 版权：西安优步
 * 全局的删除文件函数
 * 版本：1.0
 * 日期：2018.8.31 10:22
 * 删除附件
 * @param e
 * @param entityId
 * @param buttonId
 */ 


    	function delFjTxf(e,entityId,buttonId){
    		$(e).parent().parent().remove();
    		 $("#"+buttonId).show();
    		 nui.get(entityId).setValue("");
    	}	
		
    	
/**
 * 作者：谭学锋
 * 版权：西安优步
 * 文件上传（单个文件）的通用显示和删除函数
 * 版本：1.0
 * 日期：2018.8.31 10:28
 * @param lcm  流程名
 * @param entityId  实体属性id
 * @param entityOriId  文件名属性id
 * @param buttonId   按钮id
 * @param fileId   文件域id
 * @param showId   显示id
 * @param fileNameCheckFn  文件名检查函数，参见源码中的  fileNameCheckFn,默认（undefined）全部类型，"image" ：图片。
 * @param noDelete  true:没有删除按钮，也没有上传按钮。默认false.
 * @param notify  回调 function(){  }
 */
	
   function uploadInitial(lcm,entityId,entityOriId,buttonId,fileId,showId,fileNameCheckFn,noDelete,notify){
	        noDelete=noDelete||false;
	        if(  fileNameCheckFn=="image"){
	        	fileNameCheckFn=function(feid){
	        		var img = document.getElementById(feid);
	        		  return /.(jpg|png|gif|bmp)$/.test(img.value)?true:(function() {
	        			  nui.alert('图片格式仅支持jpg、png、gif、bmp格式，且区分大小写。');             
	        			  return false;
	        		  })();
	        	  
	           }
	        }else if( fileNameCheckFn== "imageAndPdf"){
	           fileNameCheckFn=function(feid){
	        		var img = document.getElementById(feid);
	        		  return /.(jpg|png|gif|bmp|pdf)$/.test(img.value)?true:(function() {
	        			  nui.alert('图片格式仅支持jpg、png、gif、bmp、pdf格式，且区分大小写。');             
	        			  return false;
	        		  })();
	        	  
	           }
	        }else if( fileNameCheckFn== undefined){
	        	  fileNameCheckFn=function(feid){
	        	var img = document.getElementById(feid);
	        	
      		  return /.(doc|docx|xls|xlsx|pdf|png|jpg|txt|ppt|pptx|rar|zip)$/.test(img.value)?true:(function() {
      			  nui.alert('文件格式仅支持doc|docx|xls|xlsx|pdf|png|jpg|txt|ppt|pptx|rar|zip格式，且区分大小写。');             
      			  return false;
      		  })();
	        	  }
	        }
         function bindChange(){
		     $("#"+fileId).change(function(e){
			       ajax_upload(fileId, function(data) {
			    	      data.url=data.url.replace(/\\\\/g,'/');
			    	      data.url=data.url.replace(/\\/g,'/');
						  data.url=basePath+"/"+data.url;
						  var fjShow='<div class="file-item" >'+
									 '    <div class="hover-box"><input type="hidden" name="fj" value="'+data.url+'">'+
									  '        <a href="'+data.url+'" target="_Blank">'+
									   '           <span class="fa fa-download"></span>'+
										'      </a>'+
										'      <a href="javaScript:void(0)" onclick="delFjTxf(this,\''+entityId+'\',\''+buttonId+'\')">'+
										 '          <span class="fa fa-remove"></span>'+
										  '    </a>&nbsp;&nbsp;&nbsp;'+data.originalname+
										'   </div>'+
									  '</div>';						
						  $('#'+showId).html(fjShow );					
						  nui.get(entityId).setValue(data.url);	
						  nui.get(entityOriId).setValue(data.originalname);	
						  if(notify){
							  notify();
						  }
						  $("#"+buttonId).hide();
				   });
			 });
		 }
         bindChange();
		 function ajax_upload(feid, callback) { 
			  if (fileNameCheckFn(feid)) { 
				  $.ajaxFileUpload({
					  fileElementId: feid,   
					  url: 'upload.jsp?lcm='+lcm, 
					  type: 'post',   
					  dataType: 'json',   //服务器返回的数据类型。可以为xml,script,json,html。如果不填写，jQuery会自动判断。
					  secureuri: false,  
					  async : true,   
					  success: function(data) {   
						  if (callback) callback.call(this, data);
							 $("#"+fileId).val(""); 
							 bindChange();
					  },
					  error: function(data, status, e) {  
						  $("#"+fileId).val("");
						  bindChange();
					  }
				  });
			  }
		  }
           //点击传递
             $("#"+buttonId).click(function(){
			     $("#"+fileId).val("");
				$("#"+fileId).trigger("click");
			});
             
             if($("#"+entityId).val()!="" && $("#"+entityId).val()!="null"){
            	 $("#"+buttonId).hide();
            	 var deleteHtml='      <a href="javaScript:void(0)" onclick="delFjTxf(this,\''+entityId+'\',\''+buttonId+'\')">'+
					 '          <span class="fa fa-remove"></span>'+
					  '    </a>';
            	 if(noDelete){
            		 deleteHtml="";
            	 }
            	 var fjShow='<div class="file-item" >'+
				 '    <div class="hover-box"><input type="hidden" name="fj" value="'+$("#"+entityId).val()+'">'+
				  '        <a href="'+$("#"+entityId).val()+'" target="_Blank">'+
				   '           <span class="fa fa-download"></span>'+
					'      </a>'+
					deleteHtml
					+'&nbsp;&nbsp;&nbsp;'+$("#"+entityOriId).val()+
					'   </div>'+
				  '</div>';						
	            $('#'+showId).html(fjShow );
             }
             if(noDelete){
            	 $("#"+buttonId).hide();
            }
    }