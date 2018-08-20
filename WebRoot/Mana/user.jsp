<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/user.css">


  </head>
  
  <body>
  <div id="user-page">
    <h2>用户信息界面</h2>
    <table>
    	<tr>
    		<td>用户姓名</td><td>证件类型</td><td>证件号码</td>
    	</tr>
    </table>
   </div>
  </body>
 <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
 <script>
 	$(document).ready(function(){
 		$("#user-page table tr:not(:first)").remove();
 		$.ajax({
 			type: "post",
 			url: "CustomerAllServlet",
 			datatype: "json",
 			success: function(data){
 				data = eval("(" + data + ")");
 				$html = "";
 				for(var i = 0;i < data.length;i++){
 					$html += "<tr>";
 					console.log(data[i]);
 					$.each(data[i],function(index, value) {
 						$html += "<td>" + value + "</td>";
 					});
 					$html += "</tr>";
 				}
 				$("#user-page table").append($html);
 			}
 		
 		});
 	});
 </script>
</html>
