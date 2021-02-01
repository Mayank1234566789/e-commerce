package com.ecommerce.dao;

import java.util.List;

public interface LoginDAO {

	public List<Object[]> getLoginMessageByUserDetails(String username,String password);
	
	public String saveUserDetais(String firstName,String lastName,String email, String password);
	
	public boolean saveUserDetails(String username,String password);
	public  List<String> findUserByUserName(String username);
	
		
	
}
