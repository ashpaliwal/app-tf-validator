package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class TfVariable<T> {
    String name;
    Class<? extends T> type;
    String description;
    T value;
    boolean isSensitive = false;
}
