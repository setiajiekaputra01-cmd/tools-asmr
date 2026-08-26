# 📘 BUKU PANDUAN LENGKAP DARAB BENER-BENER NOL (0)
## **TOOLS LOOPING VIDEO ASMR (Dibuat Oleh: Mas Arif)**
*Panduan Paling Detail, Mudah Dipahami, dan Dijamin Bisa untuk Orang Awam / Gaptek Sekalipun*

---

## 📌 DAFTAR ISI
1. [BAB 1: Mengenal 2 Aplikasi Utama yang Wajib Ada](#bab-1-mengenal-2-aplikasi-utama-yang-wajib-ada)
2. [BAB 2: Cara Menginstall Aplikasi (Termux & ZArchiver)](#bab-2-cara-menginstall-aplikasi-termux--zarchiver)
3. [BAB 3: Cara Pemasangan Tools Pertama Kali di Termux](#bab-3-cara-pemasangan-tools-pertama-kali-di-termux)
4. [BAB 4: Cara Memindahkan File Bahan Pakai ZArchiver](#bab-4-cara-memindahkan-file-bahan-pakai-zarchiver)
5. [BAB 5: Penjelasan Fungsi Semua Menu (Menu 1 sampai 7)](#bab-5-penjelasan-fungsi-semua-menu-menu-1-sampai-7)
6. [BAB 6: Urutan Langkah Kerja dari Awal Sampai Video Jadi (SOP)](#bab-6-urutan-langkah-kerja-dari-awal-sampai-video-jadi-sop)
7. [BAB 7: Khusus Pembuat (Mas Arif) - Cara Merilis Pembaruan](#bab-7-khusus-pembuat-mas-arif---cara-merilis-pembaruan)
8. [BAB 8: Solusi Masalah & Tanya Jawab (Troubleshooting)](#bab-8-solusi-masalah--tanya-jawab-troubleshooting)

---

## 🧩 BAB 1: MENGENAL 2 APLIKASI UTAMA YANG WAJIB ADA

Untuk membuat video ASMR durasi panjang (1 - 10 jam) di HP Android, Anda hanya membutuhkan **2 Aplikasi**:

1. **Termux (Mesin Pemproses Video & Audio)**
   * *Fungsi:* Tempat kita menjalankan perintah otomatis untuk menggabungkan, mengompres, dan merakit video/audio.
   * *Analogi:* Ini seperti mesin kompor dapur yang memasak bahan-bahan Anda.

2. **ZArchiver (Pengelola File HP)**
   * *Fungsi:* Tempat kita melihat, memindahkan, dan mengambil file video atau audio di dalam HP.
   * *Analogi:* Ini seperti rak piring atau lemari kulkas tempat menyimpan bahan-bahan Anda.

---

## 📥 BAB 2: CARA MENGINSTALL APLIKASI (TERMUX & ZARCHIVER)

### **1. Cara Install Termux (Wajib dari F-Droid)**
> ⚠️ **Penting:** Jangan menginstall Termux dari Google Play Store karena versi Play Store sudah mati dan pasti error.

* **Langkah 1:** Buka aplikasi Google Chrome di HP Anda.
* **Langkah 2:** Masukkan alamat link ini:  
  👉 **[f-droid.org/packages/com.termux](https://f-droid.org/en/packages/com.termux/)**
* **Langkah 3:** Scroll layar ke bawah, cari tulisan **"Download APK"**, lalu klik tombol tersebut.
* **Langkah 4:** Setelah file ter-download, buka file tersebut dan klik **Install**.
  *(Jika HP memunculkan peringatan "Izinkan dari sumber ini", aktifkan tombol Izinkan).*

### **2. Cara Install ZArchiver**
* **Langkah 1:** Buka aplikasi **Google Play Store** di HP Anda.
* **Langkah 2:** Ketik di kolom pencarian: **ZArchiver** (dengan ikon folder warna hijau).
* **Langkah 3:** Klik **Install**.

---

## 🚀 BAB 3: CARA PEMASANGAN TOOLS PERTAMA KALI DI TERMUX

Setelah Termux dan ZArchiver ter-install di HP Anda, ikuti langkah pemasangan otomatis ini:

### **Langkah 1: Buka Termux & Jalankan Perintah Persiapan**
1. Buka aplikasi **Termux**.
2. **Salin (Copy)** perintah satu baris di bawah ini:
   ```bash
   pkg update -y && pkg install ffmpeg git -y && termux-setup-storage
   ```
3. **Tempel (Paste)** di dalam layar hitam Termux, lalu tekan tombol **Enter** di keyboard HP.
4. **Saat Layar Pop-Up Izin Muncul:**  
   HP Anda akan menampilkan pesan: *"Izinkan Termux mengakses foto dan media?"*  
   👉 **Wajib Pilih: IZINKAN / ALLOW.**

### **Langkah 2: Salin Perintah Instalasi Utama**
Salin dan jalankan perintah satu baris di bawah ini ke layar Termux:

```bash
git clone https://github.com/setiajiekaputra01-cmd/tools-asmr.git ~/tools_asmr && cp ~/tools_asmr/*.sh ~ && chmod +x ~/*.sh && cp ~/PROJEK_ASMR_HUJAN.sh $PREFIX/bin/asmr && chmod +x $PREFIX/bin/asmr
```
Tekan **Enter**.

🎉 **Selamat!** Tools buatan Mas Arif kini sudah terpasang 100% dan siap digunakan kapan saja!

---

## 📂 BAB 4: CARA MEMINDAHKAN FILE BAHAN PAKAI ZARCHIVER

Tools ini secara otomatis membuatkan folder penyimpanan di memori internal HP Anda. 

### **Cara Melihat Folder Pakai Aplikasi ZArchiver:**
1. Buka aplikasi **ZArchiver**.
2. Masuk ke **Memori Perangkat (Internal Storage)**.
3. Cari folder bernama **`PROJECT ASMR`**.

Di dalam folder `PROJECT ASMR`, terdapat sub-folder dengan fungsi masing-masing:

| Nama Folder | Fungsi Folder |
| :--- | :--- |
| 📁 **`PROJECT ASMR/AUDIO`** | **Tempat Menaruh Audio Mentah.** Taruh file lagu/suara mentah 15 menit (misal `audio_bandlab.m4a`) di sini. |
| 📁 **`PROJECT ASMR/SEBELUM LOOP`** | **Tempat Menaruh Video Mentah.** Taruh file video mentah HP yang ingin di-loop atau dikompres di sini. |
| 📁 **`PROJECT ASMR/HASIL HUJAN`** | **Tempat Video ASMR Hujan.** File video hasil rakitan ASMR Hujan 10 jam akan otomatis tersimpan di sini. |
| 📁 **`PROJECT ASMR/HASIL API`** | **Tempat Video ASMR Api.** File video hasil rakitan ASMR Api 10 jam akan otomatis tersimpan di sini. |
| 📁 **`PROJECT ASMR/HASIL KOMPRES`** | **Tempat Video Kompresi.** Hasil kompresi video massal akan tersimpan di sini. |

---

## 🛠️ BAB 5: PENJELASAN FUNGSI SEMUA MENU (MENU 1 SAMPAI 7)

Setiap kali Anda mengetik perintah **`asmr`** di Termux, akan muncul 7 pilihan menu utama:

---

### 🎵 **Menu [1] Merakit Audio Seamless Durasi Panjang**
* **Fungsi:** Mengubah audio mentah pendek 15 menit menjadi satu file audio mulus durasi panjang (1, 2, 4, 8, atau 10 Jam) **tanpa jeda patahan/suara klik**.
* **Fitur Kustomisasi:**
  * *Pilih Durasi:* 1 Jam, 2 Jam, 4 Jam, 8 Jam, atau 10 Jam.
  * *Audio Fade-In:* Suara audio masuk secara perlahan (misal 5 detik).
  * *Audio Fade-Out:* Suara audio mengecil perlahan di akhir video (misal 5 detik).

---

### 🎬 **Menu [2] Mengompres Video Massal**
* **Fungsi:** Mengecilkan ukuran file (*file size*) dan resolusi banyak video sekaligus agar memori HP tidak cepat penuh.
* **Fitur Kustomisasi:**
  * *Resolusi:* 1080p, 720p (Rekomendasi Hemat), 480p, atau Original.
  * *Tingkat Kompresi:* CRF 23 (Kualitas Bagus), CRF 26 (Hemat Storage), CRF 28 (Super Hemat).

---

### 🌧️ **Menu [3] Merakit Video & Audio ASMR Hujan**
* **Fungsi:** Merakit video dan audio khusus konten **ASMR Hujan** durasi panjang (10 jam).
* **Profil Visual Khusus:** Menggunakan racikan `-tune grain` (CRF 23) agar **tetesan air hujan, cipratan air, dan tekstur basah tetap tajam & jernih** tanpa blur.
* **Pilihan Mode Video:**
  * *Dengan Intro:* Jika file video bernama berurutan (`1.mp4` = Intro, `2.mp4` = Loop Body).
  * *Tanpa Intro:* Jika nama file video acak/bebas (misal `hujan1.mp4`, `hujan_deras.mp4`).

---

### 🔥 **Menu [4] Merakit Video & Audio ASMR Api**
* **Fungsi:** Merakit video dan audio khusus konten **ASMR Api / Perapian (Fireplace)**.
* **Profil Visual Khusus:** Menggunakan racikan `Deep Dark Fire` (`aq-mode=2`, CRF 22) untuk **mencegah garis patahan warna (color banding)** pada latar belakang kamar gelap dan menjaga pendaran bara api tetap lembut.

---

### 📁 **Menu [5] Buat & Siapkan Semua Folder Projek Otomatis**
* **Fungsi:** Pilihan darurat untuk memverifikasi atau membuat ulang seluruh folder di memori HP secara otomatis tanpa perlu buat folder manual.

---

### 🔄 **Menu [6] Cek & Perbarui Tools (Auto Update)**
* **Fungsi:** Memeriksa apakah Mas Arif baru saja merilis fitur baru atau perbaikan bug di GitHub. Jika ada versi baru, tools akan ter-update otomatis dengan 1 klik.

---

### 🚪 **Menu [7] Keluar Program**
* **Fungsi:** Menutup tools dan kembali ke terminal biasa.

---

## 📋 BAB 6: URUTAN LANGKAH KERJA DARI AWAL SAMPAI VIDEO JADI (SOP)

Berikut adalah urutan langkah demi langkah yang harus dilakukan setiap kali ingin membuat konten:

```text
[LANGKAH 1: SIAPKAN BAHAN PAKAI ZARCHIVER]
   │  • Buka ZArchiver
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
[LANGKAH 5: AMBIL VIDEO DI ZARCHIVER]
   │  • Buka ZArchiver ➔ folder "PROJECT ASMR/HASIL HUJAN" (atau HASIL API)
   └─ • Video durasi panjang siap Anda upload ke YouTube / TikTok / Reels!
```

---

## 👑 BAB 7: KHUSUS PEMBUAT (MAS ARIF) - CARA MERILIS PEMBARUAN

> ⚠️ *Bagian ini khusus untuk Mas Arif ketika ingin mempublikasikan fitur baru.*

Jika Mas Arif telah selesai mengedit atau menambah fitur baru di skrip HP milik Mas Arif, jalankan perintah ini di Termux:

```bash
asmr-push
```

### **Apa Yang Terjadi Setelah Mengetik `asmr-push`?**
1. Skrip akan menanyakan nomor versi baru (misal `v1.2.0`).
2. Skrip menanyakan catatan pembaruan.
3. Skrip otomatis mempublikasikan pembaruan ke GitHub.
4. **Seluruh pengguna lain di mana saja akan melihat notifikasi lonceng update `🔔 (Versi v1.2.0 Tersedia!)` saat mereka membuka aplikasi!**

---

## 🛠️ BAB 8: SOLUSI MASALAH & TANYA JAWAB (TROUBLESHOOTING)

### **Q1: Apakah Layar HP Harus Tetap Menyala Saat Rendering Video 10 Jam?**
**Jawab:** Tidak perlu! Tools ini dilengkapi fitur *Wake Lock* otomatis. Layar HP Anda boleh dikunci atau diredupkan, dan Termux akan tetap bekerja menyelesaikan video di latar belakang (*background*).

### **Q2: Bagaimana Jika Memori HP Saya Pas-pasan?**
**Jawab:** Pilih resolusi **`720p`** dan tingkat kompresi **`CRF 26`**. Pengaturan ini akan membatasi ukuran video 10 jam hanya sekitar **1 - 1.5 GB** tanpa mengurangi kejernihan gambar di layar smartphone maupun TV.

### **Q3: Bagaimana Jika Saya Salah Pilih Menu di Tengah Jalan?**
**Jawab:** Di setiap tahap pertanyaan, Anda selalu bisa memilih angka **`[2]`** (Kembali ke Menu Utama) atau mengetik angka **`[0]`** untuk membatalkan dan kembali ke tampilan awal.

### **Q4: Bagaimana Jika Muncul Pesan `Permission denied`?**
**Jawab:** Buka Termux, lalu ketik perintah: `termux-setup-storage` dan pilih **Izinkan / Allow** pada layar HP.

---
*Buku Panduan ini dibuat khusus untuk mempermudah alur kerja pembuatan konten ASMR Hujan & Api. Selamat berkarya!* 🌧️🔥
