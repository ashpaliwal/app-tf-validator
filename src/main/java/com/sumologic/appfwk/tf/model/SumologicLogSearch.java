package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

@Accessors(fluent = true) @Getter
@Builder
@ToString
public class SumologicLogSearch {
    @NonNull
    TfVariable<String> name;

    @NonNull
    TfVariable<String> description;

    @NonNull
    TfVariable<String> parent_id;

    @NonNull
    TfVariable<String> query_string;

    @NonNull
    TfVariable<Boolean> run_by_receipt_time;

    @NonNull
    TfVariable<TimeRange> time_range;

    TfVariable<ParsingMode> parsing_mode;

    TfVariable<List<QueryParams>> query_parameter;

    TfVariable<List> schedule;
}

