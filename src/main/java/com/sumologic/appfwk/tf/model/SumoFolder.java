package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.time.Duration;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class SumoFolder {
    TfVariable<String> parent_id;
    TfVariable<String> name;
    TfVariable<String> description;
    ResourceTimeout timeout = new ResourceTimeout.ResourceTimeoutBuilder().delete(Duration.ofMinutes(1)).build();
}
