package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

import java.util.List;

public class Layout {

    @NonNull
    GridLayout gridLayout;

    public static class GridLayout {
        List<LayoutStructure> layoutStructure;
    }

    public static class LayoutStructure {
        @NonNull
        String key;

        @NonNull
        String structure;
    }

}
