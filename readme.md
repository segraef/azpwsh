# GitHub Action azpwsh

This action can be used to run Azure PowerShell scripts.

To be able to execute scripts in Azure your Action needs to be logged into Azure.
The Action [azlogin](https://github.com/segraef/azlogin) does that for you.

## Usage

```

- name: Azure PowerShell Script
  uses: segraef/azpwsh@v1
  with:
    script: "scripts/script.ps1"

```

```

- name: Azure PowerShell Script
  uses: segraef/azpwsh@v1
  with:
    inlineScript: |
      Get-Location

```

## Requirements

segraef/azlogin@v1

## Variables

- `inlineScript` – **Mandatory**
- `script` – **Mandatory**
- `azPSVersion` – **Optional**
