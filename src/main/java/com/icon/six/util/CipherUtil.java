package com.icon.six.util;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class CipherUtil {
	
	private static volatile CipherUtil INSTANCE;
	 
	final static String secretKey   = "iconmedialabWsix"; 
	static String IV                = ""; //16bit
	 
	public static CipherUtil getInstance(){
	    if(INSTANCE==null){
	        synchronized(CipherUtil.class){
	            if(INSTANCE==null)
	                INSTANCE=new CipherUtil();
	        }
	    }
	    return INSTANCE;
	}
	 
	private CipherUtil(){
	    IV = secretKey.substring(0,16);
	}
	 
	//암호화
	public static String AES_Encode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		byte[] keyData = secretKey.getBytes();
		 
		SecretKey secureKey = new SecretKeySpec(keyData, "AES");
		 
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(IV.getBytes()));
		 
		byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
		String enStr = new String(Base64.encodeBase64(encrypted));
		 
		return enStr;
	}
	 
	 //복호화
	public static String AES_Decode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		byte[] keyData = secretKey.getBytes();
		SecretKey secureKey = new SecretKeySpec(keyData, "AES");
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(IV.getBytes("UTF-8")));
		 
		byte[] byteStr = Base64.decodeBase64(str.getBytes());
		 
		return new String(c.doFinal(byteStr),"UTF-8");
	}
	
	public static void main(String[] args){
			
	     String id = "1234";
		 String custrnmNo = "111111";
		 String custNm = "테스트";       
		
		 CipherUtil a256 = CipherUtil.getInstance();
		 
		 try {
			 String enId = a256.AES_Encode(id);
		     String enYyyymmdd = a256.AES_Encode(custrnmNo);
		     String enCustNm = a256.AES_Encode(custNm);
		 
		     String desId = a256.AES_Decode(enId);
		     String desYyyymmdd = a256.AES_Decode(enYyyymmdd);
		     String desCustNm = a256.AES_Decode(enCustNm);
		     
		     System.out.println("enId : " + enId + ", desId : " + desId);
		     
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
