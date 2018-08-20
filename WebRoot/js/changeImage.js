/**
 * 修改房间的图片 .fixed-img
 */
$(function(){
 $(".fixed-img").click(function(){
					 $("#fixed .change").empty();
					 $("#fixed .change").show();
					 var $el = $("#houseshow li.checked");
					 if($el.length == 0){
						 $p = "<p style='color:red'>请选择你需要修改的房间</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed .change").hide(2000);
					 }else{
						 $div = $("<div style='line-height:40px;'></div>");
						 $p = "<p style='float:left'>你选择修改的房间号为 ";
						 for(var i = 0;i < $el.length;i++){
							 $img ="<img src='"+ $el.eq(i).children('img').attr("src") + "' style='width:80px;height:80px;float:left;paddding-left:20px;'>";
							 $p += "<span class='fixed-pri-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
						 }
						 $p += "</p>";
						 $button = $("<button>文件上传</button>");
						 $div.append($img);
						 $div.append($p);
						 $div.append($button);
						 $img1 ="<img src='images/fang/1.jpg' style='width:80px;height:80px;display:inline-block;paddding-left:20px;float:left;'  class='fixed-img-val-change'>";
						 $input = "<input  type='number' step='1' min='1' max='10' name='fixed-prices' class='fixed-img-val' placeholder='请选择图片'><br><button class='fixed-img-change'>确认</button><button class='fixed-pri-changeno'>取消</button>";
						 $div.append($img1);
						 $div.append($input);
						 $("#fixed  .change").append($div);
					 }
					
				 });

			});
//选择事件
$("body").on("click", ".fixed-img-val",function(){
	var temp = $(".fixed-img-val").val();
	if(temp > 0){
		$(".fixed-img-val-change").attr("src","images/fang/" + temp + ".jpg");
	}
} );
//确认事件
//号码确认事件
$("body").on("click", ".fixed-img-change",function(){
	var newNum = $(".fixed-img-val").val();
	var num = $(".fixed-pri-home").text();
	console.log(num);
	console.log(newNum);
	if(newNum == null || newNum == 0){
		return false;
	}
	var images = "fang/" + newNum +".jpg";
	console.log(images);
	$.ajax({
		type:"post",
		url:"ChangeHomeImgServlet?num=" + num + "&images=" + images,
		datatype: "text",
		success: function(data){
			console.log(data);
			if(data == 1){
				$(".change").empty();
				$(".change").empty().append("<font color='black'>修改成功</font>");
				$(".change").hide(3000);
				//find('HomeServlet');
				changeHome();
			}else if(data == 0){
				$(".change").empty();
				$(".change").empty().append("<font color='red'>修改失败</font>");
				$(".change").hide(3000);
			}

		}
	});
});
