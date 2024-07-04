package com.sumologic.appfwk.tf.model;

public class Enums {

    public enum ThreasholdType { Message, Group}

    public enum Operator {eq, gt, ge, lt, le}

    public enum ScheduleType {RealTime, _15Minutes, _1Hour, _2Hours, _4Hours,
                                _6Hours, _8Hours, _12Hours, _1Day, _1Week, Custom}

    public enum RefreshInterval {_0, _30, _60, _120, _300, _900, _1800, _3600, _7200, _86400}

    public enum Theme {Light, Dark}

    public enum QueryType {Logs, Metrics}

    public enum QueryMode {Basic, Advanced}

    public enum ValidMetricsAggregationDataValues {Count,
            Minimum,
            Maximum,
            Sum,
            Average,
            None}
}
