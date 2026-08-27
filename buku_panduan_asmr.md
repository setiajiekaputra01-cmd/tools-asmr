# 📘 BUKU PANDUAN MASTER DARAB BENER-BENER NOL (0)
## **TOOLS LOOPING VIDEO ASMR (Dibuat Oleh: Mas Arif v1.1.0)**
*Panduan Paling Detail, Mudah Dipahami, dan Dijamin 100% Bisa untuk Orang Awam / Gaptek Sekalipun*

---

## 📌 DAFTAR ISI
1. [BAB 1: Mengenal Aplikasi Utama yang Dibutuhkan](#bab-1-mengenal-aplikasi-utama-yang-dibutuhkan)
2. [BAB 2: Cara Download & Install Termux dari Nol](#bab-2-cara-download--install-termux-dari-nol)
3. [BAB 3: Panduan Pemasangan Tools Pertama Kali di Termux](#bab-3-panduan-pemasangan-tools-pertama-kali-di-termux)
4. [BAB 4: Struktur Folder & Cara Memindahkan File Pakai File Manager HP](#bab-4-struktur-folder--cara-memindahkan-file-pakai-file-manager-hp)
5. [BAB 5: Penjelasan & Panduan Praktek Layar Demi Layar Menu 1-7](#bab-5-penjelasan--panduan-praktek-layar-demi-layar-menu-1-7)
6. [BAB 6: Urutan Langkah Kerja dari Awal Sampai Video Jadi (SOP)](#bab-6-urutan-langkah-kerja-dari-awal-sampai-video-jadi-sop)
7. [BAB 7: Khusus Pembuat (Mas Arif) - Cara Merilis Pembaruan (asmr-push)](#bab-7-khusus-pembuat-mas-arif---cara-merilis-pembaruan-asmr-push)
8. [BAB 8: Layanan Bantuan WhatsApp & Traktir Kopi DANA](#bab-8-layanan-bantuan-whatsapp--traktir-kopi-dana)
9. [BAB 9: Solusi Masalah & Tanya Jawab (Troubleshooting)](#bab-9-solusi-masalah--tanya-jawab-troubleshooting)

---

## 🧩 BAB 1: MENGENAL APLIKASI UTAMA YANG DIBUTUHKAN

Untuk membuat video ASMR durasi panjang (1 - 10 jam) di HP Android, Anda hanya membutuhkan **2 Aplikasi Utama**:

1. **Termux (Mesin Pemproses Video & Audio)**
   * *Fungsi:* Tempat kita menjalankan perintah otomatis untuk menggabungkan, mengompres, dan merakit video/audio.
   * *Analogi:* Ini seperti mesin kompor dapur tempat memasak bahan-bahan Anda.

2. **File Manager / Pengelola File Bawaan HP Anda**
   * *Fungsi:* Tempat biasa Anda melihat foto, lagu, atau video di HP (Misal: aplikasi *File Manager*, *Pengelola File*, *My Files*, atau *File* bawaan Samsung/Xiaomi/Oppo/Vivo/Realme).
   * *Analogi:* Ini seperti lemari kulkas tempat menyimpan bahan-bahan Anda.

---

## 📥 BAB 2: CARA DOWNLOAD & INSTALL TERMUX DARI NOL

> ⚠️ **Penting:** Jangan menginstall Termux dari Google Play Store karena versi Play Store sudah mati/tidak diperbarui dan pasti error.

* **Langkah 1:** Buka aplikasi Google Chrome di HP Anda.
* **Langkah 2:** Masukkan alamat link resmi ini:  
  👉 **[f-droid.org/packages/com.termux](https://f-droid.org/en/packages/com.termux/)**
* **Langkah 3:** Scroll layar ke bawah, cari tulisan **"Download APK"**, lalu klik tombol tersebut.
* **Langkah 4:** Setelah file ter-download, buka file tersebut dan klik **Install**.
  *(Jika HP memunculkan peringatan "Izinkan instalasi dari sumber ini", aktifkan tombol Izinkan).*

---

## 🚀 BAB 3: PANDUAN PEMASANGAN TOOLS PERTAMA KALI DI TERMUX

Setelah aplikasi Termux ter-install di HP Anda, buka aplikasi Termux dan ikuti panduan instalasi di bawah ini:

### ⚡ **CARA 1: PERINTAH 1-KLIK OTOMATIS (TERCEPAT)**
Salin (Copy) kode 1-baris di bawah ini secara utuh, lalu Tempel (Paste) di layar Termux:

```bash
pkg update -y && pkg install ffmpeg git -y && termux-setup-storage && git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr && cp ~/tools_asmr/*.sh ~ && chmod +x ~/*.sh && cp ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr && chmod +x $PREFIX/bin/asmr && cp ~/push_update.sh $PREFIX/bin/asmr-push 2>/dev/null && chmod +x $PREFIX/bin/asmr-push 2>/dev/null
```
Tekan **Enter**.

> ⚠️ **Penting saat Layar Pop-Up Izin Muncul:**  
> HP Anda akan menampilkan pesan: *"Izinkan Termux mengakses foto dan media?"*  
> 👉 **Wajib Pilih: IZINKAN / ALLOW.**

---

### 📋 **CARA 2: PANDUAN TAHAP DEMI TAHAP (STEP-BY-STEP)**

Jika Anda ingin mengetik satu per satu:

* **Tahap 1: Perbarui Sistem & Install Mesin Video/Audio**
  ```bash
  pkg update -y && pkg install ffmpeg git -y
  ```

* **Tahap 2: Berikan Izin Memori HP**
  ```bash
  termux-setup-storage
  ```
  *(Pilih **IZINKAN / ALLOW** di layar HP).*

* **Tahap 3: Download Skrip dari GitHub Resmi Mas Arif**
  ```bash
  git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr
  ```

* **Tahap 4: Aktifkan Perintah `asmr`**
  ```bash
  cp ~/tools_asmr/*.sh ~ && chmod +x ~/*.sh && cp ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr && chmod +x $PREFIX/bin/asmr
  ```

🎉 **Selamat!** Tools buatan Mas Arif kini sudah terpasang 100% dan siap digunakan kapan saja dengan mengetik: **`asmr`**.

---

## 📂 BAB 4: STRUKTUR FOLDER & CARA MEMINDAHKAN FILE PAKAI FILE MANAGER HP

Tools ini secara otomatis membuatkan folder penyimpanan di memori internal HP Anda. 

### **Cara Melihat Folder Pakai File Manager HP:**
1. Buka aplikasi **File Manager / Pengelola File** bawaan HP Anda.
2. Masuk ke **Penyimpanan Internal (Internal Storage)**.
3. Cari folder bernama **`PROJECT ASMR`**.

Di dalam folder `PROJECT ASMR`, terdapat sub-folder dengan fungsi masing-masing:

| Nama Folder | Fungsi Folder |
| :--- | :--- |
| 📁 **`PROJECT ASMR/AUDIO`** | **Tempat Menaruh Audio Mentah.** Taruh file lagu/suara mentah 15 menit (misal `suara_hujan_mentah.m4a`) di sini. |
| 📁 **`PROJECT ASMR/SEBELUM LOOP`** | **Tempat Menaruh Video Mentah.** Taruh file video mentah HP yang ingin di-loop atau dikompres di sini. |
| 📁 **`PROJECT ASMR/HASIL HUJAN`** | **Tempat Video ASMR Hujan.** File video hasil rakitan ASMR Hujan 10 jam akan otomatis tersimpan di sini. |
| 📁 **`PROJECT ASMR/HASIL API`** | **Tempat Video ASMR Api.** File video hasil rakitan ASMR Api 10 jam akan otomatis tersimpan di sini. |
| 📁 **`PROJECT ASMR/HASIL KOMPRES`** | **Tempat Video Kompresi.** Hasil kompresi video massal akan tersimpan di sini. |

---

## 🛠️ BAB 5: PENJELASAN & PANDUAN PRAKTEK LAYAR DEMI LAYAR MENU 1-7

Setiap kali Anda mengetik perintah **`asmr`** di Termux, akan muncul menu utama berpenampilan full-screen dinamis:

---

### 🎵 **MENU 1: MERAKIT AUDIO SEAMLESS DURASI PANJANG**
* **Fungsi:** Mengubah audio mentah pendek 15 menit menjadi satu file audio mulus durasi panjang (1, 2, 4, 8, atau 10 Jam) **dijamin 100% tanpa patahan/suara klik**.
* **Praktek Pengetikan:**
  1. Ketik `1` ➔ Tekan **Enter** (Konfirmasi).
  2. Lokasi Audio: Tekan **Enter** langsung (Otomatis memakai file audio yang ada di folder).
  3. Durasi Output: Ketik `5` (10 Jam) ➔ Tekan **Enter**.
  4. Audio Fade-In: Ketik `5` (5 Detik) ➔ Tekan **Enter**.
  5. Audio Fade-Out: Ketik `5` (5 Detik) ➔ Tekan **Enter**.
* **Hasil File:** 📂 **`PROJECT ASMR/AUDIO/audio_10jam_mulus.m4a`**.

---

### 🎬 **MENU 2: MENGOMPRES VIDEO MASSAL**
* **Fungsi:** Mengecilkan ukuran file (*file size*) dan resolusi banyak video sekaligus agar memori HP hemat.
* **Praktek Pengetikan:**
  1. Ketik `1` ➔ Tekan **Enter** (Konfirmasi).
  2. Resolusi Target: Ketik `2` (720p HD Hemat) ➔ Tekan **Enter**.
  3. Tingkat Kompresi: Ketik `2` (CRF 26 Kompresi Tinggi) ➔ Tekan **Enter**.
* **Hasil File:** 📂 **`PROJECT ASMR/HASIL KOMPRES/`**.

---

### 🌧️ **MENU 3: MERAKIT VIDEO & AUDIO ASMR HUJAN**
* **Fungsi:** Merakit video dan audio khusus konten **ASMR Hujan** durasi panjang (10 jam).
* **Profil Visual Khusus:** Menggunakan racikan `-tune grain` (CRF 23) agar **tetesan air hujan, cipratan air, dan tekstur basah tetap tajam & jernih** tanpa blur.
* **Praktek Pengetikan:**
  1. Ketik `1` ➔ Tekan **Enter** (Konfirmasi).
  2. Mode Video: Ketik `2` (Tanpa Intro / Nama Video Bebas) ➔ Tekan **Enter**.
  3. Resolusi: Ketik `2` (720p HD) ➔ Tekan **Enter**.
  4. Kualitas Visual: Ketik `2` (CRF 23 Seimbang) ➔ Tekan **Enter**.
  5. Video Fade-In: Ketik `3` (3 Detik Hitam ke Terang) ➔ Tekan **Enter**.
  6. Pilih Audio: Ketik `1` (File audio rakitan 10 jam) ➔ Tekan **Enter**.
* **Hasil File:** 📂 **`PROJECT ASMR/HASIL HUJAN/`**.

---

### 🔥 **MENU 4: MERAKIT VIDEO & AUDIO ASMR API**
* **Fungsi:** Merakit video dan audio khusus konten **ASMR Api / Perapian (Fireplace)**.
* **Profil Visual Khusus:** Menggunakan racikan `Deep Dark Fire` (`aq-mode=2`, CRF 22) untuk **mencegah garis patahan warna (color banding)** pada latar belakang kamar gelap dan menjaga pendaran bara api tetap lembut.
* **Hasil File:** 📂 **`PROJECT ASMR/HASIL API/`**.

---

### 📁 **MENU 5: BUAT & SIAPKAN SEMUA FOLDER PROJEK OTOMATIS**
* **Fungsi:** Menu cepat jika folder projek terhapus atau ingin mereset folder.
* **Cara Pakai:** Ketik `5` ➔ Tekan **Enter** ➔ Tekan **Enter** lagi untuk kembali ke dashboard.

---

### 🔄 **MENU 6: CEK & PERBARUI TOOLS (AUTO UPDATE)**
* **Fungsi:** Memeriksa pembaruan skrip di GitHub dari Mas Arif.
* **Cara Pakai:** Ketik `6` ➔ Tekan **Enter**. Jika ada versi baru, ketik `1` ➔ Tekan **Enter** (Ter-update otomatis).

---

### 🚪 **MENU 7: KELUAR PROGRAM**
* **Fungsi:** Menutup program `asmr`.
* **Cara Pakai:** Ketik `7` ➔ Tekan **Enter**.

---

## 📋 BAB 6: URUTAN LANGKAH KERJA DARI AWAL SAMPAI VIDEO JADI (SOP)

```text
[LANGKAH 1: SIAPKAN BAHAN PAKAI FILE MANAGER BAWAAN HP]
   │  • Buka aplikasi File Manager / Pengelola File HP
   │  • Masukkan Audio 15 Menit ➔ folder "PROJECT ASMR/AUDIO"
   │  • Masukkan Video Mentah  ➔ folder "PROJECT ASMR/SEBELUM LOOP"
   ▼
[LANGKAH 2: BUKA TERMUX]
   │  • Buka aplikasi Termux
   │  • Ketik perintah: asmr
   │  • Tekan Enter
   ▼
[LANGKAH 3: PILIH MENU & JAWAB PERTANYAAN INTERAKTIF]
   │  • Pilih Menu [1] untuk merakit audio dulu (atau langsung Menu [3] / [4])
   │  • Jawab pilihan Mode Intro / Tanpa Intro
   │  • Jawab pilihan Resolusi (720p / 1080p)
   │  • Jawab pilihan Video Fade-In (3 detik)
   ▼
[LANGKAH 4: PROSES RENDERING BERJALAN]
   │  • Biarkan Termux bekerja (Layar HP boleh dikunci / redup)
   │  • Tunggu sampai muncul tulisan hijau: "SUKSES! Video ASMR berhasil dicetak!"
   ▼
[LANGKAH 5: AMBIL VIDEO DI FILE MANAGER HP]
   │  • Buka File Manager HP ➔ folder "PROJECT ASMR/HASIL HUJAN" (atau HASIL API)
   └─ • Video durasi panjang siap Anda upload ke YouTube / TikTok / Reels!
```

---

## 👑 BAB 7: KHUSUS PEMBUAT (MAS ARIF) - CARA MERILIS PEMBARUAN

> ⚠️ *Bagian ini khusus untuk Mas Arif ketika ingin mempublikasikan fitur baru.*

Jika Mas Arif telah selesai mengedit atau menambah fitur baru di skrip HP milik Mas Arif, jalankan perintah ini di Termux:

```bash
asmr-push
```
*Skrip akan menanyakan versi baru (misal `v1.2.0`) dan commit note, lalu mempublikasikannya ke GitHub. Seluruh pengguna lain di mana saja akan langsung menerima notifikasi update otomatis saat membuka aplikasi!*

---

## 💬 BAB 8: LAYANAN BANTUAN WHATSAPP & TRAKTIR KOPI DANA

* 📱 **Saran, Kendala & Feedback:** WhatsApp Mas Arif (`0851-7321-5732`)
* ☕ **Traktir Kopi Mas Arif:** Kirim via DANA (`0851-7321-5732`)

---

## 🛠️ BAB 9: SOLUSI MASALAH & TANYA JAWAB (TROUBLESHOOTING)

### **Q1: Apakah Layar HP Harus Tetap Menyala Saat Rendering Video 10 Jam?**
**Jawab:** Tidak perlu! Tools ini dilengkapi fitur *Wake Lock* otomatis. Layar HP Anda boleh dikunci atau diredupkan, dan Termux akan tetap bekerja menyelesaikan video di latar belakang (*background*).

### **Q2: Bagaimana Jika Memori HP Saya Pas-pasan?**
**Jawab:** Pilih resolusi **`720p`** dan tingkat kompresi **`CRF 26`**. Pengaturan ini akan membatasi ukuran video 10 jam hanya sekitar **1 - 1.5 GB** tanpa mengurangi kejernihan gambar di layar smartphone maupun TV.

### **Q3: Bagaimana Jika Saya Salah Pilih Menu di Tengah Jalan?**
**Jawab:** Di setiap tahap pertanyaan, Anda selalu bisa memilih angka **`[2]`** (Kembali ke Menu Utama) atau mengetik angka **`[0]`** untuk membatalkan dan kembali ke tampilan awal.

---
*Buku Panduan Master v1.1.0 ini disimpan & dipublikasikan secara resmi di GitHub!* 🌧️🔥
