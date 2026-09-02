# 🔐 Cracker CLI

A lightweight Bash-based security testing toolkit that provides a simple CLI interface for working with network scanning, authentication-testing tools, and password generation.

> ⚠️ **IMPORTANT — TESTING ONLY**
>
> This project was created for **authorized security testing, educational purposes, CTFs, and private lab environments**.
>
> **Do NOT test this tool against your own primary/production system, public networks, or systems you do not have explicit permission to test.**
>
> Although this project is designed as a testing tool, it uses real security tools and performs real network and authentication-testing operations. **It is not a simulation or fake/demo tool.**
>
> Always use isolated virtual machines or dedicated lab environments when experimenting with this project.


---

## ✨ Features

* 🖥️ **RDP / Windows testing**

  * Network discovery with Nmap
  * Extract discovered IP addresses
  * Authentication testing through Hydra
  * Save results to local files

* 🐧 **SSH / Linux testing**

  * Network discovery with Nmap
  * Extract discovered IP addresses
  * Authentication testing through Hydra
  * Save results to local files

* 🔑 **Password Generator**

  * Generate random passwords
  * Custom password length
  * Store generated passwords in the toolkit's password files

* ⚡ Simple interactive Bash interface

* 📁 Organized output directories

* 🪶 Lightweight — no large framework required

---

## 🛠️ Requirements

The following tools need to be installed on your system:

* Bash
* Nmap
* Hydra
* grep
* `/dev/urandom`

Check your installations:

```bash
bash --version
nmap --version
hydra -h
grep --version
```

---

## 📥 Installation

Clone the repository:

```bash
git clone <YOUR-REPOSITORY-URL>
cd <PROJECT-DIRECTORY>
```

Make the script executable:

```bash
chmod +x cracker-cli.sh
```

Run it:

```bash
./cracker-cli.sh
```

---

## 🚀 Usage

After starting the program, the main menu is displayed:

```text
====================
    My Toolkit
====================
1) rdp(windows) cracker
2) ssh(linux) cracker
4) Password Generator
0) Exit
====================
```

### 1. RDP / Windows

Select:

```text
1
```

The toolkit asks for the required scanning and testing parameters, then processes the workflow through its configured tools.

Output files are stored under:

```text
rdp/
```

---

### 2. SSH / Linux

Select:

```text
2
```

The SSH workflow uses the corresponding scanning and authentication-testing configuration.

Output files are stored under:

```text
ssh/
```

---

### 4. Password Generator

Select:

```text
4
```

Enter the desired password length:

```text
Password length:
```

The generated password is stored in:

```text
ssh/pass.txt
rdp/pass.txt
```

The generated password is also displayed in the terminal.

---

## 📂 Project Structure

```text
.
├── cracker-cli.sh
├── userlist.txt
│
├── rdp/
│   ├── iplist.txt
│   ├── iplog.txt
│   ├── pass.txt
│   └── finish.txt
│
└── ssh/
    ├── iplist.txt
    ├── iplog.txt
    ├── pass.txt
    └── finish.txt
```

### File descriptions

| File           | Purpose                                    |
| -------------- | ------------------------------------------ |
| `userlist.txt` | Username list used by the testing workflow |
| `iplist.txt`   | Raw network-scanning output                |
| `iplog.txt`    | Extracted IP information                   |
| `pass.txt`     | Password list                              |
| `finish.txt`   | Saved testing output                       |

---

## 🧩 Architecture

The project is intentionally built as a single Bash script.

```text
                ┌──────────────┐
                │  Cracker CLI │
                └──────┬───────┘
                       │
          ┌────────────┼────────────┐
          │            │            │
          ▼            ▼            ▼
       RDP Test     SSH Test    Password
          │            │         Generator
          ▼            ▼
        Nmap         Nmap
          │            │
          ▼            ▼
         grep         grep
          │            │
          ▼            ▼
       Hydra         Hydra
```

The goal is to provide a simple interface around existing command-line security tools rather than reimplementing those tools.

---

## 🎯 Project Goals

* Learn Bash scripting
* Practice CLI application design
* Automate repetitive security-testing workflows
* Work with existing command-line security tools
* Learn file handling and command pipelines
* Build a lightweight security toolkit

---

## 🛣️ Roadmap

Possible future improvements:

* [ ] Better input validation
* [ ] Dependency checking
* [ ] Automatic directory creation
* [ ] Improved error handling
* [ ] Colored terminal interface
* [ ] Configuration file
* [ ] Better result management
* [ ] More security-testing modules
* [ ] Cleaner menu system

---

## ⚠️ Legal & Ethical Use

This software can interact with network services and authentication systems.

Only use it against:

* Your own machines
* Your own virtual machines
* Authorized penetration-testing environments
* CTF/laboratory targets
* Systems where you have explicit permission

The author is not responsible for misuse of this software.

---

## 📜 License

Choose a license for the project before publishing the repository.

For example:

```text
MIT License
```

---

## 👨‍💻 Author

Created as a Bash security-toolkit project for learning, experimentation, and authorized security testing.
