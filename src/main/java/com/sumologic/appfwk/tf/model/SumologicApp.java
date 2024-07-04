package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Map;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class SumologicApp {
    TfVariable<String> uuid;
    TfVariable<String> version;
    TfVariable<Map<String, String>> parameters;
}
