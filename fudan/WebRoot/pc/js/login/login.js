var box_view_btn="loginBtn";//初始化按钮值
window.onload=function () {
    document.getElementsByClassName('login-form')[0].style.opacity=1;
    document.getElementsByClassName('login-form')[0].style.left="63%";
    document.getElementsByClassName('login-form')[0].style.filter="alpha(opacity=100)";
    document.getElementsByClassName('title-logo')[0].style.opacity=1;
    document.getElementsByClassName('title-logo')[0].style.filter="alpha(opacity=100)";
    document.getElementsByClassName('picWork')[0].style.opacity=1;
    document.getElementsByClassName('picWork')[0].style.right="47%";
    document.getElementsByClassName('picWork')[0].style.filter="alpha(opacity=100)";
    document.getElementsByClassName('wrice')[0].style.opacity=1;
    document.getElementsByClassName('wrice')[0].style.filter="alpha(opacity=100)";
    $("#modify_content").height(document.documentElement.clientHeight);
}
$(function(){
    //登陆验证通过时，出现loading： $('.logGif').css('display','block');
    $('input[name="username"]').val(localStorage.getItem("username")==""?"":localStorage.getItem("username"));
    $('input[name="password"]').val(localStorage.getItem("password")==""?"":localStorage.getItem("password"));
    if(localStorage.getItem("username")!=null&&localStorage.getItem("password")!=null){
        $('input[type="checkbox"]').prop('checked',true);
    }else{
        $('input[type="checkbox"]').prop('checked',false);
    }
    $('.btn').on('click',function(){
        var userVal=$('input[name="username"]').val();
        var passVal=$('input[name="password"]').val();
        if(userVal!=""&&passVal!=""){
            if($('input[type="checkbox"]').is(':checked')){
                    localStorage.setItem("username", userVal);
                    localStorage.setItem("password", passVal);
            }else{
                localStorage.removeItem("username", userVal);
                localStorage.removeItem("password", passVal);
            }
        }
    })
  //监听docuemnt的onkeydown事件看是不是按了回车键
	$(document).keydown(function(event){
		event = event ? event : window.event;
		if (event.keyCode === 13){
			$("#"+box_view_btn).trigger("click");
		}
	});
})
function loginCheck(){//登录
	$('.logGif').css('display','block');
	if("" == $("#accountNameId").val()){
		fuShowError("用户名不能为空！");
		$("#accountNameId").focus();
	}else if("" == $("#passwordId").val()){
		fuShowError("密码不能为空！");
		$("#passwordId").focus();
	}else{
		var loginname = $("#accountNameId").val();
		var password = $("#passwordId").val();
		var code = loginname+",jy,"+$.md5(password);
		$.ajax({type:'POST',url:jypath +'/system_login',data:{KEYDATA:code,tm:new Date().getTime()},
	            dataType:'json',success:function(data, textStatus) {
	            	var result = data.result;
	            	if ("success" != result) { 
	            		fuShowError("用户名密码错误");	
	            		$('.logGif').css('display','none');
					}else{
						window.location.href=jypath+"/backstage/index";
					}
	            }
	     });
	}
	return false;
}