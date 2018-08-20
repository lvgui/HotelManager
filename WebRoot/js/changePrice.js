/**
 * 修改价格函数
 */
$(function(){
 $(".fixed-pri").click(function(){
					 $("#fixed .change").empty();
					 $("#fixed .change").show();
					 var $el = $("#houseshow li.checked");
					 if($el.length == 0){
						 $p = "<p style='color:red'>请选择你需要修改的房间</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed .change").hide(2000);
					 }else{
						 $p = "<p>你选择修改的房间号为 ";
						 $pz = "<p>你要修改的房间原价为  ";
						 for(var i = 0;i < $el.length;i++){
							 $p += "<span class='fixed-pri-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
							 
							 $pz += "<span>" + $el.eq(i).children('p').eq(3).children('span').text() + "</span>   ";
						 }
						 $p += "</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed  .change").append($pz);
						 $input = "<input  type='number' step='0.01' min='0'  name='fixed-prices' class='fixed-pri-val' placeholder='请输入你要修改的金额'><button class='fixed-pri-change'>确认</button><button class='fixed-pri-changeno'>取消</button><span class='fixed-pri-change-tid'></span>";
						 $("#fixed  .change").append($input);	 
					 }
					
				 });

			});

//价格确认事件
	$("body").on("click", ".fixed-pri-change",aa );
	function aa(){
		var prices = $(".fixed-pri-val").val();
		var num = $(".fixed-pri-home").text();
		console.log(num);
		console.log(prices);
		if(prices == null || prices == ""){
			$tib = "<font color='red'>请输入你要修改的金额</font>";
			$(".fixed-pri-change-tid").empty().append($tib);
			return false;
		}
		$.ajax({
			type:"post",
			url:"ChangeHomePriServlet?num=" + num + "&prices=" + prices,
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

			}
		});
	}
	$("body").on("change", ".fixed-pri-val",function(){
		$(".fixed-pri-change-tid").empty();
	});
	$("body").on("click", ".fixed-pri-changeno",function(){
		$(".change").empty();
	});
	/**
	 * 修改房间号码
	 */	

