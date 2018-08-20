/**
 * 修改房间类型数据
 */
$(document).ready(function(){
	$(".fixed-type").click(function(){
		 $("#fixed .change").empty();
		 $("#fixed .change").show();
		 var $el = $("#houseshow li.checked");
		 if($el.length == 0){
			 $p = "<p style='color:red'>请选择你需要修改的房间</p>";
			 $("#fixed  .change").append($p);
			 $("#fixed .change").hide(1000);
		 }else{
			 $p = "<p>你选择修改的房间号为 ";
			 $pt = "<p>你选择修改的房间类型为 ";
			 for(var i = 0;i < $el.length;i++){
				 $p += "<span class='fixed-pri-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
				 $pt += "<span class='fixed-type-home'>"+$el.eq(i).children('p').eq(1).children('span').text() + "</span>    ";
				
			 }
			 $p += "</p>";
			 $pt += "</p>";
			 $("#fixed  .change").append($p);
			 $("#fixed  .change").append($pt);
			 $input = "<select    name='fixed-type' class='fixed-type-val' style='width:160px;height:30px'>";
			 var eles = $(".chooseitems").eq(1).children("input[type='radio']:not(:first)");
			 var len = eles.length;
			 for(var i = 0;i < len;i++){
				 $input += "<option value='" + eles.eq(i).val() + "'>" + eles.eq(i).val() + "</option>";
			 }
			 $input += "</select>";
			 $input += "<button class='fixed-type-yes'>确认</button><button class='fixed-type-no'>取消</button>";
			 $("#fixed  .change").append($input);	 
		 }
	});
});
//取消修改时间
$("body").on("click", ".fixed-type-no",function(){
	$(".change").empty();
});
//确认事件
$("body").on("click",".fixed-type-yes",function(){
	var type = $(".fixed-type-val").val();
	var num = $(".fixed-pri-home").text();
	$.ajax({
		type: "post",
		url: "ChangeHomeTypeServlet",
		data: {
			"type":type,
			"num": num
		},
		datatype: "text",
		success:function(data){
			console.log(data);
			if(data == "true"){
				$(".change").empty();
				$(".change").empty().append("<font color='black'>修改成功</font>");
				$(".change").hide(3000);
				//find('HomeServlet');
				changeHome();
			}else{
				$(".change").empty();
				$(".change").empty().append("<font color='red'>修改失败</font>");
				$(".change").hide(3000);
			}
		}
	});
});