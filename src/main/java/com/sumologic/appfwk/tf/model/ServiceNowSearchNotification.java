package com.sumologic.appfwk.tf.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;

public class ServiceNowSearchNotification {
    @NonNull
    String externalId;

    Fields fields;

    @AllArgsConstructor
    @Getter
    public static class Fields {
        @NonNull
        String eventType;

        @NonNull
        int severity;

        @NonNull
        String resource;

        @NonNull
        String node;
    }
}
