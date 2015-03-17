<!--#include file="../util/md5.asp"-->
<!--#include file="../util/tenpay_util.asp"-->
<%
'
'��ʱ����֧��Ӧ����
'============================================================================
'api˵����
'getKey()/setKey(),��ȡ/������Կ
'getParameter()/setParameter(),��ȡ/���ò���ֵ
'getAllParameters(),��ȡ���в���
'isTenpaySign(),�Ƿ�Ƹ�ͨǩ��,true:�� false:��
'getDebugInfo(),��ȡdebug��Ϣ
'
'============================================================================
'


Class PayResponseHandler

	'��Կ
	Private key

	'Ӧ��Ĳ���
	Private parameters

	'debug��Ϣ
	Private debugInfo

	'��ʼ���캯��
	Private Sub class_initialize()
		key = ""
		Set parameters = Server.CreateObject("Scripting.Dictionary")
		debugInfo = ""
				
		parameters.RemoveAll
		
		Dim k
		Dim v
		
		'GET
		For Each k In Request.QueryString
			v = Request.QueryString(k)
			setParameter k,v
		Next
		
		'POST
		For Each k In Request.Form
			v = Request(k)
			setParameter k,v
		Next
		
	End Sub

	'��ȡ��Կ
	Public Function getKey()
		getKey = key
	End Function
	
	'������Կ
	Public Function setKey(key_)
		key = key_
	End Function
	
	'��ȡ����ֵ
	Public Function getParameter(parameter)
		getParameter = parameters.Item(parameter)
	End Function
	
	'���ò���ֵ
	Public Sub setParameter(parameter, parameterValue)
		If parameters.Exists(parameter) = True Then
			parameters.Remove(parameter)
		End If
		parameters.Add parameter, parameterValue	
	End Sub

	'��ȡ��������Ĳ���,����Scripting.Dictionary
	Public Function getAllParameters()
		getAllParameters = parameters
	End Function

	'�Ƿ�Ƹ�ͨǩ��
	'true:�� false:��
	Public Function isTenpaySign()
		
		sign_type = getParameter("sign_type")
		service_version = getParameter("service_version")
		input_charset = getParameter("input_charset")
		sign_key_index = getParameter("sign_key_index")
		trade_mode = getParameter("trade_mode")
		trade_state = getParameter("trade_state")
		pay_info = getParameter("pay_info")
		partner = getParameter("partner")
		bank_type = getParameter("bank_type")
		bank_billno = getParameter("bank_billno")
		total_fee = getParameter("total_fee")
		fee_type = getParameter("fee_type")
		notify_id = getParameter("notify_id")
		transaction_id = getParameter("transaction_id")
		out_trade_no = getParameter("out_trade_no")
		attach = getParameter("attach")
		time_end = getParameter("time_end")
		transport_fee = getParameter("transport_fee")
		product_fee = getParameter("product_fee")
		discount = getParameter("discount")
		buyer_alias = getParameter("buyer_alias")

		signPars = Array("sign_type="&sign_type, "service_version="&service_version, "input_charset="&input_charset,
		"sign_key_index="&sign_key_index, "trade_mode="&trade_mode, "trade_state="&trade_state, "pay_info="&pay_info,
		"partner="&partner, "bank_type="&bank_type, "bank_billno="&bank_billno, "total_fee="&total_fee,
		"fee_type="&fee_type, "notify_id="&notify_id, "transaction_id="&transaction_id, "out_trade_no="&out_trade_no,
		"attach="&attach, "time_end="&time_end, "transport_fee="&transport_fee, "product_fee="&product_fee,
		"discount="&discount, "buyer_alias="&buyer_alias)

		Count=ubound(signPars)
		For i = Count TO 0 Step -1
		    minmax = signPars( 0 )
		    minmaxSlot = 0
		    For j = 1 To i
				mark = (signPars( j ) > minmax)
		        If mark Then 
		            minmax = signPars( j )
		            minmaxSlot = j
		        End If
		    Next
		    If minmaxSlot <> i Then 
		        temp = signPars( minmaxSlot )
		        signPars( minmaxSlot ) = signPars( i )
		        signPars( i ) = temp
		    End If
		Next
		
		For j = 0 To Count Step 1
			value = SPLIT(signPars( j ), "=")
			If value(1)<>"" then
				md5str= md5str&signPars( j )&"&"
			End If 
		Next
		
		md5str = md5str & "key=" & key
		
		Dim sign
		sign= LCase(ASP_MD5(md5str))
		
		Dim tenpaySign
		tenpaySign = LCase( getParameter("sign"))

		'debugInfo
		debugInfo = md5str & " => sign:" & sign & " tenpaySign:" & tenpaySign

		isTenpaySign = (sign = tenpaySign)

	End Function

	
	'��ȡdebug��Ϣ
	Function getDebugInfo()
		getDebugInfo = debugInfo
	End Function
	
End Class




%>