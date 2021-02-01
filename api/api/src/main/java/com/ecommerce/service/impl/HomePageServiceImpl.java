package com.ecommerce.service.impl;


import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.HomePageDAO;
import com.ecommerce.service.HomePageService;

@Service
public class HomePageServiceImpl implements HomePageService {

@Autowired
HomePageDAO homePageDAO;	
	
	
	public String serializeMenuDetails()
	{
		String result=null;
		JSONArray jsonArray = new JSONArray();
		jsonArray=	homePageDAO.getMenuDetails();
		result= jsonArray.toString();
		System.out.println(result);
		return result;
	}
	

}
