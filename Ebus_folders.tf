variable "e_business_folder_id" {
  default = "folders/285758495508" 
}

# Subfolders under e-business
locals {
  e_business_folders = [
    "hub",
    "ops",
    "search",
    "ordermanagement",
    "businessintelligence",
    "supplymanagement",
    "productcreation",
    "integration",
    "omnichannel",
    "consumerapp",
    "customerselfservice",
    "productpresentation",
    "productinformation",
    "dropshipment"
  ]
}

# Create subfolders
resource "google_folder" "e_business_subfolders" {
  for_each      = toset(local.e_business_folders)
  display_name  = each.key
  parent        = var.e_business_folder_id
}
