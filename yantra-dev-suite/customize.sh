ui_print "- Creating Yantra data directories..."
mkdir -p /data/local/yantra
ui_print "- Extracting files to data partition..."
cp -af $MODPATH/files/* /data/local/yantra/
rm -rf $MODPATH/files
ui_print "- Setting permissions..."
set_perm_recursive /data/local/yantra 0 0 0755 0755
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755
