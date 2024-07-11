resource "sumologic_dashboard" "account_management_overview" {
  description = "See see trends in operation for users, roles, and access as well as Admin activities."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel12651fe8beea3a4a"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":0}"
      }

      layout_structure {
        key       = "panel1a9affa8aa83bb40"
        structure = "{\"width\":24,\"height\":10,\"x\":0,\"y\":10}"
      }

      layout_structure {
        key       = "panel7b41f29abc518842"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":0}"
      }

      layout_structure {
        key       = "panel7d36fc89964e3845"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panel962ce826a3f49844"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":5}"
      }

      layout_structure {
        key       = "panelb056614b9d8bcb4f"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":5}"
      }

      layout_structure {
        key       = "panelcc5f68f48ccebb42"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":5}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel12651fe8beea3a4a"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=access_key (action=create or action=delete or action=enable or action=disable) status=SUCCESS\n| where _sourceCategory=\"account_management\"\n| timeslice 12h\n| count by _timeslice, action\n| transpose row _timeslice column action"
        query_type   = "Logs"
      }

      title           = "Access Key Operation Trend"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel1a9affa8aa83bb40"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit \n| where _sourceCategory=\"account_management\"\n| lookup latitude, longitude, country_code, country_name, region, city, postal_code from geo://location on ip = _sourceHost \n| count by latitude, longitude, country_code, country_name, region, city, postal_code \n| sort _count"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1d"
            }
          }
        }
      }

      title           = "Geolocation of Admin Activities"
      visual_settings = "{\"general\":{\"mode\":\"map\",\"type\":\"map\"},\"map\":{\"mainMetric\":{}},\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel7b41f29abc518842"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=role (action=create or action=delete or action=modify) status=SUCCESS\n| where _sourceCategory=\"account_management\"\n| timeslice 12h\n| count by _timeslice, action\n| transpose row _timeslice column action"
        query_type   = "Logs"
      }

      title           = "Role Operation Trend"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel7d36fc89964e3845"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=user (action=create or action=disable or action=modify) status=SUCCESS\n| where _sourceCategory=\"account_management\"\n| timeslice 12h\n| count by _timeslice, action\n| transpose row _timeslice column action"
        query_type   = "Logs"
      }

      title           = "User Operation Trend"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel962ce826a3f49844"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit \n| where _sourceCategory=\"account_management\"\n| timeslice 12h\n| count by _timeslice, class\n| transpose row _timeslice column class"
        query_type   = "Logs"
      }

      title           = "Admin Activities Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelb056614b9d8bcb4f"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit \n| where _sourceCategory=\"account_management\"\n| timeslice 12h\n| count by _timeslice, sourceuser\n| transpose row _timeslice column sourceuser"
        query_type   = "Logs"
      }

      title           = "Admin Activities by User Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelcc5f68f48ccebb42"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit \n| where _sourceCategory=\"account_management\"\n| count as count by _messagetime, sourceuser, action, class, target, status | sort by _messagetime\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss.SSS\", \"UTC\") as time\n| fields -_messagetime, count\n| fields time, sourceuser, action, class, target, status"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1d"
            }
          }
        }
      }

      title           = "Recent Admin Activities"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1w"
        }
      }
    }
  }

  title = "Account Management Overview"
}

resource "sumologic_dashboard" "library_content_admin_mode" {
  description = "See when content is deleted, moved, whitelisted, and shared. As well as when permission is added or removed."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel51ad66a2aaf0d94a"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":0}"
      }

      layout_structure {
        key       = "panel56b71d1494c41b48"
        structure = "{\"width\":8,\"height\":20,\"x\":16,\"y\":0}"
      }

      layout_structure {
        key       = "panel6a2c4103bbc87844"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panela6c8f8f28d701849"
        structure = "{\"width\":16,\"height\":8,\"x\":0,\"y\":10}"
      }

      layout_structure {
        key       = "panelbbe7a27ab0f99a46"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":5}"
      }

      layout_structure {
        key       = "panelc708afbf8867ba41"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":5}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel51ad66a2aaf0d94a"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"AdminMode=true\"\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=removed_permissions \"(?<removedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=removedperm \"\\((?<removed_permission_from>.+)<(?<permission_target>.+)>: (?<removed_permissions>.+)\\)\" \n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser,content_type,content_name, removed_permission_from, permission_target, removed_permissions\n"
        query_type   = "Logs"
      }

      title           = "Removed Permission"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel56b71d1494c41b48"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"AdminMode=true\"\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by sourceuser, _raw"
        query_type   = "Logs"
      }

      title           = "Admin Mode Events"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel6a2c4103bbc87844"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"updated visibility\" \"AdminMode=true\" (World or Whitelist)\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"updated visibility of * \\\"*\\\" to *\" as content_type,content_name,visibility_level\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type,content_name,visibility_level\n| sort by visibility_level\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Whitelisted and Shared with World"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panela6c8f8f28d701849"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \"AdminMode=true\"\n| parse \"moved * \\\"*\\\" into folder *\" as content_type,content_name,target_folder_location\n| where action =\"MOVE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name, target_folder_location\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Moved"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelbbe7a27ab0f99a46"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \"AdminMode=true\"\n| parse \"User * deleted * \\\"*\\\"\" as sourceuser,content_type,content_name\n| where action =\"DELETE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Deleted"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelc708afbf8867ba41"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"AdminMode=true\"\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=added_permissions \"(?<addedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=addedperm \"\\((?<added_permission_to>.+)<(?<permission_target>.+)>: (?<added_permissions>.+)\\)\" \n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by  date_time, sourceuser,content_type,content_name,added_permission_to, permission_target, added_permissions"
        query_type   = "Logs"
      }

      title           = "Added Permission"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Library Content - Admin Mode"

  variable {
    allow_multi_select = "false"
    default_value      = "*"
    display_name       = "sourceuser"
    hide_from_ui       = "false"
    include_all_option = "true"
    name               = "sourceuser"

    source_definition {
      log_query_variable_source_definition {
        field = "sourceuser"
        query = "_view=sumologic_audit _sourceCategory=user_activity \"AdminMode=true\"\n| count by sourceuser"
      }
    }
  }
}

resource "sumologic_dashboard" "library_content_created-002F-_deleted-002F-_moved-002F-_copied-002F-_updated" {
  description = "See when content is created or deleted. As as a counts, trends, and outliers in content creation or deletion."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel2e0613e88c8b094a"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":7}"
      }

      layout_structure {
        key       = "panel2ee2b6a1aab6d947"
        structure = "{\"width\":8,\"height\":10,\"x\":16,\"y\":14}"
      }

      layout_structure {
        key       = "panel3872d3e198bbeb4b"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":7}"
      }

      layout_structure {
        key       = "panel580c7d339328fb42"
        structure = "{\"width\":8,\"height\":1,\"x\":8,\"y\":0}"
      }

      layout_structure {
        key       = "panel5c32d0a996dd1842"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":12}"
      }

      layout_structure {
        key       = "panel639f5578a30bd84d"
        structure = "{\"width\":8,\"height\":8,\"x\":8,\"y\":1}"
      }

      layout_structure {
        key       = "panel67bea2f2b58b2b4e"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":12}"
      }

      layout_structure {
        key       = "panel9c22b1cb828dc94b"
        structure = "{\"width\":8,\"height\":9,\"x\":16,\"y\":7}"
      }

      layout_structure {
        key       = "panel9cb541c49178ea43"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":17}"
      }

      layout_structure {
        key       = "panelb9a3dc53b1d99b47"
        structure = "{\"width\":8,\"height\":1,\"x\":16,\"y\":0}"
      }

      layout_structure {
        key       = "panelebebe719baea3842"
        structure = "{\"width\":8,\"height\":1,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panelf0791482ab931a40"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":17}"
      }

      layout_structure {
        key       = "panelf79bc28991c23a4f"
        structure = "{\"width\":8,\"height\":8,\"x\":16,\"y\":1}"
      }

      layout_structure {
        key       = "panelfc4b598c877b0b4f"
        structure = "{\"width\":8,\"height\":8,\"x\":0,\"y\":1}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel2e0613e88c8b094a"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"created * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,folder_location\n| where action =\"CREATE\"\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by  sourceuser"
        query_type   = "Logs"
      }

      title           = "Content Created by Users"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel2ee2b6a1aab6d947"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \"updated name/description\"\n| where action =\"UPDATE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n| parse \"updated name/description of * \\\"*\\\" from (*,*) to (*,*)\" as content_type,content_name,old_name,old_desc,new_name,new_desc\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type,content_name,old_name,old_desc,new_name,new_desc"
        query_type   = "Logs"
      }

      title           = "Content Updated"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel3872d3e198bbeb4b"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"DELETE\"\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by  sourceuser"
        query_type   = "Logs"
      }

      title           = "Content Deleted by Users"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel5c32d0a996dd1842"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"DELETE\"\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, sourceuser\n| transpose row _timeslice column sourceuser\n| fillmissing timeslice(1h)"
        query_type   = "Logs"
      }

      title           = "Content Deleted Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel639f5578a30bd84d"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"User * deleted * \\\"*\\\" in folder \\\"*\\\"\" as sourceuser,content_type,content_name, source_folder\n| where action =\"DELETE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name, source_folder\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Deleted"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel67bea2f2b58b2b4e"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"created * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,folder_location\n| where action =\"CREATE\"\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, sourceuser\n| transpose row _timeslice column sourceuser\n| fillmissing timeslice(1h)"
        query_type   = "Logs"
      }

      title           = "Content Created Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel9c22b1cb828dc94b"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"copied * \\\"*\\\" into folder \\\"*\\\" as \\\"*\\\"\" as content_type,content_name,target_folder_location,copied_content_name\n| where action =\"COPY\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name,target_folder_location, copied_content_name\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Copied"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel9cb541c49178ea43"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"User * deleted * \\\"*\\\"\" as src_user,content_type,content_name\n| where action =\"DELETE\"\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice\n| outlier _count"
        query_type   = "Logs"
      }

      title           = "Outlier - Deleted Content"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf0791482ab931a40"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"created * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,folder_location\n| where action =\"CREATE\"\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice\n| outlier _count"
        query_type   = "Logs"
      }

      title           = "Outlier - Content Created"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf79bc28991c23a4f"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"moved * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,target_folder_location\n| where action =\"MOVE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name, target_folder_location\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Moved"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelfc4b598c877b0b4f"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| parse \"created * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,folder_location\n| where action =\"CREATE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name, folder_location\n| fields - _count"
        query_type   = "Logs"
      }

      title           = "Content Created"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel580c7d339328fb42"
      title                                       = "Content Deleted"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelb9a3dc53b1d99b47"
      title                                       = "Content - Moved/Copied/Updated"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelebebe719baea3842"
      title                                       = "Content Created"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Library Content - Created/Deleted/Moved/Copied/Updated"

  variable {
    allow_multi_select = "false"
    default_value      = "*"
    display_name       = "sourceuser"
    hide_from_ui       = "false"
    include_all_option = "true"
    name               = "sourceuser"

    source_definition {
      log_query_variable_source_definition {
        field = "sourceuser"
        query = "_view=sumologic_audit   _sourceCategory=user_activity \"updated name/description\"\n| where action =\"UPDATE\"\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n| parse \"updated name/description of * \\\"*\\\" from (*,*) to (*,*)\" as content_type,content_name,old_name,old_desc,new_name,new_desc"
      }
    }
  }
}

resource "sumologic_dashboard" "library_content_imported-002F-_exported-002F-_installed-002F-_shared_publicly" {
  description = "See when content is shared, exported or imported. As well as count and trends in content that has been shared, exported or imported."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel0c4bac9a9b015949"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":5}"
      }

      layout_structure {
        key       = "panel77a36c9794678849"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":10}"
      }

      layout_structure {
        key       = "panel8ffd985aa9a51a43"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":5}"
      }

      layout_structure {
        key       = "panela646dad8826deb48"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":5}"
      }

      layout_structure {
        key       = "panela778fba7916b084b"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":0}"
      }

      layout_structure {
        key       = "panelb0d0abce97528a41"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":10}"
      }

      layout_structure {
        key       = "panelc039d8d78da0494f"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panelf1870fae9ae84b4c"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":10}"
      }

      layout_structure {
        key       = "panelf2e469518984fb4c"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":0}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel0c4bac9a9b015949"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"updated visibility\"\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"updated visibility of * \\\"*\\\" to *\" as content_type,content_name,visibility_level\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type,content_name\n"
        query_type   = "Logs"
      }

      title           = "Content Un-shared from Public Users"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel77a36c9794678849"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"EXPORT\"\n| parse \"exported * \\\"*\\\"\" as content_type,content_name\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, sourceuser\n| transpose row _timeslice column sourceuser\n| fillmissing timeslice(1h)"
        query_type   = "Logs"
      }

      title           = "Content Exported Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel8ffd985aa9a51a43"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"EXPORT\"\n| parse \"exported * \\\"*\\\"\" as content_type,content_name\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice\n| outlier _count"
        query_type   = "Logs"
      }

      title           = "Outlier - Content Exported"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panela646dad8826deb48"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"EXPORT\"\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by sourceuser"
        query_type   = "Logs"
      }

      title           = "Content Exported breakdown by Users"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":false,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true},\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panela778fba7916b084b"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"IMPORT\"\n| parse \"imported * \\\"*\\\" into folder \\\"*\\\"\" as content_type,content_name,target_folder_location\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name, target_folder_location\n| fields - _count\n"
        query_type   = "Logs"
      }

      title           = "Content Imported"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelb0d0abce97528a41"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity //\"updated visibility\"\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"updated visibility of * \\\"*\\\" to *\" as content_type,content_name,visibility_level\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by content_name\n"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1w"
            }
          }
        }
      }

      title           = "Frequently Shared Content"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true},\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelc039d8d78da0494f"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity \"updated visibility\"\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"updated visibility of * \\\"*\\\" to *\" as content_type,content_name,visibility_level\n| where visibility_level in (\"World\", \"Whitelist\")\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type,content_name,visibility_level\n| sort by visibility_level\n| fields - _count\n"
        query_type   = "Logs"
      }

      title           = "Content Shared with Public Users"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf1870fae9ae84b4c"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"INSTALL\"\n| parse \"installed application (*, *) into folder \\\"*\\\" as \\\"*\\\"\" as app_name,app_id,target_folder_location,app_name2\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time,sourceuser, app_name"
        query_type   = "Logs"
      }

      title           = "Application Installed by Users"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf2e469518984fb4c"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity\n| where action =\"EXPORT\"\n| parse \"exported * \\\"*\\\"\" as content_type,content_name\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by date_time, sourceuser, content_type, content_name\n| fields - _count\n"
        query_type   = "Logs"
      }

      title           = "Content Exported"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Library Content - Imported/Exported/Installed/Shared Publicly"

  variable {
    allow_multi_select = "false"
    default_value      = "*"
    display_name       = "sourceuser"
    hide_from_ui       = "false"
    include_all_option = "true"
    name               = "sourceuser"

    source_definition {
      log_query_variable_source_definition {
        field = "sourceuser"
        query = "_view=sumologic_audit   _sourceCategory=user_activity\n| count by sourceuser"
      }
    }
  }
}

resource "sumologic_dashboard" "library_content_overview" {
  description = "See an overview of Audit Library content, including location of users, user activity, outliers by user, and breakdowns by action."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel08ac8569bf3baa4d"
        structure = "{\"width\":12,\"height\":6,\"x\":0,\"y\":6}"
      }

      layout_structure {
        key       = "panel14e220628c18594b"
        structure = "{\"width\":12,\"height\":6,\"x\":0,\"y\":1}"
      }

      layout_structure {
        key       = "panel188bc4359e0f484e"
        structure = "{\"width\":12,\"height\":6,\"x\":12,\"y\":1}"
      }

      layout_structure {
        key       = "panel335c22eea01afb4d"
        structure = "{\"width\":12,\"height\":6,\"x\":0,\"y\":16}"
      }

      layout_structure {
        key       = "panel39141b0c8c2bb94f"
        structure = "{\"width\":6,\"height\":6,\"x\":18,\"y\":11}"
      }

      layout_structure {
        key       = "panel6e82a3448c4b394d"
        structure = "{\"width\":12,\"height\":1,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panel7d5cb6ecb4a95b49"
        structure = "{\"width\":12,\"height\":1,\"x\":12,\"y\":0}"
      }

      layout_structure {
        key       = "panela4b4909da4f38a4e"
        structure = "{\"width\":6,\"height\":6,\"x\":12,\"y\":11}"
      }

      layout_structure {
        key       = "panelbd7116bba1a70941"
        structure = "{\"width\":12,\"height\":6,\"x\":12,\"y\":6}"
      }

      layout_structure {
        key       = "panelc46430859b22ab4c"
        structure = "{\"width\":12,\"height\":6,\"x\":0,\"y\":11}"
      }

      layout_structure {
        key       = "panelf6ce1fcd994be84c"
        structure = "{\"width\":12,\"height\":6,\"x\":12,\"y\":16}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel08ac8569bf3baa4d"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by  sourceuser\n| sort by _count\n| limit 10"
        query_type   = "Logs"
      }

      title           = "Top 10 Active Users"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"bar\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel14e220628c18594b"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity | where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n| lookup latitude, longitude, country_code, country_name, region, city, postal_code from geo://location on ip = _sourceHost\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by latitude, longitude, country_code, country_name, region, city, postal_code\n| sort _count"
        query_type   = "Logs"
      }

      title           = "Geo Location of Users"
      visual_settings = "{\"general\":{\"mode\":\"map\",\"type\":\"map\"},\"map\":{\"mainMetric\":{}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel188bc4359e0f484e"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by  action"
        query_type   = "Logs"
      }

      title           = "Breakdown By Action"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel335c22eea01afb4d"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, sourceuser\n| outlier _count by sourceuser \n| fields _timeslice,sourceuser, _count_violation\n| transpose row _timeslice column sourceuser"
        query_type   = "Logs"
      }

      title           = "Outlier By User"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel39141b0c8c2bb94f"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by status"
        query_type   = "Logs"
      }

      title           = "Success - Failure Status Breakdown"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panela4b4909da4f38a4e"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, action\n| outlier _count by action \n| fields _timeslice,action, _count_violation\n| transpose row _timeslice column action"
        query_type   = "Logs"
      }

      title           = "Outlier By Action"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelbd7116bba1a70941"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, action\n| transpose row _timeslice column action\n| fillmissing timeslice(1h)"
        query_type   = "Logs"
      }

      title           = "Actions Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelc46430859b22ab4c"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n| timeslice 1h\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by _timeslice, sourceuser\n| transpose row _timeslice column sourceuser\n| fillmissing timeslice(1h)"
        query_type   = "Logs"
      }

      title           = "User Activity Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf6ce1fcd994be84c"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")\n|where if (\"{{sourceuser}}\" = \"*\", true, sourceuser matches \"{{sourceuser}}\")\n|count by action\n| sort by _count | compare with timeshift 1d"
        query_type   = "Logs"
      }

      title           = "Time Compare by Action"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel6e82a3448c4b394d"
      title                                       = "Source User"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel7d5cb6ecb4a95b49"
      title                                       = "Action "
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Library Content - Overview"

  variable {
    allow_multi_select = "false"
    default_value      = "*"
    display_name       = "sourceuser"
    hide_from_ui       = "false"
    include_all_option = "true"
    name               = "sourceuser"

    source_definition {
      log_query_variable_source_definition {
        field = "sourceuser"
        query = "_view=sumologic_audit   _sourceCategory=user_activity \n| where action in (\"MANAGE_PERMISSIONS\" , \"CREATE\", \"DELETE\", \"MOVE\", \"COPY\", \"UPDATE\", \"IMPORT\", \"EXPORT\",\"INSTALL\")"
      }
    }
  }
}

resource "sumologic_dashboard" "library_content_updated_permission" {
  description = "See when permission is added or removed. As well as a breakdown, and count of permission being added or deleted by type or content."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel19b7d6609a31ea4c"
        structure = "{\"width\":12,\"height\":1,\"x\":12,\"y\":0}"
      }

      layout_structure {
        key       = "panel4fe319acb2c48a4a"
        structure = "{\"width\":12,\"height\":9,\"x\":12,\"y\":1}"
      }

      layout_structure {
        key       = "panel5da338f987934b49"
        structure = "{\"width\":12,\"height\":9,\"x\":0,\"y\":1}"
      }

      layout_structure {
        key       = "panel5f9fd669b4568a4a"
        structure = "{\"width\":12,\"height\":8,\"x\":12,\"y\":14}"
      }

      layout_structure {
        key       = "panel72a61a55aadc2b49"
        structure = "{\"width\":12,\"height\":8,\"x\":0,\"y\":14}"
      }

      layout_structure {
        key       = "panele4f3579fbb473943"
        structure = "{\"width\":12,\"height\":1,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "paneleeff3085a3f67848"
        structure = "{\"width\":12,\"height\":8,\"x\":12,\"y\":8}"
      }

      layout_structure {
        key       = "panelf1c59f1b8b278b4d"
        structure = "{\"width\":12,\"height\":8,\"x\":0,\"y\":8}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel4fe319acb2c48a4a"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=removed_permissions \"(?<removedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=removedperm \"\\((?<removed_permission_from>.+)<(?<permission_target>.+)>: (?<removed_permissions>.+)\\)\" \n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by date_time, sourceuser,content_type,content_name, removed_permission_from, permission_target, removed_permissions"
        query_type   = "Logs"
      }

      title           = "Removed Permission"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel5da338f987934b49"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=added_permissions \"(?<addedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=addedperm \"\\((?<added_permission_to>.+)<(?<permission_target>.+)>: (?<added_permissions>.+)\\)\" \n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by  date_time, sourceuser,content_type,content_name,added_permission_to, permission_target, added_permissions"
        query_type   = "Logs"
      }

      title           = "Added Permission"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel5f9fd669b4568a4a"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=removed_permissions \"(?<removedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=removedperm \"\\((?<removed_permission_from>.+)<(?<permission_target>.+)>: (?<removed_permissions>.+)\\)\"\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by content_name\n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Permissions Removed by Content"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"bar\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel72a61a55aadc2b49"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=added_permissions \"(?<addedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=addedperm \"\\((?<added_permission_to>.+)<(?<permission_target>.+)>: (?<added_permissions>.+)\\)\"\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by content_name \n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Added Permission by Content"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"bar\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "paneleeff3085a3f67848"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=removed_permissions \"(?<removedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=removedperm \"\\((?<removed_permission_from>.+)<(?<permission_target>.+)>: (?<removed_permissions>.+)\\)\"\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by removed_permission_from"
        query_type   = "Logs"
      }

      title           = "Removed Permission breakdown by Type"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelf1c59f1b8b278b4d"

      query {
        query_key    = "A"
        query_string = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=added_permissions \"(?<addedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=addedperm \"\\((?<added_permission_to>.+)<(?<permission_target>.+)>: (?<added_permissions>.+)\\)\"\n|where if (\"{{added_permissions}}\" = \"*\", true, added_permissions matches \"{{added_permissions}}\")\n|count by added_permission_to"
        query_type   = "Logs"
      }

      title           = "Added Permission breakdown by Type"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel19b7d6609a31ea4c"
      title                                       = "Removed Permission"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panele4f3579fbb473943"
      title                                       = "Added Permission"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Library Content - Updated Permission"

  variable {
    allow_multi_select = "false"
    default_value      = "*"
    display_name       = "added_permissions"
    hide_from_ui       = "false"
    include_all_option = "true"
    name               = "added_permissions"

    source_definition {
      log_query_variable_source_definition {
        field = "added_permissions"
        query = "_view=sumologic_audit _sourceCategory=user_activity\n| where action =\"MANAGE_PERMISSIONS\"\n| parse \"User * updated the following permissions on * \\\"*\\\". \\nAdded: *\\nRemoved: *\" as user,content_type,content_name,added_permissions,removed_permissions nodrop\n| parse regex field=removed_permissions \"(?<removedperm>\\(.+?: .+?\\))\" multi\n| parse regex field=removedperm \"\\((?<removed_permission_from>.+)<(?<permission_target>.+)>: (?<removed_permissions>.+)\\)\" \n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss\") as date_time"
      }
    }
  }
}

resource "sumologic_dashboard" "scheduled_search_search_triggered_summary" {
  description = "See all webhook and scheduled search triggerings."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel02417d0ea777c94e"
        structure = "{\"width\":8,\"height\":8,\"x\":16,\"y\":14}"
      }

      layout_structure {
        key       = "panel07f3baa590d49b40"
        structure = "{\"width\":8,\"height\":8,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panel0b250f0d8cc16b45"
        structure = "{\"width\":8,\"height\":8,\"x\":16,\"y\":0}"
      }

      layout_structure {
        key       = "panel0b2ee68886b32842"
        structure = "{\"width\":12,\"height\":9,\"x\":0,\"y\":6}"
      }

      layout_structure {
        key       = "panel25399462a576e84e"
        structure = "{\"width\":24,\"height\":1,\"x\":0,\"y\":13}"
      }

      layout_structure {
        key       = "panelbfb89b43a969f948"
        structure = "{\"width\":8,\"height\":8,\"x\":8,\"y\":14}"
      }

      layout_structure {
        key       = "paneldd1a45ee9fdbaa41"
        structure = "{\"width\":12,\"height\":9,\"x\":12,\"y\":6}"
      }

      layout_structure {
        key       = "panelec070aa1b9303841"
        structure = "{\"width\":8,\"height\":8,\"x\":0,\"y\":14}"
      }

      layout_structure {
        key       = "panelef575e2e9da92a47"
        structure = "{\"width\":8,\"height\":8,\"x\":8,\"y\":0}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel02417d0ea777c94e"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[StatusCode=*]\" as Status_Code\n| parse \"[Name=*]\" as SavedSearchName\n| parse \"[AlertType=*]\" as AlertType nodrop\n| count by Status_Code\n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Count Of Status Codes For Webhooks"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel07f3baa590d49b40"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH triggered\n| parse \"[AlertType=*]\" as type nodrop\n| parse \"[Destination=*]\" as destination nodrop\n| parse \"[Name=*]\" as name nodrop\n| count as count by destination\n| sort count"
        query_type   = "Logs"
      }

      title           = "Alerts Fired by Destination"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"pie\",\"displayType\":\"default\",\"fillOpacity\":1,\"startAngle\":270,\"innerRadius\":\"30%\",\"maxNumOfSlices\":\"10\",\"mode\":\"distribution\"},\"color\":{\"family\":\"Categorical Default\"},\"axes\":{\"axisX\":{\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"titleFontSize\":12,\"labelFontSize\":12}},\"legend\":{\"enabled\":true,\"wrap\":true,\"verticalAlign\":\"right\",\"showAsTable\":true}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel0b250f0d8cc16b45"

      query {
        query_key    = "A"
        query_string = "\n_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[Name=*]\" as SavedSearchName\n| parse \"[AlertType=*]\" as AlertType nodrop\n| count by SavedSearchName\n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Scheduled Searches Triggered"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel0b2ee68886b32842"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\") \n| timeslice 15m\n| count by _timeslice | compare with timeshift 1d 7"
        query_type   = "Logs"
      }

      title           = "TimeCompare Count of All Alerts Triggered"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelbfb89b43a969f948"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[StatusCode=*]\" as Status_Code\n| parse \"[Name=*]\" as SavedSearchName\n| parse \"[AlertType=*]\" as AlertType nodrop\n| where !(Status_Code matches \"2*\")\n| count by SavedSearchName, Status_Code\n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Non-200 Status Codes by Name"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "paneldd1a45ee9fdbaa41"

      query {
        query_key    = "A"
        query_string = "\n_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[Name=*]\" as SavedSearchName\n| parse \"[AlertType=*]\" as AlertType nodrop\n| timeslice 1h\n| count by SavedSearchName, _timeslice\n| transpose row _timeslice column SavedSearchName"
        query_type   = "Logs"
      }

      title           = "Alerts Fired Over Time"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"line\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[{\"series\":[\"Activity from Compromised G Suite Users in Salesforce.com\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Aggregate Event Count to Main Index\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Apache Errors\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Apache Status Code - SNOW\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Create\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Create,Delete,Update\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Delete\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: EC2\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: EC2,Redshift,S3\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: IAM\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: IAM,KMS,Lambda,RDS\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: KMS\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Lambda\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: RDS\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Redshift\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: S3\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Service\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Attack Surface: Update\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Block Malicious IP2\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableEvents,EncryptWithNewKey_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableGlobalEvents\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableGlobalEventsOrDisableLogOrEncryptWithNewKey\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableGlobalEvents_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableLogIntegrityValidation\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableLogIntegrityValidation_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableTrails\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_DisableTrails_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_EncryptWithNewKey\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"CloudTrail_EncryptWithNewKey_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Critical - Missing Source Category to SumoLabs (SumoApps)\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_AuthorizeSecurityGroupIngressToPublic\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_AuthorizeSecurityGroupIngressToPublic_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_DescribeInstanceUserData\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_DescribeInstanceUserData_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_DescribeRouteTables\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_DescribeRouteTables_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_Disableterminationprotection\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_DisableterminationprotectionOrListInstances_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_Disableterminationprotection_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_Events\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListAMIs\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListAMIs_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListInstances\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListInstances_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListSecurityGroups\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListSecurityGroupsOrSecurityGroups_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_ListSecurityGroups_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_TrafficMirroring\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_TrafficMirroringOrDescribeRouteTables_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"EC2_TrafficMirroring_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Errors by backend Microservices Version2\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AddUserToGroup\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AddUserToGroup,CompromisedUserOrKeys_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AddUserToGroup_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutGroupPolicy\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutGroupPolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutRoleOrGroupOrUserPolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutRolePolicy\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutRolePolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutUserPolicy\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_AttachPutUserPolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_CompromisedUserOrKeys\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_CompromisedUserOrKeys_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_ConsoleLoginFailureWithHiddenResponse\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_ConsoleLoginsNoMfa\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_ConsoleLoginsNoMfa_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_ConsoleLoginsOrNoMfa_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_CreateUpdatePolicy\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_CreateUpdatePolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_Events\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_TooManyAccessDenied\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_TooManyAccessDenied_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_TotalConsoleLogins\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_TotalConsoleLogins_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_UpdateAssumeRolePolicy\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"IAM_UpdateAssumeRolePolicy_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Lambda_ExcessPermissions\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Lambda_ExcessPermissionsOrInteractWithIam\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Lambda_ExcessPermissions_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Lambda_InteractWithIam\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Lambda_InteractWithIam_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Last Week View\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_ModifySecurityGroup\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_ModifySecurityGroup_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_ModifyingAdminPassword\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_ModifyingAdminPassword_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_ModifyingAdminPwd,RestoreFromBackup_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_RestoreFromBackup\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_RestoreFromBackupOrModifySecGroup\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"RDS_RestoreFromBackup_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableAccesslogging\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableAccesslogging_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableEncryption\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableEncryption,DisableAccessLogging_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableEncryption_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableSSL\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableSSLOrDisableAccesslogging\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Redshift_DisableSSL_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedForPublicIp\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedForPublicIp_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedOrBucketConfigChecksFromPublicIp\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedOrBucketConfigChecksFromPublicIp_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedTotal\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_AccessDeniedTotal_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_BucketConfigChecksFromPublicIp\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_BucketConfigChecksFromPublicIp_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_CrudBucketsFromPublicIp\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_CrudBucketsFromPublicIp_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableAccessLogging\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableAccessLogging_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableBucketVersioning\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableBucketVersioning_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableMfaDelete\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableMfaDeleteOrBucketVersionioningOrAccessLogging\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableMfaDeleteOrBucketVersionioningOrAccessLogging_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_DisableMfaDelete_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_EnablePublicAccess\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_EnablePublicAccess_CountEventResources\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"S3_ListBuckets\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Scheduled Search Test\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Send UI Exception to OpsGenie Testing AG\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Sumo to Opsgenie V3\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Test Scheduled Searches\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Unusually High Number of Apache Errors\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"Windows Events - Agg 3\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}},{\"series\":[\"fsdfs\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"line\"}}]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelec070aa1b9303841"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[Destination=*]\" as Destination\n| parse \"[StatusCode=*]\" as Status_Code\n| parse \"[Name=*]\" as SavedSearchName\n| parse \"[AlertType=*]\" as AlertType nodrop\n| count by Destination\n| sort by _count"
        query_type   = "Logs"
      }

      title           = "Top Webhook Destinations"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelef575e2e9da92a47"

      query {
        query_key    = "A"
        query_string = "\n_index=sumologic_audit and _sourceName=SCHEDULED_SEARCH (\"Scheduled search alert triggered\")\n| parse \"[Name=*]\" as SavedSearchName\n\n| parse \"[AlertType=*]\" as AlertType nodrop\n| timeslice 1d\n| count by AlertType, _timeslice\n| transpose row _timeslice column AlertType\n"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1w"
            }
          }
        }
      }

      title           = "Searches Triggered per Day"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[{\"series\":[\"email\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"column\"}},{\"series\":[\"saveToIndex\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"column\"}},{\"series\":[\"webhook\"],\"queries\":[],\"properties\":{\"axisYType\":\"primary\",\"type\":\"column\"}}]}"
    }
  }

  panel {
    text_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel25399462a576e84e"
      title                                       = "Webhook Analysis"
      visual_settings                             = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"text\",\"displayType\":\"default\",\"mode\":\"TextPanel\"},\"legend\":{\"enabled\":false},\"text\":{\"format\":\"markdownV2\",\"fontSize\":14},\"series\":{}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "Scheduled Search - Search Triggered Summary"
}

resource "sumologic_dashboard" "user_activity_login_and_credentials" {
  description = "See logins, location of logged in users, and count of login attempts, password changes, and password resets"
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel363a9a9ba049eb49"
        structure = "{\"width\":16,\"height\":10,\"x\":8,\"y\":0}"
      }

      layout_structure {
        key       = "panel6ef265d98082db4e"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":8}"
      }

      layout_structure {
        key       = "panel8b1f604b8c45d84d"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":8}"
      }

      layout_structure {
        key       = "panel9338e318bbd52a43"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":8}"
      }

      layout_structure {
        key       = "panelb0d7f9a983854949"
        structure = "{\"width\":8,\"height\":10,\"x\":0,\"y\":0}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel363a9a9ba049eb49"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit action=login status=SUCCESS\n| where _sourceCategory=\"user_activity\"\n| lookup latitude, longitude, country_code, country_name, region, city, postal_code from geo://location on ip = _sourceHost \n| count by latitude, longitude, country_code, country_name, region, city, postal_code \n| sort _count"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1d"
            }
          }
        }
      }

      title           = "Logged-In User Locations"
      visual_settings = "{\"general\":{\"mode\":\"map\",\"type\":\"map\"},\"map\":{\"mainMetric\":{}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel6ef265d98082db4e"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=PASSWORD action=MODIFY\n| where _sourceCategory=\"user_activity\"\n| timeslice 1d\n| count by _timeslice, status\n| transpose row _timeslice column status"
        query_type   = "Logs"
      }

      title           = "Password Modification Attempts"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel8b1f604b8c45d84d"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit action=login status=SUCCESS\n| where _sourceCategory=\"user_activity\" \n| timeslice by 1d\n| count as count by _timeslice"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1w"
            }
          }
        }
      }

      title           = "Successful User Login Attempts"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":false,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel9338e318bbd52a43"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=PASSWORD action=RESET\n| where _sourceCategory=\"user_activity\"\n| timeslice 1d\n| count by _timeslice, status\n| transpose row _timeslice column status"
        query_type   = "Logs"
      }

      title           = "Password Reset Attempts"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelb0d7f9a983854949"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit action=login status=SUCCESS\n| where _sourceCategory=\"user_activity\"\n| withtime _messageTime\n| most_recent(_messageTime_withtime) as last_login by sourceuser,_sourceHost\n| formatDate(fromMillis(last_login), \"MM-dd-yyyy HH:mm:ss.SSS\", \"UTC\") as last_login\n| _sourceHost as Host\n| fields -_sourceHost\n| fields sourceuser, host, last_login\n| sort by last_login"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1d"
            }
          }
        }
      }

      title           = "Last Successful Login (UTC)"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-4w2d"
        }
      }
    }
  }

  title = "User Activity - Login and Credentials"
}

resource "sumologic_dashboard" "user_activity_scheduled_search" {
  description = "See a count of scheduled searches that were started, completed, finished with errors, timed-out, skipped, or suspended."
  folder_id   = sumologic_folder.integration_folder.id

  layout {
    grid {
      layout_structure {
        key       = "panel16179cb79f722948"
        structure = "{\"width\":6,\"height\":6,\"x\":0,\"y\":0}"
      }

      layout_structure {
        key       = "panel27df3df79f78aa44"
        structure = "{\"width\":8,\"height\":6,\"x\":0,\"y\":10}"
      }

      layout_structure {
        key       = "panel2bc924fe9330c942"
        structure = "{\"width\":6,\"height\":6,\"x\":18,\"y\":5}"
      }

      layout_structure {
        key       = "panel3805d6fb970db84a"
        structure = "{\"width\":8,\"height\":6,\"x\":8,\"y\":10}"
      }

      layout_structure {
        key       = "panel5e4598adbcf2894d"
        structure = "{\"width\":6,\"height\":6,\"x\":18,\"y\":0}"
      }

      layout_structure {
        key       = "panel6c9d0676b82f2b4e"
        structure = "{\"width\":8,\"height\":6,\"x\":16,\"y\":10}"
      }

      layout_structure {
        key       = "panel9807d0d7a5392948"
        structure = "{\"width\":6,\"height\":6,\"x\":6,\"y\":5}"
      }

      layout_structure {
        key       = "panela7fb66dfafba094f"
        structure = "{\"width\":6,\"height\":6,\"x\":6,\"y\":0}"
      }

      layout_structure {
        key       = "panelc9faeba9a3e08b47"
        structure = "{\"width\":6,\"height\":6,\"x\":12,\"y\":0}"
      }

      layout_structure {
        key       = "panelceb718e1b0fee942"
        structure = "{\"width\":6,\"height\":6,\"x\":12,\"y\":5}"
      }

      layout_structure {
        key       = "panelef08ec96b7e4ca4a"
        structure = "{\"width\":6,\"height\":6,\"x\":0,\"y\":5}"
      }
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel16179cb79f722948"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=START\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| timeslice 1h\n| count as count by _timeslice, status\n| transpose row _timeslice column status"
        query_type   = "Logs"
      }

      title           = "Schd Search Started"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel27df3df79f78aa44"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search (action=TIMEOUT or action=SUSPEND or action=SKIP or status=FAILURE)\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| count as count by SchTime, Name, SchSearchId, sourceuser, action, status | sort by SchTime | limit 10\n| fields -count"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1h"
            }
          }
        }
      }

      title           = "Recent Scheduled Search Errors"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel2bc924fe9330c942"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=SUSPEND\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\"\n| count"
        query_type   = "Logs"
      }

      title           = "Suspended"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"svp\",\"displayType\":\"default\",\"mode\":\"singleValueMetrics\"},\"svp\":{\"option\":\"Latest\",\"label\":\"\",\"useBackgroundColor\":false,\"useNoData\":false,\"noDataString\":\"No data\",\"hideData\":false,\"hideLabel\":false,\"rounding\":2,\"valueFontSize\":24,\"labelFontSize\":14,\"thresholds\":[{\"from\":null,\"to\":null,\"color\":\"#16943E\"},{\"from\":null,\"to\":null,\"color\":\"#DFBE2E\"},{\"from\":null,\"to\":null,\"color\":\"#BF2121\"}],\"sparkline\":{\"show\":false,\"color\":\"#222D3B\"},\"gauge\":{\"show\":false,\"min\":0,\"max\":100,\"showThreshold\":false,\"showThresholdMarker\":false}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel3805d6fb970db84a"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search (action=TIMEOUT or action=SUSPEND or action=SKIP or status=FAILURE)\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| count as count by Name, SchSearchId, sourceuser | sort by count | limit 10"
        query_type   = "Logs"
      }

      title           = "Top 10 Scheduled Searches with Errors"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel5e4598adbcf2894d"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search (action=CREATE or action=UPDATE or action=DELETE)\n| where _sourceCategory=\"scheduled_search\"\n| timeslice 12h\n| count by _timeslice, action\n| transpose row _timeslice column action"
        query_type   = "Logs"
      }

      time_range {
        begin_bounded_time_range {
          from {
            relative_time_range {
              relative_time = "-1w"
            }
          }
        }
      }

      title           = "Schd Search Operations"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"area\",\"displayType\":\"default\",\"markerSize\":null,\"lineDashType\":\"solid\",\"markerType\":\"none\",\"lineThickness\":1,\"fillOpacity\":0.25,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[],\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel6c9d0676b82f2b4e"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=SUSPEND\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\"\n| count as count by _messagetime, Name, SchSearchId, sourceuser\n| sort by _messagetime\n| formatDate(fromMillis(_messagetime), \"MM-dd-yyyy HH:mm:ss.SSS\", \"UTC\") as time\n| fields -count,_messagetime\n| fields time,name,SchSearchId, sourceuser"
        query_type   = "Logs"
      }

      title           = "Suspended Searches"
      visual_settings = "{\"title\":{\"fontSize\":12},\"series\":{},\"general\":{\"type\":\"table\",\"fontSize\":12,\"mode\":\"timeSeries\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panel9807d0d7a5392948"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=TIMEOUT status=FAILURE\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| count"
        query_type   = "Logs"
      }

      title           = "Timed-out"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"svp\",\"displayType\":\"default\",\"mode\":\"singleValueMetrics\"},\"svp\":{\"option\":\"Latest\",\"label\":\"\",\"useBackgroundColor\":false,\"useNoData\":false,\"noDataString\":\"No data\",\"hideData\":false,\"hideLabel\":false,\"rounding\":2,\"valueFontSize\":24,\"labelFontSize\":14,\"thresholds\":[{\"from\":null,\"to\":null,\"color\":\"#16943E\"},{\"from\":null,\"to\":null,\"color\":\"#DFBE2E\"},{\"from\":null,\"to\":null,\"color\":\"#BF2121\"}],\"sparkline\":{\"show\":false,\"color\":\"#222D3B\"},\"gauge\":{\"show\":false,\"min\":0,\"max\":100,\"showThreshold\":false,\"showThresholdMarker\":false}},\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panela7fb66dfafba094f"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=FINISH\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| timeslice 1h\n| count as count by _timeslice,status\n| transpose row _timeslice column status"
        query_type   = "Logs"
      }

      title           = "Schd Search Completed"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"stacked\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":true,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelc9faeba9a3e08b47"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=START\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| timeslice 1h\n| count_distinct(sourceuser) as count by _timeslice"
        query_type   = "Logs"
      }

      title           = "Distinct Users Executing Schd Searches"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"column\",\"displayType\":\"default\",\"fillOpacity\":1,\"mode\":\"timeSeries\"},\"axes\":{\"axisX\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12},\"axisY\":{\"hideLabels\":false,\"title\":\"\",\"titleFontSize\":12,\"labelFontSize\":12,\"logarithmic\":false,\"gridColor\":\"\",\"minimum\":null,\"maximum\":null}},\"legend\":{\"enabled\":false,\"verticalAlign\":\"right\",\"fontSize\":12,\"maxHeight\":50,\"showAsTable\":true,\"wrap\":true},\"color\":{\"family\":\"Categorical Default\"},\"thresholdsSettings\":{\"fillRemainingGreen\":false,\"showThresholds\":false,\"numberThresholds\":{\"warning\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":80},\"critical\":{\"display\":true,\"comparator\":\"greater_or_equal\",\"value\":100}}},\"overrides\":[]}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelceb718e1b0fee942"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=SKIP\n| where _sourceCategory=\"scheduled_search\"\n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| count"
        query_type   = "Logs"
      }

      title           = "Skipped"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"svp\",\"displayType\":\"default\",\"mode\":\"singleValueMetrics\"},\"svp\":{\"option\":\"Latest\",\"label\":\"\",\"useBackgroundColor\":false,\"useNoData\":false,\"noDataString\":\"No data\",\"hideData\":false,\"hideLabel\":false,\"rounding\":2,\"valueFontSize\":24,\"labelFontSize\":14,\"thresholds\":[{\"from\":null,\"to\":null,\"color\":\"#16943E\"},{\"from\":null,\"to\":null,\"color\":\"#DFBE2E\"},{\"from\":null,\"to\":null,\"color\":\"#BF2121\"}],\"sparkline\":{\"show\":false,\"color\":\"#222D3B\"},\"gauge\":{\"show\":false,\"min\":0,\"max\":100,\"showThreshold\":false,\"showThresholdMarker\":false}},\"series\":{}}"
    }
  }

  panel {
    sumo_search_panel {
      keep_visual_settings_consistent_with_parent = "true"
      key                                         = "panelef08ec96b7e4ca4a"

      query {
        query_key    = "A"
        query_string = "_index=sumologic_audit class=scheduled_search action=FINISH status=FAILURE\n| where _sourceCategory=\"scheduled_search\" \n| KV \"Name\", \"SchSearchId\", \"SchTime\"\n| count"
        query_type   = "Logs"
      }

      title           = "Finished with Errors"
      visual_settings = "{\"title\":{\"fontSize\":14},\"general\":{\"type\":\"svp\",\"displayType\":\"default\",\"mode\":\"singleValueMetrics\"},\"svp\":{\"option\":\"Latest\",\"label\":\"\",\"useBackgroundColor\":false,\"useNoData\":false,\"noDataString\":\"No data\",\"hideData\":false,\"hideLabel\":false,\"rounding\":2,\"valueFontSize\":24,\"labelFontSize\":14,\"thresholds\":[{\"from\":null,\"to\":null,\"color\":\"#16943E\"},{\"from\":null,\"to\":null,\"color\":\"#DFBE2E\"},{\"from\":null,\"to\":null,\"color\":\"#BF2121\"}],\"sparkline\":{\"show\":false,\"color\":\"#222D3B\"},\"gauge\":{\"show\":false,\"min\":0,\"max\":100,\"showThreshold\":false,\"showThresholdMarker\":false}}}"
    }
  }

  refresh_interval = "0"
  theme            = "Dark"

  time_range {
    begin_bounded_time_range {
      from {
        relative_time_range {
          relative_time = "-1d"
        }
      }
    }
  }

  title = "User Activity - Scheduled Search"
}
