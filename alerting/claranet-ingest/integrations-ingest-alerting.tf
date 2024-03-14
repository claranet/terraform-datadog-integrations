resource "datadog_webhook" "datadog_integration" {
  name      = local.integration_name
  url       = var.url
  encode_as = "json"
  custom_headers = jsonencode(
    { "Authorization" : "Bearer ${var.token}" }
  )
  payload = jsonencode(
    {
      "aggregationKey" : "$AGGREG_KEY",
      "alert" : {
        "cycleKey" : "$ALERT_CYCLE_KEY",
        "id" : "$ALERT_ID",
        "metric" : "$ALERT_METRIC",
        "query" : "$ALERT_QUERY",
        "scope" : "$ALERT_SCOPE",
        "status" : "$ALERT_STATUS",
        "title" : "$ALERT_TITLE",
        "transition" : "$ALERT_TRANSITION",
        "type" : "$ALERT_TYPE"
      },
      "date" : "$DATE",
      "email" : "$EMAIL",
      "event" : {
        "message" : "$EVENT_MSG",
        "title" : "$EVENT_TITLE",
        "type" : "$EVENT_TYPE"
      },
      "hostName" : "$HOSTNAME",
      "id" : "$ID",
      "lastUpdated" : "$LAST_UPDATED",
      "link" : "$LINK",
      "logsSample" : "$LOGS_SAMPLE",
      "metricNamespace" : "$METRIC_NAMESPACE",
      "organization" : {
        "id" : "$ORG_ID",
        "name" : "$ORG_NAME"
      },
      "priority" : "$PRIORITY",
      "snapshot" : "$SNAPSHOT",
      "tags" : "$TAGS",
      "testOnlyMsg" : "$TEXT_ONLY_MSG",
      "user" : "$USER",
      "userName" : "$USERNAME"
    }
  )
}
