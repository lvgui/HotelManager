<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="css/house.css">
</head>
<body onload="find('HomeServlet')">
	 <ul class="house">
    	<li class="active">全部房间</li>
    	<li>类别管理</li>
    	<li>添加房间</li>

    </ul>
    <div id="allhome">
    <button id="house_all">全部房间</button>
    <div class="choose">
    	<div class="chooseitems">
    	<span>按状态查看：</span>
    	<input type="radio" name="status" checked="checked" value="all">全部
    	<input type="radio" name="status" value="1">已住
    	<input type="radio" name="status" value="0">未住
    	<input type="radio" name="status" value="2">已预约
   		</div>
   		<div class="chooseitems">
    	
    	
    	
    	</div>
    	<input type="hidden" id="chooseitems-status" value="all">
    	<input type="hidden" id="chooseitems-types" value="all">
    </div>
    <div id="houseshow_all">
    	<div id="fixed">
            <button class="fixed-in">添加入住</button>
            <button class="fixed-img">修改房间图片</button>
            <button class="fixed-type">修改房间类别</button>
            <button class="fixed-home">删除房间</button>
            <button class="fixed-num">修改房间号码</button>  
            <button class="fixed-pri">修改价格</button>   
            <button class="fixed-dis">修改折扣</button>  
            <button class="fixed-all">全选</button> 
            <button class="fixed-not">全不选</button>     
            <div class="change">
            
            </div> 
    	</div>
    </div>
    <ul id="houseshow">

    	<!--  <li>
                <img src="images/fang.jpg">
                <p>房间号码：<span>301</span></p>
                <p>房间状态：<span>已住</span></p>
                <p>房间类型：<span>商务房</span></p>
                <p>房间价格：<span>89/天</span></p>
                <p>房间折扣：<span>1</span></p>
                <h3>入住信息</h3>
                	<div class="infor">

                		<p>姓名：<span>吕贵</span></p>
                		<p>证件号码：<span>612726199211236012</span></p>
                		<p>入住时间：<span>2018-2-5 12：12</span></p>
                		<p>押金：<span>100</span></p>
                		<p>到期时间：<span>2018-2-5 12：12</span></p>
                	</div>
                <h3>预定信息</h3> 
                	<div class="infor">
                		<p>无</p>
                	</div>           
    	</li>-->
    </ul>
    </div>
    <div id="typemanager">
     <h2>类别信息</h2>
     <button id="typemanager-add">添加类别</button>
    <table>
    	<tr>
    		<th>类别名称</th>
    		<th>操作</th>
    	</tr>
    		<tr>
    			<td><a href="">aa</a></td>
    			<td>
    				<a href="">查看</a>
    				<a href="">修改</a>
    				<a href="">删除</a>
    			</td>
    		</tr>
 	
    </table>
    </div>
    <div id="addhome">		
			<h2>添加房间</h2>
		<form action="" method="post">
			<input type="hidden">
			<b>房间号码</b> <input type="text" name="addhome-num" /><span class="addhome-num-tid"></span><br>
			<b>房间类型 </b><select name="addhome-type" id="addhome-type"> 
			    <option value="麻将房">麻将房</option>
			    <option value="大床房">大床房</option>
			    <option value="标间">标间</option>
		</select><br>
		<b>房间图片</b> <img src="images/fang.jpg"/><input type="number" step="1" min="1" max="10" name="addhome-image"/><br />
		<b>房间价格</b><input type="number" step="1" min="0" name="addhome-prices"/><span class="addhome-prices-tid"></span><br>
		<b>房价折扣</b> <input type="number" step="0.01" min="0.01" value="1" name="addhome-discount" /><br>
		
		<input type="submit" value="确认" class="addhome-submit"/> <input type="reset"  value="重置"/>
		</form>
		</div>
    <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
    
		<script>
			function find(url){
				//显示房间的信息查询
				$.ajax({
					type: "post",
					url: url,
					datatype: "json",
					success: function(data){
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
				//显示房间类型列表的信息
				$.ajax({
					type: "post",
					url: "HomeTypeAllServlet",
					datatype: "json",
					success: function(data){
						//console.log(data);
						data = eval("(" + data + ")");
						$(".chooseitems").eq(1).empty();
						console.log(data instanceof Array); 
						var html = "<span>按类别查看：</span><input type='radio' name='types'  checked='checked' value='all'>全部";					
						for(var i = 0;i < data.length;i++){
							html += "<input type='radio' name='types' value=" + data[i] +">" + data[i];
						}
						$(".chooseitems").eq(1).append(html);
					}
				});
				
			}
			$(document).ready(function(){
				var li = [$("#allhome"),$("#typemanager"),$("#addhome")];
				for(var i = 0;i < li.length;i++){
					li[i].hide();
				}
				li[0].show();
				$(".house li").click(function(){
					var index = $(".house li").index(this);
					if(index == 0){
						find("HomeServlet");
					}
					if(index == 1){
						selectHomeType();
					}
					for(var i = 0;i < li.length;i++){
						li[i].hide();
					}
					li[index].show();
				});
				//元素显示即查找
				$(".house li").eq(0).addClass("active");
				$(".house li").click(function(){
					$(this).addClass("active").siblings().removeClass("active");
				});
				//房间选择事件
				$("#houseshow").on("click","li", function() {
				     //do something here
				     if($(this).hasClass("checked")){
				    	 $(this).removeClass("checked");
				     }else{
				    	 $(this).addClass("checked").siblings().removeClass("checked"); 
				     }
					
				 });
				//全不选按钮事件
				 $(".fixed-not").click(function(){
					 $("#houseshow li").removeClass("checked");
				 });
				//全选按钮事件
				 $(".fixed-all").click(function(){
					 $("#houseshow li").addClass("checked");
				 });
				//修改折扣时间
				 $(".fixed-dis").click(function(){
					 $("#fixed .change").empty();
					 $("#fixed .change").show();
					 var $el = $("#houseshow li.checked");
					 if($el.length == 0){
						 $p = "<p style='color:red'>请选择你需要需改的数据</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed .change").hide(2000);
					 }else{
						 $p = "<p>你修改的房间号为  ";
						 $pz = "<p>你修改的当前折扣  ";
						 for(var i = 0;i < $el.length;i++){
							 $p += "<span class='fixed-dis-home'>"+$el.eq(i).children('p').eq(0).children('span').text() + "</span>    ";
							 
							 $pz += "<span>" + $el.eq(i).children('p').eq(4).children('span').text() + "</span>   ";
						 }
						 $p += "</p>";
						 $("#fixed  .change").append($p);
						 $("#fixed  .change").append($pz);
						 $input = "<input  type='number' step='0.01' min='0.01' max='1'  name='discount' class='fixed-dis-val' placeholder='请输入新的的折扣值'><button class='fixed-dis-change'>确认</button><button class='fixed-dis-changeno'>取消</button><span class='fixed-dis-change-tid'></span>";
						 $("#fixed  .change").append($input);	 
					 }
					
				 });

			});
			//查询所有的列表
			function selectHomeType(){
				$.ajax({
					type: "post",
					url: "HomeTypeAllServlet",
					datatype: "json",
					success: function(data){
						console.log(data);
						data = eval("(" + data + ")");
						$("#typemanager table tr:not(:first)").remove();
						console.log(data instanceof Array);
						var html = "";					
						for(var i = 0;i < data.length;i++){
							html += "<tr>";
							html += "<td>" + data[i] + "</td>";
							html += "<td><a href=''>修改</a><a href=''>删除</a></td>";
							html += "</tr>";
						}
						$("#typemanager table").append(html);
					}
				});
			}
		</script>
		<script type="text/javascript" src="js/home.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/changePrice.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/radio.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/typemanager.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/changeNum.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/typechange.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/changeImage.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/addHome.js"  charset="utf-8"></script>
		<script type="text/javascript" src="js/homein.js"  charset="utf-8"></script>
</body>
</html>