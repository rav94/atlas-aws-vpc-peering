provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

provider "mongodbatlas" {
  public_key   = var.ATLAS_PUBLIC_KEY
  private_key  = var.ATLAS_PRIVATE_KEY
}