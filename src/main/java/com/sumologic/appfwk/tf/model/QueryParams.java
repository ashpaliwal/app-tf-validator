package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class QueryParams {

    public enum QueryType {NUMBER, STRING, ANY, KEYWORD}

    @NonNull
    String name;
    @NonNull
    String description;

    @NonNull
    String value;

    @NonNull
    QueryType dataType;
}
