/**
 * @author Sahil Gupta - sahilgupta5@hotmail.com
 * Copyright - Take authors permission before using any piece of the code.
 */

package com.foodline.services;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import android.annotation.SuppressLint;
import android.util.Base64;

public class AES {

	private static SecretKeySpec secretKey;
	private static byte[] key;

	private static String decryptedString;
	private static String encryptedString;

	public static void setKey(String myKey) {
		MessageDigest SHA = null;
		try {
			key = myKey.getBytes("UTF-8");
			SHA = MessageDigest.getInstance("SHA-1");
			//Uses the SHA hash function to generate the hash for the key
			key = SHA.digest(key);
			key = Arrays.copyOf(key, 16);// use only first 128 bit
			secretKey = new SecretKeySpec(key, "AES");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public static String getDecryptedString() {
		return decryptedString;
	}

	public static void setDecryptedString(String decryptedString) {
		AES.decryptedString = decryptedString;
	}

	public static String getEncryptedString() {
		return encryptedString;
	}

	public static void setEncryptedString(String encryptedString) {
		AES.encryptedString = encryptedString;
	}

	@SuppressLint("TrulyRandom")
	public static void encrypt(String strToEncrypt) {
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			
			String encodedString = new String(Base64.encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")), Base64.DEFAULT));
			String safeString = encodedString.replace('+','-').replace('/','_');
			setEncryptedString(safeString);
		} catch (Exception e) {
			System.out.println("Error while encrypting: " + e.toString());
		}
	}

	public static void decrypt(String strToDecrypt) {
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			setDecryptedString(new String(cipher.doFinal(Base64.decode(strToDecrypt, Base64.DEFAULT))));
		} catch (Exception e) {
			System.out.println("Error while decrypting: " + e.toString());
		}
	}
}