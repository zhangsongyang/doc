package com.bill.encrypt;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

/**
 * PKI证书加密工具类
 * @author guangquan.hu
 *
 */
public class Pkipair {
	/**
	 * 加密方法
	 * 
	 * @param signMsg signMsg
	 * @return String
	 */
	public static String signMsg( String signMsg) {
		
		String base64 = "";
		try {
			// 密钥仓库
			KeyStore ks = KeyStore.getInstance("PKCS12");

			// 读取密钥仓库
			FileInputStream ksfis = new FileInputStream("E:/3334/tester-rsa.pfx");
			BufferedInputStream ksbufin = new BufferedInputStream(ksfis);

			char[] keyPwd = "1qaz2wsx".toCharArray();//1qaz2wsx hgq123456
			ks.load(ksbufin, keyPwd);
			// 从密钥仓库得到私钥
			PrivateKey priK = (PrivateKey) ks.getKey("test-alias", keyPwd);
			Signature signature = Signature.getInstance("SHA1withRSA");
			signature.initSign(priK);
			signature.update(signMsg.getBytes());
			sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
			base64 = encoder.encode(signature.sign());
			
		} catch(FileNotFoundException e){
			System.out.println("文件找不到");
		}catch (Exception ex) {
			ex.printStackTrace();
		}
//		System.out.println("test = "+base64);
		return base64;
	}

	
	/**
	 * 
	 * @param val 摘要值
	 * @param msg 快钱传递的密钥
	 * @return boolean
	 */
	public static boolean enCodeByCer(String val, String msg) {
		boolean flag = false;
		try {
			//获得文件
			InputStream inStream = new FileInputStream("E:/3334/99bill.cert.rsa.20140803.cer");
			//InputStream inStream = this.getClass().getClassLoader().getResourceAsStream("\\demo\\99bill[1].cert.rsa.20140728.cer");
			CertificateFactory cf = CertificateFactory.getInstance("X.509");
			X509Certificate cert = (X509Certificate) cf.generateCertificate(inStream);
			//获得公钥
			PublicKey pk = cert.getPublicKey();
			//签名
			Signature signature = Signature.getInstance("SHA1withRSA");
			signature.initVerify(pk);
			signature.update(val.getBytes());
			//解码
			sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
//			System.out.println(new String(decoder.decodeBuffer(msg)));
			flag = signature.verify(decoder.decodeBuffer(msg));
			System.out.println("flag="+flag);
		} catch (Exception e) {
			System.out.println("文件找不到");
		} 
		return flag;
	}

}
