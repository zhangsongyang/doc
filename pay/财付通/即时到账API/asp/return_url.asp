<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include file="./classes/PayResponseHandler.asp"-->
<%
'---------------------------------------------------------
'财付通即时到帐处理回调示例，商户按照此示例进行开发即可
'---------------------------------------------------------

'密钥
Dim key
key = "8934e7d15453e97507ef794cf7b0519d"

'创建支付应答对象
Dim resHandler
Set resHandler = new PayResponseHandler
resHandler.setKey(key)

'判断签名
If resHandler.isTenpaySign() = True Then
	
	Dim transaction_id
	Dim total_fee
	Dim out_trade_no
	Dim discount
	Dim trade_state
	
	'商户交易单号
	out_trade_no = resHandler.getParameter("out_trade_no")	

	'财付通交易单号
	transaction_id = resHandler.getParameter("transaction_id")

	'商品金额,以分为单位
	total_fee = resHandler.getParameter("total_fee")
	
	'如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
	discount = resHandler.getParameter("discount");
	
	'支付结果
	trade_state = resHandler.getParameter("trade_state")
	trade_mode = resHandler.getParameter("trade_mode")
	
	If "0" = trade_state && "1" = trade_mode Then
	
		'------------------------------
		'处理业务开始
		'------------------------------
		
		'注意交易单不要重复处理
		'注意判断返回金额
		
		'------------------------------
		'处理业务完毕
		'------------------------------	
		
		'处理成功
		Response.Write("支付成功")
	
	Else
		'当做不成功处理
		Response.Write("支付失败")
	End If	

Else

	'签名失败
	Response.Write("签名签证失败")

	Dim debugInfo
	debugInfo = resHandler.getDebugInfo()
	Response.Write("<br/>debugInfo:" & debugInfo & "<br/>")

End If


%>