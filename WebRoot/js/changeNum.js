/**
 * 修改房间号码事件 .fixed-num
 */
 $(function(){
		 $(".fixed-num").click(function(){
							 $("#fixed .change").empty();
							 $("#fixed .change").show();
							 var $el = $("#houseshow li.checked");
							 if($el.length == 0){
								 $p = "<p style='color:red'>请选择你需要修改的房间</p>";
								 $("#fixed  .change").append($p);
								 $("#fixed .change").hide(1000);
							 }else{
								 $p = "<p>你选择修改的房间号为 ";
								 for(var i = 0;i < $el.length;i++){
									 $p += "<span class='fixed-pri-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
									 
									
								 }
								 $p += "</p>";
								 $("#fixed  .change").append($p);
					
								 $input = "<input  type='text'  name='fixed-num' class='fixed-num-val' placeholder='请输入你要修改的新的房间号' id='fixed-num-val'><button class='fixed-num-yes'>确认</button><button class='fixed-num-no'>取消</button><span class='fixed-num-tid'></span>";
								 $("#fixed  .change").append($input);	 
							 }
							
						 });
		 //删除事件
		 $(".fixed-home").click(function(){
			 $("#fixed .change").empty();
			 $("#fixed .change").show();
			 var $el = $("#houseshow li.checked");
			 if($el.length == 0){
				 $p = "<p style='color:red'>请选择你需要修改的房间</p>";
				 $("#fixed  .change").append($p);
				 $("#fixed .change").hide(1000);
			 }else{
				 $p = "<p>你选择删除的房间号为 ";
				 for(var i = 0;i < $el.length;i++){
					 $p += "<span class='fixed-pri-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
					 
					
				 }
				 $p += "</p>";
				 $("#fixed  .change").append($p);	
				 $input = "<button class='fixed-home-yes'>确认</button><button class='fixed-home-no'>取消</button>";
				 $("#fixed  .change").append($input);	 
			 }
		 });
 });
 
//号码确认事件
	$("body").on("click", ".fixed-num-yes",function(){
		var newNum = $(".fixed-num-val").val();
		var num = $(".fixed-pri-home").text();
		console.log(num);
		console.log(newNum);
		if(newNum == null || newNum == ""){
			$tib = "<font color='red'>请输入你要修改的房间号</font>";
			$(".fixed-num-tid").empty().append($tib);
			return false;
		}
		$.ajax({
			type:"post",
			url:"ChangeHomeNumServlet?num=" + num + "&newNum=" + newNum,
			datatype: "text",
			success: function(data){
				console.log(data);
				if(data == -1){
					$(".fixed-num-tid").empty().append("<font color='red'>你输入的房间号已存在</font>");
				}else if(data == 1){
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
	$("body").on("focus", ".fixed-num-val",function(){
		$(".fixed-num-tid").empty();
	});

	$("body").on("click", ".fixed-num-no",function(){
		$(".change").empty();
	});
	//确认删除
	$("body").on("click", ".fixed-home-yes",function(){
		var num = $(".fixed-pri-home").text();
		console.log(num);
		$.ajax({
			type:"post",
			url:"DelHomeNumServlet?num=" + num,
			datatype: "text",
			success: function(data){
				console.log(data);
				if(data == "true"){
					$(".change").empty();
					$(".change").empty().append("<font color='black'>删除成功</font>");
					$(".change").hide(3000);
					//find('HomeServlet');
					changeHome();
				}else{
					$(".change").empty();
					$(".change").empty().append("<font color='red'>删除失败</font>");
					$(".change").hide(3000);
				}

			}
		});
	});
	//取消删除
	$("body").on("click", ".fixed-home-no",function(){
		$(".change").empty();
	});