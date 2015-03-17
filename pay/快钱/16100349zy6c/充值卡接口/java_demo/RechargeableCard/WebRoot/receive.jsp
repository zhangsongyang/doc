<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.bill.util.Util"%>
<%@page import="com.bill.util.Const"%>
<%@page import="com.bill.*"%>
<%@page import="com.bill.encrypt.Pkipair"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>接受页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
	<body>
		<%
			String key = "XTFDGRXT7U9MK79W";
			// 获取快钱的响应
			String merchantAcctId = request.getParameter("merchantAcctId");
			String version = request.getParameter("version");
			String language = request.getParameter("language");
			String payType = request.getParameter("payType");
			String cardNumber = request.getParameter("cardNumber");
			String cardPwd = request.getParameter("cardPwd");
			String orderId = request.getParameter("orderId");
			String orderAmount = request.getParameter("orderAmount");
			String dealId = request.getParameter("dealId");
			String orderTime = request.getParameter("orderTime");
			String ext1 = request.getParameter("ext1");
			String ext2 = request.getParameter("ext2");
			String payAmount = request.getParameter("payAmount");
			String billOrderTime = request.getParameter("billOrderTime");
			String payResult = request.getParameter("payResult");
			String signType = request.getParameter("signType");
			String bossType = request.getParameter("bossType");
			String receiveBossType = request.getParameter("receiveBossType");
			String receiverAcctId = request.getParameter("receiverAcctId");
			String signMsg = request.getParameter("signMsg");
			// 定义摘要，用于将响应中的signMsg解密后产生的摘要进行比较
			String param = "";
			if (Util.isNotEmpty(merchantAcctId)) {
				param = param + "merchantAcctId" + Const.EQ + merchantAcctId;
			}
			if (Util.isNotEmpty(version)) {
				param = param + Const.CON + "version" + Const.EQ + version;
			}
			if (Util.isNotEmpty(language)) {
				param = param + Const.CON + "language" + Const.EQ + language;
			}
			if (Util.isNotEmpty(payType)) {
				param = param + Const.CON + "payType" + Const.EQ + payType;
			}
			if (Util.isNotEmpty(cardNumber)) {
				param = param + Const.CON + "cardNumber" + Const.EQ
						+ cardNumber;
			}
			if (Util.isNotEmpty(cardPwd)) {
				param = param + Const.CON + "cardPwd" + Const.EQ + cardPwd;
			}
			if (Util.isNotEmpty(orderId)) {
				param = param + Const.CON + "orderId" + Const.EQ + orderId;
			}
			if (Util.isNotEmpty(orderAmount)) {
				param = param + Const.CON + "orderAmount" + Const.EQ
						+ orderAmount;
			}
			if (Util.isNotEmpty(dealId)) {
				param = param + Const.CON + "dealId" + Const.EQ + dealId;
			}
			if (Util.isNotEmpty(orderTime)) {
				param = param + Const.CON + "orderTime" + Const.EQ + orderTime;
			}
			if (Util.isNotEmpty(ext1)) {
				param = param + Const.CON + "ext1" + Const.EQ + ext1;
			}
			if (Util.isNotEmpty(ext2)) {
				param = param + Const.CON + "ext2" + Const.EQ + ext2;
			}
			if (Util.isNotEmpty(payAmount)) {
				param = param + Const.CON + "payAmount" + Const.EQ + payAmount;
			}
			if (Util.isNotEmpty(billOrderTime)) {
				param = param + Const.CON + "billOrderTime" + Const.EQ
						+ billOrderTime;
			}
			if (Util.isNotEmpty(payResult)) {
				param = param + Const.CON + "payResult" + Const.EQ + payResult;
			}
			if (Util.isNotEmpty(signType)) {
				param = param + Const.CON + "signType" + Const.EQ + signType;
			}
			if (Util.isNotEmpty(bossType)) {
				param = param + Const.CON + "bossType" + Const.EQ + bossType;
			}
			if (Util.isNotEmpty(receiveBossType)) {
				param = param + Const.CON + "receiveBossType" + Const.EQ
						+ receiveBossType;
			}
			if (Util.isNotEmpty(receiverAcctId)) {
				param = param + Const.CON + "receiverAcctId" + Const.EQ
						+ receiverAcctId;
			}
			param = param + Const.CON + "key=" + key;
			String signMsgVal = MD5Util.md5Hex(param.getBytes("utf-8")).toUpperCase();
			int rtnOk = 0;
	        String rtnUrl = "";
			if (signMsgVal.equalsIgnoreCase(signMsg)) {
				if (payResult == "10") {
					rtnOk = 1;
			        rtnUrl = "http://219.233.173.50:8801/RechargeableCard/show.jsp?msg=success";
				} else {
					rtnOk = 1;
			        rtnUrl = "http://219.233.173.50:8801/RechargeableCard/show.jsp?msg=false";
				}
			} else {
				    rtnOk = 1;
			        rtnUrl = "http://219.233.173.50:8801/RechargeableCard/show.jsp?msg=error";
			}
%>
	<result><%=rtnOk%></result><redirecturl><%=rtnUrl%></redirecturl>
</html>
