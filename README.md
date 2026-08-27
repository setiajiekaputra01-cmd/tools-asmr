# 🌧️🔥 TOOLS LOOPING VIDEO ASMR (Mas Arif) v1.1.0

Tools otomatisasi pembuatan video & audio ASMR durasi panjang (1 - 10 Jam) khusus Termux Android. Dilengkapi dengan optimasi visual **High-Fidelity Rain** (Hujan) & **Deep Dark Fire** (Api), kustomisasi resolusi, VBV bitrate capping, serta pembuatan audio seamless tanpa patahan.

---

## 🚀 Fitur Utama

- 🎵 **Merakit Audio Seamless:** Penggabungan audio mulus (1, 2, 4, 8, 10 Jam) dengan kustom Audio Fade-In & Fade-Out.
- 🎬 **Mengompres Video Massal:** Kompresi & ubah ukuran banyak video sekaligus hemat memori HP.
- 🌧️ **Merakit Video ASMR Hujan:** Optimasi visual tekstur air & tetesan hujan (`-tune grain`, CRF 23).
- 🔥 **Merakit Video ASMR Api:** Optimasi visual pencahayaan gelap & perapian (`aq-mode=2`, CRF 22).
- 🎛️ **Kustomisasi Lengkap:** Opsi Mode Intro / Tanpa Intro, Pilihan Resolusi (1080p/720p/480p), CRF, & Video Fade-In.
- 📁 **Manajemen Folder Otomatis:** Otomatis membuat struktur folder di memori internal HP (`/sdcard/PROJECT ASMR`).
- 🔄 **Sistem Auto Update (Menu 6):** Cek & perbarui aplikasi otomatis dari GitHub dengan 1 klik.

---

## 📥 Perintah Instalasi 1-Klik di Termux

Cukup salin dan tempel perintah 1-baris di bawah ini ke layar Termux:

```bash
pkg update -y && pkg install ffmpeg git -y && termux-setup-storage && git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr && cp ~/tools_asmr/*.sh ~ && chmod +x ~/*.sh && cp ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr && chmod +x $PREFIX/bin/asmr && cp ~/push_update.sh $PREFIX/bin/asmr-push 2>/dev/null && chmod +x $PREFIX/bin/asmr-push 2>/dev/null
```

---

## ⚡ Cara Menjalankan

Setelah instalasi selesai, cukup buka Termux dan ketik perintah:

```bash
asmr
```

---

## 👑 Kredit & Pembuat
- **Dibuat Oleh:** Mas Arif (`v1.1.0`)
- **WhatsApp Support:** `0851-7321-5732`
- **Traktir Kopi DANA:** `0851-7321-5732`
