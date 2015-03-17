<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bill.util.Const"%>
<%@page import="com.bill.util.Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bill.encrypt.Pkipair"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bill.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>信息确认</title>
  </head>
  <body>
    <%
    	// 获取传入的变量值
    	String inputCharset = request.getParameter("inputCharset");
        String pageUrl = request.getParameter("pageUrl");
    	String bgUrl = request.getParameter("bgURL");
    	String version = request.getParameter("version");
    	String language = request.getParameter("language");
    	String signType = request.getParameter("signType");
    	String merchantAcctId = request.getParameter("merchantAcctId");
    	String payerName = request.getParameter("payerName"); 
    	String payerContactType = request.getParameter("payerContactType");
    	String payerContact = request.getParameter("payerContact");
    	String orderId = request.getParameter("orderId");
    	String orderAmount = request.getParameter("orderAmount");
    	String payType = request.getParameter("payType");
    	String cardNumber = request.getParameter("cardNumber");
    	String cardPwd = request.getParameter("cardPwd");
    	String fullAmountFlag = request.getParameter("fullAmountFlag");
    	String orderTime = request.getParameter("orderTime");
        String productName = URLEncoder.encode(request.getParameter("productName"),"ISO8859_1").toUpperCase();
    	String productNum = request.getParameter("productNum");
    	String productId = request.getParameter("productId");
        String productDesc = URLEncoder.encode(request.getParameter("productDesc"),"ISO8859_1").toUpperCase();
    	String ext1 = request.getParameter("ext1");
    	String ext2 = request.getParameter("ext2");
    	String bossType = request.getParameter("bossType");
    	String key="XTFDGRXT7U9MK79W";
    	// 定义需要加密的摘要
    	String param = "";
    	if (Util.isNotEmpty(inputCharset)) {
    		param = param + "inputCharset" + Const.EQ + inputCharset;
    	}
    	if (Util.isNotEmpty(pageUrl)) {
    		param = param + Const.CON + "pageUrl" + Const.EQ + pageUrl;
    	}
    	if (Util.isNotEmpty(bgUrl)) {
    		param = param + Const.CON + "bgUrl" + Const.EQ + bgUrl;
    	}
    	if (Util.isNotEmpty(version)) {
    		param = param + Const.CON + "version" + Const.EQ + version;
    	}
    	if (Util.isNotEmpty(language)) {
    		param = param + Const.CON + "language" + Const.EQ + language;
    	}
    	if (Util.isNotEmpty(signType)) {
    		param = param + Const.CON + "signType" + Const.EQ + signType;
    	}
    	if (Util.isNotEmpty(merchantAcctId)) {
    		param = param + Const.CON + "merchantAcctId" + Const.EQ + merchantAcctId;
    	}
    	if (Util.isNotEmpty(payerName)) {
    		param = param + Const.CON + "payerName" + Const.EQ + payerName;
    	}
    	if (Util.isNotEmpty(payerContactType)) {
    		param = param + Const.CON + "payerContactType" + Const.EQ + payerContactType;
    	}
    	if (Util.isNotEmpty(payerContact)) {
    		param = param + Const.CON + "payerContact" + Const.EQ + payerContact;
    	} 
    	if (Util.isNotEmpty(orderId)) {
    		param = param + Const.CON + "orderId" + Const.EQ + orderId;
    	}
    	if (Util.isNotEmpty(orderAmount)) {
    		param = param + Const.CON + "orderAmount" + Const.EQ + orderAmount;
    	}
    	if (Util.isNotEmpty(payType)) {
    		param = param + Const.CON + "payType" + Const.EQ + payType;
    	}
    	if (Util.isNotEmpty(cardNumber)) {
    		param = param + Const.CON + "cardNumber" + Const.EQ + cardNumber;
    	}
    	if (Util.isNotEmpty(cardPwd)) {
    		param = param + Const.CON + "cardPwd" + Const.EQ + cardPwd;
    	}
    	if (Util.isNotEmpty(fullAmountFlag)) {
    		param = param + Const.CON + "fullAmountFlag" + Const.EQ + fullAmountFlag;
    	}
    	if (Util.isNotEmpty(orderTime)) {
    		param = param + Const.CON + "orderTime" + Const.EQ + orderTime;
    	}
    	if (Util.isNotEmpty(productName)) {
    		param = param + Const.CON + "productName" + Const.EQ + productName;
    	}
    	if (Util.isNotEmpty(productNum)) {
    		param = param + Const.CON + "productNum" + Const.EQ + productNum;
    	}
    	if (Util.isNotEmpty(productId)) {
    		param = param + Const.CON + "productId" + Const.EQ + productId;
    	}
    	if (Util.isNotEmpty(productDesc)) {
    		param = param + Const.CON + "productDesc" + Const.EQ + productDesc;
    	}
    	if (Util.isNotEmpty(ext1)) {
    		param = param + Const.CON + "ext1" + Const.EQ + ext1;
    	}
    	if (Util.isNotEmpty(ext2)) {
    		param = param + Const.CON + "ext2" + Const.EQ + ext2;
    	}
    	if (Util.isNotEmpty(bossType)) {
    		param = param + Const.CON + "bossType" + Const.EQ + bossType;
    	}
    	param = param + Const.CON + "key" + Const.EQ + key;
	   String signMsg = MD5Util.md5Hex(param.getBytes("utf-8")).toUpperCase();
    %>
    <%=param %>
    <form action="https://sandbox.99bill.com/szxgateway/recvMerchantInfoAction.htm" method="get">
			<table width="100%">
				<tr>
					<td width="50%" align="right">
						字符集[inputCharset]:
					</td>
					<td width="50%" align="left">
						<input name="inputCharset" type="hidden" value="<%= inputCharset %>" />
						<%= inputCharset %>
					</td>
				</tr>
				<tr>
					<td align="right">
						服务器接受支付结果的后台地址[pageUrl]:
					</td>
					<td align="left">
						<input name="pageUrl" type="hidden" value="<%= pageUrl %>" />
						<%= pageUrl %>
					</td>
				</tr>
				<tr>
					<td align="right">
						服务器接受支付结果的后台地址[bgUrl]:
					</td>
					<td align="left">
						<input name="bgUrl" type="hidden" value="<%= bgUrl %>" />
						<%= bgUrl %>
					</td>
				</tr>
				<tr>
					<td align="right">
						网关版本[version]:
					</td>
					<td align="left">
						<input name="version" type="hidden" value="<%= version %>" />
						<%= version %>
					</td>
				</tr>
				<tr>
					<td align="right">
						网关页面显示语言种类[language]:
					</td>
					<td align="left">
						<input name="language" type="hidden" value="<%= language %>" />
						<%= language %>
					</td>
				</tr>
				<tr>
					<td align="right">
						签名类型[signType]:
					</td>
					<td align="left">
						<input name="signType" type="hidden" value="<%= signType %>" />
						<%= signType %>
					</td>
				</tr>
				<tr>
					<td align="right">
						人民币账号[merchantAcctId]:
					</td>
					<td align="left">
						<input name="merchantAcctId" type="hidden" value="<%= merchantAcctId %>" />
						<%= merchantAcctId %>
					</td>
				</tr>
			  	<tr>
					<td align="right">
						支付人姓名[payerName]:
					</td>
					<td align="left">
						<input name="payerName" type="hidden" value="<%= payerName %>" />
						<%= payerName %>
					</td>
				</tr>
				<tr>
					<td align="right">
						支付人联系方式类型[payerContactType]:
					</td>
					<td align="left">
						<input name="payerContactType" type="hidden" value="" />
					</td>
				</tr>
				<tr>
					<td align="right">
						支付人联系方式[payerContact]:
					</td>
					<td align="left">
						<input name="payerContact" type="hidden" value="" />
					</td>
				</tr>
				<tr>
					<td align="right">
						商家订单号[orderId]:
					</td>
					<td align="left">
						<input name="orderId" type="hidden" value="<%= orderId %>" />
						<%= orderId %>
					</td>
				</tr>
				<tr>
					<td align="right">
						商家订单金额[orderAmount]:
					</td>
					<td align="left">
						<input name="orderAmount" type="hidden" value="<%= orderAmount %>" />
						<%= orderAmount %>
					</td>
				</tr>
				<tr>
					<td align="right">
						支付方式[payType]:
					</td>
					<td align="left">
						<input name="payType" type="hidden" value="<%= payType %>" />
						<%= payType %>
					</td>
				</tr>
				  <tr>
					<td align="right">
						充值卡序号[cardNumber]:
					</td>
					<td align="left">
						<input name="cardNumber" type="hidden" value="<%=cardNumber %>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						充值卡密码[cardPwd]:
					</td>
					<td align="left">
						<input name="cardPwd" type="hidden" value="<%= cardPwd %>" />
					</td>
				</tr> 
				<tr>
					<td align="right">
						全额支付标志[fullAmountFlag]:
					</td>
					<td align="left">
						<input name="fullAmountFlag" type="hidden" value="<%= fullAmountFlag %>" />
						<%= fullAmountFlag %>
					</td>
				</tr>
				<tr>
					<td align="right">
						商家订单提交时间[orderTime]:
					</td>
					<td align="left">
						<input name="orderTime" type="hidden" value="<%= orderTime %>" />
					</td>
				</tr>
				  <tr>
					<td align="right">
						商品名称[productName]:
					</td>
					<td align="left">
						<input name="productName" type="hidden" value="<%= productName%>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						商品数量[productNum]:
					</td>
					<td align="left">
						<input name="productNum" type="hidden" value="<%= productNum %>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						商品代码[productId]:
					</td>
					<td align="left">
						<input name="productId" type="hidden" value="<%= productId %>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						商品描述[productDesc]:
					</td>
					<td align="left">
						<input name="productDesc" type="hidden" value="<%= productDesc %>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						扩展字段1[ext1]:
					</td>
					<td align="left">
						<input name="ext1" type="hidden" value="<%= ext1%>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						扩展字段2[ext2]:
					</td>
					<td align="left">
						<input name="ext2" type="hidden" value="<%= ext2%>" />
					</td>
				</tr>
				<tr>
					<td align="right">
						充值卡类型[bossType]:
					</td>
					<td align="left">
						<input name="bossType" type="hidden" value="<%= bossType %>" />
						<%= bossType %>
					</td>
				</tr>
				<tr>
					<td align="right">
						签名字符串[signMsg]:
					</td>
					<td align="left">
						<input name="signMsg" type="hidden" value="<%= signMsg %>" />
						<%= signMsg %>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="提交" />
					</td>
				</tr>
			</table>
		</form>
  </body>
</html>
