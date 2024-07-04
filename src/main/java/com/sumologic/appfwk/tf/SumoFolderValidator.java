package com.sumologic.appfwk.tf;


import com.bertramlabs.plugins.hcl4j.RuntimeSymbols.VariableTree;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;

public class SumoFolderValidator implements Validator<Map<String, Object>> {

    public static final String[] mandatoryFields = new String[] {"parent_id", "name", "description"};

    @Override
    public ValidationResult isValid(Map<String, Object> tfValue) {
        ValidationResult validationResult = new ValidationResult();
        StringBuffer errors = new StringBuffer();

        for(String field : mandatoryFields) {
            if (!tfValue.containsKey(field)) {
                validationResult.setValid(false);
                errors.append(String.format("Field '%s' is missing\n", field));
            }

            if(tfValue.get(field) == null){
                errors.append(String.format("Field '%s' value is missing or empty \n", field));
            } else {
                // validate if variable is declared
                Object filedValue = tfValue.get(field);
                System.out.println(filedValue.getClass());
                System.out.println(((VariableTree)filedValue).getName());
                System.out.println(((VariableTree)filedValue).getSymbolName());
                System.out.println(((VariableTree)filedValue).getParent());
            }
        }

        validationResult.setErrorMessage(errors.toString());

        return validationResult;
    }
}
