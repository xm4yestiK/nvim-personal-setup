## Requirements

| Tool                         | Description                                    | Download                                                                                                                                                                                                                      |
| ---------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **JDK 25**                   | Java Development Kit (required for Groovy LSP) | [Adoptium JDK 25 MSI](https://adoptium.net/download?link=https%3A%2F%2Fgithub.com%2Fadoptium%2Ftemurin25-binaries%2Freleases%2Fdownload%2Fjdk-25.0.1%252B8%2FOpenJDK25U-jdk_x64_windows_hotspot_25.0.1_8.msi&vendor=Adoptium) |
| **Go**                       | Go compiler and runtime (required for `gopls`) | [https://go.dev/dl/](https://go.dev/dl/)                                                                                                                                                                                      |
| **GCC (via MSYS2)**          | C compiler required by some Neovim plugins     | [MSYS2 Installer (x86_64)](https://github.com/msys2/msys2-installer/releases/download/2025-08-30/msys2-x86_64-20250830.exe)                                                                                                   |
| **JetBrains Mono Nerd Font** | Developer font with NerdFont icons             | [JetBrainsMono Nerd Font v3.4.0](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)                                                                                                          |

---

## How to Use

1. Clone the repository to your Neovim configuration directory:

   **Windows**

   ```powershell
   git clone https://github.com/<username>/<repo-name>.git "C:\Users\ramvi\AppData\Local\nvim"
   ```

   **Linux/macOS**

   ```bash
   git clone https://github.com/<username>/<repo-name>.git ~/.config/nvim/
   ```

2. Open Neovim:

   ```bash
   nvim
   ```

3. Plugins and LSP servers will be installed automatically via `lazy.nvim` or `mason.nvim`.

---

Would you like me to make this version Markdown-styled with icons and better spacing (like a professional GitHub README)?
