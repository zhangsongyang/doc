<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include file="./classes/PayResponseHandler.asp"-->
<%
'---------------------------------------------------------
'�Ƹ�ͨ��ʱ���ʴ���ص�ʾ�����̻����մ�ʾ�����п�������
'---------------------------------------------------------

'��Կ
Dim key
key = "8934e7d15453e97507ef794cf7b0519d"

'����֧��Ӧ�����
Dim resHandler
Set resHandler = new PayResponseHandler
resHandler.setKey(key)

'�ж�ǩ��
If resHandler.isTenpaySign() = True Then
	
	Dim transaction_id
	Dim total_fee
	Dim out_trade_no
	Dim discount
	Dim trade_state
	
	'�̻����׵���
	out_trade_no = resHandler.getParameter("out_trade_no")	

	'�Ƹ�ͨ���׵���
	transaction_id = resHandler.getParameter("transaction_id")

	'��Ʒ���,�Է�Ϊ��λ
	total_fee = resHandler.getParameter("total_fee")
	
	'�����ʹ���ۿ�ȯ��discount��ֵ��total_fee+discount=ԭ�����total_fee
	discount = resHandler.getParameter("discount");
	
	'֧�����
	trade_state = resHandler.getParameter("trade_state")
	trade_mode = resHandler.getParameter("trade_mode")
	
	If "0" = trade_state && "1" = trade_mode Then
	
		'------------------------------
		'����ҵ��ʼ
		'------------------------------
		
		'ע�⽻�׵���Ҫ�ظ�����
		'ע���жϷ��ؽ��
		
		'------------------------------
		'����ҵ�����
		'------------------------------	
		
		'����ɹ�
		Response.Write("֧���ɹ�")
	
	Else
		'�������ɹ�����
		Response.Write("֧��ʧ��")
	End If	

Else

	'ǩ��ʧ��
	Response.Write("ǩ��ǩ֤ʧ��")

	Dim debugInfo
	debugInfo = resHandler.getDebugInfo()
	Response.Write("<br/>debugInfo:" & debugInfo & "<br/>")

End If


%>