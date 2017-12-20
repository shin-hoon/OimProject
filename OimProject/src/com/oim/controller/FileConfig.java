package com.oim.controller;

import java.util.*;
import java.io.*;

public class FileConfig {
	public List<String> componentScan(String pack){
		List<String> list = new ArrayList<String>();
		try {
			String path="C:\\Users\\Jang\\git\\OimWeb\\OimProject\\src\\";
			path = path + pack.replace(".","\\"); 
			// --> C:\\webDev\\OimWeb\\OimProject\\src\\com\\oim\\model\\MainModel.java
			File dir = new File(path); // 각 파일 변수로 저장 : MainModel.java
			File[] files=dir.listFiles(); // 파일리스트 배열로 저장
			for(File f:files) {	
				String name = f.getName(); // 파일명을 문자형으로 저장
				String ext = name.substring(name.lastIndexOf(".")+1); //파일의 확장명을 가지고온다
				if(ext.equals("java")) { //파일 확장명이 java일 경우
					String str=pack+"."+name.substring(0, name.lastIndexOf("."));
					list.add(str); // --> src\\com\\oim\\model\\MainModel.java를 list에 문자형으로 저장
				}
			}
		}catch (Exception e) {
			System.out.println("FileConfig:"+e.getMessage());
		}
		return list;
	}
}
