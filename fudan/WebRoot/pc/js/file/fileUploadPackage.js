var globalLink;
var iFormat;
var iSize;
var iNumber;

function fileSetting(parm2,parm3){//单个文件参数配置
	iFormat = parm2;
	iSize = parm3 * 1024 * 1024;
	iNumber = parm3;
}

function fileAddImage(){//则添加
	var inputFile = '<input type="file" id="filePicture" class="filePicture" name="filePicture"/>';
	$('#filePictureInput').find('input').remove();
	$('#filePictureInput').find('div').append(inputFile);
	inputFileClick();
}

function inputFileClick(){//绑定input的click事件，返回i在change事件调用
	document.getElementById('filePicture').click();
}
$('#filePictureInput').off('change').on('change','input[type="file"]',function(){//监听change事件
	var file = $(this);
	selectFile(file);
});
function selectFile(pd){//图片打印预览
	var fileFormat = pd.val().substring(pd.val().lastIndexOf('.')+1);//文件判断
	document.getElementById('fileHintWordXX').innerHTML = '';//提示语句清除
	if(fileFormat.match(iFormat)){
		if(pd[0].files[0].size > iSize){//图片大小判断
			pd[0].outerHTML= pd[0].outerHTML.replace(/(value=\").+\"/i, "$1\"");//input值清除
			document.getElementById('fileHintWordXX').innerHTML = '<span style="vertical-align:middle;" class="text-danger">*大小超过限制,每张图片大小不超过'+ iSize +'M </span>';
			$(".filePicture").remove();//不符合要求直接删除当前input
		}else{
			var fileObj = pd[0];
			var windowURL = window.URL || window.webkitURL;
			var dataURL;
			//图片打印区域检测
			var show = document.getElementById('filePictureImgXXBox');//内容区没有内容,可以打印
			if(fileObj && fileObj.files && fileObj.files[0]){
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				show.innerHTML = '<img id="filePictureImgXX" src="'+ dataURL +'" alt="个人照片">';
			}else{
				dataURL = $file.val();
				// 两个坑:
				// 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
				// 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
				show.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				show.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src += dataURL;
			}
		}
	}else{
		pd[0].outerHTML= pd[0].outerHTML.replace(/(value=\").+\"/i, "$1\"");//input值清除
		document.getElementById('fileHintWordXX').innerHTML = '<span style="vertical-align:middle;" class="text-danger">*图片格式不正确,请选择JPG、PNG、JPEG、ICO格式图片</span>';
		$(".filePicture").remove();//不符合要求直接删除当前input
	}
}
//图片删除
function fileDeleteImg(pd){
	document.getElementById('fileHintWordXX').innerHTML = '';//提示语句清除
	$("#imgBox"+pd).remove(); //删除imgbox的整个dom
	$(".file" + pd).remove();//删除input
	var imgNumber = $("#Box img").length;//内容区域img的数量
	if(imgNumber == 0){//内容区域为空则显示语句
	} 
}

var inputs;//input数量
var globalIdLink;
var imgFormat;
var imgSize;
var imgSizeNumber;

function fileAreaSetting(parm1,parm2,parm3){//多个文件参数配置
	inputs = parm1 + 1;
	imgFormat = parm2;
	imgSize = parm3 * 1024 * 1024;
	imgSizeNumber = parm3;
	document.getElementById("XXSize").innerHTML = parm3;
	document.getElementById("XXNumber").innerHTML = imgSizeNumber;
}

function fileAreaAddImage(){//遍历input，如果不存在，则添加
	for(globalIdLink=1;globalIdLink<inputs;globalIdLink++){
		if($('.file'+globalIdLink).length != 0){
			var tFile = document.getElementById('file' + globalIdLink);
            if (tFile.value == '') {
                tFile.click();
                return;
            }
		}else{
			var inputFile = '<input type="file" id="file'+ globalIdLink +'" class="file'+ globalIdLink +'" name="files"/>';
			$('#fileInput').find('div').append(inputFile);
			inputFileAreaClick(globalIdLink);
			return;//返回，阻止循环继续进行
		}
	}
}
function inputFileAreaClick(globalIdLink){//绑定input的click事件，返回i在change事件调用
	var fileValue = document.getElementsByName('files')[globalIdLink - 1].value;
	if(fileValue == ''){
		if(globalIdLink == 1){
			document.getElementsByName('files')[globalIdLink - 1].click();
			return globalIdLink;
		}else if(globalIdLink == 2){
			document.getElementsByName('files')[globalIdLink - 1].click();
			return globalIdLink;
		}else if(globalIdLink == 3){
			document.getElementsByName('files')[globalIdLink - 1].click();
			return globalIdLink;
		}else{
			document.getElementsByName('files')[globalIdLink - 1].click();
			return globalIdLink;
		}
	}
}
$('#fileInput').off('change').on('change','input[type="file"]',function(){//监听change事件
	var file=$(this);
	selectFileArea(file,globalIdLink);
});
function selectFileArea(pd,i){//图片打印预览
	var fileFormat = pd.val().substring(pd.val().lastIndexOf('.')+1);//文件判断
	document.getElementById('fileHintWord').innerHTML = '';//提示语句清除
	console.log(pd[0].files[0].size );
	if(fileFormat.match(imgFormat)){
		if(pd[0].files[0].size > imgSize){//图片大小判断
			pd[0].outerHTML= pd[0].outerHTML.replace(/(value=\").+\"/i, "$1\"");//input值清除
			document.getElementById('fileHintWord').innerHTML = '<span style="vertical-align:middle;">*</span>大小超过限制,每张图片大小不超过'+ imgSize +'M ';
			$(".file"+i).remove();//不符合要求直接删除当前input
		}else{
			var fileObj = pd[0];
			var windowURL = window.URL || window.webkitURL;
			var dataURL;
			//图片打印区域检测
			document.getElementById('slogan').style.display = "none";//提示文字隐藏
			var show = document.getElementById('Box');//内容区没有内容,可以打印
			if(fileObj && fileObj.files && fileObj.files[0]){
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				show.innerHTML += '<div class="imgBox" id="imgBox'+ i +'">'
					+'<div id="img'+ i + '"class="imgs">'
					+'<img src="'+ dataURL +'">'
					+'</div>'
					+'<div class="imgDelete" onclick="deleteAreaImg('+ i +')">'
						+'<a href="javascript:void(0)"><span class="span0" id="delete'+ i +'"><i class="glyphicon glyphicon-trash"></i></span></a>'
					+'</div>'
				+'</div>';
			}else{
				dataURL = $file.val();
				// 两个坑:
				// 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
				// 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
				show.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				show.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").innerHTML += '<div class="imgBox" id="imgBox'+ i +'">'
						+'<div id="img'+ i + '"class="imgs">'
						+'<img src="'+ dataURL +'">'
						+'</div>'
						+'<div class="imgDelete" onclick="deleteAreaImg('+ i +')">'
							+'<a href="javascript:void(0)"><span class="span0" id="delete'+ i +'"><i class="glyphicon glyphicon-trash"></i></span></a>'
						+'</div>'
					+'</div>';
			}
		}
	}else{
		pd[0].outerHTML= pd[0].outerHTML.replace(/(value=\").+\"/i, "$1\"");//input值清除
		document.getElementById('fileHintWord').innerHTML = '<span style="vertical-align:middle;">*</span>图片格式不正确,请选择JPG、PNG、JPEG、ICO格式图片';
		$(".file"+i).remove();//不符合要求直接删除当前input
	}
}
//图片删除
function deleteAreaImg(pd){
	document.getElementById('fileHintWord').innerHTML = '';//提示语句清除
	$("#imgBox"+pd).remove(); //删除imgbox的整个dom
	$(".file" + pd).remove();//删除input
	var imgNumber = $("#Box img").length;//内容区域img的数量
	if(imgNumber == 0){//内容区域为空则显示语句
		document.getElementById('slogan').style.display = "block";//提示文字显示
	} 
}