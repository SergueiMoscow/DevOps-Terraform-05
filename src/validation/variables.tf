variable "ip_address" {
  type = string
  description = "IP-address"
  default     = "192.168.0.1"
  validation  {
    condition = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.ip_address))
    error_message   = "Ip адрес должен иметь корректного формат, например: 192.168.1.1"
  }

}

variable "ip_addresses" {
  type = list(string)
  description = "Список IP адресов"
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"] 
  validation {
    condition = alltrue([
      for ip in var.ip_addresses : can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", ip))
    ])
    error_message   = "Переменная должна содержать список валидных IP адресов, например: [\"192.168.1.1\", \"8.8.8.8\"]"
  }

}

variable "any_string" {
  type = string
  description = "любая строка"
  default = "qwerTy"
  validation {
    condition = can(regex("^[^A-Z]*$", var.any_string))
    error_message = "Строка не должна содержать символы верхнего регистра"
  }
}

variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "Значение true должно быть только у одного объекта"
        condition = var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
    }
}