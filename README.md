# 🚀 code-server + PlatformIO 🛠️ in a Self-Contained Virtual Env 🌈

Welcome to your supercharged ⚡ development environment! This Dockerfile creates a [code-server](https://github.com/coder/code-server) container with [PlatformIO](https://platformio.org/) pre-installed inside a **Python virtual environment**, ready to roll from the terminal! 🐍💻

---

## ✨ Features

🔧 **PlatformIO Pre-installed**  
✅ Self-contained in `/opt/pio` virtual environment — no system-wide pollution!  

🌐 **code-server**  
🖥️ VS Code in the browser, powered by [codercom/code-server](https://hub.docker.com/r/codercom/code-server)  

🐧 **Linux-based Setup**  
📦 Installs Python 3, pip, venv, and Git  

👤 **Runs as `coder` user**  
🔒 Safer and ready to use without root access  

---

## 🧪 What's Inside?

| Component      | Version        |
|----------------|----------------|
| code-server    | `latest`       |
| Python         | `3.x`          |
| PlatformIO     | `latest` via pip |
| Virtual Env    | `/opt/pio`     |

PlatformIO is activated automatically for every terminal session 🎉

---

## 🚀 Getting Started

### 1. 🛠️ Build the image

```bash
docker build -t code-pio .
```

### 2. 🧱 Run the container

```bash
docker run -it -p 8080:8080 -v $(pwd):/workspace code-pio
```

Then, open your browser and navigate to:

```
http://localhost:8080
```

No authentication — just dive right in! 🏊‍♂️

---

## 📦 Terminal Access to PIO

Open the terminal inside `code-server` and start using `platformio` right away!

```bash
pio --version
```

Since it's all inside a virtual environment, you're safe from global package chaos 🌀

---

## 📁 Workspace Directory

The default working directory is:

```
/workspace
```

Mount your local project folder there using Docker's `-v` flag!

