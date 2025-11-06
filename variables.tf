variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "by-251105"
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
  default     = "us-west1"
}

variable "gcp_zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-west1-b"
}

variable "instance_name" {
  description = "Compute Engine instance name"
  type        = string
  default     = "bibi-bot-vm"
}

variable "machine_type" {
  description = "Machine type for Compute Engine instance"
  type        = string
  default     = "e2-micro"
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "enable_public_ip" {
  description = "Assign public IP to instance"
  type        = bool
  default     = true
}

variable "allowed_ssh_ips" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_ips" {
  description = "CIDR blocks allowed for HTTP access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Network tags for firewall rules"
  type        = list(string)
  default     = ["bibi-bot", "discord-bot"]
}

variable "gcp_credentials" {
  description = "GCP credentials JSON file"
  type        = string
  sensitive = true
}

variable "service_account_email" {
  description = "Email of the service account for GCR access"
  type        = string
  default     = "devbyeon@gmail.com"
}