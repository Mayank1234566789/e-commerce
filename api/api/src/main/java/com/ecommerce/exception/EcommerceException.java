package com.ecommerce.exception;

public class EcommerceException extends Exception {
private long user_id;
public EcommerceException(long user_id) {
        super(String.format("user is not found with id : '%s'", user_id));
        }
}