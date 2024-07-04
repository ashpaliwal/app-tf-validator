package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.time.Duration;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class ResourceTimeout {
    private Duration create;
    private Duration read;
    private Duration update;
    private Duration delete;
    private Duration defaultTimeout;
}
