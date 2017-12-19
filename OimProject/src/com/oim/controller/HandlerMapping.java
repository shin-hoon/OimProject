package com.oim.controller;

import java.util.*;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class HandlerMapping extends DefaultHandler {
    private List<String> list=new ArrayList<String>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		try
		{
			if(qName.equals("context:component-scan"))
			{
				String pack=attributes.getValue("base-package");
				list.add(pack);
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

	public List<String> getList() {
		return list;
	}
	
}