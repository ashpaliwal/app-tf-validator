package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;
import lombok.experimental.Accessors;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class SumologicDashboard {

    String title;

    String description;

    String folder_id;

    TopologyLabelMap topologyLabelMap;

    String domain;

    Enums.RefreshInterval refresh_interval;

    TimeRange time_range;

    Panel panel;
    Layout.GridLayout layout;
    Variable variable;
    Enums.Theme theme;
}
