# 📘 BUKU PANDUAN MASTER ULTRA-DETAIL (STEP-BY-STEP)
## **TOOLS LOOPING VIDEO ASMR (Dibuat Oleh: Mas Arif)**
*Panduan 100% Detail Pengetikan & Tampilan Layar dari Menu 1 sampai Menu 7*

---

## 📌 DAFTAR ISI
1. [Langkah Persiapan Bahan di File Manager HP](#langkah-persiapan-bahan-di-file-manager-hp)
2. [MENU 1: Merakit Audio Seamless Durasi Panjang (Lengkap)](#menu-1-merakit-audio-seamless-durasi-panjang-lengkap)
3. [MENU 2: Mengompres Video Massal (Lengkap)](#menu-2-mengompres-video-massal-lengkap)
4. [MENU 3: Merakit Video & Audio ASMR Hujan (Lengkap)](#menu-3-merakit-video--audio-asmr-hujan-lengkap)
5. [MENU 4: Merakit Video & Audio ASMR Api (Lengkap)](#menu-4-merakit-video--audio-asmr-api-lengkap)
6. [MENU 5: Buat & Siapkan Semua Folder Projek Otomatis](#menu-5-buat--siapkan-semua-folder-projek-otomatis)
7. [MENU 6: Cek & Perbarui Tools / Auto Update](#menu-6-cek--perbarui-tools--auto-update)
8. [MENU 7: Keluar Program](#menu-7-keluar-program)

---

## 🛑 LANGKAH PERSIAPAN BAHAN DI FILE MANAGER HP

Buka aplikasi **File Manager / Pengelola File** bawaan HP Anda sebelum membuka Termux:

1. **Menyiapkan Audio Mentah:**
   * Pindahkan file audio mentah (15 menit) ke folder:  
     📁 **`Penyimpanan Internal` ➔ `PROJECT ASMR` ➔ `AUDIO`**  
     *(Contoh nama file: `suara_hujan_mentah.m4a`)*.

2. **Menyiapkan Video Mentah:**
   * Pindahkan file video mentah HP ke folder:  
     📁 **`Penyimpanan Internal` ➔ `PROJECT ASMR` ➔ `SEBELUM LOOP`**  
     *(Contoh nama file: `video_hujan1.mp4` & `video_hujan2.mp4`)*.

---

## 🎵 MENU 1: MERAKIT AUDIO SEAMLESS DURASI PANJANG (LENGKAP)

### **Langkah Pengeksekusian:**
1. Buka aplikasi **Termux**, ketik `asmr` lalu tekan **Enter**.
2. Di layar utama, ketik angka **`1`** lalu tekan **Enter**.

### **Pertanyaan & Pengetikan Layar Demi Layar:**

* **Pertanyaan 1: Konfirmasi Aksinya**
  ```text
  📌 Konfirmasi Aksinya:
    [1] Lanjutkan Rakit Audio
    [2] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `1` ➔ Tekan **Enter**.

* **Pertanyaan 2: Informasi Bahan Audio**
  ```text
  📁 Informasi Bahan Audio:
     Folder Default: /sdcard/PROJECT ASMR/AUDIO
  ➔ Masukkan lokasi file audio (Default: /sdcard/PROJECT ASMR/AUDIO/audio_bandlab.m4a):
  ```
  👉 **Yang Anda ketik:** Langsung tekan **Enter** *(Otomatis memakai file audio yang ada di folder)*.

* **Pertanyaan 3: Pilih Durasi Output Audio**
  ```text
  ⏱️ Pilih Durasi Output Audio:
    [1] 1 Jam (Seamless, Loop)
    [2] 2 Jam (Seamless, Loop)
    [3] 4 Jam (Seamless, Loop)
    [4] 8 Jam (Seamless, Loop)
    [5] 10 Jam (Seamless, Loop) [Rekomendasi]
    [6] Custom Jam (Ketik Manual)
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `5` ➔ Tekan **Enter**.

* **Pertanyaan 4: Audio Fade-In (Suara Masuk Perlahan)**
  ```text
  🔊 Pengaturan Audio Fade-In (Masuk Perlahan):
  ➔ Masukkan durasi Fade-In dalam detik (0 = Tanpa Fade-In, Default: 5):
  ```
  👉 **Yang Anda ketik:** `5` ➔ Tekan **Enter**.

* **Pertanyaan 5: Audio Fade-Out (Suara Keluar Perlahan)**
  ```text
  🔉 Pengaturan Audio Fade-Out (Keluar Perlahan):
  ➔ Masukkan durasi Fade-Out dalam detik (0 = Tanpa Fade-Out, Default: 5):
  ```
  👉 **Yang Anda ketik:** `5` ➔ Tekan **Enter**.

* **Hasil Akhir:** File audio mulus `.m4a` 10 jam tersimpan di folder HP:  
  📂 **`PROJECT ASMR/AUDIO/audio_10jam_mulus.m4a`**.

---

## 🎬 MENU 2: MENGOMPRES VIDEO MASSAL (LENGKAP)

### **Langkah Pengeksekusian:**
1. Buka Termux, ketik `asmr` ➔ Tekan **Enter**.
2. Ketik angka **`2`** ➔ Tekan **Enter**.

### **Pertanyaan & Pengetikan Layar Demi Layar:**

* **Pertanyaan 1: Konfirmasi Aksinya**
  👉 **Yang Anda ketik:** `1` ➔ Tekan **Enter**.

* **Pertanyaan 2: Pilih Resolusi Output Video Target**
  ```text
  📺 Pilih Resolusi Output Video Target:
    [1] 1080p (Full HD - Tajam)
    [2] 720p  (HD - Rekomendasi Hemat Memori)
    [3] 480p  (SD - Super Hemat Memori)
    [4] Resolusi Asli Video Input
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `2` ➔ Tekan **Enter**.

* **Pertanyaan 3: Pilih Tingkat Kompresi (CRF)**
  ```text
  🎛️ Pilih Tingkat Kompresi (CRF):
    [1] Seimbang (CRF 23 - Kualitas Bagus)
    [2] Kompresi Tinggi (CRF 26 - Rekomendasi Hemat Storage)
    [3] Super Hemat (CRF 28 - Ukuran Sangat Kecil)
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `2` ➔ Tekan **Enter**.

* **Hasil Akhir:** Seluruh video mentah di folder `SEBELUM LOOP` terkompresi hemat memori dan tersimpan di:  
  📂 **`PROJECT ASMR/HASIL KOMPRES/`**.

---

## 🌧️ MENU 3: MERAKIT VIDEO & AUDIO ASMR HUJAN (LENGKAP)

### **Langkah Pengeksekusian:**
1. Buka Termux, ketik `asmr` ➔ Tekan **Enter**.
2. Ketik angka **`3`** ➔ Tekan **Enter**.

### **Pertanyaan & Pengetikan Layar Demi Layar:**

* **Pertanyaan 1: Konfirmasi Aksinya**
  👉 **Yang Anda ketik:** `1` ➔ Tekan **Enter**.

* **Pertanyaan 2: Mode Video (Dengan Intro vs Tanpa Intro)**
  ```text
  ❓ Apakah video Anda menggunakan Intro khusus?
    [1] Ya, Gunakan Video Intro (Video 1 = Intro, Video 2 = Loop Body)
    [2] Tidak, Tanpa Intro (Langsung Loop dari File Mana Saja) [Rekomendasi]
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `2` *(Jika nama video bebas/acak)* ➔ Tekan **Enter**.

* **Pertanyaan 3: Resolusi Video Target**
  👉 **Yang Anda ketik:** `2` (720p) ➔ Tekan **Enter**.

* **Pertanyaan 4: Kualitas Visual (CRF)**
  ```text
  🎛️ Pilih Kualitas Visual (CRF - Constant Rate Factor):
    [1] Super Jernih (CRF 20)
    [2] Seimbang (CRF 23) [Rekomendasi Tekstur Air]
    [3] Hemat Memori HP (CRF 26)
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `2` ➔ Tekan **Enter**.

* **Pertanyaan 5: Video Fade-In (Hitam ke Terang)**
  ```text
  🎬 Tambahkan Efek Video Fade-In (Hitam ke Terang) di Awal Video?
    [1] Tanpa Fade-In (0 Detik)
    [2] 2 Detik
    [3] 3 Detik [Rekomendasi]
    [4] 5 Detik
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `3` ➔ Tekan **Enter**.

* **Pertanyaan 6: Pilih File Audio Rakitan**
  ```text
  🎵 Silakan pilih file audio untuk menyatukan dengan video:
    [1] audio_10jam_mulus.m4a (Durasi: 600:00)
    [0] Kembali ke Menu Utama
  ```
  👉 **Yang Anda ketik:** `1` ➔ Tekan **Enter**.

* **Hasil Akhir:** Video ASMR Hujan 10 jam berkualitas tinggi siap dipakai dan tersimpan di:  
  📂 **`PROJECT ASMR/HASIL HUJAN/`**.

---

## 🔥 MENU 4: MERAKIT VIDEO & AUDIO ASMR API (LENGKAP)

* **Langkah & Pertanyaan:** Sama persis seperti Menu [3].
* **Keunggulan Otomatis:** Sistem secara otomatis menerapkan profile **Deep Dark Fire** (`-tune film`, `aq-mode=2`, CRF 22) untuk membuang kotak-kotak patahan piksel di latar belakang perapian yang gelap.
* **Hasil Akhir:** Video ASMR Api 10 jam tersimpan di:  
  📂 **`PROJECT ASMR/HASIL API/`**.

---

## 📁 MENU 5: BUAT & SIAPKAN SEMUA FOLDER PROJEK OTOMATIS

* **Fungsi:** Menu cepat jika folder projek terhapus atau ingin mereset folder.
* **Cara Pakai:** Ketik `5` ➔ Tekan **Enter** ➔ Tekan **Enter** lagi untuk kembali ke dashboard.

---

## 🔄 MENU 6: CEK & PERBARUI TOOLS (AUTO UPDATE)

* **Fungsi:** Memeriksa pembaruan skrip di GitHub dari Mas Arif.
* **Cara Pakai:** Ketik `6` ➔ Tekan **Enter**.
  * Jika ada update: Ketik `1` ➔ Tekan **Enter** (Tools otomatis mengunduh skrip terbaru).

---

## 🚪 MENU 7: KELUAR PROGRAM

* **Fungsi:** Menutup program `asmr`.
* **Cara Pakai:** Ketik `7` ➔ Tekan **Enter**.
