locals {
  integration_name = "IngestAlerting${var.suffix == "" ? "" : "-${title(var.suffix)}"}"
}
