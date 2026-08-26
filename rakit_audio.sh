#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 ASMR AUDIO MAKER - SEAMLESS AUDIO RAKITAN
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
NC="\033[0m"
BOLD="\033[1m"

clear
echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}           🎵 ASMR AUDIO MAKER - SEAMLESS           ${NC} ${C_BORDER}│${NC}"
echo -e "${C_BORDER}│${NC} ${BOLD}${C_AUTHOR}              👑 Dibuat Oleh: Mas Arif 👑              ${NC} ${C_BORDER}│${NC}"
echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"

# Folder default baru: /sdcard/PROJECT ASMR/AUDIO
FOLDER_AUDIO="/sdcard/PROJECT ASMR/AUDIO"
mkdir -p "$FOLDER_AUDIO"

# Fallback ke folder lama jika ada file di folder lama
DEFAULT_BAHAN="$FOLDER_AUDIO/audio_bandlab.m4a"
if [ ! -f "$DEFAULT_BAHAN" ] && [ -f "/sdcard/PROJECT ASMR HUJAN/audio_bandlab.m4a" ]; then
    DEFAULT_BAHAN="/sdcard/PROJECT ASMR HUJAN/audio_bandlab.m4a"
fi

# Tanya lokasi bahan audio
echo -e " ${BOLD}${C_TEXT}📁 Informasi Bahan Audio:${NC}"
echo -e "    Folder Default: ${C_BLUE}$FOLDER_AUDIO${NC}"
read -p " ➔ Masukkan lokasi file audio (Default: $DEFAULT_BAHAN): " INPUT_BAHAN
INPUT_BAHAN="${INPUT_BAHAN//$'\r'/}"
BAHAN="${INPUT_BAHAN:-$DEFAULT_BAHAN}"

if [ ! -f "$BAHAN" ]; then
    FOUND_AUDIOS=( $(find "$FOLDER_AUDIO" -maxdepth 1 \( -name "*.m4a" -o -name "*.mp3" -o -name "*.wav" \) 2>/dev/null) )
    if [ ${#FOUND_AUDIOS[@]} -gt 0 ]; then
        BAHAN="${FOUND_AUDIOS[0]}"
        echo -e " ${C_GREEN}[✓] Menggunakan audio otomatis: $(basename "$BAHAN")${NC}"
    else
        echo -e " ${C_RED}[!] ERROR: File audio '$BAHAN' tidak ditemukan!${NC}"
        echo -e "     Silakan taruh file audio di: ${C_BLUE}$FOLDER_AUDIO${NC}"
        exit 1
    fi
fi

# Tanya Durasi
echo -e "\n ${BOLD}${C_TEXT}⏱️  Pilih Durasi Output Audio:${NC}"
echo -e "  ${C_PURPLE}[1]${NC} 1 Jam (Seamless, Loop)"
echo -e "  ${C_PURPLE}[2]${NC} 2 Jam (Seamless, Loop)"
echo -e "  ${C_PURPLE}[3]${NC} 4 Jam (Seamless, Loop)"
echo -e "  ${C_PURPLE}[4]${NC} 8 Jam (Seamless, Loop)"
echo -e "  ${C_PURPLE}[5]${NC} 10 Jam (Seamless, Loop) ${C_GREEN}[Rekomendasi]${NC}"
echo -e "  ${C_PURPLE}[6]${NC} Custom Jam (Ketik Manual)"
echo -e "  ${C_RED}[0] Kembali ke Menu Utama${NC}"
read -p " ➔ Masukkan pilihan [0-6] (Default: 5): " DURASI_CHOICE
DURASI_CHOICE="${DURASI_CHOICE//[$'\t\r ']/}"

if [ "$DURASI_CHOICE" = "0" ]; then
    echo -e " ${C_TITLE}[*] Membatalkan dan kembali ke menu utama...${NC}"
    exit 0
fi

HOURS=10
case "$DURASI_CHOICE" in
    1) HOURS=1 ;;
    2) HOURS=2 ;;
    3) HOURS=4 ;;
    4) HOURS=8 ;;
    5) HOURS=10 ;;
    6)
        read -p " ➔ Masukkan durasi dalam Jam (contoh: 3 atau 1.5): " CUSTOM_HOURS
        CUSTOM_HOURS="${CUSTOM_HOURS//[$'\t\r ']/}"
        if [[ "$CUSTOM_HOURS" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
            HOURS="$CUSTOM_HOURS"
        else
            echo -e " ${C_RED}[!] Input tidak valid. Menggunakan default 10 Jam.${NC}"
            HOURS=10
        fi
        ;;
    *) HOURS=10 ;;
esac

# Opsi Audio Fade-In (Masuk Perlahan)
echo -e "\n ${BOLD}${C_TEXT}🔊 Pengaturan Audio Fade-In (Masuk Perlahan):${NC}"
read -p " ➔ Masukkan durasi Fade-In dalam detik (0 = Tanpa Fade-In, Default: 5): " IN_FADE_INPUT
IN_FADE_INPUT="${IN_FADE_INPUT//[$'\t\r ']/}"
if [[ "$IN_FADE_INPUT" =~ ^[0-9]+$ ]]; then
    AUDIO_FADE_IN="$IN_FADE_INPUT"
else
    AUDIO_FADE_IN=5
fi

# Opsi Audio Fade-Out (Keluar Perlahan)
echo -e "\n ${BOLD}${C_TEXT}🔉 Pengaturan Audio Fade-Out (Keluar Perlahan):${NC}"
read -p " ➔ Masukkan durasi Fade-Out dalam detik (0 = Tanpa Fade-Out, Default: 5): " OUT_FADE_INPUT
OUT_FADE_INPUT="${OUT_FADE_INPUT//[$'\t\r ']/}"
if [[ "$OUT_FADE_INPUT" =~ ^[0-9]+$ ]]; then
    AUDIO_FADE_OUT="$OUT_FADE_INPUT"
else
    AUDIO_FADE_OUT=5
fi

TARGET_DURATION=$(awk "BEGIN {print $HOURS * 3600}")
OUTPUT="$FOLDER_AUDIO/audio_${HOURS}jam_mulus.m4a"

BAHAN_DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BAHAN")
if [ -z "$BAHAN_DURATION" ]; then
    BAHAN_DURATION=900
fi

BAHAN_DURATION_INT=${BAHAN_DURATION%.*}
CROSSFADE_DUR=3
if [ "$BAHAN_DURATION_INT" -le 10 ]; then
    CROSSFADE_DUR=1
fi

PART2_END=$(awk "BEGIN {print $BAHAN_DURATION - $CROSSFADE_DUR}")
PART3_START=$(awk "BEGIN {print $BAHAN_DURATION - $CROSSFADE_DUR}")

SAMPLE_RATE=$(ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of default=noprint_wrappers=1:nokey=1 "$BAHAN" | head -n 1)
if [ -z "$SAMPLE_RATE" ]; then
    SAMPLE_RATE=48000
fi

TOTAL_SAMPLES=$(ffprobe -v error -select_streams a:0 -show_entries stream=duration_ts -of default=noprint_wrappers=1:nokey=1 "$BAHAN" | head -n 1)
if [[ ! "$TOTAL_SAMPLES" =~ ^[0-9]+$ ]]; then
    TOTAL_SAMPLES=$(awk "BEGIN {print int($BAHAN_DURATION * $SAMPLE_RATE)}")
fi

CROSSFADE_SAMPLES=$((CROSSFADE_DUR * SAMPLE_RATE))
LOOPABLE_SAMPLES=$((TOTAL_SAMPLES - CROSSFADE_SAMPLES))
LOOPABLE_DURATION=$(awk "BEGIN {print $LOOPABLE_SAMPLES / $SAMPLE_RATE}")

LOOPS=$(awk "BEGIN {
    val = $TARGET_DURATION / $LOOPABLE_DURATION;
    ival = int(val);
    loops = (val > ival) ? ival + 1 : ival;
    print (loops < 1) ? 1 : loops;
}")

FADE_OUT_START=$(awk "BEGIN {print $TARGET_DURATION - $AUDIO_FADE_OUT}")

echo -e "\n ${C_TITLE}⏳ Memproses audio seamless (${HOURS} Jam | Fade-In: ${AUDIO_FADE_IN}s | Fade-Out: ${AUDIO_FADE_OUT}s)...${NC}"
termux-wake-lock 2>/dev/null

FILTER_COMPLEX="[0:a]atrim=start=0:end=$CROSSFADE_DUR,asetpts=PTS-STARTPTS[part1]; \
 [0:a]atrim=start=$CROSSFADE_DUR:end=$PART2_END,asetpts=PTS-STARTPTS[part2]; \
 [0:a]atrim=start=$PART3_START:end=$BAHAN_DURATION,asetpts=PTS-STARTPTS[part3]; \
 [part3][part1]acrossfade=d=$CROSSFADE_DUR:c1=tri:c2=tri[t]; \
 [t][part2]concat=n=2:v=0:a=1[loopable]"

if [ "$LOOPS" -gt 1 ]; then
    LOOPS_PARAM=$((LOOPS - 1))
    FILTER_COMPLEX="${FILTER_COMPLEX}; [loopable]aloop=loop=${LOOPS_PARAM}:size=${LOOPABLE_SAMPLES}:start=0[looped]"
    LAST_STREAM="[looped]"
else
    LAST_STREAM="[loopable]"
fi

FADE_FILTERS=""
if [ "$AUDIO_FADE_IN" -gt 0 ] && [ "$AUDIO_FADE_OUT" -gt 0 ]; then
    FADE_FILTERS="afade=t=in:d=${AUDIO_FADE_IN},afade=t=out:d=${AUDIO_FADE_OUT}:st=${FADE_OUT_START}"
elif [ "$AUDIO_FADE_IN" -gt 0 ]; then
    FADE_FILTERS="afade=t=in:d=${AUDIO_FADE_IN}"
elif [ "$AUDIO_FADE_OUT" -gt 0 ]; then
    FADE_FILTERS="afade=t=out:d=${AUDIO_FADE_OUT}:st=${FADE_OUT_START}"
fi

if [ -n "$FADE_FILTERS" ]; then
    FILTER_COMPLEX="${FILTER_COMPLEX}; ${LAST_STREAM}atrim=end=${TARGET_DURATION},asetpts=PTS-STARTPTS[trimmed]; [trimmed]${FADE_FILTERS}[out]"
else
    FILTER_COMPLEX="${FILTER_COMPLEX}; ${LAST_STREAM}atrim=end=${TARGET_DURATION},asetpts=PTS-STARTPTS[out]"
fi

ffmpeg -y -i "$BAHAN" -filter_complex "$FILTER_COMPLEX" -map "[out]" -c:a aac -b:a 256k -threads 2 "$OUTPUT"

termux-wake-unlock 2>/dev/null

if [ $? -eq 0 ] && [ -f "$OUTPUT" ]; then
    echo -e "\n${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_GREEN}  🎉 PROSES SELESAI! AUDIO ${HOURS} JAM SEAMLESS BERHASIL! ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Nama File :${NC} ${C_TITLE}$(basename "$OUTPUT")${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Lokasi    :${NC} ${C_BLUE}$FOLDER_AUDIO${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"
else
    echo -e "\n ${C_RED}[!] ERROR: Proses pembuatan audio gagal.${NC}\n"
fi
