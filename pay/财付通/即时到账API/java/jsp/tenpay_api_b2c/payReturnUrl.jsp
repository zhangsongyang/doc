<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>

<%@ page import="com.tenpay.ResponseHandler"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//---------------------------------------------------------
//�Ƹ�֧ͨ��Ӧ�𣨴���ص���ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
//��Կ
String key = "8934e7d15453e97507ef794cf7b0519d";

//����֧��Ӧ�����
ResponseHandler resHandler = new ResponseHandler(request, response);
resHandler.setKey(key);

//�ж�ǩ��
if(resHandler.isTenpaySign()) {

        //֪ͨid
	String notify_id = resHandler.getParameter("notify_id");
	
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
	
	String trade_mode = resHandler.getParameter("trade_mode");
	
	if( "0".equals(trade_state) && "1".equals(trade_mode) ) {
		//------------------------------
		//����ҵ��ʼ
		//------------------------------ 
		
		//ע�⽻�׵���Ҫ�ظ�����
		//ע���жϷ��ؽ��
		
		//------------------------------
		//����ҵ�����
		//------------------------------
	        out.println("֧���ɹ�");	
	} else {
		//�������ɹ�����
		out.println("֧��ʧ��");
	}
	
} else {

	out.println("��֤ǩ��ʧ��");
}
//��ȡdebug��Ϣ,�����debug��Ϣд����־�����㶨λ����
String debuginfo = resHandler.getDebugInfo();
System.out.println("debuginfo:" + debuginfo);
%>
