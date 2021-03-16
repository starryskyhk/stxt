/**
 * 获取系统当前时间精确到日
 */ 
  function getTime(){
   var mydate = new Date();
   var str = "" + mydate.getFullYear() + "-";
   str += (mydate.getMonth()+1) + "-";
   str += mydate.getDate() + "-";
   return str;
  }

  
  /**
   * 获取公共表审批意见
   */ 
  function getOptionsForLc(procinstid){
	   this.procinstid=procinstid;
	   var json = nui.encode({procinstid:procinstid});
	   var that=this;
	   this.workitems=[];
	   $.ajax({                
		url:"com.primeton.eos.commons.zdtg.getApprovalByProcessInstId.biz.ext",
		type:"post",data:json,cache:false,contentType:"text/json",async:false,
		success:function(text){
		   var shyjs = nui.decode(text).datas;
		   shyjs=checkBh(shyjs);
		   reduceNoNeed(shyjs);
		}
	  });
		
	   this.get=function(workitemname){
	      var tempReturn=[];
	      for(var i=0;i<that.workitems.length;i++){
		     if(workitemname ==  that.workitems[i].WORKITEMNAME){
			    tempReturn.push(that.workitems[i]);
		     }
		  }
		  return tempReturn;
	   };
	   
	   //取消意见是驳回前的审批意见，作废不必要的。
   //这需要修改sql语句，取出意见是驳回的，没有完成的工作项。
	   function checkBh(shyjs){
	      var   temp=[];
		  for(var i=0;i<shyjs.length;i++){
		    if(shyjs[i].SHYJ != '驳回'){
		    	temp.push(shyjs[i]);
		    }			
		  }
	      return temp;
	   }
	   //同一个人在某个节点的审批，只取最后的意见。
	  function reduceNoNeed(shyjs){
		    for(var i=0;i<shyjs.length;i++){
			   var find=null,index=null;
			   for(var j=0;j<that.workitems.length;j++){
				  if(that.workitems[j].WORKITEMNAME == shyjs[i].WORKITEMNAME &&
				     that.workitems[j].SHRID == shyjs[i].SHRID 
				    ){
					 // find=that.workitems[j];
					find=shyjs[i]; index=j;
				  }
			   }
			   if(find !=null){
			      //存在就替换
				  that.workitems[index]=find;
			   }else{
			      that.workitems.push(shyjs[i]);
			   }
			}
		}
	}
  
  /**
   * 公共审批时间格式化 年-月-日
   */ 
  function formatDateTime(inputTime) {
	  var date = new Date(inputTime);
	  var y = date.getFullYear();
	  var m = date.getMonth() + 1;
	  m = m < 10 ? ('0' + m) : m;
	  var d = date.getDate();
	  d = d < 10 ? ('0' + d) : d;
	  return y + '-' + m + '-' + d;
  }
/**
  * 用于从表格中将数据提出来
  * @param gridId
  * @returns {Array}
  */
 
	function getGridData(gridId){
	    var entities = [];
	
       var data={};
	   $("#"+gridId + " tr").each(function(){
	        data=getTableData($(this));
			entities.push(data);
	   });
	   return entities;
   }
	
	/**判断是否发布人，如果是不用填写值班人信息和带班领导信息**/
  	function  sfxxfbr(){
  		//判断是否是发布人
	  	//var sfxxfbr = nui.get("sfxxfbr").getValue();
	  	if(1==0){//sfxxfbr=="否"
		  	$("#zbryxxtx").hide();
		  	$("#dbldxx").hide();
	  	}else{
	  		$("#xkdjjrzbrysb.fbmc").css(readonly="readonly");
	  		$("#xkdjjrzbrysb.sbqssj").css(readonly="readonly");
	  		$("#xkdjjrzbrysb.sbjzrq").css(readonly="readonly");
	  		$("#zbryxxtx").show();
	  		$("#dbldxx").show();
	  	}
  	}
	
	//修正行号	
	function fixXh(gridId){
		  if(typeof gridId == "string"){
			$("#"+gridId ).find("tr").each(function(i,tr){
				 $(this).find("td").eq(0).html(i+1);
			});
			
		 }else{
		   var dom=$(gridId);
			dom.find("tr").each(function(i,tr){
				 $(this).find("td").eq(0).html(i+1);
			});
		 }
	}
//删除行
	
	
	function removeTr(dom){
		 var $tobdy= $(dom).closest("tbody");
	     $(dom).parent().parent().remove();
		  fixXh($tobdy);
   }
	/**
	 * 流程提交入库ajax
	 * @param url 提交地址
	 * @param data 附带参数
	 */
	function lctjajax(url, data){
		//转换ajax
		var json = nui.encode(data);

	    $.ajax({
	        url:url,
	        type:'POST',
	        data:json,
	        cache:false,
	        contentType:'text/json',
	        success:function(text){
	            var returnJson = nui.decode(text);
	            if(returnJson.exception == null){
	            	CallGoBack();
	            }else{
	                nui.alert("保存失败", "系统提示", function(action){
	                    if(action == "ok" || action == "close"){
	                        //CloseWindow("saveFailed");
	                    }
	                    });
	                }
	            }
	            });
		
	}
	/**
	 * //用于从from中将数据提出来
	 * getTableData("mainTable")
	 */	 
	function getTableData(formId){
	    var data={};
		 var parent=null;
	    if(typeof formId == "string"){
		     parent= $("#"+formId+" input");
	    }else{
		     parent= $(formId).find("input" );
	    }
		 
		   parent.each(function(){
		      var $this=$(this);
			  var name=$this.attr("name");
			  if(  (name  !=  undefined)  &&  (name !=null)   &&  (name  != "")  ){
				  var value=$this.val();
				  data[name]=value;
			  }
		   });
		   return data;
	}
	
	//添加值班人员行
	function  addGnTr(gridId,getTr){	      
	    var trHTML =  getTr({}, $(this).find("td").length +1);
		var $tr=$(trHTML);
		$("#"+gridId).append($tr);
		fixXh(gridId);
		nui.parse();
			
		var height = $('body').height();
		try{
			parent.document.getElementById( 'iframe-content' ).style.height = height +  'px';
		}catch(e){
				     	
		}		
	}
	//添加带班人员行
	function  addGnTrd(gridId,getTrd){
		var trHTML =  getTrd({}, $(this).find("td").length +1);
		var $tr=$(trHTML);
		$("#"+gridId).append($tr); 
		nui.parse();
		fixXh(gridId);
		
		var height = $('body').height();
		try{
			parent.document.getElementById( 'iframe-content' ).style.height = height +  'px';
		}catch(e){
				     	
		}
	}
	function setTableData(tabelId,data){
	    if(typeof tabelId == "string"){
			  for(var fieldName in data){
				   if( ({}).hasOwnProperty.call(data, fieldName) ) {
				     if(data[fieldName]){
					    $("#"+tabelId+" "+"input[name='"+fieldName+"']").val(data[fieldName]);
					 }
					  
				   }
			  }
		 }else{
		   var dom=$(tabelId);
		    for(var fieldName in data){
				   if( ({}).hasOwnProperty.call(data, fieldName) ) {
				      if(data[fieldName]){
					       dom.find("input[name='"+fieldName+"']" ).val(data[fieldName]);
					  }
				   }
			}
		 }
	 }
	
	 function setGridData(gridId,data,getTr,role){
	     for(var i=0;i<data.length;i++){
			      var trHTML =  getTr(data[i],i);
				  var $tr=$(trHTML);
		    	  $("#"+gridId).append($tr);
		    	  
				  setTableData($tr,data[i]);
				  nui.parse();
	 	}
	   
	 
	}