package com.sumologic.appfwk.tf;

import com.bertramlabs.plugins.hcl4j.HCLParser;
import com.bertramlabs.plugins.hcl4j.HCLParserException;
import com.sumologic.appfwk.tf.model.TfVariable;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
public class TfValidator {

    // this is dirty
    static Map<String, TfVariable> variableMap;

    public static void main(String[] args) throws HCLParserException, IOException {
        TfValidator validator = new TfValidator();
        variableMap = validator.buildVariableTable(args[0] + "/variables.tf");
        validator.validateFolders(args[0]+"/folders.tf");

    }

    private void validateFolders(String fileName) throws HCLParserException, IOException {
        log.info("Validating {}", fileName);
        File folderFile = new File(fileName);
        Map<String, Object> results = new HCLParser().parse(folderFile, "UTF-8");

        // get the sumo folder resource
        Map<String, Object> folders = (Map<String, Object>) ((Map<String, Object>) results.get("resource")).get("sumologic_folder");

        Validator<Map<String, Object>> folderValidator = ValidatorFactory.getValidator("sumologic_folder");

        for(Map.Entry<String, Object> entry : folders.entrySet()) {
            System.out.println("validating folder " + entry.getKey());
            System.out.println(folderValidator.isValid((Map<String, Object>) entry.getValue()));
        }
    }

    private Map<String, TfVariable> buildVariableTable(String variableFileName) throws HCLParserException, IOException {
        System.out.println("Reading variable file Name : " + variableFileName);
        Map<String, TfVariable> variablesMap = new LinkedHashMap<>();
        File variableFile = new File(variableFileName);
        Map<String, Object> variables = new HCLParser().parse(variableFile, "UTF-8");
        System.out.println(variables.get("variable"));
        Map<String, Object> variable = (Map<String, Object>) variables.get("variable");
        for(Map.Entry<String, Object> entry : variable.entrySet()) {
            variablesMap.put(entry.getKey(), parseVariable(entry.getKey(), (Map<String, Object>)entry.getValue()));
        }
        return variablesMap;
    }

    private TfVariable parseVariable(String variableName, Map<String, Object> properties)  {
        return TfVariable.builder().name(variableName)
//                .type((String) properties.get("type").toString())
                .description((String) properties.get("type").toString())
                .value((String) properties.getOrDefault("default", ""))
                .isSensitive((Boolean) properties.getOrDefault("sensitive", false))
                .build();
    }
}
