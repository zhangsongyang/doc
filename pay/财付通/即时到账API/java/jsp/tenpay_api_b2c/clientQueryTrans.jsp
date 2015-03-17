<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>

<%@ page import="com.tenpay.RequestHandler" %>
<%@ page import="com.tenpay.client.ClientResponseHandler" %>    
<%@ page import="com.tenpay.client.TenpayHttpClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    //�̻��� 
    String partner = "1900000109";

    //��Կ 
    String key = "8934e7d15453e97507ef794cf7b0519d";
    
    //������ѯ�������
    RequestHandler reqHandler = new RequestHandler(null, null);
    //ͨ�Ŷ���
    TenpayHttpClient httpClient = new TenpayHttpClient();
    //Ӧ�����
    ClientResponseHandler resHandler = new ClientResponseHandler();
    
    //-----------------------------
    //�����������
    //-----------------------------
    reqHandler.init();
    reqHandler.setKey(key);
    reqHandler.setGateUrl("https://gw.tenpay.com/gateway/normalorderquery.xml");
    
    //-----------------------------
    //���ýӿڲ���
    //-----------------------------
    reqHandler.setParameter("partner", partner);    //�̻���
    
    //out_trade_no��transaction_id����һ�����ͬʱ����ʱtransaction_id����
    reqHandler.setParameter("out_trade_no", "1033537274");    	    	                //�̼Ҷ�����
    //reqHandler.setParameter("transaction_id", "1900000109201101270026218385");	//�Ƹ�ͨ���׵���    

    //-----------------------------
    //����ͨ�Ų���
    //-----------------------------
    //�������󷵻صĵȴ�ʱ��
    httpClient.setTimeOut(5);	
    
    //������������
    String requestUrl = reqHandler.getRequestURL();
    httpClient.setReqContent(requestUrl);
    String rescontent = "null";
    
    //��̨����
    if(httpClient.call()) {
    	//���ý������
    	rescontent = httpClient.getResContent();
    	resHandler.setContent(rescontent);
    	resHandler.setKey(key);
    	   	
    	//��ȡ���ز���
    	String retcode = resHandler.getParameter("retcode");
    	
    	//�ж�ǩ�������
    	if(resHandler.isTenpaySign()&& "0".equals(retcode)) {
    		out.println("������ѯ�ɹ�</br>");
    		
    		//�̻�������
                String out_trade_no = resHandler.getParameter("out_trade_no");
                //�Ƹ�ͨ������
                String transaction_id = resHandler.getParameter("transaction_id");
                //���,�Է�Ϊ��λ
                String total_fee = resHandler.getParameter("total_fee");
                //�����ʹ���ۿ�ȯ��discount��ֵ��total_fee+discount=ԭ�����total_fee
                String discount = resHandler.getParameter("discount");
                //֧�����
                String trade_state = resHandler.getParameter("trade_state");
                //֧���ɹ�
                if("0".equals(trade_state)) {
                       //ҵ����
                       out.println("transaction_id=" + resHandler.getParameter("transaction_id") +
                                  " out_trade_no=" + resHandler.getParameter("out_trade_no") + "</br>");
                       out.println("total_fee=" + resHandler.getParameter("total_fee") +
                                  " discount=" + resHandler.getParameter("discount"));
                                  
                }
    	} else {
    		//����ʱ�����ؽ��δǩ������¼retcode��retmsg��ʧ�����顣
    		System.out.println("��֤ǩ��ʧ�ܻ�ҵ�����");
    		System.out.println("retcode:" + resHandler.getParameter("retcode")+
    	    	                    " retmsg:" + resHandler.getParameter("retmsg"));
    	}	
    } else {
    	System.out.println("��̨����ͨ��ʧ��");   	
    	System.out.println(httpClient.getResponseCode());
    	System.out.println(httpClient.getErrInfo());
    	//�п�����Ϊ����ԭ�������Ѿ�������δ�յ�Ӧ��
    }
    
    //��ȡdebug��Ϣ,���������Ӧ�����ݡ�debug��Ϣ��ͨ�ŷ�����д����־�����㶨λ����
    System.out.println("http res:" + httpClient.getResponseCode() + "," + httpClient.getErrInfo());
    System.out.println("req url:" + requestUrl);
    System.out.println("req debug:" + reqHandler.getDebugInfo());
    System.out.println("res content:" + rescontent);
    System.out.println("res debug:" + resHandler.getDebugInfo());
    
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<title>������ѯ��̨����ʾ��</title>
</head>
<body>
</body>
</html>
