variable "region" {
  type = string
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "creator" {
  type        = string
  description = "Creator name"
}

variable "business_name" {
  type = string
}

variable "cost_code" {
  type = string
}


variable "project_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "project_sponsor" {
  type = string
}

variable "project_technical_lead" {
  type = string
}
