# 💤 NixOS I3lock Color

> Declarative NixOS module to deploy i3lock-color with Catppuccin mocha green theme and secure per-user config.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/i3lock-color``` with ```700``` permissions.

- 🎨 **Catppuccin Mocha theme :** Uses the Catppuccin mocha color palette in the lock screen.

- ⚙️ **Config deployment :** Installs ```i3lock-color``` binary into the user’s config folder for easy updates.

- 🔄 **Idempotent :** Cleans and recreates on every rebuild without removing existing credentials.

- 📦 **Package installation :** Ensures ```i3lock-color``` is added to ```environment.systemPackages```.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing lock-screen configs.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/i3lock-color{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-i3lock-color = fetchGit {
    url = "https://github.com/typovrak/nixos-i3lock-color.git";
    ref = "main";
    rev = "acb27d6837a2c375e99f0eaf5460374fe36de851"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-i3lock-color}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Lock your screen with i3lock-color and the Catppuccin mocha green theme
```bash
~/.config/i3lock-color
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
