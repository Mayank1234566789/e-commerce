package com.ecommerce.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

public class AuthenticationResponse implements Serializable {

private static final long serialVersionUID = -8091879091924046844L;
private final String jwtToken;



public AuthenticationResponse(String jwtToken) {
this.jwtToken = jwtToken;
}
public String getToken() {
return this.jwtToken;
}
}
