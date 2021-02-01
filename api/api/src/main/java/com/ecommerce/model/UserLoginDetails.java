package com.ecommerce.model;

import java.sql.Timestamp;

public class UserLoginDetails {
	
	public String id;
	public	String firstName;
	public	String lastName;
	public	String email;
	public	String password;
	public	Timestamp creationDateTime;
	public	Timestamp modificationDateTime;
	
	public String status;
	

	public UserLoginDetails(String id, String firstName, String lastName, String email, String password,
			Timestamp creationDateTime, Timestamp modificationDateTime, String status) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.creationDateTime = creationDateTime;
		this.modificationDateTime = modificationDateTime;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getCreationDateTime() {
		return creationDateTime;
	}
	public void setCreationDateTime(Timestamp creationDateTime) {
		this.creationDateTime = creationDateTime;
	}
	public Timestamp getModificationDateTime() {
		return modificationDateTime;
	}
	public void setModificationDateTime(Timestamp modificationDateTime) {
		this.modificationDateTime = modificationDateTime;
	}
	


}
