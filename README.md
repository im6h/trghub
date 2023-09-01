## Status
The __README__ is updating....

### Terragrunt folder

```
root
├── terragrunt.hcl
├── prod
│   └── terragrunt.hcl
├── stag
│   └── terragrunt.hcl
└── dev
    ├── terragrunt.hcl
    └── firewall
        └── terragrunt.hcl
    └── firewall_group
        └── terragrunt.hcl
    └── ssh_keys
        └── terragrunt.hcl
    └── instance
        └── terragrunt.hcl
    └── vpc
        └── terragrunt.hcl
```

### Dependencies
```tf
dependency "vpc" {
  config_path = "../vpc"
  skip_outputs = true
}
## or
dependencies {
  paths = ["../vpc", "../mysql", "../redis"]
}

```

show graph depend

```tf
terragrunt graph-dependencies | dot -Tsvg > graph.svg
```

### Provison infrastructure

the **terragrunt** will read from `env.yaml` and `secret.yaml` to get variable

create the file __secret.yaml__ with template: 
```yaml
api_key: ""
ssh_key: ""
aws:
  profile: ""
  bucket: ""
```

create the __env.yaml__ in for each folder in env with template:
```yaml
environment: "dev"
region: "ams"
vpc:
  cidr_block: "192.168.0.0/24"
rules:
  - index: 1
    cidr_block: "0.0.0.0/0"
    port: "22"
    protocol: "TCP"
  - index: 2
    cidr_block: "0.0.0.0/0"
    port: "51820"
    protocol: "TCP"
  - index: 3
    cidr_block: "0.0.0.0/0"
    port: "51820"
    protocol: "UDP"
ice:
  kind: "vhf"
  core: "1c"
  ram: "1gb"
  label: "VPN instance"
  backups: "disabled"
  tags: ["vpn", "wireguard", "dev"]
  os_id: 352

```