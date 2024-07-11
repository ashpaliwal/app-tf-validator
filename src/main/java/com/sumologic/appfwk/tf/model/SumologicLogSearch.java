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

    String name;

    String displayName;

    String description;

    String parent_id;

    String query_string;

    boolean run_by_receipt_time;

    TimeRange time_range;

    ParsingMode parsing_mode;

    List<QueryParams> query_parameter;

    List schedule;
}

