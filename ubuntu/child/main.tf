### this is the main entry point for module
### terraform suggests you create this, even if its empty

# just using this to refer to a default prefix for this project as an example
locals {
  # this expression can be used anywhere in the current module
  default_prefix = "${var.project_name}-webserver"
}

