
# ✨ Inception Project

> A fully containerized, modular infrastructure powered by Docker Compose.

![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker)
![License](https://img.shields.io/badge/License-Educational-informational)
![Made With](https://img.shields.io/badge/Made%20with-Linux%20%26%20Docker-success)

---

## 📖 Overview
**Inception** is a system administration project where you build a personal infrastructure composed of multiple services — each running in its own Docker container, securely configured and orchestrated via Docker Compose.

Everything is lightweight, persistent, and reproducible.

---

## 🛠️ Services Included
- **NGINX** — SSL-secured web server and reverse proxy
- **WordPress** — CMS application
- **MariaDB** — Relational database server
- **Redis** — Caching server
- **Adminer** — Database administration interface
- **FTP Server** — Secure file transfer service
- **Static Site** — Bonus service

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/inception.git
   cd inception
   ```

2. Configure environment variables and secrets.

3. Build and launch the containers:
   ```bash
   make up
   ```

---

## 🧩 Features
- 🔒 **SSL Encryption** with Docker secrets
- 📦 **Volume persistence** for database and WordPress data
- 🛡️ **Private Docker network** for secure communication
- 🛠️ **Environment-based configuration** with `.env` support
- ⚡ **Modular, rebuildable services**

---

## 🧰 Requirements
- 🐳 Docker
- 🐙 Docker Compose
- 🐧 Linux-based OS (recommended)

---

## 📜 License
This project is developed for educational purposes.
