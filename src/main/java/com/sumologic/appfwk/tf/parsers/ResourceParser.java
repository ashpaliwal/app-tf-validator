package com.sumologic.appfwk.tf.parsers;

import com.bertramlabs.plugins.hcl4j.HCLParser;
import com.sumologic.appfwk.tf.model.ParsingMode;
import com.sumologic.appfwk.tf.model.Resource;
import com.sumologic.appfwk.tf.model.SumologicLogSearch;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
public class ResourceParser {

    public List<SumologicLogSearch> parse(String fileName) throws Exception {
        log.info("Received file name : {}", fileName);
        InputStream inputStream = this.getClass().getResourceAsStream(fileName);
        Map<String, Object> results = new HCLParser().parse(inputStream, "UTF-8");
        results.forEach((key, value) -> log.info("key: {}, value: {}", key, value));
        Map<String, Object> resourceMap = (Map<String, Object>) results.get("resource");
        log.info("{}",resourceMap.get("sumologic_log_search").getClass());
        Map<String, Object> logSearch = (Map<String, Object>)resourceMap.get("sumologic_log_search");
        logSearch.forEach((key, value) -> log.info("key: {}, value: {}", key, value));
        List<SumologicLogSearch> logSearchResources  =
                logSearch.entrySet().stream().map((entry) -> parseLogSearch(entry.getKey(),
                        (Map<String, Object>) entry.getValue())).collect(Collectors.toList());
        return logSearchResources;
    }

    private SumologicLogSearch parseLogSearch(String resourceName, Map<String, Object> resourceProperties) {
        log.info("Parsing resource : {}", resourceName);
        String description = resourceProperties.getOrDefault("description", "").toString();
        SumologicLogSearch logSearch = SumologicLogSearch.builder()
                .name(resourceName)
                .displayName(resourceProperties.getOrDefault("name", "").toString())
                .parent_id(resourceProperties.getOrDefault("parent_id", "").toString())
                .query_string(resourceProperties.getOrDefault("query_string", "").toString())
                .run_by_receipt_time(Boolean.parseBoolean(resourceProperties.getOrDefault("run_by_receipt_time", "false").toString()))
                .parsing_mode(ParsingMode.valueOf(resourceProperties.getOrDefault("parsing_mode", "").toString()))
                .description(description)
                .build();
        log.info("{}, {}", resourceName, logSearch);
        return logSearch;
    }

    public static void main(String[] args) throws Exception {
        log.info("parsing file: {}", args[0]);
        ResourceParser resourceParser = new ResourceParser();
        List<SumologicLogSearch> logSearches = resourceParser.parse(args[0]);
        log.info(" Log Searches : {}", logSearches);
    }

}
