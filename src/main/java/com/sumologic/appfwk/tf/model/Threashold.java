package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class Threashold {

    @NonNull
    Enums.ThreasholdType thresholdType;

    @NonNull
    Enums.Operator operator;
    @NonNull
    int count;
}
