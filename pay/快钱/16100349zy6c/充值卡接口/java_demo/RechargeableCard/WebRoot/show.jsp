<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bill.util.Const"%>
<%@page import="com.bill.util.Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bill.encrypt.Pkipair"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bill.*"%>
<%
String msg=(String)request.getParameter("msg").trim();
%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>显示页面</title>
  </head>
 <BODY>
	<div align="center">
		<h2 align="center">快钱支付结果页面</h2>
		<font color="#ff0000">（该页面仅做参考）</font>
    	<table width="500" border="1" style="border-collapse: collapse" bordercolor="green" align="center">
			<tr>
				<td align="center">
					处理结果
				</td>
				<td align="center">
					<%= msg%>
				</td>
			</tr>	
		</table>
	</div>
</BODY>
</html>
