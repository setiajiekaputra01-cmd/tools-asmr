#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 KOMPRES VIDEO MASSAL - AUTOMATION ENGINE
#                      Tools Dibuat Oleh: Mas Arif
# ==============================================================================

C_BORDER="\033[38;5;39m"
C_TITLE="\033[38;5;220m"
C_AUTHOR="\033[38;5;82m"
C_TEXT="\033[38;5;255m"
C_MUTED="\033[38;5;245m"
C_GREEN="\033[38;5;82m"
C_RED="\033[38;5;196m"
C_BLUE="\033[38;5;75m"
C_PURPLE="\033[38;5;141m"
C_CYAN="\033[38;5;51m"
NC="\033[0m"
BOLD="\033[1m"

FOLDER_INPUT="${FOLDER_INPUT:-/sdcard/PROJECT ASMR/SEBELUM LOOP}"
FOLDER_HASIL="${FOLDER_HASIL:-/sdcard/PROJECT ASMR/HASIL KOMPRES}"

mkdir -p "$FOLDER_INPUT" "$FOLDER_HASIL"

show_header() {
    clear
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_BLUE}            🎬 MENGOMPRES VIDEO MASSAL                ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_AUTHOR}              👑 Dibuat Oleh: Mas Arif 👑              ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"
}

show_header

if ! command -v ffmpeg &>/dev/null; then
    echo -e " ${C_RED}[!] ERROR: FFMPEG belum terinstall di Termux!${NC}\n"
    read -p " Tekan [Enter] untuk kembali..."
    exit 1
fi

# 1. Pilih Resolusi Target
echo -e " ${BOLD}${C_TEXT}📺 Pilih Resolusi Output Video Target:${NC}"
echo -e "  ${C_PURPLE}[1]${NC} 1080p (Full HD - Tajam)"
echo -e "  ${C_PURPLE}[2]${NC} 720p  (HD - Rekomendasi Hemat Memori)"
echo -e "  ${C_PURPLE}[3]${NC} 480p  (SD - Super Hemat Memori)"
echo -e "  ${C_PURPLE}[4]${NC} Resolusi Asli Video Input"
echo -e "  ${C_RED}[0] Kembali ke Menu Utama${NC}"
read -p " ➔ Masukkan pilihan [0-4] (Default: 2): " RES_CHOICE
RES_CHOICE="${RES_CHOICE//[$'\t\r ']/}"

if [ "$RES_CHOICE" = "0" ]; then
    echo -e "\n ${C_TITLE}[*] Membatalkan dan kembali ke menu utama...${NC}"
    exit 0
fi

TARGET_HEIGHT=720
case "$RES_CHOICE" in
    1) TARGET_HEIGHT=1080 ;;
    2) TARGET_HEIGHT=720 ;;
    3) TARGET_HEIGHT=480 ;;
    4) TARGET_HEIGHT="input" ;;
    *) TARGET_HEIGHT=720 ;;
esac

# 2. Pilih Tingkat Kompresi (CRF)
echo -e "\n ${BOLD}${C_TEXT}🎛️  Pilih Tingkat Kompresi (CRF):${NC}"
echo -e "  ${C_PURPLE}[1]${NC} Seimbang (CRF 23 - Kualitas Bagus)"
echo -e "  ${C_PURPLE}[2]${NC} Kompresi Tinggi (CRF 26 - Rekomendasi Hemat Storage)"
echo -e "  ${C_PURPLE}[3]${NC} Super Hemat (CRF 28 - Ukuran Sangat Kecil)"
echo -e "  ${C_RED}[0] Kembali ke Menu Utama${NC}"
read -p " ➔ Masukkan pilihan [0-3] (Default: 2): " CRF_CHOICE
CRF_CHOICE="${CRF_CHOICE//[$'\t\r ']/}"

if [ "$CRF_CHOICE" = "0" ]; then
    echo -e "\n ${C_TITLE}[*] Membatalkan dan kembali ke menu utama...${NC}"
    exit 0
fi

TARGET_CRF=26
case "$CRF_CHOICE" in
    1) TARGET_CRF=23 ;;
    2) TARGET_CRF=26 ;;
    3) TARGET_CRF=28 ;;
    *) TARGET_CRF=26 ;;
esac

# Scan File Video
echo -e "\n ${C_TITLE}[*] Men-scan file video di: $FOLDER_INPUT...${NC}"
VIDEO_FILES=()
while IFS= read -r -d '' file; do
    VIDEO_FILES+=("$file")
done < <(find "$FOLDER_INPUT" -maxdepth 1 \( -name "*.mp4" -o -name "*.mkv" -o -name "*.mov" -o -name "*.avi" -o -name "*.3gp" \) -print0 2>/dev/null | sort -z -V)

TOTAL_VIDEOS=${#VIDEO_FILES[@]}
if [ "$TOTAL_VIDEOS" -lt 1 ]; then
    echo -e "\n ${C_RED}[!] Tidak ada file video di folder '$FOLDER_INPUT'!${NC}"
    echo -e "     Silakan letakkan video mentah di folder tersebut dahulu.\n"
    read -p " Tekan [Enter] untuk kembali..."
    exit 0
fi

echo -e " ${C_GREEN}[✓] Ditemukan $TOTAL_VIDEOS file video.${NC}\n"
termux-wake-lock 2>/dev/null

SUCCESS_COUNT=0
TOTAL_BEFORE_BYTES=0
TOTAL_AFTER_BYTES=0

for i in "${!VIDEO_FILES[@]}"; do
    FILE_INPUT="${VIDEO_FILES[$i]}"
    FILE_NAME=$(basename "$FILE_INPUT")
    BASE_NAME="${FILE_NAME%.*}"
    FILE_OUTPUT="$FOLDER_HASIL/COMPRESSED_${BASE_NAME}.mp4"

    SIZE_BEFORE=$(stat -c%s "$FILE_INPUT" 2>/dev/null || echo 0)
    TOTAL_BEFORE_BYTES=$((TOTAL_BEFORE_BYTES + SIZE_BEFORE))
    SIZE_BEFORE_MB=$(awk "BEGIN {print $SIZE_BEFORE / 1024 / 1024}")

    echo -e " 🎬 ${C_CYAN}[$((i+1))/$TOTAL_VIDEOS] Mengompres: $FILE_NAME ($(printf "%.1f" $SIZE_BEFORE_MB) MB)...${NC}"

    ORIG_HEIGHT=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=noprint_wrappers=1:nokey=1 "$FILE_INPUT" 2>/dev/null)
    if [ -z "$ORIG_HEIGHT" ] || ! [[ "$ORIG_HEIGHT" =~ ^[0-9]+$ ]]; then ORIG_HEIGHT=720; fi

    if [ "$TARGET_HEIGHT" = "input" ]; then
        SCALE_FILTER=""
    else
        SCALE_FILTER="scale=-2:$TARGET_HEIGHT:flags=bicubic,"
    fi

    ffmpeg -y -i "$FILE_INPUT" -vf "${SCALE_FILTER}format=yuv420p" -c:v libx264 -preset veryfast -crf $TARGET_CRF -c:a aac -b:a 128k -threads 2 "$FILE_OUTPUT" >/dev/null 2>&1

    if [ $? -eq 0 ] && [ -f "$FILE_OUTPUT" ]; then
        SIZE_AFTER=$(stat -c%s "$FILE_OUTPUT" 2>/dev/null || echo 0)
        TOTAL_AFTER_BYTES=$((TOTAL_AFTER_BYTES + SIZE_AFTER))
        SIZE_AFTER_MB=$(awk "BEGIN {print $SIZE_AFTER / 1024 / 1024}")
        HEMAT_PCT=$(awk "BEGIN {if ($SIZE_BEFORE > 0) print (1 - ($SIZE_AFTER / $SIZE_BEFORE)) * 100; else print 0}")

        echo -e "    ${C_GREEN}[✓] Berhasil! $(printf "%.1f" $SIZE_BEFORE_MB) MB ➔ $(printf "%.1f" $SIZE_AFTER_MB) MB (Hemat $(printf "%.0f" $HEMAT_PCT)%)${NC}\n"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo -e "    ${C_RED}[!] Gagal mengompres $FILE_NAME${NC}\n"
    fi
done

termux-wake-unlock 2>/dev/null

echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
echo -e "${C_BORDER}│${NC} ${BOLD}${C_GREEN}  🎉 KOMPRESI MASSAL SELESAI! ($SUCCESS_COUNT/$TOTAL_VIDEOS Berhasil)    ${NC} ${C_BORDER}│${NC}"
echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Folder Hasil :${NC} ${C_BLUE}$FOLDER_HASIL${NC}"
echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"

read -p " Tekan [Enter] untuk kembali ke menu..."
