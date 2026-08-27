#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#           INSTALLER DARING 1-KLIK TOOLS ASMR (MAS ARIF v1.1.0)
# ==============================================================================

clear
echo -e "\033[38;5;39m╭──────────────────────────────────────────────────────╮\033[0m"
echo -e "\033[38;5;39m│\033[0m \033[1m\033[38;5;220m   🚀 MEMASANG TOOLS LOOPING VIDEO ASMR (MAS ARIF)    \033[0m \033[38;5;39m│\033[0m"
echo -e "\033[38;5;39m╰──────────────────────────────────────────────────────╯\033[0m\n"

echo -e " \033[38;5;220m[*] Memeriksa & mengunduh berkas terbaru dari GitHub...\033[0m"
rm -rf ~/tools_asmr
git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr

if [ $? -eq 0 ] && [ -f "$HOME/tools_asmr/PROJEK_ASMR_HUJAN.sh" ]; then
    cp -f ~/tools_asmr/*.sh ~ 2>/dev/null
    chmod +x ~/*.sh 2>/dev/null
    cp -f ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr 2>/dev/null
    chmod +x $PREFIX/bin/asmr 2>/dev/null
    cp -f ~/push_update.sh $PREFIX/bin/asmr-push 2>/dev/null
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
