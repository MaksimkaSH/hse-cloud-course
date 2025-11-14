## Развертывание

Для развертывания нужно создать файл `terraform.tfvars` и прописать нужные переменные

После нужно выполнить
```bash
terraform init
terraform apply
```

## SSH к серверу

```bash
ssh ubuntu@$(terraform output -raw server_external_ip)
```

## Подключение к PostgreSQL

```bash
psql "$(terraform output -raw connection_string)"
```

## Артефакты

### VM
![VM](artefacts/VM.png)

![VM-browser](artefacts/VM-browser.png)

### VPC
![VPC](artefacts/VPC.png)

![VPC-full](artefacts/VPC-full.png)

### PostrgreSQL

![PostgreSQL](artefacts/Postgres.png)

![PostgreSQL-full](artefacts/Postgres-full.png)

### Object Storage

![Object Storage](artefacts/Object-Storage.png)
