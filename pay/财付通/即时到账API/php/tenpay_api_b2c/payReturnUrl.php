<?php

//---------------------------------------------------------
//�Ƹ�ͨ��ʱ����֧��ҳ��ص�ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
require_once ("./classes/ResponseHandler.class.php");

/* ��Կ */
$key = "8934e7d15453e97507ef794cf7b0519d";


/* ����֧��Ӧ����� */
$resHandler = new ResponseHandler();
$resHandler->setKey($key);

//�ж�ǩ��
if($resHandler->isTenpaySign()) {
	
	//֪ͨid
	$notify_id = $resHandler->getParameter("notify_id");
	//�̻�������
	$out_trade_no = $resHandler->getParameter("out_trade_no");
	//�Ƹ�ͨ������
	$transaction_id = $resHandler->getParameter("transaction_id");
	//���,�Է�Ϊ��λ
	$total_fee = $resHandler->getParameter("total_fee");
	//�����ʹ���ۿ�ȯ��discount��ֵ��total_fee+discount=ԭ�����total_fee
	$discount = $resHandler->getParameter("discount");
	//֧�����
	$trade_state = $resHandler->getParameter("trade_state");
	//����ģʽ,1��ʱ����
	$trade_mode = $resHandler->getParameter("trade_mode");
	
	if( "0" == $trade_state && "1" == $trade_mode  ) {
	
		//------------------------------
		//����ҵ��ʼ
		//------------------------------
		
		//ע�⽻�׵���Ҫ�ظ�����
		//ע���жϷ��ؽ��
		
		//------------------------------
		//����ҵ�����
		//------------------------------	
		
		echo "<br/>" . "֧���ɹ�" . "<br/>";
	
	} else {
		//�������ɹ�����
		echo "<br/>" . "֧��ʧ��" . "<br/>";
	}
	
} else {
	echo "<br/>" . "��֤ǩ��ʧ��" . "<br/>";
}

//��ȡdebug��Ϣ,�����debug��Ϣд����־�����㶨λ����
//echo $resHandler->getDebugInfo() . "<br>";

?>