package com.oim.controller;

import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import java.io.*;

public class WebApplicationContext {
	private List<String> list = new ArrayList<String>();
	
	public WebApplicationContext(String path) {
		try {
			//SAX파서기 생성
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			//HandlerMapping으로 path 파서분석 요청 후 List<>에 저장
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm);
			List<String> packList = hm.getList();
			//FileConfig으로 파일명 정리 후 list에 저장
			FileConfig fc = new FileConfig();
			for(String pack:packList) {
				List<String> p = fc.componentScan(pack);
				for(String s:p) {
					list.add(s);
				}
			}
		}catch (Exception e) {
			System.out.println("WebApplicationContext: "+e.getMessage());
		}
	}
	//getList(다른 곳에서 원할한 사용을 위한 것)
	public List<String> getList(){
		return list;
	}
}
