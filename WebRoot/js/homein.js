/**
 * fixed-in事件
 */
$(function(){
 $(".fixed-in").click(function(){
					 $("#fixed .change").empty();
					 $("#fixed .change").show();
					 var $el = $("#houseshow li.checked");
					 if($el.length == 0){
						 $p = "<p style='color:red'>请选择你添加入住的房间</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed .change").hide(2000);
					 }else if($el.length > 1){
						 $p = "<p style='color:red'>请选择一个一个房间操作</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed .change").hide(2000);
					 }else{
						 $choose = $el.eq(0).children('p').eq(2).children('span').text();
						 $num = $el.eq(0).children('p').eq(0).children('span').text();
						 if(!$choose == "未入住"){
							 alert("有人了");
						 }else{
							 $(".which-room-choose").val($num);
							 $("#main_left_middle ul li").eq(4).click();
						 }
						
					 }
					
				 });

			});