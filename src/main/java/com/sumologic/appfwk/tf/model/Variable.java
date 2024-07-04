package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class Variable {
    String id;

    @NonNull
    String name;

    String displayName;

    String defaultValue;

    @NonNull
    SourceDefinition sourceDefinition;

    boolean allowMultiSelect;

    boolean includeAllOption;

    boolean hideFromUi;
}
