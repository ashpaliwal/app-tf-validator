resource "sumologic_folder" "integration_folder" {
  name        = var.integration_name
  description = var.integration_description
  parent_id   = var.integration_root_dir
}

resource "sumologic_folder" "logs_folder" {
  name        = var.log_folder_name
  description = var.log_folder_description
  parent_id   = sumologic_folder.integration_folder.id
}

resource "sumologic_folder" "metrics_folder" {
  name        = var.metric_folder_name
  description = var.metric_folder_description
  parent_id   = sumologic_folder.integration_folder.id
}

moved {
  from = sumologic_folder.logs
  to   = sumologic_folder.logs_folder
}

moved {
  from = sumologic_folder.metrics
  to   = sumologic_folder.metrics_folder
}

moved {
  from = sumologic_folder.apache
  to   = sumologic_folder.integration_folder
}