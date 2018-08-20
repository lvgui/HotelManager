<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>订单页面</title>
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="css/dingdan.css">
</head>
<body>
	<div id="dingdanpage">
		<nav>
			<ul>
				<li class="active">下订单</li>
				<li>订单查询</li>
				<li>预约激活</li>
			</ul>
		</nav>
		<div id="outdingdan"> <!-- 下订单 -->
		<input type="hidden" value="301-8" class="which-room-choose">
				选择房间：
				<select name="room-num">
						<option value="301-1">301-1</option>
				</select>		 
			<div class="outdingdan-choose">
				<img src="images/fang.jpg" class="dingdan-home-images">
				<p>房间编号：<span class="dingdan-home-num">301-1</span></p>
				<p>房间类型：<span class="dingdan-home-type">麻将房</span></p>
				<p>房间价格：<span class="dingdan-home-prices">403</span></p>
				<p>房间折扣：<span class="dingdan-home-discount">1</span></p>
			</div>			
			<div class="outdingdan-user">
				<h2>入住用户信息</h2>
				<p></p>
				姓&#12288;&#12288;名：<input type="text" name="customer-name"><span class="customer-name-tid"></span><br>
				证件类型：<input type="radio" name="credentialstype" checked="checked" value="身份证">身份证<input type="radio" name="credentialstype" value="驾驶证">驾驶证<br>
				证件号码：<input type="text" name="credentialsnum"><span class="customer-credentialsnum-tid"></span><br>
				押&#12288;&#12288;金：<input type="number" step="1" min="0" name="deposit"><br>
				入住时间：<input type="date" name="checktime"><br>
				住房天数：<input type="number" name="days" min="0"><br>
				总计金额：<input type="number" min="0" step="1" name="total">
				<br>
				<button id="outdingdan-submit">完成</button>
			</div> 
		</div>
		<div id="selectdingdan"> <!-- 订单查询 -->
			
		</div>
		<div id="actdingdan"> <!-- 预约激活 -->
			
		</div>
	</div>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script>
	$(document).ready(function(){
		$("#main_left_middle ul li").eq(4).click(function(){
			getAllHomeCanIn();
		});

		getAllHomeCanIn();
		$("#outdingdan select").change(function(){
			//alert("yes");
			getAllHomeCanInShow();
		});
		//点击完成
		$("#outdingdan-submit").click(function(){
			
			//姓名
			var name = $("#dingdanpage input[name='customer-name']").val();
			if(name == null || name == ""){
				$("#dingdanpage .customer-name-tid").empty().text("姓名不能为空");
				$("#dingdanpage input[name='customer-name']").focus();
				return false;
			}
			console.log(name);	
			// credentialstype 身份卡类型
			var credentialstype = $("#dingdanpage [name='credentialstype']:checked").val();
			console.log(credentialstype);
			//credentialsnum 身份卡号码
			var credentialsnum = $("#dingdanpage [name='credentialsnum']").val();
			if(credentialsnum == null || credentialsnum == ""){
				$("#dingdanpage .customer-credentialsnum-tid").empty().text("证件号码不能为空");
				$("#dingdanpage [name='credentialsnum']").focus();
				return false;
			}
			console.log(credentialsnum);
			//押金
			var deposit = $("#dingdanpage [name='deposit']").val();
			console.log(deposit);
			//日期
			var date = $("#dingdanpage [type='date']").val();
			console.log(date);
			//天数
			var days = $("#dingdanpage [name='days']").val();
			console.log(days);
			//总价
			var total = $("#dingdanpage [name='total']").val();
			console.log(total);
			
		});
		//姓名输入框改变事件
		$("#dingdanpage input[name='customer-name']").keyup(function(){
			$("#dingdanpage .customer-name-tid").empty();
		});
		//证件号码输入框改变事件
		$("#dingdanpage [name='credentialsnum']").keyup(function(){
			$("#dingdanpage .customer-credentialsnum-tid").empty();
		});
	});
	//将所有能住的房间显示出来
	function getAllHomeCanIn(){
		var choosehome = $(".which-room-choose").val();
		console.log(choosehome);
		$.ajax({
			type:"post",
			url:"FindAllHomeCanInServlet",
			async:false,
			datatype:"json",
			success:function(data){
				data = eval("(" + data + ")");
				$("#outdingdan select").empty();
				$html = "";
				for(var i = 0;i < data.length;i++){
					if(i == 0){
						$html += "<option checked='checked' value='" + data[i] + "'>" + data[i] + "</option>";
					}else{
						$html += "<option value='" + data[i] + "'>" + data[i] + "</option>";
					}
					
				}
				$("#outdingdan select").append($html);
			}
			
		});
		for(var i = 0;i< $("#outdingdan select option").length;i++){
			if($("#outdingdan select option").eq(i).val() == choosehome){
				$("#outdingdan select option").eq(i).attr("selected",true);
			}
		}
		getAllHomeCanInShow();
		//alert($("#outdingdan select").val());
	}
	//展示当前选择的图片
	function getAllHomeCanInShow(){
		$.ajax({
			type:"post",
			url:"SelectHomeByNumServlet",
			data:{"num":$("#outdingdan select").val()},
			async:false,
			datatype:"json",
			success:function(data){
				data = eval("(" + data + ")");
				//alert(data.num);
				$("#dingdanpage .dingdan-home-num").empty().text(data.num);
				$("#dingdanpage .dingdan-home-prices").empty().text(data.prices);
				$("#dingdanpage .dingdan-home-discount").empty().text(data.discount);
				$("#dingdanpage .dingdan-home-type").empty().text(data.type);
				$("#dingdanpage .dingdan-home-images").attr("src","images/" +data.images);
			}
			
		});
	}
</script>
</body>
</html>
