// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}

    	$(function(){
			//提交表单
			$('#submit_btn').click(function(){
				show_loading();
				if($('#loginName').val() == ''){
					show_err_msg('用户名不能为空，还没填呢！');	
					$('#loginName').focus();
				}else if ($('#pwd').val() == '') {
					show_err_msg('密码不能为空，还没填呢！');	
					$('#pwd').focus();
				}else{
					show_msg('正在为您跳转...','/');	
				}
			});
			
			
		});
    
    	
    	
    	
    	
    	
    	
    	
    	
    	