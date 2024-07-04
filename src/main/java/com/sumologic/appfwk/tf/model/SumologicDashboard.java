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

    @NonNull
    TfVariable<String> title;

    TfVariable<String> description;

    TfVariable<String> folder_id;

    TfVariable<TopologyLabelMap> topologyLabelMap;

    TfVariable<String> domain;

    @NonNull
    TfVariable<Enums.RefreshInterval> refresh_interval;

    @NonNull
    TfVariable<TimeRange> time_range;

    TfVariable<Panel> panel;
    TfVariable<Layout.GridLayout> layout;
    TfVariable<Variable> variable;
    TfVariable<Enums.Theme> theme;
}
