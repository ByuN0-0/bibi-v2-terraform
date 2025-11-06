# Compute Engine Instance with Container-Optimized OS (COS)
resource "google_compute_instance" "bibi_bot_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
      size  = var.boot_disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  # Metadata for startup script and SSH keys
  metadata = {
    enable-oslogin = "true"
  }

  # Allow HTTP and custom ports for Discord bot
  tags = var.tags

  labels = {
    environment = "production"
    app         = "discord-bot"
    project     = "bibi-v2"
  }
}

# Grant GCR pull permissions to default service account
resource "google_project_iam_member" "default_sa_gcr_pull" {
  project = var.gcp_project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${var.gcp_project_id}-compute@developer.gserviceaccount.com"
}

# Firewall rule for SSH access
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.allowed_ssh_ips
  target_tags   = var.tags
}

# Firewall rule for HTTP (if needed for webhooks)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.allowed_http_ips
  target_tags   = var.tags
}

# Firewall rule for HTTPS (if needed for webhooks)
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = var.allowed_http_ips
  target_tags   = var.tags
}
