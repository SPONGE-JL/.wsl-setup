<!-- https://badges.pages.dev/ -->
<!-- https://ileriayo.github.io/markdown-badges/#markdown-badges -->
![Windows 11](https://img.shields.io/badge/Windows%2011-%230079d5.svg?logo=Windows%2011&style=flat&logoColor=white)
![Linux Badge](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=000&style=flat)

# .wsl-setup

From factory reset to Windows Subsustem for Linux (call it 'WSL' or 'wsl') version 2

## Prerequisite

- [Windows 11](https://www.microsoft.com/ko-kr/windows/end-of-support?r=1)
  with [latest update](https://support.microsoft.com/en-us/windows/install-windows-updates-3c5ae7fc-9fb6-9af1-1984-b5e0412c556a)

- [Enable Hypervisor](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-hyper-v?tabs=gui&pivots=windows)
  for WSL and container:

  - **Hyper-V**
  - **Windows Subsystem for Linux** (Linux용 Windows 하위 시스템)
  - (option) **Virtual Machine Platform**
  - (option) **Windows Hypervisor Platform** (Windows 하이퍼바이저 플랫폼)

- Microsoft Store:

  - [Terminal](https://apps.microsoft.com/detail/9n0dx20hk701)
  - [BandiZip](https://apps.microsoft.com/detail/9P2W3W81SPPB): Easy archiver
  - [Draw.io Diagrams](https://apps.microsoft.com/detail/9MVVSZK43QQW): Easy drawing diagrams
  - [EarTrumpet](https://apps.microsoft.com/detail/9NBLGGH516XP): Easy volume mixer
  - [Microsoft PC Manager](https://apps.microsoft.com/detail/9PM860492SZD): Easy PC optimization

- Other recommand:

  - [Flow Launcher](https://www.flowlauncher.com/):
    `PS > winget install "Flow Launcher"`
    (shortcut: `alt + space`) // alternative [Raycast for Windows](https://www.raycast.com/windows)
  - [TreeSize](https://www.jam-software.com/treesize_free):
    `PS > winget install -e --id JAMSoftware.TreeSize.Free`
  - [Everything](https://www.voidtools.com/support/everything/):
    `PS > winget install -e --id voidtools.Everything`
  - [CCleaner Portable](https://www.ccleaner.com/ccleaner/builds)

- [Update all packages](https://learn.microsoft.com/en-us/windows/package-manager/winget/upgrade#upgrade---all):
    `PS > winget upgrade --all`

---

## Devlopment Capability on Linux

### [WSL](https://learn.microsoft.com/ko-kr/windows/wsl/install)

Update WSL to latest version:

```powershell
PS > wsl --update
```

Check the available distributions:

```powershell
PS > wsl --list --online
```

Install Ubuntu Latest LTS:

```powershell
PS > wsl --install -d Ubuntu-22.04
```

Enter UNIX username and new password, then proceed:

```bash
whoami
```

In another terminal, check the installed distributions:

```powershell
PS > wsl --list --all --verbose
```

Tuning WSL resources at [`<HOST_HOME>/.wslconfig`](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig):

```powershell
PS > New-Item -Path "${HOME}\.wslconfig" -ItemType File -ErrorAction SilentlyContinue
PS > Start-Process "${HOME}\.wslconfig"
```

Add below configuration after opening in editor:

```toml
[wsl2]
processors=4
memory=8GB
```

Check:

```powershell
PS > Get-Content "${HOME}\.wslconfig"
```

Reboot:

```powershell
# Shutdown
PS > wsl --terminate Ubuntu-22.04

# Check after 3 seconds
PS > wsl --list --all --verbose

# Boot up
PS > wsl --distribution Ubuntu-22.04

# Check after logout(exit command)
PS > wsl --list --all --verbose
```

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

### [Visual Studio Code](https://code.visualstudio.com/):

- [Download installer](https://code.visualstudio.com/)

- [Diable GitHub Copilot Extentions](https://stackoverflow.com/a/75377469)

- [Enable DevContainer for VS Code](https://docs.rancherdesktop.io/how-to-guides/vs-code-remote-containers/)
  (a.k.a [Remote Container](https://code.visualstudio.com/docs/devcontainers/containers))

### [Jetbrain Toolbox](https://www.jetbrains.com/lp/toolbox/) (option)

- [Download installer](https://www.jetbrains.com/toolbox-app/)

- Install the IntelliJ IDEA

- Setup [the CLI `idea`](https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#toolbox)

- [Enable DevContainer for IntelliJ IDEA](https://www.jetbrains.com/help/idea/start-dev-container-for-a-remote-project.html)

---

## Setup Ubuntu LTS on WSL2

### Latest upgrade `apt`(advanced package toolkit)

```bash
sudo apt update
sudo apt upgrade
```

> [What is diffrent between `apt` and `apt-get`](https://aws.amazon.com/ko/compare/the-difference-between-apt-and-apt-get/)

### Set default locale

```bash
sudo apt install locales
sudo locale-gen en_US.UTF-8
```

### ZSH

Install via apt:

```bash
sudo apt install zsh
```

Switch to ZSH:

```bash
chsh -s $(which zsh)
```

Refresh:

```bash
exec $(which zsh)
# Insert 2 for default setting
```

### Homebrew for Linux

[Required packages](https://docs.brew.sh/Homebrew-on-Linux#requirements):

```bash
apt install build-essential procps file
```

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)" && brew --version
```

Add below snippet for `brew` command to `PATH` variable:

```bash
echo '# ---'                                                  >> "${HOME}/.zprofile"
echo '# Homebrew set to PATH variable'                        >> "${HOME}/.zprofile"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
echo >> "${HOME}/.zprofile"

cat "${HOME}/.zprofile" | grep -B1 -A2 '# Homebrew'
```

Linux on-boarding with [`.mac-setup`](https://github.com/SPONGE-JL/.mac-setup#readme) guide
(maybe some packages would be not requiqred)
