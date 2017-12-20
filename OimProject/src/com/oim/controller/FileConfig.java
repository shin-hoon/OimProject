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
			File dir = new File(path); // �� ���� ������ ���� : MainModel.java
			File[] files=dir.listFiles(); // ���ϸ���Ʈ �迭�� ����
			for(File f:files) {	
				String name = f.getName(); // ���ϸ��� ���������� ����
				String ext = name.substring(name.lastIndexOf(".")+1); //������ Ȯ����� ������´�
				if(ext.equals("java")) { //���� Ȯ����� java�� ���
					String str=pack+"."+name.substring(0, name.lastIndexOf("."));
					list.add(str); // --> src\\com\\oim\\model\\MainModel.java�� list�� ���������� ����
				}
			}
		}catch (Exception e) {
			System.out.println("FileConfig:"+e.getMessage());
		}
		return list;
	}
}
