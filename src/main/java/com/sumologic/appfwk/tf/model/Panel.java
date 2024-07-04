package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class Panel {

    String id;

    @NonNull
    String key;

    String title;

    String visualSettings;

    boolean keepVisualSettingsConsistentWithParent;
}
