package com.sumologic.appfwk.tf.model;

import lombok.NonNull;

public class SourceDefinition {

    LogQueryVariableSourceDefinition logQueryVariableSourceDefinition;
    MetadataVariableSourceDefinition metadataVariableSourceDefinition;
    CsrVariableSourceDefinition csrVariableSourceDefinition;

    public static class LogQueryVariableSourceDefinition {
        @NonNull
        String query;

        @NonNull
        String field;
    }

    public static class MetadataVariableSourceDefinition {
        @NonNull
        String filter;

        @NonNull
        String key;
    }

    public static class CsrVariableSourceDefinition {
        @NonNull
        String values;
    }
}


