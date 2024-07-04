package com.sumologic.appfwk.tf;

import java.util.HashMap;
import java.util.Map;

public class ValidatorFactory {

    static Map<String, Validator> validators = new HashMap<>();

    static {
        validators.put("sumologic_folder", new SumoFolderValidator());
    }

    public static Validator getValidator(String tfType) {
        return validators.get(tfType);
    }
}
