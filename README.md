# tf-aws-rds-cluster

Terraform module to create AWS RDS multy region cluster.

terrafrom module config exampl see [examples/test](examples/test)


Terraform versions tested
- 1.1.8

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_security_group"></a> [aws\_security\_group](#module\_aws\_security\_group) | ./aws_security_group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_rds_cluster.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_instance.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |
| [aws_rds_global_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_global_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | n/a | `list(string)` | n/a | yes |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | Daily time range during which the backups happen | `string` | `"02:00-03:00"` | no |
| <a name="input_cluster_parameters"></a> [cluster\_parameters](#input\_cluster\_parameters) | List of DB cluster parameters to apply | <pre>list(object({<br>    apply_method = string<br>    name         = string<br>    value        = string<br>  }))</pre> | `[]` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | defines the type of cluster instance(primary or secondary | `string` | `"primary"` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy tags to backup snapshots | `bool` | `true` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The name of the database engine to be used for this DB cluster. Valid values: `aurora`, `aurora-mysql`, `aurora-postgresql` | `string` | `"aurora-mysql"` | no |
| <a name="input_db_engine_family"></a> [db\_engine\_family](#input\_db\_engine\_family) | The family of the DB cluster parameter group | `string` | `"aurora-mysql8.0"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The version of the database engine to use. See `aws rds describe-db-engine-versions` | `string` | `""` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | This setting is required to create a provisioned Multi-AZ DB cluster | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name (default is not to create a database) | `string` | `""` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Database subnet group name. | `string` | `null` | no |
| <a name="input_engine_mode"></a> [engine\_mode](#input\_engine\_mode) | The database engine mode. Valid values: `parallelquery`, `provisioned`, `serverless` | `string` | `"provisioned"` | no |
| <a name="input_global_cluster_identifier"></a> [global\_cluster\_identifier](#input\_global\_cluster\_identifier) | ID of the Aurora global cluster | `string` | `""` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | `bool` | `true` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | Iam roles for the Aurora cluster | `list(string)` | `[]` | no |
| <a name="input_instance_parameters"></a> [instance\_parameters](#input\_instance\_parameters) | List of DB instance parameters to apply | <pre>list(object({<br>    apply_method = string<br>    name         = string<br>    value        = string<br>  }))</pre> | `[]` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN for the KMS encryption key. When specifying `kms_key_arn`, `storage_encrypted` needs to be set to `true` | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Minimum required map of labels(tags) for creating aws resources | <pre>object({<br>    prefix    = string<br>    stack     = string<br>    component = string<br>    env       = string<br>  })</pre> | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Password for the master DB user. Ignored if cluster\_type == secondary | `string` | `""` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username for the master DB user. Ignored if cluster\_type == secondary | `string` | `"admin"` | no |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | Number of days to retain backups for | `number` | `7` | no |
| <a name="input_security_group_cidr_blocks_allowed"></a> [security\_group\_cidr\_blocks\_allowed](#input\_security\_group\_cidr\_blocks\_allowed) | List of cidr blocks to be allowed to connect to the DB instance | `list(string)` | `[]` | no |
| <a name="input_security_group_ids_add_external"></a> [security\_group\_ids\_add\_external](#input\_security\_group\_ids\_add\_external) | Additional security group IDs to apply to the cluster | `list(string)` | `[]` | no |
| <a name="input_security_groups_ids_allowed"></a> [security\_groups\_ids\_allowed](#input\_security\_groups\_ids\_allowed) | List of security groups to be allowed to connect to the DB instance | `list(string)` | `[]` | no |
| <a name="input_serverlessv2_scaling_configuration"></a> [serverlessv2\_scaling\_configuration](#input\_serverlessv2\_scaling\_configuration) | serverlessv2 scaling properties | <pre>object({<br>    min_capacity = number<br>    max_capacity = number<br>  })</pre> | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted | `bool` | `true` | no |
| <a name="input_source_region"></a> [source\_region](#input\_source\_region) | Source Region of primary cluster, needed when using encrypted storage and region replicas | `string` | `""` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create the cluster in (e.g. `vpc-a394745sdf`) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The DNS address of the RDS instance |
| <a name="output_global_cluster_identifier"></a> [global\_cluster\_identifier](#output\_global\_cluster\_identifier) | The DNS address of the RDS instance |
<!-- END_TF_DOCS -->