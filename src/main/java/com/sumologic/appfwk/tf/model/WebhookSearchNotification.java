package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class WebhookSearchNotification {

    @NonNull
    String webhookId;

    @NonNull
    String payload;

    @NonNull
    boolean itemizeAlerts;

    @NonNull
    int maxItemizedAlerts;
}
