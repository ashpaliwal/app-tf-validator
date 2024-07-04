package com.sumologic.appfwk.tf.parsers;

import com.bertramlabs.plugins.hcl4j.HCLParser;
import com.sumologic.appfwk.tf.model.Resource;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.util.Map;

@Slf4j
public class ResourceParser {

    public static final Logger LOGGER = LoggerFactory.getLogger(ResourceParser.class);

    public Resource parse(String fileName) throws Exception {
        log.info("Received file name : {}", fileName);
        LOGGER.info("Received file name : {}", fileName);

//        System.out.println("Received file name : " + fileName);
        InputStream inputStream = this.getClass().getResourceAsStream(fileName);
        Map<String, Object> results = new HCLParser().parse(inputStream, "UTF-8");
        results.forEach((key, value) -> log.info("key: {}, value: {}", key, value));
        return null;
    }

    public static void main(String[] args) throws Exception {
        log.info("parsing file: {}", args[0]);
        ResourceParser resourceParser = new ResourceParser();
        resourceParser.parse(args[0]);
    }

}
