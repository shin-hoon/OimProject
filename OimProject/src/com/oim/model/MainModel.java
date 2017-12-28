package com.oim.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import java.util.*;

@Controller
public class MainModel {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		

		req.setAttribute("main_jsp","default.jsp");
		return "main/main.jsp";
	}
	
	
}
