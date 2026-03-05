## OrangeFox Recovery Project for Redmi K80 (zorn)

### 项目说明

本项目是专为 Redmi K80 (代号: zorn) 适配的 OrangeFox Recovery 14.1 分支。其核心目标是解决小米新一代硬件架构在 Android 14/15 混合环境下的存储挂载难题。基于 Kyuofox 的 TWRP 设备树开发，并针对 HyperOS 的特定安全机制进行了内核级别的补丁处理。

### 技术实现要点

- **AIDL 解密支持：** 针对 K80 采用的 AIDL Weaver 接口规范，对 `Weaver.cpp` 与 `Decrypt.cpp` 进行了重构。该改动确保了 Recovery 能够正确调用 TEE 安全环境进行密钥交换，从而实现对 FBE (File-Based Encryption) 加密分区的完整读取。
  
- **KernelSU 桥接：** 集成了 `foxstart.sh` 引导脚本。该设计允许用户在 Recovery 环境下，通过 Magisk Manager 的逻辑层对 KernelSU 模块进行挂载与卸载管理，实现了两种 Root 方案的兼容性互补。
  
- **环境验证：** 目前已在 HyperOS 3.9.0 稳定版环境下通过功能性验证，包括分区备份、Data 挂载及脚本执行。
  

### 源码编译指引

在执行编译脚本之前，必须确保底层源码已同步并应用以下补丁。未应用补丁的编译版本将导致 Data 分区无法挂载。

Bash

```
# 执行路径：Android Source Root
patch -p1 < device/xiaomi/zorn/patches/fix_k80_fbe_decryption.patch
patch -p1 < device/xiaomi/zorn/patches/add_kernelsu_support.patch
```

### 部署指南

1. 将移动设备置于 Fastboot 模式。
  
2. 在宿主机终端执行以下指令： `fastboot flash recovery recovery.img`
  
3. 强制重启至 Recovery 分区以验证完整性。
  

### 免责声明

本软件按“原样”提供，不附带任何明示或暗示的保证。刷写第三方 Recovery 存在不可预知的风险，包括但不限于数据丢失及硬件损坏。用户需自行承担操作风险。由于底层架构复杂，建议在操作前进行全量数据备份。

---

# OrangeFox Recovery Project for Redmi K80 (zorn)

### Project Description

This repository provides the OrangeFox Recovery 14.1 adaptation for the Redmi K80 (codename: zorn). Based on the Kyuofox TWRP device tree, this build addresses the specific storage mounting challenges presented by Xiaomi's latest hardware and the HyperOS environment.

### Technical Implementation

- **AIDL Decryption Support:** To accommodate the AIDL Weaver interface on the K80, `Weaver.cpp` and `Decrypt.cpp` have been refactored. This ensures proper communication with the TEE (Trusted Execution Environment) for secure key exchange, enabling full access to FBE-encrypted Data partitions.
  
- **KernelSU Integration:** The inclusion of the `foxstart.sh` script facilitates the management of KernelSU modules via the Magisk Manager interface within the recovery environment, bridging the functional gap between disparate root solutions.
  
- **Verification:** This build has been successfully validated on HyperOS 3.9.0. Standard operations, including partition backup and data decryption, are functional under controlled testing conditions.
  

### Build Requirements

Before initiating the build process, the following patches must be applied to the source root. Failure to do so will result in an unfunctional build regarding storage decryption.

Bash

```
# Working Directory: Android Source Root
patch -p1 < device/xiaomi/zorn/patches/fix_k80_fbe_decryption.patch
patch -p1 < device/xiaomi/zorn/patches/add_kernelsu_support.patch
```

### Installation Procedures

1. Put the device into Fastboot mode.
  
2. Execute the following command from the host terminal: `fastboot flash recovery recovery.img`
  
3. Reboot to the recovery partition to verify the installation.
  

### Disclaimer

This software is provided "as is" without warranty of any kind. Modifying device firmware involves significant risk. The developer is not liable for data loss, hardware malfunctions, or any other damages resulting from the use of this recovery. Full data backup is strongly recommended before deployment.

### Credits

- Base Device Tree: [Kyuofox](https://www.google.com/search?q=https://github.com/Kyuofox/android_device_xiaomi_zorn_TWRP&authuser=1)
  
- OrangeFox Recovery Team
  
- Gemini 3 Pro
