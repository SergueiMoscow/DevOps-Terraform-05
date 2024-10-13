variable "ip_address" {
  type = string
  description = "IP-address"
  default     = "1920.1680.0.1"
  validation  {
    condition = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.ip_address))
    error_message   = "Ip адрес должен иметь корректного формат, например: 192.168.1.1"
  }

}

variable "ip_addresses" {
  type = list(string)
  description = "Список IP адресов"
  default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    condition = alltrue([
      for ip in var.ip_addresses : can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", ip))
    ])
    error_message   = "Переменная должна содержать список валидных IP адресов, например: [\"192.168.1.1\", \"8.8.8.8\"]"
  }
}