resource "mongodbatlas_cluster" "cluster-vpc-peer-demo" {
  project_id   = var.ATLAS_PROJECT_ID
  name         = "cluster-vpc-peer-demo"
  num_shards   = 1

  replication_factor           = 3
  provider_backup_enabled      = false
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "4.0"

  //Provider Settings "block"
  provider_name               = var.ATLAS_PROVIDER
  disk_size_gb                = 10
  provider_disk_iops          = 100
  provider_volume_type        = "STANDARD"
  provider_encrypt_ebs_volume = true
  provider_instance_size_name = "M10"
  provider_region_name        = "US_EAST_1"
}