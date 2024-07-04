package com.sumologic.appfwk.tf.model;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Accessors;

// keeping as variable as opposed to List in TF Provider
@Accessors(fluent = true) @Getter
@Builder
@ToString
public class TimeRangeBoundary {

    // epoch_time_range
    int epochTimeRange;

    // iso8601_time_range
    String iso8601Time;

    // literal_time_range
    String literalTimeRange;

    // relative_time_range
    String relativeTimeRange;
}
