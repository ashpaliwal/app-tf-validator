package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.List;

public class EmailSearchNotification {
    String subjectTemplate;
    boolean includeQuery;
    boolean includeResultSet;
    boolean includeHistogram;
    boolean includeCsvAttachment;

    @NonNull
    List<String> toList;
}
