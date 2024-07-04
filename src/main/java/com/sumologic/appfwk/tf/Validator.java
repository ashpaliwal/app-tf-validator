package com.sumologic.appfwk.tf;

public interface Validator<T> {

    ValidationResult isValid(T tfValue);

}
