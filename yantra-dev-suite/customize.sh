ui_print "- Creating Yantra data directories..."
mkdir -p /data/local/yantra
mkdir -p /data/openclaw/home
mkdir -p /data/openclaw/npm-global

ui_print "- Extracting files..."
cp -af $MODPATH/files/* /data/local/yantra/
rm -rf $MODPATH/files

ui_print "- Setting permissive permissions for global access..."
# 777 ensures the 'shell' user and apps can write to their home/npm folders
set_perm_recursive /data/local/yantra 0 0 0777 0777
set_perm_recursive /data/openclaw 0 0 0777 0777
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755
