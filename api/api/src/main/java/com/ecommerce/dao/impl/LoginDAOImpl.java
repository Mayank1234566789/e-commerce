package com.ecommerce.dao.impl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Repository;

import com.ecommerce.dao.LoginDAO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	

@PersistenceContext
private EntityManager entityManager;

	public List<Object[]> getLoginMessageByUserDetails(String username, String password) {
		  StoredProcedureQuery query = entityManager.createStoredProcedureQuery("ecommerce.sp_validate_user"); 
	        //Declare the parameters in the same order
	        query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
	        query.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);

	        //Pass the parameter values
	        query.setParameter(1, username);
	        query.setParameter(2, password);
	       
	        //Execute query
	        List<Object[]> resultList =query.getResultList();
	       
	        Object result[] = resultList.get(0);
	        String resultMessage = String.valueOf(result[0]);
	        String resultCode = String.valueOf(result[1]);
		return resultList;
	}
	

	public List<String> findUserByUserName(String username) {
		List<String> returnList = new ArrayList<String>();
		  StoredProcedureQuery query = entityManager.createStoredProcedureQuery("e_commerce.sp_find_user"); 
	        //Declare the parameters in the same order
	        query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);

	        //Pass the parameter values
	        query.setParameter(1, username);
	       
	        //Execute query
	        List<Object[]> resultList =query.getResultList();
	       String one="1";
	        Object result[] = resultList.get(0);
	        String resultMessage = String.valueOf(result[0]);
	        returnList.add(resultMessage);
	        String resultCode = String.valueOf(result[1]);
	        returnList.add(resultCode);
	        if(resultCode.compareTo(one)==0)
	        {
	        	String password = String.valueOf(result[2]);
	        	returnList.add(password);
	        }
	        else
	        {
	        	returnList.add(null);
	        }
		return returnList;
	}
	public String saveUserDetais(String firstName,String lastName,String email, String password) {
		  StoredProcedureQuery query = entityManager.createStoredProcedureQuery("e_commerce.sp_sign_up_user"); 
	        //Declare the parameters in the same order
	        query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
	        query.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
	        query.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
	        query.registerStoredProcedureParameter(4, String.class, ParameterMode.IN);

	        //Pass the parameter values
	        query.setParameter(1, firstName);
	        query.setParameter(2, lastName);
	        query.setParameter(2, email);
	        query.setParameter(2, password);
	       
	        //Execute query
	        List<Object[]> resultList =query.getResultList();
	       
	        Object result[] = resultList.get(0);
	        String resultMessage = String.valueOf(result[0]);
	        String resultCode = String.valueOf(result[1]);
		return resultCode;
	}

	public boolean saveUserDetails(String username, String password) {
		// TODO Auto-generated method stub
		return false;
	}

}
