package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.Map;

public class App {

    @NonNull
    TfVariable<String>  uuid;

    @NonNull
    TfVariable<String> version;

    @NonNull
    TfVariable<Map<String, String>> parameters;
}
