package com.ecommerce.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.LoginDAO;
import com.ecommerce.model.UserLoginDetails;
import com.ecommerce.service.LoginService;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Service
public class LoginServiceImpl implements LoginService,UserDetailsService {
	
	@Autowired
	LoginDAO loginDAO;

	public String performSignIn(String email,String password) {
		String result=null;
		List<Object[]> userDetailsList = new ArrayList<Object[]>();
		userDetailsList= loginDAO.getLoginMessageByUserDetails(email,password);
		 ObjectMapper mapper = new ObjectMapper();	
			ArrayList<UserLoginDetails> userDetails = new ArrayList<UserLoginDetails>();
			for(Object[] userDetail :userDetailsList)
			{
				userDetails.add(new UserLoginDetails(null, (String) userDetail[2], null, null, null, null, null, (String)userDetail[1]));
				//userDetails.add(new com.ecommerce.model.UserLoginDetails("",(String) userDetail[2],"","","",new Timestamp(123),new Timestamp(23),(String)userDetail[1]));
			}
			try {
				   result=  mapper.writeValueAsString(userDetails);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	
public String performSignUp(String firstName,String lastName,String email,String password) {
		
		String result= loginDAO.saveUserDetais(firstName,lastName,email,password);
		
		return result;
	}

/*@Override
public UserDetails loadUserByUsername(String username) {
	// TODO Auto-generated method stub
	List<String> result=loginDAO.findUserByUserName(username);
	if (result.get(1).equalsIgnoreCase("1")) {
		String password=result.get(3);
		return new User(username, password,
				new ArrayList<>());
	} else {
		throw new UsernameNotFoundException("User not found with username: " + username);
	}
	
}*/

@Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	List<String> result=loginDAO.findUserByUserName(username);
	String password=result.get(2);
    return new User(username,password ,
            new ArrayList<>());
}

	

}
