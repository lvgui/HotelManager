<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
 	<meta charset="utf-8">  
    <title>Java Hotel 管理后台</title>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="css/hindex.css">
  </head>
  <body>
	    <header class="all_width">
			<h2>Java Hotel Manager</h2>
			<div id="info"><img src="images/image2.jpg"><img src="images/xiala.png">

				<ul>
					<li><img src="images/me.png">我的信息</li>
					<li><a href="Mana/index.jsp" style="text-decoration:none;color:#949494;"><img src="images/exit.png">退出</a></li>
				</ul>
			</div>
		</header>
		<div id="main" class="all_width">
			<div id="main_left">
				<div id="main_left_top">
					<img src="images/image2.jpg">
					<h2>${requestScope.manager}</h2>
					<p>当前段位：
						<span>
							<c:choose>
								<c:when test="${requestScope.quan == 1}">
									荣誉黄金
								</c:when>
								<c:when test="${requestScope.quan == 2}">
									华贵铂金
								</c:when>
								<c:when test="${requestScope.quan == 10}">
									最强王者
								</c:when>
							</c:choose>
						</span>
					</p>
				</div>
				<div id="main_left_middle">
					<span>操作菜单</span>
					<ul>
						<li><span></span><h4>房屋管理</h4></li>
						<li><span></span><h4>人员信息</h4></li>
						<li><span></span><h4>用户信息</h4></li>
						<li><span></span><h4>会员信息</h4></li>
						<li><span></span><h4>下订单</h4></li>
						<li><span></span><h4>退房</h4></li>
						<li><span></span><h4>交班</h4></li>
						<li><span></span><h4>消费记录</h4></li>
					</ul>
				</div>
			</div>
			<div id="main_right">
				<ul>
					<li>
						<jsp:include page="house.jsp"></jsp:include>
					</li>
					<li>
					人员信息页面
					</li>
					<li>
						<jsp:include page="user.jsp"></jsp:include>
					</li>
					<li>
						会员信息
					</li>
					<li>
						<jsp:include page="dingdan.jsp"></jsp:include>
					</li>
					<li>
						退房页面
					</li>
					<li>
						交班页面
					</li>
					<li>
						消费记录
					</li>
				
				</ul>
			</div>
		</div>
		<!-- <footer class="all_width">
			<p>本系统由贾强、陈瑞涛、陈辉、辛琪、匣中制作,你有任何的问题，都可以联系744411122，提供免费帮助，软件升级等。</p>
		</footer>
		 -->
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script>
			$(document).ready(function(){
				//$("#main_right>ul>li:not(:first)").hide();
				$("#main_right>ul>li").eq(0).show().siblings().hide();
				$("#main_left_middle>ul>li").eq(0).addClass("show");
				$("#main_left_middle>ul>li").click(function(){
					$(this).addClass("show").siblings().removeClass("show");
					var index = $("#main_left_middle>ul>li").index(this);
					console.log(index);
					$("#main_right>ul>li").eq(index).show().siblings().hide();
				});
				$(window).on('scroll',function(){
				     bodyScroll = $(window).scrollTop();
				     //console.log(bodyScroll);
				     if(bodyScroll > 90){
							$("#main_left").css({"position":"fixed",
								"top":"10px"});
						}else{
							$("#main_left").css({"position":"absolute",
								"top":"100px"});
							
						}
				});

			});
		</script>
  </body>
</html>
