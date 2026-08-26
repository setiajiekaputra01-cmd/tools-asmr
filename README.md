# 🌧️🔥 TOOLS LOOPING VIDEO ASMR (Mas Arif)

Tools otomatisasi pembuatan video ASMR durasi panjang (1 - 10 Jam) khusus Termux Android. Dilengkapi dengan optimasi visual **High-Fidelity Rain** (Hujan) & **Deep Dark Fire** (Api), kustomisasi resolusi, bitrate VBV capping, serta pembuatan audio seamless tanpa patahan.

---

## 🚀 Fitur Utama

- 🎵 **Merakit Audio Seamless:** Penggabungan audio mulus (1, 2, 4, 8, 10 Jam) dengan kustom Audio Fade-In & Fade-Out.
- 🎬 **Mengompres Video Massal:** Kompresi & ubah ukuran banyak video sekaligus hemat memori HP.
- 🌧️ **Merakit Video ASMR Hujan:** Optimasi visual tekstur air & tetesan hujan (`-tune grain`, CRF 23).
- 🔥 **Merakit Video ASMR Api:** Optimasi visual pencahayaan gelap & perapian (`aq-mode=2`, CRF 22).
- 🎛️ **Kustomisasi Lengkap:** Opsi Mode Intro / Tanpa Intro, Pilihan Resolusi (1080p/720p/480p), CRF, & Video Fade-In.
- 📂 **Manajemen Folder Otomatis:** Otomatis membuat struktur folder di memori internal HP (`/sdcard/PROJECT ASMR`).

---

## 📥 Cara Instalasi di Termux

Jalankan perintah ini di aplikasi Termux HP:

```bash
pkg update -y && pkg install ffmpeg git -y && termux-setup-storage
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/tools_asmr
cp ~/tools_asmr/*.sh ~ && chmod +x ~/*.sh && cp ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr && chmod +x $PREFIX/bin/asmr
```

---

## ⚡ Cara Menjalankan

Buka Termux dan ketik satu perintah:

```bash
asmr
```

---

## 👤 Kredit & Pembuat

- **Pengembang:** Mas Arif
- **Platform:** Termux Android & FFMPEG Engine
