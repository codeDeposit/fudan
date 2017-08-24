$(function () {
	getMenu("1","y");//加载菜单
});
//获取菜单
function getMenu(layer,ref){
	//layer为定义好的菜单功能顺序值为1,2,3,4
	//ref值为y
	$("#menu_li_id").empty();
	JY.Ajax.doRequest(null,jypath +'/backstage/menu/getMenu',{layer:layer,ref:ref},function(data){
    	$("#menu_li_id").html(data.obj); 
	});
}
//打开菜单
function openMenu(type,id,parentId,menuName,resUrl){
	if('1'!=type || "noset"==resUrl)return;
	else if('/'==resUrl.substring(0,1))TabControlAppend(id,menuName,jypath+resUrl+"?menu="+id);
	else TabControlAppend(id,menuName,resUrl);	
}
function logout(){
	JY.Model.confirm("确认要退出吗？",function(){window.location.href=jypath+"/system_logout";});	
}