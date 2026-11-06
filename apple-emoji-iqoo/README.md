# Emojis Apple sur iQOO Z9 Turbo

## Option A — avec root (Magisk / KernelSU / APatch)
1. Copier `AppleEmoji-iQOO-Z9Turbo.zip` sur le téléphone.
2. Magisk → Modules → *Installer depuis le stockage* → choisir le zip (Wi-Fi activé : la police est téléchargée pendant l'installation).
3. Redémarrer.

Si le téléchargement échoue : télécharger `AppleColorEmoji.ttf` depuis
https://github.com/samuelngs/apple-emoji-linux/releases, le mettre dans **Téléchargements**, puis réinstaller le zip.

Désinstaller : Magisk → Modules → supprimer « Apple Emoji » → redémarrer.

## Option B — sans root (recommandée si le bootloader est verrouillé)
Le bootloader des iQOO/vivo est très difficile à déverrouiller, donc la plupart des Z9 Turbo n'ont pas de root.
1. Installer **zFont 3** (Play Store).
2. Onglet Emoji → choisir *iOS* → Appliquer.
3. zFont ouvre l'app **Thèmes** de vivo/iQOO → appliquer la police → redémarrer.

## Reconstruire le zip
`./build.sh`
