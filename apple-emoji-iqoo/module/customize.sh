#!/system/bin/sh
SKIPUNZIP=0
URL="https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf"
FONT="$MODPATH/AppleColorEmoji.ttf"

ui_print "- Telechargement des emojis Apple..."
BB=/data/adb/magisk/busybox
[ -x "$BB" ] || BB=/data/adb/ksu/bin/busybox
[ -x "$BB" ] || BB=/data/adb/ap/bin/busybox
if command -v curl >/dev/null 2>&1; then
  curl -fsSL -o "$FONT" "$URL"
else
  "$BB" wget -q -O "$FONT" "$URL"
fi
# Si le telechargement echoue, on accepte une police deposee manuellement
[ -s "$FONT" ] || cp /sdcard/Download/AppleColorEmoji.ttf "$FONT" 2>/dev/null
[ -s "$FONT" ] || abort "! Echec : connectez-vous a Internet ou placez AppleColorEmoji.ttf dans Telechargements"

ui_print "- Remplacement des polices emoji systeme..."
COUNT=0
for DIR in /system/fonts /product/fonts /system_ext/fonts; do
  [ -d "$DIR" ] || continue
  for F in "$DIR"/*[Ee]moji*.ttf "$DIR"/*[Ee]moji*.ttc; do
    [ -f "$F" ] || continue
    case "$DIR" in
      /system/*) T="$MODPATH$F" ;;
      *) T="$MODPATH/system$F" ;;
    esac
    mkdir -p "$(dirname "$T")"
    cp -f "$FONT" "$T"
    ui_print "  * $F"
    COUNT=$((COUNT+1))
  done
done
# Valeur de secours si aucun fichier trouve
if [ "$COUNT" -eq 0 ]; then
  mkdir -p "$MODPATH/system/fonts"
  cp -f "$FONT" "$MODPATH/system/fonts/NotoColorEmoji.ttf"
fi
rm -f "$FONT"
set_perm_recursive "$MODPATH/system" 0 0 0755 0644
ui_print "- Termine ! Redemarrez le telephone."
