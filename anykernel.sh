# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=HardcoreKernel for Aquaris X / X Pro by @scafroglia93
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=bardock
device.name2=bardock-pro
device.name3=
device.name4=
device.name5=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# Disable dm-verity on /system (due to changed modules)
patch_fstab fstab.qcom /system ext4 options ",errors=panic" ""
patch_fstab fstab.qcom /system ext4 flags ",verify" ""

# end ramdisk changes

write_boot;

## end install

