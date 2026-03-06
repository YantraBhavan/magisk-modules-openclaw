# Yantra Development Suite - Magisk Module

A professional-grade, systemless development environment for Android `aarch64` (ARM64). 

## 🚀 The "Safe-Linker" Architecture
- **Isolated Storage:** All binaries live in `/data/local/yantra/`.
- **User Data:** Home and NPM cache live in `/sdcard/yantrabhavan/`.
- **Direct Linker:** Bypasses Android 15 security by calling `linker64` directly.

## 🛠️ Included Tools
- **Node.js:** v24.13.0 (LTS) with `npm`, `npx`, and `pnpm`.
- **Python:** v3.13.12 (LTS) with `pip`.
- **Compilers:** Clang, G++, GCC, CC (v21.1.8).
- **Build Tools:** Make, CMake, Binutils.

## 📦 Installation

### 1. Build the Full Module
```bash
./build_zip.sh
```

### 2. Flash and Reboot
Install the generated ZIP via Magisk App and reboot.

### 3. ⚠️ MANDATORY: Manual Permission Fix
Android 15 security often resets permissions on boot. After your first reboot, you **must** run these commands via `adb shell` to enable global NPM installs:

```bash
su -c "chmod -R 777 /data/local/yantra"
su -c "chmod -R 777 /sdcard/yantrabhavan"
su -c "chcon u:object_r:shell_data_file:s0 /data/local/yantra"
su -c "chcon u:object_r:shell_data_file:s0 /data/local/yantra/npm-global"
```

## 📋 Usage
Once permissions are set, all tools are available globally. To use globally installed NPM packages (like `cowsay`):
```bash
export PATH=/data/local/yantra/npm-global/bin:$PATH
```

## 🔗 Credits
Developed by **Yantra Bhavan**.
