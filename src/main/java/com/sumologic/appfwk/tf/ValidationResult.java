package com.sumologic.appfwk.tf;

public class ValidationResult {
    private boolean isValid = true;
    private String errorMessage;


    public ValidationResult() {
    }

    public ValidationResult(boolean isValid, String errorMessage) {
        this.isValid = isValid;
        this.errorMessage = errorMessage;
    }

    public boolean isValid() {
        return isValid;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setValid(boolean valid) {
        isValid = valid;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    @Override
    public String toString() {
        return "ValidationResult{\n" +
                    "isValid=" + isValid + ", errorMessage='" + errorMessage + '\'' +
                '}';
    }
}
