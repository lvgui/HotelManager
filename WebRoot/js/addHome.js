/**
 * 添加房屋的js文件
 */
$(document).ready(function(){
	//alert("a");
	$.ajax({
		type: "post",
		url:"HomeTypeAllServlet",
		datatype:"json",
		success:function(data){
			console.log(data);
			data = eval("("+data+")");
			$("#addhome-type").empty();
			$html = "";
			for(var i = 0;i < data.length;i++){
				$html += "<option value='" + data[i] + "'>" + data[i] + "</option>";
			}
			$("#addhome-type").append($html);
		}
		
	});
	$(".addhome-submit").click(function(){
		//房间号码
		var num = $("#addhome input[name='addhome-num']").val();
		if(num == null || num == ""){
			$(".addhome-num-tid").text("请输入正确的房间号码");
			$("#addhome input[name='addhome-num']").focus();
			return false;
		}else{
			$.ajax({
				type:"post",
				url:"JudgeHomeNumServlet",
				async: false,
				data:{"num":num},
				datatype:"text",
				success:function(data){
					console.log(data);
					$("#addhome input[type='hidden']").val(data);
				}

			});
			
//			if(flag == "有"){
//				$(".addhome-num-tid").text("你添加的房间号码已存在");
//				
//			}
				
			
		}
		if($("#addhome input[type='hidden']").val() == "有"){
			$(".addhome-num-tid").text("你添加的房间号码已存在");
			return false;
		}
		//房间类型
		var type = $("#addhome input[name='addhome-type']").val();
		console.log(type);
		
		//图片处理
		//var images = "";
		//images = "fang/" + temp +".jpg";
		//console.log(images);
		$("#addhome input[name='addhome-num']").keydown(function(){
			$(".addhome-num-tid").text("");
		});
		//价格处理
		var prices = $("#addhome input[name='addhome-prices']").val();
		if(prices == null || prices == ""){
			$(".addhome-prices-tid").text("请输入价格");
			return false;
		}
		
	});
	$("#addhome input[name='addhome-image']").change(function(){
		var temp = $("#addhome input[name='addhome-image']").val();
		$("#addhome img").attr("src","images/fang/" + temp + ".jpg");
		images = "fang/" + temp +".jpg";
	});
	
});