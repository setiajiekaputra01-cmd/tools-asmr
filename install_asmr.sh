#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
#                 INSTALLER AUTOMATIS TOOLS LOOPING VIDEO
#                      Tools Dibuat Oleh: Mas Arif
# ==============================================================================

echo "======================================================"
echo "   🚀 SKRIP INSTALLER TOOLS LOOPING VIDEO (MAS ARIF)"
echo "======================================================"
echo ""

# 1. Update paket Termux & Install FFMPEG
echo "[1/4] Menginstall dependensi utama (FFMPEG)..."
pkg update -y && pkg install ffmpeg -y

# 2. Minta Izin Storage SDCard
echo "[2/4] Meminta izin akses penyimpanan HP (Storage)..."
termux-setup-storage

# 3. Buat Folder Projek Otomatis
echo "[3/4] Membuat struktur folder /sdcard/PROJECT ASMR..."
mkdir -p "/sdcard/PROJECT ASMR/AUDIO" \
         "/sdcard/PROJECT ASMR/SEBELUM LOOP" \
         "/sdcard/PROJECT ASMR/HASIL HUJAN" \
         "/sdcard/PROJECT ASMR/HASIL API" \
         "/sdcard/PROJECT ASMR/HASIL KOMPRES" \
         "/sdcard/PROJECT ASMR/BAHAN MENTAH" \
         "$HOME/temp_asmr"

# 4. Buat Shortcut Perintah 'asmr'
echo "[4/4] Membuat shortcut perintah 'asmr'..."
chmod +x "$HOME/PROJEK_ASMR_HUJAN.sh" "$HOME/asmr_dual_video_loop.sh" "$HOME/rakit_audio.sh" "$HOME/kompres_massal.sh" 2>/dev/null

cp -f "$HOME/PROJEK_ASMR_HUJAN.sh" "$PREFIX/bin/asmr" 2>/dev/null || cat << 'EOF' > "$PREFIX/bin/asmr"
#!/data/data/com.termux/files/usr/bin/bash
exec /data/data/com.termux/files/home/PROJEK_ASMR_HUJAN.sh "$@"
EOF

chmod +x "$PREFIX/bin/asmr" "$HOME/asmr" 2>/dev/null

echo ""
echo "======================================================"
echo "🎉 INSTALLASI SELESAI BRO!"
echo "➔ Untuk menjalankan tools, cukup ketik: asmr"
echo "======================================================"
