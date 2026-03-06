# Node.js v24 (LTS) for Android (Magisk Module)

A natively compiled, systemless Node.js v24.13.0 (LTS) installation for Android `aarch64` devices, including `npm` and `npx`.

## Why this exists?
Standard Node.js binaries for Linux are compiled against `glibc`. Android uses `Bionic libc`, which makes official binaries incompatible. This module provides a **native Bionic build**, offering:
- **Higher Performance:** No translation layer or emulation.
- **Lean Footprint:** No need for full Linux environments like Termux or Proot.
- **Full Package Management:** Includes `npm` and `npx` out of the box.
- **Systemless:** Uses Magisk's Magic Mount to integrate into `/system/bin` without modifying the system partition.

## Features
- **Node.js:** v24.13.0 (LTS)
- **NPM:** v11.11.0
- **Architecture:** `aarch64` (ARM64)
- **Isolated Dependencies:** Includes all required shared libraries (`openssl`, `icu`, `sqlite`, etc.) in `/system/usr/lib/node` to prevent system conflicts.
- **Automatic Pathing:** Includes wrapper scripts that handle `LD_LIBRARY_PATH` automatically.

## Installation
1. Download the `nodejs-v24-yantrabhavan.zip`.
2. Transfer the zip to your Android device.
3. Open the **Magisk App**.
4. Go to the **Modules** tab.
5. Tap **Install from storage** and select the zip.
6. **Reboot your device.**

## Usage
After rebooting, you can run:
```bash
node -v
npm -v
npx -v
```

## Internal Structure
- `/system/bin/node`: Wrapper script for Node.js.
- `/system/bin/npm`: Wrapper script for NPM.
- `/system/bin/npx`: Wrapper script for NPX.
- `/system/bin/node_real`: The native binary.
- `/system/usr/lib/node/`: Shared library dependencies.
- `/system/usr/lib/node_modules/npm/`: NPM source logic.

---
**Created by Yantra Bhavan**
