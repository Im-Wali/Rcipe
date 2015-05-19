package com.rcipe.commons;

import java.io.UnsupportedEncodingException;

public class ConvertKo {

	public ConvertKo() {
	}
	static public  String convertKo(String paramValue){
		String convertParamValue = null;
		try{

			byte[] b = paramValue.getBytes("8859_1");
			convertParamValue = new String(b,"EUC_KR");
		}catch(UnsupportedEncodingException uee){
			System.out.println("�ѱ� ��ȯ�� Exception �߻�");
			uee.printStackTrace();
		}
		return convertParamValue;
	}
}