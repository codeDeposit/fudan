 /**
   * param: formId是要添加Input file的form的ID号
   */
  function addInputTypeFile(formId) {
    totalcount ++;
    var formObj = document.getElementById(formId);
    //创建子元素input
    var inputObj = document.createElement("input");
    inputObj.type = "file";
    inputObj.id = "file"+totalcount;
    inputObj.name = "fileAttach";
    //子元素的添加
    formObj.appendChild(inputObj);
    //将新添加的inputObj的id返回，后面有用
    return inputObj.id;
  }

  /*
   * inputfileId是fileform中Input file的ID号
   * tableId是要添加的表格
   */
   function addTableData(inputfileId, tableId) {
     var tableObj = document.getElementById(tableId);
     var tbodyElement = null;
     //如果该table没有tbody则创建一个,如果有使用已存在的tbody
     if($("#"+tableId).find("tbody").length == 0) {
       tbodyElement = document.createElement("tbody");
     }else {
       tbodyElement = $("#"+tableId+" tbody")[0];
     }
     var trElement = document.createElement("tr");
     //设置tr的class为inputfileId
     trElement.setAttribute("class", inputfileId);
     //序号列
     var index_tdElement = document.createElement("td");
     index_tdElement.innerText = ""+totalcount;
     //文件名列
     var filename_tdElement = document.createElement("td");
     var fileObj = document.getElementById(inputfileId).files[0];
     filename_tdElement.innerText = ""+fileObj['name'];
     //操作列
     var operation_tdElement = document.createElement("td");
     //创建删除图标
     var delete_ico = document.createElement("i");
     delete_ico.setAttribute("class", "glyphicon glyphicon-trash");
     //在删除图标外围包装一层a标签
     var delete_a = document.createElement("a");
     delete_a.href="javascript:void(0)";
     delete_a.addEventListener("click", function() {
       remove($(this).parent().parent().attr("class"));
     });
     delete_a.appendChild(delete_ico);
     //将删除图标外围的a标签添加到操作列
     operation_tdElement.appendChild(delete_a);
     //将所有列添加到tr中
     trElement.appendChild(index_tdElement);
     trElement.appendChild(filename_tdElement);
     trElement.appendChild(operation_tdElement);
     //将tr添加到tbody中
     tbodyElement.appendChild(trElement);
     //将tbody放到table中
     tableObj.appendChild(tbodyElement);
   }
  /**
   * 重新设置toby中index_td的值
   */
  function setTobyIndex(tableId) {
    $("#"+tableId).find("tr").each(function(index, element) {
      $(this).find("td").eq(0).html(""+index);
    });
  }
  function remove(id) {
	  $("#"+id).remove();
	  $("."+id).remove();
  }