<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>充值卡网关</title>
	</head>
	<body>
		<form action="send.jsp" method="post">
			<table width="100%">
				<tr>
					<td width="50%" align="right">
						字符集[inputCharset]:
					</td>
					<td width="50%" align="left">
						<input name="inputCharset" type="text" value="1">
						1、utf-8 2、gbk 3、gb2312；5 代表big5；默认为1
					</td>
				</tr>
				<tr>
					<td align="right">
						服务器接受支付结果的后台地址[bgUrl]:
					</td>
					<td align="left">
						<input name="bgURL" type="text" style="width: 400px"
							value="http://219.233.173.50:8801/RechargeableCard/receive.jsp" />
					</td>
				</tr>
				<tr>
					<td align="right">
						服务器接受支付结果的前台地址[pageUrl]:
					</td>
					<td align="left">
						<input name="pageUrl" type="text" style="width: 400px"
							value="" />
					</td>
				</tr>
				<tr>
					<td align="right">
						网关版本[version]:
					</td>
					<td align="left">
						<input name="version" type="text" value="v2.0" />
						固定值：v2.0（N）
					</td>
				</tr>
				<tr>
					<td align="right">
						网关页面显示语言种类[language]:
					</td>
					<td align="left">
						<input name="language" type="text" value="1" />
						1,中文;2,英文（N）
					</td>
				</tr>
				<tr>
					<td align="right">
						签名类型[signType]:
					</td>
					<td align="left">
						<input name="signType" type="text" value="1" />
					</td>
				</tr>
				<tr>
					<td align="right">
						收款帐号[merchantAcctId]:
					//线上的话为商户的具体的某种卡类型的账号，send,receive页面具体的修改为改账号对应的密钥
					</td>
					<td align="left">
						<input name="merchantAcctId" type="text" value= "1001213884209"       />
						（N）                                                    
					</td>
				</tr>
				<tr>
					<td align="right">
						支付人姓名[payerName]:
					</td>
					<td align="left">
						<input name="payerName" type="text" value="1" />
					</td>
				</tr>
				<tr>
					<td align="right">
						支付人联系方式类型[payerContactType]:
					</td>
					<td align="left">
						<input name="payerContactType" type="text" value="" />
					</td>
				</tr>
				<tr>
					<td align="right">
						支付人联系方式[payerContact]:
					</td>
					<td align="left">
						<input name="payerContact" type="text" value=""/>
					</td>
				</tr>
				<tr>
					<td align="right">
						商家订单号[orderId]:
					</td>
					<td align="left">
						<input name="orderId" type="text" value="<%=new java.text.SimpleDateFormat("yyyyMMddHHmmss")
						.format(new java.util.Date())%>"/>
						(N)
					</td>
				</tr>
				<tr>
					<td align="right">
						商家订单金额[orderAmount]:
					</td>
					<td align="left">
						<input name="orderAmount" type="text" value="3000" />
						整型数字，以分为单位。（N）
					</td>
				</tr>
				<tr>
					<td align="right">
						支付方式[payType]:
						//如果为卡密直连的话该值为52，对应的下面的全额支付标志fullAmountFlag=1，卡号卡密为必填且bossType
						的值为具体的某种卡类型的值（具体的卡类型值参考接口文档）
					</td>
					<td align="left">
						<input name="payType" type="text" value="42" />
						（N）41 42 52
					</td>
				</tr>
				<tr>
					<td align="right">
						充值卡序号[cardNumber]:
					</td>
					<td align="left">
						<input name="cardNumber" type="text"  value=""/>
					</td>
				</tr>
				<tr>
					<td align="right">
						充值卡密码[cardPwd]:
					</td>
					<td align="left">
						<input name="cardPwd" type="text"  value=""/>
					</td>
				</tr>
				<tr>
					<td align="right">
						全额支付标志[fullAmountFlag]:
					</td>
					<td align="left">
						<input name="fullAmountFlag" type="text"  value="0"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						商户订单提交时间[orderTime]:
					</td>
					<td align="left">
						<input name="orderTime" type="text"  value="<%=new java.text.SimpleDateFormat("yyyyMMddHHmmss")
						.format(new java.util.Date())%>"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						商品名称[productName]:
					</td>
					<td align="left">
						<input name="productName" type="text" value="dd"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						商品数量[productNum]:
					</td>
					<td align="left">
						<input name="productNum" type="text" value="1" />
						取值为1到999
					</td>
				</tr>
				<tr>
					<td align="right">
						商品代码[productId]:
					</td>
					<td align="left">
						<input name="productId" type="text" />
					</td>
				</tr>
				<tr>
					<td align="right">
						商品描述[productDesc]:
					</td>
					<td align="left">
						<input name="productDesc" type="text" value="FF"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						扩展字段1[ext1]:
					</td>
					<td align="left">
						<input name="ext1" type="text" value="30|12|90" />
					</td>
				</tr>
				<tr>
					<td align="right">
						扩展字段2[ext2]:
					</td>
					<td align="left">
						<input name="ext2" type="text" value="99127|ss476966349" />
					</td>
				</tr>
				
				<tr>
					<td align="right">
						充值卡类型[bossType]:
					</td>
					<td align="left">
						<input name="bossType" type="text" value="9" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="确认" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
