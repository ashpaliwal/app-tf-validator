package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class Resource<T> {
    String name;
    private T resource;
    Class<? extends T> type;
}
