package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.List;

public class Schedule {

    String cronExpression;
    TimeRange parseableTimeRange;
    String timeZone;

    Threashold threshold;
    List<Parameter> parameter;

    @NonNull
    boolean muteErrorEmails;

    SearchNotification notification;

    Enums.ScheduleType scheduleType;
}
