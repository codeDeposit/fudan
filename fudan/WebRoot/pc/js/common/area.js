//省份调取
function getProvince(mark){
	$.ajax({//加载省
		type: "POST",
		async: false,
		url: ServerHost + 'backstage/area/province',
		data: {pareaid:0},
		success: function(data){
			$("#" + mark).html(data);
		}
	});
}

//对应城市调取
function getCity(province,mark){
	$.ajax({
		type: "POST",
		async: false,
		url: ServerHost + 'backstage/area/city',
    	data: {pareaid:province},
		success: function(data){
			$("#" + mark).html(data);
		}
	});
}