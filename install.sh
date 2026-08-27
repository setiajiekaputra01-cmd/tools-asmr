#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#           INSTALLER DARING 1-KLIK TOOLS ASMR (MAS ARIF v1.1.0)
# ==============================================================================

clear
echo -e "\033[38;5;39m╭──────────────────────────────────────────────────────╮\033[0m"
echo -e "\033[38;5;39m│\033[0m \033[1m\033[38;5;220m   🚀 MEMASANG TOOLS LOOPING VIDEO ASMR (MAS ARIF)    \033[0m \033[38;5;39m│\033[0m"
echo -e "\033[38;5;39m╰──────────────────────────────────────────────────────╯\033[0m\n"

RAW_BASE="https://raw.githubusercontent.com/setiajiekaputra01-cmd/tools-asmr/main"

echo -e " \033[38;5;220m[*] Memeriksa & mengunduh berkas terbaru dari GitHub...\033[0m"
rm -rf ~/tools_asmr 2>/dev/null

# Metode 1: Menggunakan Git Clone
git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr 2>/dev/null

# Metode 2: Fallback Curl jika Git Clone gagal di jaringan HP tertentu
if [ ! -f "$HOME/tools_asmr/PROJEK_ASMR_HUJAN.sh" ]; then
    echo -e " \033[38;5;214m[*] Menggunakan metode unduh langsung (Curl Fallback)... \033[0m"
    mkdir -p ~/tools_asmr
    curl -sSL "$RAW_BASE/PROJEK_ASMR_HUJAN.sh" -o ~/tools_asmr/PROJEK_ASMR_HUJAN.sh
    curl -sSL "$RAW_BASE/asmr_dual_video_loop.sh" -o ~/tools_asmr/asmr_dual_video_loop.sh
    curl -sSL "$RAW_BASE/rakit_audio.sh" -o ~/tools_asmr/rakit_audio.sh
    curl -sSL "$RAW_BASE/kompres_massal.sh" -o ~/tools_asmr/kompres_massal.sh
    curl -sSL "$RAW_BASE/VERSION" -o ~/tools_asmr/VERSION
    curl -sSL "$RAW_BASE/push_update.sh" -o ~/tools_asmr/push_update.sh
fi

if [ -f "$HOME/tools_asmr/PROJEK_ASMR_HUJAN.sh" ]; then
    cp -f ~/tools_asmr/*.sh ~ 2>/dev/null
    chmod +x ~/*.sh 2>/dev/null
    
    # Buat Wrapper Executable Pintas di $PREFIX/bin/asmr
    cat << 'EOF' > $PREFIX/bin/asmr
#!/data/data/com.termux/files/usr/bin/bash
exec bash "$HOME/PROJEK_ASMR_HUJAN.sh" "$@"
EOF
    chmod +x $PREFIX/bin/asmr 2>/dev/null

    cat << 'EOF' > $PREFIX/bin/asmr-push
#!/data/data/com.termux/files/usr/bin/bash
exec bash "$HOME/push_update.sh" "$@"
EOF
    chmod +x $PREFIX/bin/asmr-push 2>/dev/null
    
    echo -e "\n\033[38;5;39m╭──────────────────────────────────────────────────────╮\033[0m"
    echo -e "\033[38;5;39m│\033[0m \033[1m\033[38;5;82m  🎉 SUKSES TOTAL! TOOLS ASMR BERHASIL TERPASANG!     \033[0m \033[38;5;39m│\033[0m"
    echo -e "\033[38;5;39m├──────────────────────────────────────────────────────┤\033[0m"
    echo -e "\033[38;5;39m│\033[0m   \033[38;5;255mBuka aplikasi kapan saja di Termux dengan ketik:    \033[0m \033[38;5;39m│\033[0m"
    echo -e "\033[38;5;39m│\033[0m   \033[1m\033[38;5;220m👉 asmr                                              \033[0m \033[38;5;39m│\033[0m"
    echo -e "\033[38;5;39m╰──────────────────────────────────────────────────────╯\033[0m\n"
else
    echo -e "\n \033[38;5;196m[!] Gagal mengunduh dari GitHub. Pastikan internet HP aktif!\033[0m\n"
fi
