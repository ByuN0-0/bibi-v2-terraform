output "instance_name" {
  description = "Name of the Compute Engine instance"
  value       = google_compute_instance.bibi_bot_vm.name
}

output "instance_internal_ip" {
  description = "Internal IP address of the instance"
  value       = google_compute_instance.bibi_bot_vm.network_interface[0].network_ip
}

output "instance_external_ip" {
  description = "External IP address of the instance"
  value       = google_compute_instance.bibi_bot_vm.network_interface[0].access_config[0].nat_ip
}

output "instance_zone" {
  description = "Zone of the instance"
  value       = google_compute_instance.bibi_bot_vm.zone
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "gcloud compute ssh ${google_compute_instance.bibi_bot_vm.name} --zone=${google_compute_instance.bibi_bot_vm.zone} --project=${var.gcp_project_id}"
}

output "artifact_registry_repository" {
  description = "Artifact Registry repository URL"
  value       = "${var.gcp_region}-docker.pkg.dev/${var.gcp_project_id}/${google_artifact_registry_repository.bibi_bot_repo.repository_id}"
}
