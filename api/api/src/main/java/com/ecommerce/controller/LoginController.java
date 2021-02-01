package com.ecommerce.controller;


import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ecommerce.api.config.JwtTokenUtil;
import com.ecommerce.exception.EcommerceException;
import com.ecommerce.model.AuthenticationRequest;
import com.ecommerce.model.AuthenticationResponse;
import com.ecommerce.service.HomePageService;
import com.ecommerce.service.LoginService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private JwtTokenUtil jwtTokenUtil;
	
	
	@Autowired 
	private HomePageService homePageService;
	
	
	  @PostMapping("/user")
	    public String getUserById(@RequestBody Map<String,String> body) throws EcommerceException {
		  String username = body.get("email").toString();
		  String password = body.get("password").toString();
		 String result=loginService.performSignIn(username, password);
		 System.out.println("result object "+result);
	        return result;
	    }
	  
	/*  @RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	  public ResponseEntity<?> createAuthenticationToken(@RequestBody AuthenticationRequest authenticationRequest) throws Exception {
		 
		  authenticate(authenticationRequest.getUsername(),authenticationRequest.getPassword());
		
		  final UserDetails userDetails = loginService
	  	.loadUserByUsername(authenticationRequest.getUsername());
	  	final String jwtToken = jwtTokenUtil.generateToken(userDetails);
	  	return ResponseEntity.ok(new AuthenticationResponse(jwtToken));
	  	}
	  
	  private void authenticate(String username, String password) throws Exception {
			try {
				authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
			} catch (DisabledException e) {
				throw new Exception("USER_DISABLED", e);
			} catch (BadCredentialsException e) {
				throw new Exception("INVALID_CREDENTIALS", e);
			}
		}*/
	  
	  
 @RequestMapping(value = "/authenticate", method = RequestMethod.POST)
		public ResponseEntity<?> createAuthenticationToken(@RequestBody AuthenticationRequest authenticationRequest) throws Exception {

			try {
				authenticationManager.authenticate(
						new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(), authenticationRequest.getPassword())
				);
			}
			catch (BadCredentialsException e) {
				throw new Exception("Incorrect username or password", e);
			}


			final UserDetails userDetails = loginService
					.loadUserByUsername(authenticationRequest.getUsername());

			final String jwt = jwtTokenUtil.generateToken(userDetails);

			return ResponseEntity.ok(new AuthenticationResponse(jwt));
		} 
 
 

 	@GetMapping("/getMenuDetails")
	    public String loadSubCategoryById(@RequestParam Map<String,String> body) throws EcommerceException {
		  String result =homePageService.serializeMenuDetails();
		  System.out.println(result);
	        return result;
	    }



	
}
