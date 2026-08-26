#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 DEVELOPER AUTO PUSH UPDATE ENGINE (MAS ARIF)
# ==============================================================================

C_BORDER="\033[38;5;39m"
C_TITLE="\033[38;5;220m"
C_AUTHOR="\033[38;5;82m"
C_TEXT="\033[38;5;255m"
C_MUTED="\033[38;5;245m"
C_GREEN="\033[38;5;82m"
C_RED="\033[38;5;196m"
NC="\033[0m"
BOLD="\033[1m"

clear
echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}       🚀 DEVELOPER AUTO-PUSH UPDATE (MAS ARIF)       ${NC} ${C_BORDER}│${NC}"
echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"

DIR_SEKARANG="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="$DIR_SEKARANG/VERSION"
MAIN_SCRIPT="$DIR_SEKARANG/PROJEK_ASMR_HUJAN.sh"

CURRENT_VER="v1.1.0"
if [ -f "$VERSION_FILE" ]; then
    CURRENT_VER=$(cat "$VERSION_FILE" | tr -d '\r\n ')
fi

echo -e " ${C_MUTED}• Versi Saat Ini:${NC} ${C_GREEN}$CURRENT_VER${NC}"
read -p " ➔ Masukkan Versi Baru (Contoh: v1.2.0, Tekan Enter untuk tetap $CURRENT_VER): " NEW_VER
NEW_VER="${NEW_VER//[$'\t\r ']/}"
NEW_VER="${NEW_VER:-$CURRENT_VER}"

read -p " ➔ Masukkan Catatan Pembaruan (Commit Note): " COMMIT_MSG
COMMIT_MSG="${COMMIT_MSG:-Pembaruan otomatis skrip ASMR oleh Mas Arif}"

# Perbarui file VERSION
echo "$NEW_VER" > "$VERSION_FILE"

# Perbarui variabel CURRENT_VERSION di PROJEK_ASMR_HUJAN.sh
sed -i "s/CURRENT_VERSION=\".*\"/CURRENT_VERSION=\"$NEW_VER\"/" "$MAIN_SCRIPT"

echo -e "\n ${C_TITLE}[*] Mengunggah pembaruan $NEW_VER ke GitHub...${NC}"

cd "$DIR_SEKARANG"
git add .
git commit -m "[$NEW_VER] $COMMIT_MSG"
git push origin master:main

if [ $? -eq 0 ]; then
    echo -e "\n${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_GREEN}  🎉 SUKSES TOTAL! PEMBARUAN $NEW_VER TELAH DIPUBLIKASI!${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Seluruh pengguna akan melihat notifikasi update     ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}    ${C_MUTED}secara otomatis saat membuka aplikasi Termux!      ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"
else
    echo -e "\n ${C_RED}[!] Gagal mengunggah ke GitHub. Cek koneksi internet!${NC}\n"
fi
