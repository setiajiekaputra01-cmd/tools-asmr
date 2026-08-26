#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 ASMR VIDEO & AUDIO AUTOMATION ENGINE
#                      Tools Dibuat Oleh: Mas Arif
# ==============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'
BOLD='\033[1m'

ASMR_TYPE="${ASMR_TYPE:-hujan}"

BASE_PROJECT="/sdcard/PROJECT ASMR"
FOLDER_AUDIO_BASE="$BASE_PROJECT/AUDIO"
FOLDER_INPUT_BASE="$BASE_PROJECT/SEBELUM LOOP"

if [ ! -d "$FOLDER_INPUT_BASE" ] && [ -d "/sdcard/SEBELUM LOOP" ]; then
    FOLDER_INPUT_BASE="/sdcard/SEBELUM LOOP"
fi
if [ ! -d "$FOLDER_AUDIO_BASE" ] && [ -d "/sdcard/PROJECT ASMR HUJAN" ]; then
    FOLDER_AUDIO_BASE="/sdcard/PROJECT ASMR HUJAN"
fi

if [ "$ASMR_TYPE" = "api" ]; then
    FOLDER_HASIL="${FOLDER_HASIL:-$BASE_PROJECT/HASIL API}"
    DEFAULT_CRF=22
    DEFAULT_TUNE="film"
    DEFAULT_X264="aq-mode=2:aq-strength=1.3:psy-rd=1.1:0.15"
    TITLE_TYPE="🔥 PROJEK ASMR API (DEEP DARK FIRE & MEMORY GUARD) 🔥"
else
    FOLDER_HASIL="${FOLDER_HASIL:-$BASE_PROJECT/HASIL HUJAN}"
    DEFAULT_CRF=23
    DEFAULT_TUNE="grain"
    DEFAULT_X264="aq-mode=2:aq-strength=1.0"
    TITLE_TYPE="🌧️ PROJEK ASMR HUJAN (HIGH-FIDELITY RAIN & MEMORY GUARD) 🌧️"
fi

FOLDER_INPUT="${FOLDER_INPUT:-$FOLDER_INPUT_BASE}"
FOLDER_BAHAN="${FOLDER_BAHAN:-$FOLDER_AUDIO_BASE}"
TEMP_DIR="/data/data/com.termux/files/home/temp_asmr"
VIDEO_PREFIX="${VIDEO_PREFIX:-}"

mkdir -p "$BASE_PROJECT"
mkdir -p "$FOLDER_AUDIO_BASE"
mkdir -p "$FOLDER_INPUT_BASE"
mkdir -p "$FOLDER_HASIL"
mkdir -p "$TEMP_DIR"

show_header() {
    clear
    echo -e "${CYAN}======================================================================${NC}"
    echo -e "${BOLD}${YELLOW}   $TITLE_TYPE   ${NC}"
    echo -e "${CYAN}======================================================================${NC}"
    
    if command -v df &>/dev/null; then
        FREE_KB=$(df -k /sdcard 2>/dev/null | tail -n 1 | awk '{print $4}')
        if [ -n "$FREE_KB" ] && [[ "$FREE_KB" =~ ^[0-9]+$ ]]; then
            FREE_GB=$(awk "BEGIN {print $FREE_KB / 1024 / 1024}")
            echo -e "${CYAN}💾 Storage SDCard Tersedia: $(printf "%.2f" $FREE_GB) GB${NC}"
        fi
    fi
    echo -e "${CYAN}----------------------------------------------------------------------${NC}"
}

show_header

if ! command -v ffmpeg &>/dev/null || ! command -v ffprobe &>/dev/null; then
    echo -e "${RED}[!] ERROR: ffmpeg atau ffprobe belum terinstall!${NC}"
    exit 1
fi

# 1. Pilihan Mode Intro
if [ -z "$USE_INTRO_CONF" ]; then
    echo -e "\n${BOLD}${YELLOW}❓ Apakah video Anda menggunakan Intro khusus?${NC}"
    echo -e "  [1] Ya, Gunakan Video Intro (Video 1 = Intro, Video 2 = Loop Body)"
    echo -e "  [2] Tidak, Tanpa Intro (Langsung Loop dari File Mana Saja) [Rekomendasi]"
    echo -e "  [0] ${RED}Kembali ke Menu Utama${NC}"
    read -p "Masukkan pilihan [0-2] (Default: 2): " INTRO_CHOICE
    INTRO_CHOICE="${INTRO_CHOICE//[$'\t\r ']/}"
    if [ "$INTRO_CHOICE" = "0" ]; then
        echo -e "${YELLOW}[*] Membatalkan dan kembali ke menu utama...${NC}"
        exit 0
    elif [ "$INTRO_CHOICE" = "1" ]; then
        USE_INTRO="yes"
    else
        USE_INTRO="no"
    fi
else
    USE_INTRO="$USE_INTRO_CONF"
fi

# 2. Pilihan Resolusi Output Video
if [ -z "$TARGET_HEIGHT_CONF" ]; then
    echo -e "\n${BOLD}${YELLOW}📺 Pilih Resolusi Output Video Target:${NC}"
    echo -e "  [1] 1080p (Full HD - Tajam & Jernih)"
    echo -e "  [2] 720p  (HD - Rekomendasi Hemat Storage)"
    echo -e "  [3] 480p  (SD - Super Hemat Memori)"
    echo -e "  [4] Asli / Original Video Input"
    echo -e "  [0] ${RED}Kembali ke Menu Utama${NC}"
    read -p "Masukkan pilihan [0-4] (Default: 2): " RES_CHOICE
    RES_CHOICE="${RES_CHOICE//[$'\t\r ']/}"
    if [ "$RES_CHOICE" = "0" ]; then
        echo -e "${YELLOW}[*] Membatalkan dan kembali ke menu utama...${NC}"
        exit 0
    fi
    case "$RES_CHOICE" in
        1) TARGET_HEIGHT_CONF=1080 ;;
        2) TARGET_HEIGHT_CONF=720 ;;
        3) TARGET_HEIGHT_CONF=480 ;;
        4) TARGET_HEIGHT_CONF="input" ;;
        *) TARGET_HEIGHT_CONF=720 ;;
    esac
fi

# 3. Pilihan Kualitas Visual (CRF)
if [ -z "$LOOP_CRF" ]; then
    echo -e "\n${BOLD}${YELLOW}🎛️  Pilih Kualitas Visual (CRF - Constant Rate Factor):${NC}"
    echo -e "  [1] Super Jernih (CRF 20)"
    echo -e "  [2] Seimbang (CRF $DEFAULT_CRF) [Rekomendasi]"
    echo -e "  [3] Hemat Memori HP (CRF 26)"
    echo -e "  [4] Input CRF Manual"
    echo -e "  [0] ${RED}Kembali ke Menu Utama${NC}"
    read -p "Masukkan pilihan [0-4] (Default: 2): " CRF_CHOICE
    CRF_CHOICE="${CRF_CHOICE//[$'\t\r ']/}"
    if [ "$CRF_CHOICE" = "0" ]; then
        echo -e "${YELLOW}[*] Membatalkan dan kembali ke menu utama...${NC}"
        exit 0
    fi
    case "$CRF_CHOICE" in
        1) LOOP_CRF=20 ;;
        2) LOOP_CRF=$DEFAULT_CRF ;;
        3) LOOP_CRF=26 ;;
        4)
            read -p "➔ Masukkan nilai CRF (18 - 30): " MANUAL_CRF
            MANUAL_CRF="${MANUAL_CRF//[$'\t\r ']/}"
            if [[ "$MANUAL_CRF" =~ ^[0-9]+$ ]] && [ "$MANUAL_CRF" -ge 18 ] && [ "$MANUAL_CRF" -le 30 ]; then
                LOOP_CRF="$MANUAL_CRF"
            else
                LOOP_CRF=$DEFAULT_CRF
            fi
            ;;
        *) LOOP_CRF=$DEFAULT_CRF ;;
    esac
fi

# 4. Pilihan Video Fade-In
if [ -z "$VIDEO_FADE_IN_CONF" ]; then
    echo -e "\n${BOLD}${YELLOW}🎬 Tambahkan Efek Video Fade-In (Hitam ke Terang) di Awal Video?${NC}"
    echo -e "  [1] Tanpa Fade-In (0 Detik)"
    echo -e "  [2] 2 Detik"
    echo -e "  [3] 3 Detik [Rekomendasi]"
    echo -e "  [4] 5 Detik"
    echo -e "  [5] Custom Detik"
    echo -e "  [0] ${RED}Kembali ke Menu Utama${NC}"
    read -p "Masukkan pilihan [0-5] (Default: 3): " FADE_CHOICE
    FADE_CHOICE="${FADE_CHOICE//[$'\t\r ']/}"
    if [ "$FADE_CHOICE" = "0" ]; then
        echo -e "${YELLOW}[*] Membatalkan dan kembali ke menu utama...${NC}"
        exit 0
    fi
    case "$FADE_CHOICE" in
        1) VIDEO_FADE_IN_SEC=0 ;;
        2) VIDEO_FADE_IN_SEC=2 ;;
        3) VIDEO_FADE_IN_SEC=3 ;;
        4) VIDEO_FADE_IN_SEC=5 ;;
        5)
            read -p "➔ Masukkan durasi Video Fade-In dalam detik: " MANUAL_FADE
            MANUAL_FADE="${MANUAL_FADE//[$'\t\r ']/}"
            if [[ "$MANUAL_FADE" =~ ^[0-9]+$ ]]; then
                VIDEO_FADE_IN_SEC="$MANUAL_FADE"
            else
                VIDEO_FADE_IN_SEC=3
            fi
            ;;
        *) VIDEO_FADE_IN_SEC=3 ;;
    esac
else
    VIDEO_FADE_IN_SEC="$VIDEO_FADE_IN_CONF"
fi

AUDIO_FILES=()
while IFS= read -r -d '' file; do
    AUDIO_FILES+=("$file")
done < <(find "$FOLDER_BAHAN" -maxdepth 1 \( -name "*.m4a" -o -name "*.mp3" -o -name "*.wav" \) -print0 2>/dev/null | sort -z -V)

if [ ${#AUDIO_FILES[@]} -eq 0 ]; then
    echo -e "${RED}[!] ERROR: Tidak ada file audio di $FOLDER_BAHAN! Harap rakit audio dahulu.${NC}"
    exit 1
fi

AUDIO_FILE=""
if [ -n "$CHOSEN_AUDIO" ] && [ -f "$CHOSEN_AUDIO" ]; then
    AUDIO_FILE="$CHOSEN_AUDIO"
    echo -e "${GREEN}[✓] Audio Terpilih: $(basename "$AUDIO_FILE")${NC}"
else
    echo -e "\n${YELLOW}🎵 Silakan pilih file audio untuk menyatukan dengan video:${NC}"
    for i in "${!AUDIO_FILES[@]}"; do
        filename=$(basename "${AUDIO_FILES[$i]}")
        dur_sec=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${AUDIO_FILES[$i]}")
        dur_sec_int=${dur_sec%.*}
        dur_min=$((dur_sec_int / 60))
        dur_sec_rem=$((dur_sec_int % 60))
        if [ "$dur_sec_rem" -lt 10 ]; then dur_sec_rem="0$dur_sec_rem"; fi
        echo -e "  [$((i+1))] $filename (Durasi: ${dur_min}:${dur_sec_rem})"
    done
    echo -e "  [0] ${RED}Kembali ke Menu Utama${NC}"
    echo ""
    read -p "Masukkan pilihan audio [0-${#AUDIO_FILES[@]}] (Default: 1): " AUDIO_IDX
    AUDIO_IDX="${AUDIO_IDX//[$'\t\r ']/}"
    if [ "$AUDIO_IDX" = "0" ]; then
        echo -e "${YELLOW}[*] Membatalkan dan kembali ke menu utama...${NC}"
        exit 0
    fi
    CHOSEN_IDX=${AUDIO_IDX:-1}
    
    if ! [[ "$CHOSEN_IDX" =~ ^[0-9]+$ ]] || [ "$CHOSEN_IDX" -lt 1 ] || [ "$CHOSEN_IDX" -gt "${#AUDIO_FILES[@]}" ]; then
        AUDIO_FILE="${AUDIO_FILES[0]}"
    else
        AUDIO_FILE="${AUDIO_FILES[$((CHOSEN_IDX-1))]}"
    fi
    echo -e "${GREEN}[✓] Audio Terpilih: $(basename "$AUDIO_FILE")${NC}"
fi

TARGET_DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$AUDIO_FILE")
if [ -z "$TARGET_DURATION" ]; then
    TARGET_DURATION=36000
fi

echo -e "\n${YELLOW}[*] Men-scan video di folder input: $FOLDER_INPUT...${NC}"
VIDEO_FILES=()
while IFS= read -r -d '' file; do
    VIDEO_FILES+=("$file")
done < <(find "$FOLDER_INPUT" -maxdepth 1 \( -name "*.mp4" -o -name "*.mkv" -o -name "*.mov" -o -name "*.3gp" \) -print0 | sort -z -V)

NUM_VIDEOS=${#VIDEO_FILES[@]}
if [ "$NUM_VIDEOS" -lt 1 ]; then
    echo -e "${RED}[!] ERROR: Tidak ada file video di folder $FOLDER_INPUT!${NC}"
    exit 1
fi

C_SEC=5

if [ "$USE_INTRO" = "yes" ] && [ "$NUM_VIDEOS" -ge 2 ]; then
    PAIRS_COUNT=$((NUM_VIDEOS / 2))
    for ((i=0; i<PAIRS_COUNT; i++)); do
        idx_a=$((i * 2))
        idx_b=$((idx_a + 1))
        VIDEO_A="${VIDEO_FILES[idx_a]}"
        VIDEO_B="${VIDEO_FILES[idx_b]}"
        
        NAME_A=$(basename "$VIDEO_A" | sed 's/\.[^.]*$//')
        NAME_B=$(basename "$VIDEO_B" | sed 's/\.[^.]*$//')
        OUTPUT_FILE="$FOLDER_HASIL/ASMR_${ASMR_TYPE^^}_FINAL_${NAME_A}_x_${NAME_B}.mp4"
        
        echo -e "\n🎬 ${YELLOW}[$((i+1))/$PAIRS_COUNT] Memproses dengan Intro: $NAME_A + $NAME_B...${NC}"
        
        L_A=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO_A")
        L_B=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO_B")
        ORIG_HEIGHT=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=noprint_wrappers=1:nokey=1 "$VIDEO_A")
        if [ -z "$ORIG_HEIGHT" ] || ! [[ "$ORIG_HEIGHT" =~ ^[0-9]+$ ]]; then ORIG_HEIGHT=1080; fi
        
        if [ "$TARGET_HEIGHT_CONF" = "input" ]; then
            TARGET_HEIGHT=$ORIG_HEIGHT
        else
            TARGET_HEIGHT=$TARGET_HEIGHT_CONF
        fi
        
        CURRENT_CRF="${LOOP_CRF:-$DEFAULT_CRF}"
        CURRENT_TUNE="${LOOP_TUNE:-$DEFAULT_TUNE}"
        CURRENT_X264="${X264_OPTS:-$DEFAULT_X264}"
        
        if [ "$TARGET_HEIGHT" -ge 1080 ]; then
            MAXRATE="2400k"; BUFSIZE="4800k"
        elif [ "$TARGET_HEIGHT" -ge 720 ]; then
            MAXRATE="1350k"; BUFSIZE="2700k"
        else
            MAXRATE="800k"; BUFSIZE="1600k"
        fi
        
        H=$(awk "BEGIN {print $C_SEC / 2}")
        L_A_minus_C=$(awk "BEGIN {print $L_A - $C_SEC}")
        L_B_minus_C=$(awk "BEGIN {print $L_B - $C_SEC}")
        
        TEMP_BLOCK_B="$TEMP_DIR/block_b_$i.ts"
        TEMP_INTRO_PART="$TEMP_DIR/intro_part_$i.ts"
        CONCAT_LIST="$TEMP_DIR/list_$i.txt"
        
        VF_FADE=""
        if [ "$VIDEO_FADE_IN_SEC" -gt 0 ]; then
            VF_FADE=",fade=t=in:st=0:d=${VIDEO_FADE_IN_SEC}"
        fi
        
        ffmpeg -y -i "$VIDEO_B" -i "$VIDEO_B" -i "$VIDEO_B" -filter_complex \
        "[0:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=$C_SEC:end=$L_B_minus_C,setpts=PTS-STARTPTS[mid]; \
         [1:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=$L_B_minus_C:end=$L_B,setpts=PTS-STARTPTS[end_part]; \
         [2:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=0:end=$C_SEC,setpts=PTS-STARTPTS[start_part]; \
         [end_part][start_part]xfade=transition=fade:duration=$C_SEC:offset=0[cf]; \
         [cf]split=2[cf_a][cf_b]; \
         [cf_a]trim=start=$H:end=$C_SEC,setpts=PTS-STARTPTS[cf2]; \
         [cf_b]trim=start=0:end=$H,setpts=PTS-STARTPTS[cf1]; \
         [cf2][mid][cf1]concat=n=3:v=1:a=0,format=yuv420p[out]" \
        -map "[out]" -c:v libx264 -pix_fmt yuv420p -preset veryfast -crf $CURRENT_CRF ${CURRENT_TUNE:+-tune "$CURRENT_TUNE"} ${CURRENT_X264:+-x264opts "$CURRENT_X264"} -maxrate "$MAXRATE" -bufsize "$BUFSIZE" -bf 0 -threads 2 -an -f mpegts "$TEMP_BLOCK_B" > "$TEMP_DIR/render_block_b.log" 2>&1
        
        ffmpeg -y -i "$VIDEO_A" -i "$VIDEO_A" -i "$TEMP_BLOCK_B" -i "$TEMP_BLOCK_B" -filter_complex \
        "[0:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=0:end=$L_A_minus_C,setpts=PTS-STARTPTS[a_start]; \
         [1:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=$L_A_minus_C:end=$L_A,setpts=PTS-STARTPTS[a_end]; \
         [2:v]fps=30,trim=start=0:end=$C_SEC,setpts=PTS-STARTPTS,format=yuv420p[b_start]; \
         [3:v]fps=30,trim=start=$C_SEC,setpts=PTS-STARTPTS,format=yuv420p[b_rest]; \
         [a_end][b_start]xfade=transition=fade:duration=$C_SEC:offset=0[cf]; \
         [a_start][cf][b_rest]concat=n=3:v=1:a=0,format=yuv420p${VF_FADE}[out]" \
        -map "[out]" -c:v libx264 -pix_fmt yuv420p -preset veryfast -crf $CURRENT_CRF ${CURRENT_TUNE:+-tune "$CURRENT_TUNE"} ${CURRENT_X264:+-x264opts "$CURRENT_X264"} -maxrate "$MAXRATE" -bufsize "$BUFSIZE" -bf 0 -threads 2 -an -f mpegts "$TEMP_INTRO_PART" > "$TEMP_DIR/render_intro.log" 2>&1
        
        DUR_INTRO=$(awk "BEGIN {print $L_A + $L_B - 2 * $C_SEC}")
        DUR_BLOCK=$(awk "BEGIN {print $L_B - $C_SEC}")
        R=$(awk "BEGIN {print $TARGET_DURATION - $DUR_INTRO}")
        K=$(awk "BEGIN {
            val = $R / $DUR_BLOCK; ival = int(val);
            loops = (val > ival) ? ival + 1 : ival;
            print (loops < 0) ? 0 : loops;
        }")
        
        echo "file '$TEMP_INTRO_PART'" > "$CONCAT_LIST"
        for ((k=0; k<K; k++)); do
            echo "file '$TEMP_BLOCK_B'" >> "$CONCAT_LIST"
        done
        
        ffmpeg -y -f concat -safe 0 -i "$CONCAT_LIST" -i "$AUDIO_FILE" \
        -map 0:v -map 1:a -c:v copy -c:a copy -t "$TARGET_DURATION" "$OUTPUT_FILE"
        
        if [ $? -eq 0 ] && [ -f "$OUTPUT_FILE" ]; then
            FILE_SIZE_BYTES=$(stat -c%s "$OUTPUT_FILE")
            FILE_SIZE_MB=$(awk "BEGIN {print $FILE_SIZE_BYTES / 1024 / 1024}")
            echo -e "${GREEN}   [✓] SUKSES! Video ASMR berhasil dicetak!${NC}"
            echo -e "       📂 Lokasi: $OUTPUT_FILE"
            echo -e "       📦 Ukuran: $(printf "%.2f" $FILE_SIZE_MB) MB"
        fi
        rm -f "$TEMP_BLOCK_B" "$TEMP_INTRO_PART" "$CONCAT_LIST"
    done
else
    for i in "${!VIDEO_FILES[@]}"; do
        VIDEO_SINGLE="${VIDEO_FILES[$i]}"
        NAME_SINGLE=$(basename "$VIDEO_SINGLE" | sed 's/\.[^.]*$//')
        OUTPUT_FILE="$FOLDER_HASIL/ASMR_${ASMR_TYPE^^}_FINAL_${NAME_SINGLE}.mp4"
        
        echo -e "\n🎬 ${YELLOW}[$((i+1))/$NUM_VIDEOS] Memproses Tanpa Intro: $NAME_SINGLE...${NC}"
        
        L_S=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO_SINGLE")
        ORIG_HEIGHT=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=noprint_wrappers=1:nokey=1 "$VIDEO_SINGLE")
        if [ -z "$ORIG_HEIGHT" ] || ! [[ "$ORIG_HEIGHT" =~ ^[0-9]+$ ]]; then ORIG_HEIGHT=1080; fi
        
        if [ "$TARGET_HEIGHT_CONF" = "input" ]; then
            TARGET_HEIGHT=$ORIG_HEIGHT
        else
            TARGET_HEIGHT=$TARGET_HEIGHT_CONF
        fi
        
        CURRENT_CRF="${LOOP_CRF:-$DEFAULT_CRF}"
        CURRENT_TUNE="${LOOP_TUNE:-$DEFAULT_TUNE}"
        CURRENT_X264="${X264_OPTS:-$DEFAULT_X264}"
        
        if [ "$TARGET_HEIGHT" -ge 1080 ]; then
            MAXRATE="2400k"; BUFSIZE="4800k"
        elif [ "$TARGET_HEIGHT" -ge 720 ]; then
            MAXRATE="1350k"; BUFSIZE="2700k"
        else
            MAXRATE="800k"; BUFSIZE="1600k"
        fi
        
        L_S_minus_C=$(awk "BEGIN {print $L_S - $C_SEC}")
        H=$(awk "BEGIN {print $C_SEC / 2}")
        
        TEMP_BLOCK_SINGLE="$TEMP_DIR/block_single_$i.ts"
        CONCAT_LIST="$TEMP_DIR/list_single_$i.txt"
        
        VF_FADE=""
        if [ "$VIDEO_FADE_IN_SEC" -gt 0 ]; then
            VF_FADE=",fade=t=in:st=0:d=${VIDEO_FADE_IN_SEC}"
        fi
        
        ffmpeg -y -i "$VIDEO_SINGLE" -i "$VIDEO_SINGLE" -i "$VIDEO_SINGLE" -filter_complex \
        "[0:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=$C_SEC:end=$L_S_minus_C,setpts=PTS-STARTPTS[mid]; \
         [1:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=$L_S_minus_C:end=$L_S,setpts=PTS-STARTPTS[end_part]; \
         [2:v]scale=-2:$TARGET_HEIGHT:flags=bicubic,fps=30,format=yuv420p,trim=start=0:end=$C_SEC,setpts=PTS-STARTPTS[start_part]; \
         [end_part][start_part]xfade=transition=fade:duration=$C_SEC:offset=0[cf]; \
         [cf]split=2[cf_a][cf_b]; \
         [cf_a]trim=start=$H:end=$C_SEC,setpts=PTS-STARTPTS[cf2]; \
         [cf_b]trim=start=0:end=$H,setpts=PTS-STARTPTS[cf1]; \
         [cf2][mid][cf1]concat=n=3:v=1:a=0,format=yuv420p${VF_FADE}[out]" \
        -map "[out]" -c:v libx264 -pix_fmt yuv420p -preset veryfast -crf $CURRENT_CRF ${CURRENT_TUNE:+-tune "$CURRENT_TUNE"} ${CURRENT_X264:+-x264opts "$CURRENT_X264"} -maxrate "$MAXRATE" -bufsize "$BUFSIZE" -bf 0 -threads 2 -an -f mpegts "$TEMP_BLOCK_SINGLE" > "$TEMP_DIR/render_single.log" 2>&1
        
        DUR_BLOCK=$(awk "BEGIN {print $L_S - $C_SEC}")
        K=$(awk "BEGIN {
            val = $TARGET_DURATION / $DUR_BLOCK; ival = int(val);
            loops = (val > ival) ? ival + 1 : ival;
            print (loops < 1) ? 1 : loops;
        }")
        
        echo "file '$TEMP_BLOCK_SINGLE'" > "$CONCAT_LIST"
        for ((k=1; k<K; k++)); do
            echo "file '$TEMP_BLOCK_SINGLE'" >> "$CONCAT_LIST"
        done
        
        ffmpeg -y -f concat -safe 0 -i "$CONCAT_LIST" -i "$AUDIO_FILE" \
        -map 0:v -map 1:a -c:v copy -c:a copy -t "$TARGET_DURATION" "$OUTPUT_FILE"
        
        if [ $? -eq 0 ] && [ -f "$OUTPUT_FILE" ]; then
            FILE_SIZE_BYTES=$(stat -c%s "$OUTPUT_FILE")
            FILE_SIZE_MB=$(awk "BEGIN {print $FILE_SIZE_BYTES / 1024 / 1024}")
            echo -e "${GREEN}   [✓] SUKSES! Video ASMR Tanpa Intro berhasil dicetak!${NC}"
            echo -e "       📂 Lokasi: $OUTPUT_FILE"
            echo -e "       📦 Ukuran: $(printf "%.2f" $FILE_SIZE_MB) MB"
        fi
        rm -f "$TEMP_BLOCK_SINGLE" "$CONCAT_LIST"
    done
fi
