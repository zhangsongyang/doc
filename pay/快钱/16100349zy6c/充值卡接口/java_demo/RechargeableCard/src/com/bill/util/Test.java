package com.bill.util;

import com.bill.encrypt.Pkipair;

public class Test {
	public static void main(String[] args) {
		String key = "inputCharset=3&pageUrl=http://192.168.121.20/Test/receive.jsp&version=v2.0&language=1&signType=1&merchantAcctId=1001153656201&orderId=20111009044645&orderAmount=1000&orderTime=20111009044645&productNum=1&payType=00";
		
		System.out.println(Pkipair.signMsg(key));
		
	}
}
