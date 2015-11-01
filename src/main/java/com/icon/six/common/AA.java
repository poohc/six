package com.icon.six.common;

public class AA {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String a = "20151101031137__SIX sitemap.pdf";
		System.out.println(a.substring(a.indexOf("__"),a.length()).replace("__", ""));
	}

}
