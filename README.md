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

create the file __secret.yaml__ with template: 
```yaml
api_key: ""
ssh_key: ""
aws:
  profile: ""
  bucket: ""
```