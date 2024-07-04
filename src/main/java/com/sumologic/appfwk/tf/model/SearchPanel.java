package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.List;

public class SearchPanel extends Panel {

    String description;
    TimeRange timeRange;
    LinkedDashboard linkedDashboard;

    ColoringRules coloringRules;

    public static class LinkedDashboard {
        @NonNull
        String id;

        String relativePath;

        boolean includeTimeRange;

        boolean includeVariables;
    }

    public static class ColoringRules {
        @NonNull
        String scope;

        @NonNull
        String singleSeriesAggregateFunction;

        @NonNull
        String multipleSeriesAggregateFunction;

        ColorThreshold colorThreshold;

    }

    public static class ColorThreshold {
        @NonNull
        String color;

        float min;

        float max;
    }

    public static class SearchPanelQuery {
        @NonNull
        String queryString;

        Enums.QueryType queryType;

        @NonNull
        String queryKey;

        Enums.QueryMode queryMode;

        MetricsQueryData metricsQueryData;
    }

    public static class MetricsQueryData {
        @NonNull
        String metric;

        Enums.ValidMetricsAggregationDataValues aggregationType;

        String groupBy;

        @NonNull
        Filter filter;

        Operator operator;
    }

    public static class Filter {
        @NonNull
        String key;

        @NonNull
        String value;

        boolean negation;
    }

    public static class Operator {
        @NonNull
        String operatorName;

        List<Parameter> parameters;
    }
}
