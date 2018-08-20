/**
 * 类别事件 #typemanager
 */
	$(document).ready(function(){
		//添加类别
		$("#typemanager-add").click(function(){
			$(".typemanager-add-cla").show();
			if($(".typemanager-add-cla").length == 0){
				$html = "";
				$html += "<input type='text' class='typemanager-add-val typemanager-add-cla' placeholder='请输入你要添加的类别'>" +
						"<button class='typemanager-add-cla typemanager-add-yes'>确认</button>" +
						"<button class='typemanager-add-cla typemanager-add-no'>取消</button>" + 
						"<span class='typemanager-add-cla typemanager-add-tib'></span>";
				$(this).after($html);
			}else{
				return false;
			}
		});
	});
	
	//点击确认事件
	$("body").on("click", ".typemanager-add-yes",function(){
		var type = $(".typemanager-add-val").val();
		if(type == null || type == ""){
			$(".typemanager-add-tib").empty();
			$(".typemanager-add-tib").append("<font color='red'>请你输入正确的值</font>");
		}else{
			$.ajax({
				type: "post",
				url: "AddHomeTypeServlet",
				data:{
					"type":type
				},
				datatype:"text",
				success:function(data){
					console.log(data);
					if(data == -1){
						$(".typemanager-add-tib").empty();
						$(".typemanager-add-tib").append("<font color='red'>你添加的类别已存在</font>");
					}else if(data == 0){
						$(".typemanager-add-tib").empty();
						$(".typemanager-add-tib").append("<font color='red'>添加失败</font>");
					}else if(data == 1){
						$(".typemanager-add-tib").empty();
						$(".typemanager-add-tib").append("<font color='green'>添加成功</font>");
						selectHomeType();
						$(".typemanager-add-cla").fadeOut(3000);
						
					}
				}
			});
		}
	});
	$("body").on("change", ".typemanager-add-val",function(){
		$(".typemanager-add-tib").empty();
	});
	//点击取消事件
	$("body").on("click", ".typemanager-add-no",function(){
		$(".typemanager-add-cla").remove();
	});