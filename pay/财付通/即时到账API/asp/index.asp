<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include file="./classes/PayRequestHandler.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�Ƹ�ͨ��ʱ����֧������ʾ��</title>
</head>
<body>
<%
'---------------------------------------------------------
'�Ƹ�ͨ��ʱ����֧������ʾ�����̻����մ�ʾ�����п�������
'---------------------------------------------------------

Dim strDate
Dim strTime
Dim randNumber
Dim key
Dim partner
Dim out_trade_no
Dim total_fee
Dim body
Dim return_url
Dim notify_url
Dim attach

'8λ���ڸ�ʽYYYYmmdd
strDate = getServerDate()

'6λʱ��,��ʽhhmiss
strTime = getTime()

'4λ�����
randNumber = getStrRandNumber(1000,9999)

'�����ţ��˴���ʱ�����������ɣ��̻������Լ����������ֻҪ����ȫ��Ψһ����
out_trade_no = strDate & strTime & randNumber

'��Կ����Ҫ�滻Ϊ�̻��Լ���
key = "8934e7d15453e97507ef794cf7b0519d"

'�̻��ţ���Ҫ�滻Ϊ�̻��Լ���
partner = "1900000109"

'�ص���ַ����Ҫ�滻Ϊ�̻��Լ���
return_url = "http://localhost/tenpay/return_url.asp"

'֪ͨ��ַ����Ҫ�滻Ϊ�̻��Լ���
notify_url = "http://localhost/tenpay/notify_url.asp"


'��Ʒ�۸��Է�Ϊ��λ
total_fee = "1"

'��Ʒ����
body = "Ӫҵ���Ͻ��Ϻ��ӹ�˾"

'�̻������ֶ�
attach = "�����ˣ�����"

'����֧���������
Dim reqHandler
Set reqHandler = new PayRequestHandler
reqHandler.setGateUrl("https://gw.tenpay.com/gateway/pay.htm");
'��ʼ��
reqHandler.init()

'������Կ
reqHandler.setKey(key)

'-----------------------------
'����֧������
'-----------------------------
reqHandler.setParameter "partner", partner		'�����̻���
reqHandler.setParameter "out_trade_no", out_trade_no				'�̻�������
reqHandler.setParameter "body", body	'��Ʒ����
reqHandler.setParameter "total_fee", total_fee				'��Ʒ�ܽ��,�Է�Ϊ��λ
reqHandler.setParameter "return_url", return_url			'�ص���ַ
reqHandler.setParameter "notify_url", notify_url			'֪ͨ��ַ
reqHandler.setParameter "bank_type", "DEFAULT"						'��������
reqHandler.setParameter "fee_type", "1"						'��������
reqHandler.setParameter "spbill_create_ip", Request.ServerVariables("REMOTE_ADDR")  '֧������IP

'ϵͳ��ѡ����
reqHandler.setParameter "sign_type", "MD5"
reqHandler.setParameter "service_version", "1.0"
reqHandler.setParameter "input_charset", "GBK"
reqHandler.setParameter "sign_key_index", "1"

'ҵ���ѡ����
reqHandler.setParameter "attach", attach

'�����URL
Dim reqUrl
reqUrl = reqHandler.getRequestURL()

'debug��Ϣ
Dim debugInfo
debugInfo = reqHandler.getDebugInfo()
Response.Write("<br/>debugInfo:" & debugInfo & "<br/>")
Response.Write("<br/>reqUrl" & reqUrl & "<br/>")


%>
<br/><a href="<%=reqUrl%>" target="_blank">�Ƹ�֧ͨ��</a>
</body>
</html>