 resource "google_sql_database_instance" "mysql_instance" {
  name             = "mysql-db"
  region           = "us-central1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "Internet-access"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = false
}
