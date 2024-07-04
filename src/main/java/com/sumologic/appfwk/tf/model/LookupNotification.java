package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class LookupNotification {
    @NonNull
    String lookupFilePath;

    @NonNull
    boolean isLookupMergeOperation;
}
