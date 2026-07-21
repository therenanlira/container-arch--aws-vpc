# container-arch--aws-vpc

Provisiona a VPC do projeto via o módulo [`network`](https://github.com/therenanlira/container-arch--aws-modules/tree/main/network).

## Estrutura

Terraform em `terraform/`, com workspaces por ambiente (`local.workspace = var.workspaces[terraform.workspace]` em `terraform.tfvars`). Hoje só o workspace `dev` está configurado.

## Pipeline (`.github/workflows/`)

- **`cicd.yaml`** — orquestrador. Em PR `dev -> main` e em push/merge na `main`, aplica o workspace `dev`. Blocos de `prd` já existem no arquivo, comentados, prontos para ativar quando houver um segundo ambiente.
- **`pipeline.yaml`** — reusable workflow (lint/validate → plan → apply), compartilhado entre os repos de infra.
- **`destroy.yaml`** — roda `terraform plan -destroy` diariamente às 09:40 UTC (06:40 BRT) e só destrói se houver recursos; também pode ser disparado manualmente (`workflow_dispatch`). Como o `cluster` e o `app` dependem da VPC, o destroy dela roda **por último** no ciclo diário.

## Uso local

```bash
cd terraform
terraform init
terraform workspace select dev
terraform plan
terraform apply
```
