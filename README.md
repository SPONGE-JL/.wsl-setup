
<!-- https://badges.pages.dev/ -->
<!-- https://ileriayo.github.io/markdown-badges/#markdown-badges -->
![Windows 11](https://img.shields.io/badge/Windows%2011-%230079d5.svg?logo=Windows%2011&style=flat&logoColor=white)
![Linux Badge](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=000&style=flat)

# Windows 11 on-boarding to WSL2

From factory reset to Windows Subsustem for Linux (call it 'WSL' or 'wsl') version 2

- [Windows 11 on-boarding to WSL2](#windows-11-on-boarding-to-wsl2)
  - [Prerequisite](#prerequisite)
    - [Baseline requirements](#baseline-requirements)
    - [Required IDEs](#required-ides)
      - [Jetbrain Toolbox](#jetbrain-toolbox)
      - [Visual Studio Code](#jetbrain-toolbox)
      - [Kiro (option)](#kiro-option)
  - [Add Container Capability with WSL2](#add-container-capability-with-wsl2)
    - [Enable windows features for WSL and container](#enable-windows-features-for-wsl-and-container)
    - [Activate WSL2](#activate-wsl2)
    - [Rancher Desktop](#rancher-desktop)
  - [Setup Ubuntu LTS (WSL2)](#setup-ubuntu-lts-wsl2)
    - [Latest upgrade `apt`(advanced package toolkit)](#latest-upgrade-aptadvanced-package-toolkit)
    - [Set default locale](#set-default-locale)
    - [Switch from bash to zsh](#switch-from-bash-to-zsh)
    - [Homebrew for Linux](#homebrew-for-linux)
  - [Next step](#next-step)

---

## Prerequisite

### Baseline requirements

> ⚠️ STRONGLY RECOMMEND ⚠️
>
> DO NOT SKIP WINDOWS UPDATE!!

- Upgrade to [Windows 11](https://www.microsoft.com/ko-kr/windows/end-of-support?r=1)

- Install all [latest updates](https://support.microsoft.com/en-us/windows/install-windows-updates-3c5ae7fc-9fb6-9af1-1984-b5e0412c556a)

### Recommended packages

1. Open PowerShell as an Administrator: `Win + X, A`

2. Copy the [`winget.ps1` script](.winget.ps1)

3. Paste with execution block

    ```powershell
    # In PowerShell
    . {
      # Paste here
    }
    ```

<details>
<summary>click to contents</summary><br/>

- [Terminal](https://apps.microsoft.com/detail/9n0dx20hk701):
  [Easy to connect multiple kernels](https://github.com/microsoft/terminal#readme)
  (already installed in Windows 11)

  ```powershell
  # In PowerShell
  winget install -e --id Microsoft.WindowsTerminal
  ```

- [BandiZip](https://apps.microsoft.com/detail/9P2W3W81SPPB):
  Easy archiver

  ```powershell
  # In PowerShell
  winget install -e --id Bandisoft.Bandizip
  ```

- [Draw.io Diagrams](https://apps.microsoft.com/detail/9MVVSZK43QQW):
  [Easy drawing diagrams](https://www.drawio.com/blog/diagrams-offline)

  ```powershell
  # In PowerShell
  winget install -e --id JGraph.Draw
  ```

- [Sublime Text Editor](https://www.sublimetext.com/):
  The sophisticated text editor for code, markup and prose

  ```powershell
  # In PowerShell
  winget install -e --id SublimeHQ.SublimeText.4
  ```

</details>

- [Microsoft PC Manager](https://apps.microsoft.com/detail/9PM860492SZD):
  [Easy PC optimization](https://pcmanager.microsoft.com/en-us)

  ```powershell
  # In PowerShell
  winget install -e --id Microsoft.PCManager
  ```

- [PowerToys](https://apps.microsoft.com/detail/XP89DCGQ3K6VLD):
  [Easy for Windows Experience](https://github.com/microsoft/PowerToys#readme)
  (shortcut: `win + alt + space`)

  ```powershell
  # In PowerShell
  winget install -e --id Microsoft.PowerToys
  ```

  > 💁 Here are some useful features for your perfomance
  >
  > - [Fancy zones](https://learn.microsoft.com/en-us/windows/powertoys/fancyzones):
  >   `shift + drag` or `win + arrow` a window manager utility for arranging and snapping windows
  >
  > - [Zoom it](https://learn.microsoft.com/en-us/windows/powertoys/zoomit):
  >   (enable in setting) a screen zoom, annotation, and recording tool for technical presentations and demos
  >
  > - [Find my mouse](https://learn.microsoft.com/en-us/windows/powertoys/mouse-utilities#find-my-mouse):
  >   `ctrl ctrl` (twice) activate a spotlight that focuses on the cursor's position
  >
  > - [Text extractor](https://learn.microsoft.com/en-us/windows/powertoys/text-extractor):
  >   `win + shift + t` enables you to copy text from anywhere on your screen

  Other alternatives: [Flow Launcher](https://www.flowlauncher.com/), [Raycast](https://www.raycast.com/windows)

- Install [Nerd Fonts](https://www.nerdfonts.com/#home)
  to [Windows Fonts](https://support.microsoft.com/en-us/windows/manage-fonts-in-windows-f12d0657-2fc8-7613-c76f-88d043b334b8)

  > 💁 You can convert [the font family in your terminal profile in configuration](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/profile-appearance#font):
  > `cntl + ,`

### Required IDEs

#### [Jetbrain Toolbox](https://www.jetbrains.com/lp/toolbox/)

- [Download installer](https://www.jetbrains.com/toolbox-app/)

  - Install the IntelliJ IDEA

  - Setup [the CLI `idea`](https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#toolbox)

  - [Enable DevContainer for IntelliJ IDEA](https://www.jetbrains.com/help/idea/start-dev-container-for-a-remote-project.html)

- Or, [Download System Installer for IntelliJ IDEA Ultimate](https://www.jetbrains.com/ko-kr/idea/download/?section=windows) only

#### [Visual Studio Code](https://code.visualstudio.com/)

- [Download System Installer](https://code.visualstudio.com/Download)

- [Diable GitHub Copilot Extentions](https://stackoverflow.com/a/75377469)

- [Enable DevContainer for VS Code](https://docs.rancherdesktop.io/how-to-guides/vs-code-remote-containers/)
  (a.k.a [Remote Container](https://code.visualstudio.com/docs/devcontainers/containers))

#### [Kiro](https://kiro.dev) (option)

- [Download installer](https://kiro.dev/)

  - [Official Documents](https://kiro.dev/docs/getting-started/installation/)

  - [Builder Center Articles](https://builder.aws.com/learn/topics/kiro?tab=article)

  - [Community Documents](https://kiro.help/docs)

---

## Add Container Capability with WSL2

### Enable windows features for WSL and container

1. Open PowerShell as an Administrator: `Win + X, A`

2. Copy the [`prerequisite.ps1` script](./prerequisite.ps1)

3. Paste with execution block

    ```powershell
    # In PowerShell
    . {
      # Paste here
    }
    ```

    <details>
    <summary>Also, you can setup in GUI</summary><br/>

    [Enable Hypervisor](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-hyper-v?tabs=gui&pivots=windows) for WSL and container

    - **Hyper-V**
    - **Windows Subsystem for Linux** (Linux용 Windows 하위 시스템)
    - (option) **Virtual Machine Platform**
    - (option) **Windows Hypervisor Platform** (Windows 하이퍼바이저 플랫폼)

    </details>

### Activate [WSL2](https://learn.microsoft.com/ko-kr/windows/wsl/install)

- [Update WSL kernel to latest version](https://learn.microsoft.com/ko-kr/windows/wsl/basic-commands#update-wsl):

  ```powershell
  # In PowerShell
  wsl --update
  ```

- [Check the available distributions](https://learn.microsoft.com/ko-kr/windows/wsl/basic-commands#list-available-linux-distributions):

  ```powershell
  # In PowerShell
  wsl --list --online
  ```

- Install [Ubuntu Latest LTS](https://endoflife.date/ubuntu):

  ```powershell
  # In PowerShell
  wsl --install --distribution Ubuntu-24.04
  ```

- Enter new UNIX username and new password, then proceed:

  ```bash
  # In Bash of WSL2
  whoami
  ```

- In another terminal, check the installed distributions:

  ```powershell
  # In PowerShell
  wsl --list --all --verbose
  ```

  <details>
  <summary>(Optional) Tuning WSL resources at <code>{HOST_HOME}/.wslconfig</code></summary><br/>

  - About [`.wslconfig`](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig)

    ```powershell
    # In PowerShell
    New-Item -Path "${HOME}\.wslconfig" -ItemType File -ErrorAction SilentlyContinue
    Start-Process "${HOME}\.wslconfig"
    ```

  - Add below configuration after opening in editor

    ```toml
    [wsl2]
    processors=8
    memory=16GB
    ```

  - Check:

    ```powershell
    # In PowerShell
    Get-Content "${HOME}\.wslconfig"
    ```

  - Reboot WSL:

    ```powershell
    # In PowerShell
    # Shutdown
    wsl --terminate Ubuntu-24.04

    # Check after 3 seconds
    wsl --list --all --verbose

    # Boot up
    wsl --distribution Ubuntu-24.04

    # Check after logout(exit command)
    wsl --list --all --verbose
    ```

  </details>

### [Rancher Desktop](https://rancherdesktop.io/)

- [Download binary to install](https://rancherdesktop.io/)

- Choose `dockerd (moby)` runtime with automatically `PATH` valiable setting

- Integrate with WSL distros:

  - Open the Preference panel: `Ctrl + ,(comman)`
  - `WSL` -> `Integrations` -> Choose the WSL distros
  - Click the `apply`

- Check in WSL

  ```bash
  docker version
  docker compose version
  kubectl version
  helm version
  ```

- (option) Check in PowerShell

  ```powershell
  PS > docker version
  PS > docker compose version
  PS > kubectl version
  PS > helm version
  ```

---

## Setup Ubuntu LTS (WSL2)

> 💁 These scripts are shell script for WSL.

### Latest upgrade `apt`(advanced package toolkit)

```bash
sudo apt update
sudo apt upgrade -y
```

> [What is diffrent between `apt` and `apt-get`](https://aws.amazon.com/ko/compare/the-difference-between-apt-and-apt-get/)

### Set default locale

```bash
sudo apt install -y locales
sudo locale-gen en_US.UTF-8
```

### Switch from bash to zsh

Install via apt:

```bash
sudo apt install -y zsh
```

Switch to ZSH:

```bash
sudo chsh -s $(which zsh)
```

Refresh:

```bash
exec $(which zsh)
# Insert 2 for default setting
```

### Homebrew for Linux

[Required packages](https://docs.brew.sh/Homebrew-on-Linux#requirements):

```bash
sudo apt install -y build-essential procps file
```

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew --version
```

Linux on-boarding with [`.mac-setup`](https://github.com/SPONGE-JL/.mac-setup#readme) guide
(maybe some packages would be not requiqred)
