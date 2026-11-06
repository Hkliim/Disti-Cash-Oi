#!/system/bin/sh
# Apps Meta (Messenger/Facebook) et Gboard gardent leurs propres emojis en cache :
# on les supprime au demarrage pour forcer les emojis systeme.
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
rm -rf /data/data/com.facebook.orca/app_ras_blobs/FacebookEmoji.ttf \
       /data/data/com.facebook.katana/app_ras_blobs/FacebookEmoji.ttf 2>/dev/null
