<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Java Hotel Manager</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{font-family:sans-serif;text-align:center;}
		h1{font-size:36px;font-weight:normal;color:#0084ff;margin-top:50px;margin-bottom:90px;}        
		.login-main{width:350px;margin-left: calc(50% - 175px);padding:20px;
		box-sizing:border-box;border:1px solid #ccc;box-shadow:10px 0px 10px -5px rgba(0,0,0,.3),-10px 0px 10px -5px rgba(0,0,0,.3)}
		input[type="text"],input[type="password"] {border:1px solid #9a9696;height:24px;} 
		input[type="submit"]{width:120px;background:#0076e6;
		border:1px solid #80f5e6;text-align:center;height:35px;
		line-height:35px;cursor:pointer;margin-top:20px;
		margin-left:70px;border-radius:5px;color:white;}
		fieldset{border:1px solid #0084ff;text-align: left;padding:20px;height:340px;width:300px;box-sizing:border-box;} 
		fieldset legend{margin-bottom:40px;text-align:center;}  
		fieldset legend a{color:#333;text-decoration:none;}  
		fieldset legend a:hover{color:blue;}  
		footer{margin-top:100px;}	
		p{line-height:24px;font-size:14px;color:red;height:24px;font-size:14px;}
	</style>
  </head>
 <body>
 <%request.setCharacterEncoding("UTF-8"); %>
	
	<h1>Java Hotel Manager System 1.0</h1>

	   <div class="login-main">
	    <form name="form1" method="post" action="JugdeManagerPageServlet" id="form1">
	    <fieldset>
	      <legend><a href="http://localhost:8080" target="_blank" title="返回网站主页">管理员登陆</a></legend>
	     
		   用户名：
		   <input type="text" name="maneger" placeholder="你的名字" id="maneger">
		   <p id="user_tib"> </p>
		   密&#12288;码：
		   <input type="password" class="alltxt" name="pwd" placeholder="忘了就忘了" id="pwd"><br>
		   		<p id="pwd_tib"></p>
		<input type="submit" value="登陆">
			
		 </fieldset>
		</form>
	   </div>
	<footer>
		<p>2018@最后一排，万千个董小姐，一个莉莉安，一首郭源潮，再无安河桥。</p>
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<script>
		$(document).ready(function(){
			$("#maneger").focus();
			$("input[type='submit']").click(function(){
				var name = $("#maneger").val();
				var pwd = $("#pwd").val();
				if(name == null || name == ""){
					$("#user_tib").text("账号不能为空");
					$("#maneger").focus();
					return false;
				}
				if(pwd == null || pwd == ""){
					$("#pwd_tib").text("密码不能为空");
					$("#pwd").focus();
					return false;
				}
				$.ajax({
					url: "ManageJudgeServlet",
					type: "post",
					async: "true",
					data: "manager=" + name + "&pwd=" + pwd,
					dateType: "text",
					success: function(data){
						if(data == "false"){
							$("#pwd_tib").text("密码或者密码错误");
						}else{
							//$("#pwd_tib").text("吕贵");
							$("#form1").submit();
						}
					}
				});
				return false;
			});
			$("#maneger").bind("input propertychange",function () {
				$("#user_tib").text("");
            });
			$("#pwd").bind("input propertychange",function () {
				$("#pwd_tib").text("");
            });
			$("#maneger").blur(function(){
				var name = $("#maneger").val();
				if(name == null || name == ""){
					$("#user_tib").text("账号不能为空");
				}
			});
			$("#pwd").blur(function(){
				var name = $("#pwd").val();
				if(name == null || name == ""){
					$("#pwd_tib").text("密码不能为空");
				}
			});
		});
	</script>
</body>
</html>
