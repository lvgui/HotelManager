/**
 * 单选框按钮事件
 */
$(document).ready(function(){
	$(".chooseitems").eq(0).change(function(){
		var status = $(this).children("input[name='status']:checked").val();
		$("#chooseitems-status").val(status);
		changeHome();
	});
	//全部房间按钮事件
	$("#house_all").click(function(){
		find('HomeServlet');
		$(".chooseitems").eq(0).children("input[value='all']").prop("checked", "checked");
	});
});
$("body").on("change", ".chooseitems:nth-child(2)",function(){
	var types = $(this).children("input[name='types']:checked").val();
	$("#chooseitems-types").val(types);
	changeHome();	
});
function changeHome(){
	var status = $("#chooseitems-status").val();
	var type = $("#chooseitems-types").val();
	$.ajax({
		type: "post",
		url: "SelectHomeServlet",
		data: {
			"status": status, "type": type
		},
	datatype: "json",
	success:function(data){
		console.log(data);
		data = eval("(" + data + ")");
		console.log(data instanceof Array);
		var html = "";
		//删除除第一行数据
		$("#houseshow").empty();
		for(var i = 0;i < data.length;i++){
			html += "<li>";
			html += "<img src='images/" + data[i].images + "'>";
			html += "<p>房间号码：<span>" + data[i].num + "</span></p>";
			html += "<p>房间类型：<span>" + data[i].type + "</span></p>";
			var status = "";
			switch(data[i].status){
				case 0:
					status = "未入住";
					break;
				case 1:
					status = "入住";
					break;
				case 2:
					status = "预定";
					break;
				default:
					status = "未入住";
					
			}
			html += "<p>房间状态：<span>" + status + "</span></p>";
			html += "<p>房间价格：<span>" + data[i].prices + "/天</span></p>";
			html += "<p>房间折扣：<span>" + data[i].discount + "</span></p>";
			//console.log(data[i].images + "----");
			//console.log(html);
		}
		$("#houseshow").html(html);
	}	
	});
}