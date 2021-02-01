package com.ecommerce.service;

import org.springframework.security.core.userdetails.UserDetails;

public interface LoginService {
	
	public String performSignIn(String email,String password);
	
	public String performSignUp(String firstName,String lastName,String email,String password);

	public UserDetails loadUserByUsername(String username);

	
	

}
