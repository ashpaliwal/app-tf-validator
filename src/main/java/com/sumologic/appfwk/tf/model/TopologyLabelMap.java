package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.List;

public class TopologyLabelMap {
    @NonNull
    String label;

    List<String> values;
}
