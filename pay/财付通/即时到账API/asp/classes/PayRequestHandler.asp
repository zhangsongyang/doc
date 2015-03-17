<!--#include file="../util/md5.asp"-->
<!--#include file="../util/tenpay_util.asp"-->
<%
'
'��ʱ����֧��������
'============================================================================
'api˵����
'init(),��ʼ��������Ĭ�ϸ�һЩ������ֵ����cmdno,date�ȡ�
'getGateURL()/setGateURL(),��ȡ/������ڵ�ַ,����������ֵ
'getKey()/setKey(),��ȡ/������Կ
'getParameter()/setParameter(),��ȡ/���ò���ֵ
'getAllParameters(),��ȡ���в���
'getRequestURL(),��ȡ������������URL
'doSend(),�ض��򵽲Ƹ�֧ͨ��
'getDebugInfo(),��ȡdebug��Ϣ
'
'============================================================================
'

Class PayRequestHandler
	
	'����url��ַ
	Private gateUrl
	
	'��Կ
	Private key
	
	'����Ĳ���
	Private parameters
	
	'debug��Ϣ
	Private debugInfo
	
	'��ʼ���캯��
	Private Sub class_initialize()
		gateUrl = "https://gw.tenpay.com/gateway/pay.htm"
		key = ""
		Set parameters = Server.CreateObject("Scripting.Dictionary")
		debugInfo = ""
	End Sub
	
	'��ʼ������
	Public Function init()
		parameters.RemoveAll


	End Function
	
	'��ȡ��ڵ�ַ,����������ֵ
	Public Function getGateURL()
		getGateURL = gateUrl
	End Function
	
	'������ڵ�ַ,����������ֵ
	Public Function setGateURL(gateUrl_)
		gateUrl = gateUrl_
	End Function
	
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
	
	'��ȡ������������URL
	Public Function getRequestURL()

		Call createSign()
		
		Dim reqPars
		Dim k
		For Each k In parameters
			reqPars = reqPars & k & "=" & Server.URLEncode(parameters(k)) & "&" 
		Next
		
		'ȥ�����һ��&
		reqPars = Left(reqPars, Len(reqPars)-1)

		getRequestURL = getGateURL & "?" & reqPars

	End Function
	
	'�ض��򵽲Ƹ�֧ͨ��
	Public Function doSend()
		Response.Redirect(getRequestURL())
		Response.End
	End Function	
	
	'��ȡdebug��Ϣ
	Public Function getDebugInfo()
		getDebugInfo = debugInfo
	End Function
	
	'����ǩ��
	Private Sub createSign()
	
		sign_type = getParameter("sign_type")
		service_version = getParameter("service_version")
		input_charset = getParameter("input_charset")
		sign_key_index = getParameter("sign_key_index")
		bank_type = getParameter("bank_type")
		body = getParameter("body")
		attach = getParameter("attach")
		return_url = getParameter("return_url")
		notify_url = getParameter("notify_url")
		buyer_id = getParameter("buyer_id")
		partner = getParameter("partner")
		out_trade_no = getParameter("out_trade_no")
		total_fee = getParameter("total_fee")
		fee_type = getParameter("fee_type")
		spbill_create_ip = getParameter("spbill_create_ip")
		time_start = getParameter("time_start")
		time_expire = getParameter("time_expire")
		transport_fee = getParameter("transport_fee")
		product_fee = getParameter("product_fee")
		goods_tag = getParameter("goods_tag")

		signPars = Array("sign_type="&sign_type, "service_version="&service_version, "input_charset="&input_charset, "sign_key_index="&sign_key_index, "bank_type="&bank_type, "body="&body, "attach="&attach,"return_url="&return_url, "notify_url="&notify_url, "buyer_id="&buyer_id, "partner="&partner,"out_trade_no="&out_trade_no, "total_fee="&total_fee, "fee_type="&fee_type, "spbill_create_ip="&spbill_create_ip, "time_start="&time_start, "time_expire="&time_expire, "transport_fee="&transport_fee, "product_fee="&product_fee, "goods_tag="&goods_tag)
	
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

		setParameter "sign", sign

		'debuginfo
		debugInfo = md5str & " => sign:" & sign
		
	End Sub

End Class

%>