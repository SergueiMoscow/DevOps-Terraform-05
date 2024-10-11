[Задание](https://github.com/netology-code/ter-homeworks/blob/main/05/hw-05.md)

## [Задание 1](tasks/task1.md)

### Типы ошибок:
#### tflint
- **terraform_required_providers
 Missing version constraint for provider "yandex" in `required_providers`**  
Не указана версия провайдера. Это чревато тем, что между версиями могут быть изменения, которые вызовут проблемы с кодом для текущей версии.
- **terraform_unused_declarations**  
В целях "очищения кода" tflint указывает на неиспользуемые переменные.



#### checkov
- **Check: CKV_TF_1: "Ensure Terraform module sources use a commit hash"**  
рекомендуется использовать URL-адреса Git с ревизией хэша коммита, чтобы гарантировать неизменяемость и согласованность
[Источник](https://docs.prismacloud.io/en/enterprise-edition/policy-reference/supply-chain-policies/terraform-policies/ensure-terraform-module-sources-use-git-url-with-commit-hash-revision)
- **Check: CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"**  
Хотя теги Git также можно использовать, они не столь неизменяемы, как хэш, и поэтому менее предпочтительны.

