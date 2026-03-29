variable "queue_name" {}
variable "delay_seconds" { default = 0 }
variable "max_message_size" { default = 262144 }
variable "retention_seconds" { default = 86400 }
variable "wait_time" { default = 0 }