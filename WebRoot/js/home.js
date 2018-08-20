
//修改折扣--确认事件
	$("body").on("click", ".fixed-dis-change",bb );
	function bb(){
		//alert('文件格式错误');
		var discount = $(".fixed-dis-val").val();
		var num = $(".fixed-dis-home").text();
		console.log(num);
		console.log(discount);
		if(discount == null || discount == ""){
			$tib = "<font color='red'>请你输入正确的值</font>";
			$(".fixed-dis-change-tid").empty().append($tib);
			return false;
		}
		$.ajax({
			type:"post",
			url:"ChangeHomeDisServlet?num=" + num + "&discount=" + discount,
			datatype: "text",
			success: function(data){
				console.log(data);
				if(data == "true"){
					$(".change").empty();
					$(".change").empty().append("<font color='black'>修改成功</font>");
					$(".change").hide(5000);
					//find('HomeServlet');
					changeHome();
				}else{
					$(".change").empty();
					$(".change").empty().append("<font color='red'>修改失败</font>");
					$(".change").hide(5000);
				}
				/*console.log(data instanceof Array);
				var html = "";					
				for(var i = 0;i < data.length;i++){
					html += "<input type='radio' name='types' value=" + data[i] +">" + data[i];
				}
				$(".chooseitems").eq(1).append(html);*/
			}
		});
	}
	$("body").on("change", ".fixed-dis-val",function(){
		$(".fixed-dis-change-tid").empty();
	});
	$("body").on("click", ".fixed-dis-changeno",function(){
		$(".change").empty();
	});