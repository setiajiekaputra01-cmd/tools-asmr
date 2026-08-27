#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 PROJEK ASMR CONTROL DASHBOARD (v1.1.0)
#                  Tools Dibuat Oleh: Mas Arif
# ==============================================================================

# Versi & Repositori GitHub
CURRENT_VERSION="v1.1.0"
GITHUB_REPO_RAW="https://raw.githubusercontent.com/setiajiekaputra01-cmd/tools-asmr/main"

# Palette Warna Modern untuk Termux Mobile
C_BORDER="\033[38;5;39m"   # Cyan / Deep Sky Blue
C_TITLE="\033[38;5;220m"   # Bright Gold / Yellow
C_AUTHOR="\033[38;5;82m"   # Neon Lime Green
C_TEXT="\033[38;5;255m"    # Crisp White
C_MUTED="\033[38;5;245m"   # Soft Silver Gray
C_NUM="\033[38;5;214m"     # Amber / Orange Badge
C_GREEN="\033[38;5;82m"    # Emerald Green
C_RED="\033[38;5;196m"     # Crimson Red
C_BLUE="\033[38;5;75m"     # Soft Blue
C_PURPLE="\033[38;5;141m"   # Lavender Purple
C_CYAN="\033[38;5;51m"     # Bright Cyan
NC="\033[0m"               # Reset Color
BOLD="\033[1m"

# Lokasi File Script Sub-Projek
DIR_SEKARANG="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_AUDIO="$DIR_SEKARANG/rakit_audio.sh"
SCRIPT_KOMPRES="$DIR_SEKARANG/kompres_massal.sh"
SCRIPT_KOMPRES_PRO="$DIR_SEKARANG/kompres_video_pro.sh"
SCRIPT_DUAL_LOOP="$DIR_SEKARANG/asmr_dual_video_loop.sh"

# Lokasi Folder Storage SDCard
BASE_PROJECT="/sdcard/PROJECT ASMR"
FOLDER_AUDIO="$BASE_PROJECT/AUDIO"
FOLDER_KOMPRES_IN="$BASE_PROJECT/SEBELUM LOOP"
FOLDER_HUJAN_HASIL="$BASE_PROJECT/HASIL HUJAN"
FOLDER_API_HASIL="$BASE_PROJECT/HASIL API"
FOLDER_KOMPRES_OUT="$BASE_PROJECT/HASIL KOMPRES"
FOLDER_BAHAN_MENTAH="$BASE_PROJECT/BAHAN MENTAH"

# Variabel Global Cek Update Remote
REMOTE_VERSION_DETECTED=""
UPDATE_AVAILABLE=false

# Fungsi Otomatis: Buat & Siapkan Seluruh Folder Projek Tanpa Manual
setup_all_folders_auto() {
    if ! ls /sdcard &>/dev/null; then
        termux-setup-storage 2>/dev/null
        sleep 2
    fi

    mkdir -p "$BASE_PROJECT" \
             "$FOLDER_AUDIO" \
             "$FOLDER_KOMPRES_IN" \
             "$FOLDER_HUJAN_HASIL" \
             "$FOLDER_API_HASIL" \
             "$FOLDER_KOMPRES_OUT" \
             "$FOLDER_BAHAN_MENTAH" \
             "/sdcard/SEBELUM LOOP" \
             "/sdcard/kompres vidio" \
             "/sdcard/PROJECT ASMR HUJAN" \
             "/sdcard/PROJECT ASMR API" \
             "$HOME/temp_asmr" 2>/dev/null

    if [ -d "/sdcard/SEBELUM LOOP" ] && [ "$FOLDER_KOMPRES_IN" != "/sdcard/SEBELUM LOOP" ]; then
        cp -rn "/sdcard/SEBELUM LOOP/"* "$FOLDER_KOMPRES_IN/" 2>/dev/null
    fi
    if [ -d "/sdcard/PROJECT ASMR HUJAN" ]; then
        cp -rn "/sdcard/PROJECT ASMR HUJAN/"* "$FOLDER_AUDIO/" 2>/dev/null
    fi
}

# Fungsi Fast Silent Check Update dari GitHub (Max 2 detik)
check_update_silent() {
    REMOTE_VER=$(curl -sSL --max-time 2 "$GITHUB_REPO_RAW/VERSION" 2>/dev/null | tr -d '\r\n ')
    if [ -n "$REMOTE_VER" ] && [ "$REMOTE_VER" != "$CURRENT_VERSION" ]; then
        REMOTE_VERSION_DETECTED="$REMOTE_VER"
        UPDATE_AVAILABLE=true
    fi
}

# Jalankan Otomatis Pembuatan Folder & Cek Update
setup_all_folders_auto
check_update_silent

# Fungsi: Tampilan Manual Menu Pembuatan Folder (Menu 5)
setup_folders_interactive() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}📁 MENYIAPKAN SELURUH FOLDER PROJEK OTOMATIS...     ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    
    setup_all_folders_auto

    echo -e "${C_BORDER}│${NC}  ${C_GREEN}[✓] Semua folder projek telah siap di memori HP!       ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Folder Utama :${NC} ${C_BLUE}/sdcard/PROJECT ASMR/            ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan Audio  :${NC} ${C_BLUE}/sdcard/PROJECT ASMR/AUDIO/      ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Video Mentah :${NC} ${C_BLUE}/sdcard/PROJECT ASMR/SEBELUM LOOP/${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Hasil Hujan  :${NC} ${C_BLUE}/sdcard/PROJECT ASMR/HASIL HUJAN/ ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Hasil Api    :${NC} ${C_BLUE}/sdcard/PROJECT ASMR/HASIL API/   ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Hasil Kompres:${NC} ${C_BLUE}/sdcard/PROJECT ASMR/HASIL KOMPRES/${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    read -p " Tekan [Enter] untuk kembali ke menu utama..."
}

# Fungsi: Auto Update (Menu 6)
run_auto_update() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_AUTHOR}🔄 CEK & PERBARUI TOOLS (AUTO UPDATE)${NC}                ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Versi Saat Ini   :${NC} ${C_TITLE}$CURRENT_VERSION${NC}                        ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Repositori GitHub:${NC} ${C_BLUE}setiajiekaputra01-cmd/tools-asmr${NC}   ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e " ${C_TITLE}[*] Memeriksa versi terbaru di GitHub...${NC}"

    REMOTE_VERSION=$(curl -sSL --max-time 5 "$GITHUB_REPO_RAW/VERSION" 2>/dev/null | tr -d '\r\n ')

    if [ -z "$REMOTE_VERSION" ]; then
        echo -e " ${C_RED}[!] Gagal terhubung ke GitHub. Cek koneksi internet HP Anda!${NC}\n"
        read -p " Tekan [Enter] untuk kembali..."
        return
    fi

    echo -e " ${C_MUTED}• Versi di Server  :${NC} ${C_GREEN}$REMOTE_VERSION${NC}\n"

    if [ "$CURRENT_VERSION" = "$REMOTE_VERSION" ]; then
        echo -e " ${C_GREEN}[✓] Tools Anda sudah menggunakan versi TERBARU ($CURRENT_VERSION)!${NC}\n"
        echo -e " 📌 Apakah Anda tetap ingin mengunduh ulang/memperbarui file skrip?"
        echo -e "  ${C_NUM}[1]${NC} Ya, Unduh Ulang File Skrip"
        echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
        echo ""
        read -p " ❯ Masukkan Pilihan [1-2] (Default: 2): " up_choice
        up_choice="${up_choice//[$'\t\r ']/}"
        if [ "$up_choice" != "1" ]; then
            return
        fi
    else
        echo -e " ${C_TITLE}🔔 TERSEDIA PEMBARUAN BARU DARI MAS ARIF! ($CURRENT_VERSION ➔ $REMOTE_VERSION)${NC}\n"
        echo -e " 📌 Lanjutkan proses perbarui tools?"
        echo -e "  ${C_NUM}[1]${NC} Lanjutkan Update Sekarang"
        echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
        echo ""
        read -p " ❯ Masukkan Pilihan [1-2] (Default: 1): " up_choice
        up_choice="${up_choice//[$'\t\r ']/}"
        if [ "$up_choice" = "2" ]; then
            return
        fi
    fi

    echo -e "\n ${C_TITLE}[*] Mengunduh berkas skrip terbaru dari GitHub...${NC}"
    
    curl -sSL "$GITHUB_REPO_RAW/PROJEK_ASMR_HUJAN.sh" -o "$DIR_SEKARANG/PROJEK_ASMR_HUJAN.sh"
    curl -sSL "$GITHUB_REPO_RAW/asmr_dual_video_loop.sh" -o "$DIR_SEKARANG/asmr_dual_video_loop.sh"
    curl -sSL "$GITHUB_REPO_RAW/rakit_audio.sh" -o "$DIR_SEKARANG/rakit_audio.sh"
    curl -sSL "$GITHUB_REPO_RAW/kompres_massal.sh" -o "$DIR_SEKARANG/kompres_massal.sh"
    curl -sSL "$GITHUB_REPO_RAW/VERSION" -o "$DIR_SEKARANG/VERSION"

    chmod +x "$DIR_SEKARANG"/*.sh 2>/dev/null
    cp -f "$DIR_SEKARANG/PROJEK_ASMR_HUJAN.sh" "$PREFIX/bin/asmr" 2>/dev/null
    chmod +x "$PREFIX/bin/asmr" 2>/dev/null

    echo -e "\n${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_GREEN}  🎉 PEMBARUAN BERHASIL! TOOLS TELAH DIPERBARUI!      ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"
    read -p " Tekan [Enter] untuk memuat ulang tools..."
    exec "$DIR_SEKARANG/PROJEK_ASMR_HUJAN.sh"
}

# Fungsi: Header Dashboard Utama
show_header() {
    clear
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}        █████╗ ███████╗███╗   ███╗██████╗         ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}       ██╔══██╗██╔════╝████╗ ████║██╔══██╗        ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}       ███████║███████╗██╔████╔██║██████╔╝        ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}       ██╔══██║╚════██║██║╚██╔╝██║██╔══██╗        ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}       ██║  ██║███████║██║ ╚═╝ ██║██║  ██║        ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${C_CYAN}${BOLD}       ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝        ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}               🌧️ TOOLS LOOPING VIDEO 🌧️               ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_AUTHOR}          👑 Dibuat Oleh: Mas Arif ($CURRENT_VERSION) 👑         ${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    
    # Status Storage
    if ls /sdcard &>/dev/null; then
        ST_STORAGE="${C_GREEN}✓ Aktif (Normal)${NC}       "
    else
        ST_STORAGE="${C_RED}✗ Tidak Aktif${NC}          "
    fi

    # Status FFMPEG
    if command -v ffmpeg &>/dev/null; then
        FFMPEG_VER=$(ffmpeg -version | head -n 1 | cut -d' ' -f3)
        ST_FFMPEG="${C_GREEN}✓ Terinstall (v$FFMPEG_VER)${NC}"
    else
        ST_FFMPEG="${C_RED}✗ Belum Terinstall${NC}   "
    fi

    # Status Versi
    if [ "$UPDATE_AVAILABLE" = true ]; then
        ST_VER="${C_TITLE}$CURRENT_VERSION${NC} ${C_RED}🔔 ($REMOTE_VERSION_DETECTED Tersedia!)${NC}"
    else
        ST_VER="${C_TITLE}$CURRENT_VERSION${NC} ${C_GREEN}(Terbaru)${NC}               "
    fi

    echo -e "${C_BORDER}│${NC} ${C_MUTED}Status Sistem:${NC}                                       ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  • Akses SDCard  : $ST_STORAGE ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  • FFMPEG Engine : $ST_FFMPEG ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  • Versi Tools   : $ST_VER ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"

    # Banner Notifikasi Jika Ada Update
    if [ "$UPDATE_AVAILABLE" = true ]; then
        echo -e "${C_TITLE}╭──────────────────────────────────────────────────────╮${NC}"
        echo -e "${C_TITLE}│${NC} ${BOLD}${C_RED}🔔 PEMBARUAN BARU TERSEDIA! Versi $REMOTE_VERSION_DETECTED telah rilis! ${NC} ${C_TITLE}│${NC}"
        echo -e "${C_TITLE}│${NC}    ${C_TEXT}Pilih Menu [6] untuk memperbarui secara otomatis. ${NC} ${C_TITLE}│${NC}"
        echo -e "${C_TITLE}╰──────────────────────────────────────────────────────╯${NC}"
    fi
}

# Fungsi: Sub-Projek 1 (Merakit Audio Seamless Durasi Panjang)
run_audio_project() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_PURPLE}🎵 1. MERAKIT AUDIO SEAMLESS DURASI PANJANG${NC}          ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Fungsi : Merakit audio mentah 15 menit menjadi${NC}   ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}             ${C_MUTED}audio ASMR mulus (1 - 10 Jam).${NC}      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Fitur  :${NC} ${C_GREEN}Kustom Audio Fade-In & Fade-Out (Detik)${NC} ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan  :${NC} ${C_BLUE}$FOLDER_AUDIO/audio_bandlab.m4a${NC}      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Output :${NC} ${C_GREEN}audio_[DURASI]jam_mulus.m4a${NC}         ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e " ${BOLD}${C_TEXT}📌 Konfirmasi Aksinya:${NC}"
    echo -e "  ${C_NUM}[1]${NC} Lanjutkan Rakit Audio"
    echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
    echo ""
    read -p " ❯ Masukkan Pilihan [1-2] (Default: 1): " sub_choice
    sub_choice="${sub_choice//[$'\t\r ']/}"
    if [ "$sub_choice" = "2" ]; then
        return
    fi

    if [ ! -f "$SCRIPT_AUDIO" ]; then
        echo -e "\n ${C_RED}[!] ERROR: File script '$SCRIPT_AUDIO' tidak ditemukan!${NC}\n"
        read -p " Tekan [Enter] untuk kembali..."
        return
    fi

    echo -e "\n ${C_TITLE}[*] Memulai proses rakit audio...${NC}\n"
    bash "$SCRIPT_AUDIO"
    echo ""
    read -p " Tekan [Enter] untuk kembali..."
}

# Fungsi: Sub-Projek 2 (Mengompres Video Massal)
run_compress_project() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_BLUE}🎬 2. MENGOMPRES VIDEO MASSAL${NC}                        ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Fungsi : Ubah ukuran & kompresi video mentah${NC}      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Input  :${NC} ${C_BLUE}$FOLDER_KOMPRES_IN${NC}                     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Output :${NC} ${C_GREEN}$FOLDER_KOMPRES_OUT${NC}                    ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e " ${BOLD}${C_TEXT}📌 Konfirmasi Aksinya:${NC}"
    echo -e "  ${C_NUM}[1]${NC} Lanjutkan Kompresi Video"
    echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
    echo ""
    read -p " ❯ Masukkan Pilihan [1-2] (Default: 1): " sub_choice
    sub_choice="${sub_choice//[$'\t\r ']/}"
    if [ "$sub_choice" = "2" ]; then
        return
    fi

    export FOLDER_INPUT="$FOLDER_KOMPRES_IN"
    export FOLDER_HASIL="$FOLDER_KOMPRES_OUT"

    if [ -f "$SCRIPT_KOMPRES_PRO" ]; then
        bash "$SCRIPT_KOMPRES_PRO"
    elif [ -f "$SCRIPT_KOMPRES" ]; then
        bash "$SCRIPT_KOMPRES"
    else
        echo -e "\n ${C_RED}[!] ERROR: Tool kompres video tidak ditemukan!${NC}\n"
        read -p " Tekan [Enter] untuk kembali..."
    fi
}

# Fungsi: Sub-Projek 3 (Merakit Video & Audio ASMR Hujan)
run_asmr_hujan_project() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_CYAN}🌧️  3. MERAKIT VIDEO & AUDIO ASMR HUJAN${NC}              ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Profil Visual:${NC} ${C_GREEN}High-Fidelity Rain (Grain Tekstur Air)${NC}${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Opsi Kustom  :${NC} ${C_TITLE}Intro/Tanpa Intro, Resolusi, CRF, Fade${NC}${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan Video  :${NC} ${C_BLUE}$FOLDER_KOMPRES_IN${NC}                     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan Audio  :${NC} ${C_BLUE}$FOLDER_AUDIO${NC}                          ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Output Folder:${NC} ${C_GREEN}$FOLDER_HUJAN_HASIL${NC}                    ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e " ${BOLD}${C_TEXT}📌 Konfirmasi Aksinya:${NC}"
    echo -e "  ${C_NUM}[1]${NC} Lanjutkan Rakit ASMR Hujan"
    echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
    echo ""
    read -p " ❯ Masukkan Pilihan [1-2] (Default: 1): " sub_choice
    sub_choice="${sub_choice//[$'\t\r ']/}"
    if [ "$sub_choice" = "2" ]; then
        return
    fi

    if [ ! -f "$SCRIPT_DUAL_LOOP" ]; then
        echo -e "\n ${C_RED}[!] ERROR: Script '$SCRIPT_DUAL_LOOP' tidak ditemukan!${NC}\n"
        read -p " Tekan [Enter] untuk kembali..."
        return
    fi

    echo -e "\n ${C_TITLE}[*] Memulai Rakit Video & Audio ASMR Hujan...${NC}\n"
    export ASMR_TYPE="hujan"
    export FOLDER_INPUT="$FOLDER_KOMPRES_IN"
    export FOLDER_BAHAN="$FOLDER_AUDIO"
    export FOLDER_HASIL="$FOLDER_HUJAN_HASIL"
    bash "$SCRIPT_DUAL_LOOP"
    echo ""
    read -p " Tekan [Enter] untuk kembali..."
}

# Fungsi: Sub-Projek 4 (Merakit Video & Audio ASMR Api)
run_asmr_api_project() {
    show_header
    echo -e ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}🔥 4. MERAKIT VIDEO & AUDIO ASMR API${NC}                 ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Profil Visual:${NC} ${C_GREEN}Deep Dark Fire (Anti Banding & Flicker)${NC}${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Opsi Kustom  :${NC} ${C_TITLE}Intro/Tanpa Intro, Resolusi, CRF, Fade${NC}${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan Video  :${NC} ${C_BLUE}$FOLDER_KOMPRES_IN${NC}                     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Bahan Audio  :${NC} ${C_BLUE}$FOLDER_AUDIO${NC}                          ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Output Folder:${NC} ${C_GREEN}$FOLDER_API_HASIL${NC}                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e " ${BOLD}${C_TEXT}📌 Konfirmasi Aksinya:${NC}"
    echo -e "  ${C_NUM}[1]${NC} Lanjutkan Rakit ASMR Api"
    echo -e "  ${C_NUM}[2]${NC} ${C_RED}Kembali ke Menu Utama${NC}"
    echo ""
    read -p " ❯ Masukkan Pilihan [1-2] (Default: 1): " sub_choice
    sub_choice="${sub_choice//[$'\t\r ']/}"
    if [ "$sub_choice" = "2" ]; then
        return
    fi

    if [ ! -f "$SCRIPT_DUAL_LOOP" ]; then
        echo -e "\n ${C_RED}[!] ERROR: Script '$SCRIPT_DUAL_LOOP' tidak ditemukan!${NC}\n"
        read -p " Tekan [Enter] untuk kembali..."
        return
    fi

    echo -e "\n ${C_TITLE}[*] Memulai Rakit Video & Audio ASMR Api...${NC}\n"
    export ASMR_TYPE="api"
    export FOLDER_INPUT="$FOLDER_KOMPRES_IN"
    export FOLDER_BAHAN="$FOLDER_AUDIO"
    export FOLDER_HASIL="$FOLDER_API_HASIL"
    bash "$SCRIPT_DUAL_LOOP"
    echo ""
    read -p " Tekan [Enter] untuk kembali..."
}

# Inisialisasi awal: Cek FFMPEG
check_requirements() {
    if ! command -v ffmpeg &>/dev/null; then
        echo -e " ${C_TITLE}[*] Memeriksa FFMPEG... Tidak ditemukan.${NC}"
        echo -e " ${C_TITLE}[*] Mengunduh & Menginstall FFMPEG otomatis...${NC}"
        pkg update -y && pkg install ffmpeg -y
        if [ $? -eq 0 ]; then
            echo -e " ${C_GREEN}[✓] FFMPEG Berhasil terinstall!${NC}"
            sleep 2
        else
            echo -e " ${C_RED}[!] Gagal mengunduh FFMPEG. Cek koneksi internet!${NC}"
            sleep 3
        fi
    fi
}

# Jalankan Cek Prasyarat
check_requirements

# Loop Utama Dashboard Menu
while true; do
    show_header
    echo ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_TEXT}📌 Apa yang ingin Anda buat?${NC}                          ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[1]${NC} ${BOLD}${C_PURPLE}Merakit Audio Seamless Durasi Panjang${NC}            ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ Penggabungan audio ASMR mulus (1 - 10 Jam)${NC}    ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[2]${NC} ${BOLD}${C_BLUE}Mengompres Video Massal${NC}                        ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ Kompresi & ubah ukuran banyak file video${NC}       ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[3]${NC} ${BOLD}${C_CYAN}Merakit Video & Audio ASMR Hujan${NC}                ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ High-Fidelity Rain (Tekstur Air & Partikel)${NC}   ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[4]${NC} ${BOLD}${C_TITLE}Merakit Video & Audio ASMR Api${NC}                  ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ Deep Dark Fire (Bebas Banding & Cahaya)${NC}        ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[5]${NC} ${BOLD}${C_GREEN}Buat & Siapkan Semua Folder Projek Otomatis${NC}     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ Otomatis siapkan semua folder di memori HP${NC}     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[6]${NC} ${BOLD}${C_AUTHOR}Cek & Perbarui Tools (Auto Update)${NC}              ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}      ${C_MUTED}↳ Perbarui ke fitur & perbaikan bug terbaru${NC}     ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${BOLD}${C_NUM}[7]${NC} ${BOLD}${C_RED}Keluar Program${NC}                                 ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
    echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}💬 LAYANAN BANTUAN & APRESIASI MAS ARIF${NC}              ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Saran, Kendala & Feedback:${NC}                         ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}    ${BOLD}${C_GREEN}📱 WhatsApp Mas Arif : 0851-7321-5732${NC}              ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}                                                      ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Traktir Kopi Mas Arif:${NC}                             ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}│${NC}    ${BOLD}${C_TITLE}☕ DANA Mas Arif     : 0851-7321-5732${NC}              ${C_BORDER}│${NC}"
    echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -ne " ${BOLD}${C_TITLE}❯ Masukkan Pilihan Menu [1-7]:${NC} "
    read main_choice
    main_choice="${main_choice//[$'\t\r ']/}"
    
    case $main_choice in
        1)
            run_audio_project
            ;;
        2)
            run_compress_project
            ;;
        3)
            run_asmr_hujan_project
            ;;
        4)
            run_asmr_api_project
            ;;
        5)
            setup_folders_interactive
            ;;
        6)
            run_auto_update
            ;;
        7)
            clear
            echo -e "${C_BORDER}╭──────────────────────────────────────────────────────╮${NC}"
            echo -e "${C_BORDER}│${NC} ${BOLD}${C_AUTHOR}       Terima kasih telah memakai Tools Mas Arif!      ${NC} ${C_BORDER}│${NC}"
            echo -e "${C_BORDER}│${NC} ${BOLD}${C_TITLE}       Semangat bikin konten ASMR Hujan & Api! 🌧️🔥     ${NC} ${C_BORDER}│${NC}"
            echo -e "${C_BORDER}├──────────────────────────────────────────────────────┤${NC}"
            echo -e "${C_BORDER}│${NC}  ${C_MUTED}• WhatsApp Mas Arif :${NC} ${C_GREEN}0851-7321-5732${NC}                  ${C_BORDER}│${NC}"
            echo -e "${C_BORDER}│${NC}  ${C_MUTED}• Traktir DANA     :${NC} ${C_TITLE}0851-7321-5732${NC}                  ${C_BORDER}│${NC}"
            echo -e "${C_BORDER}╰──────────────────────────────────────────────────────╯${NC}\n"
            exit 0
            ;;
        *)
            echo -e "\n ${C_RED}[!] Pilihan tidak valid! Masukkan angka 1 sampai 7.${NC}"
            sleep 1.5
            ;;
    esac
done
