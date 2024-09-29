# Macos-Multi-Tool


# MacOS Multi-Tool by Declanmidd

## Overview

The **MacOS Multi-Tool** is a versatile bash script designed for cybersecurity professionals and ethical hackers. It combines system maintenance capabilities with penetration testing options, offering an intuitive, menu-driven interface similar to the SEToolkit. 

This script is specifically tailored for macOS environments, utilizing popular open-source tools like **msfvenom**, **WhatWeb**, **Gobuster**, and **SQLMap** to facilitate payload generation, web application testing, and system updates.


## Features

### Metasploit Payloads:
- **Android Payload with Template APK**: Quickly generate an Android reverse TCP payload using a template APK.
- **Windows Payload**: Create Windows reverse TCP executables for penetration testing.
- **macOS Payload**: Generate reverse TCP payloads for macOS environments.
- **Linux Payload**: Create reverse TCP payloads for Linux systems.

### Website Attacks:
- **WhatWeb Web Fingerprinting**: Perform reconnaissance and fingerprint websites to discover vulnerabilities.
- **Gobuster Directory Scanning**: Brute-force directories using a customizable wordlist for content discovery.
- **SQL Injection Test**: Test websites for SQL injection vulnerabilities with SQLMap.

### System Maintenance:
- **Update macOS with Homebrew**: Update and upgrade all Homebrew packages on your macOS system.
- **Clear Homebrew Cache**: Clean up and reclaim disk space by removing outdated Homebrew packages.

---

## Requirements

- **Homebrew** (for package management): Install [here](https://brew.sh)
- **msfvenom** (for payload generation)
- **WhatWeb** (for web scanning)
- **Gobuster** (for directory brute-forcing)
- **SQLMap** (for SQL injection testing)

Install dependencies using Homebrew:

```bash
brew install whatweb gobuster sqlmap
```

---

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/declanmidd/Macos-Multi-Tool
   cd Macos-Multi-Tool
   ```

2. Run the script:
   ```bash
   bash multi.sh
   ```

3. Follow the interactive menu to select tasks:
   - Generate payloads for various platforms.
   - Run web application attacks.
   - Update your macOS system or clean Homebrew caches.

---

## Author

**Declanmidd**  
GitHub: [github.com/Declanmidd](https://github.com/declanmidd)

---

This tool is intended for educational and ethical hacking purposes only.
