# device/xiaomi/zorn/vendorsetup.sh

echo "检测到 Redmi K80 编译环境，正在自动注入 AIDL 与 KSU 补丁..."
PATCH_PATH="device/xiaomi/zorn/patches"

# 检查是否已经打过补丁，避免重复操作报错
if [ ! -f "bootable/recovery/patched_by_zorn" ]; then
    patch -p1 < $PATCH_PATH/fix_k80_fbe_decryption.patch
    patch -p1 < $PATCH_PATH/add_kernelsu_support.patch
    touch bootable/recovery/patched_by_zorn
    echo "补丁注入成功。"
else
    echo "补丁已存在，跳过注入。"
fi
