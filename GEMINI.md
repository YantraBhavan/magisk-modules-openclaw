# Gemini Development Mandates - Yantra Development Suite

This file provides foundational context and architectural rules for AI agents working on this repository.

## 🏗️ Core Architecture: "Safe-Linker"
To ensure compatibility with Android 15+ and prevent bootloops, the following structure MUST be strictly maintained:

1. **Data Isolation:** All heavy binaries and shared libraries must reside in `/data/local/yantra/`.
   - **NEVER** put heavy libraries directly into `/system/lib64/` (this causes fatal bootloops).
   - **NEVER** use `/system/usr/lib/` (it is blocked by Android Linker Namespaces).

2. **User Data Isolation:** All user data (NPM cache, Python modules, Home) must reside in `/data/openclaw/`.

3. **Direct Linker Invocation:** Wrapper scripts in `/system/bin/` must invoke the system linker directly:
   ```bash
   exec /system/bin/linker64 /data/local/yantra/bin/binary_real "$@"
   ```
   This bypasses security namespace restrictions.

4. **Permissions:** All folders in `/data/local/yantra` and `/data/openclaw` must have `777` (permissive) permissions to allow the `shell` user to install global packages.

## 🛠️ Tool-Specific Rules
- **Node.js:** Always export `HOME=/data/openclaw/home`.
- **NPM/NPX:** Always hardcode `--prefix=/data/openclaw/npm-global --cache=/data/openclaw/home/.npm` in the execution line.
- **Python:** Always export `PYTHONHOME=/data/local/yantra` and `PYTHONPATH=/data/local/yantra/lib/python3.13`. 
