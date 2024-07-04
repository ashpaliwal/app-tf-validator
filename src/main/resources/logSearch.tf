resource "sumologic_log_search" "throttling_events_cloud_watch_metrics_ingest" {
  name                = "Throttling events - CloudWatch Metrics Ingest"
  parent_id           = sumologic_folder.integration_folder.id
  parsing_mode        = "Manual"
  query_string        = "_index=sumologic_audit _sourceCategory=account_management _sourceName=COLLECTOR CloudWatch"
  run_by_receipt_time = "false"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }
}

resource "sumologic_log_search" "throttling_events_log_ingest" {
  description         = "Throttling events are reported when:  1.At least 15 minutes has elapsed since the last time a throttling event was reported. AND 2.At least 2 percent of collector sources experienced the effect of data throttling in the time interval."
  name                = "Throttling events - Log Ingest"
  parent_id           = sumologic_folder.integration_folder.id
  parsing_mode        = "Manual"
  query_string        = "_index=sumologic_audit _sourceCategory=account_management _sourceName=VOLUME_QUOTA AND LogIngest "
  run_by_receipt_time = "false"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }
}

resource "sumologic_log_search" "throttling_events_metrics_ingest" {
  description         = "Throttling events are reported when:  1.At least 15 minutes has elapsed since the last time a throttling event was reported. AND 2.At least 2 percent of collector sources experienced the effect of data throttling in the time interval."
  name                = "Throttling events - Metrics Ingest"
  parent_id           = sumologic_folder.integration_folder.id
  parsing_mode        = "Manual"
  query_string        = "_index=sumologic_audit _sourceCategory=account_management _sourceName=VOLUME_QUOTA AND MetricIngest "
  run_by_receipt_time = "false"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }
}
