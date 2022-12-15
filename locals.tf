locals {

  is_serverless                        = var.serverlessv2_scaling_configuration != null
  is_instance_availability_zone        = var.instance_availability_zone != null
  is_instance_availability_zone_reader = var.instance_availability_zone_reader != null

  tags = merge(
    var.labels,
    var.tags,
  )

  db_security_group = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-security-group-${var.cluster_type}-${var.labels.env}"

  db_cluster            = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-cl-global-${var.labels.env}"
  db_cluster_primary    = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-cl-primary-${var.labels.env}"
  db_cluster_secondary  = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-cl-secondary-${var.labels.env}"
  db_primary_instance   = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-primary-instance"
  db_secondary_instance = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-secondary-instance"

  db_param_group         = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-param-group-${var.cluster_type}-${var.labels.env}"
  db_cluster_param_group = "${var.labels.prefix}-${var.labels.stack}-${var.labels.component}-cluster-param-group-${var.cluster_type}-${var.labels.env}"
}