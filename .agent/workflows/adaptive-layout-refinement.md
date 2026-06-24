---
description: Panduan penyesuaian tata letak (layout) dan desain UI Flutter agar responsif, konsisten dengan Material 3, dan berpenampilan premium.
---

# Adaptive Layout Refinement Workflow (Flutter)

**Deskripsi:** Menyempurnakan komponen UI Flutter untuk beradaptasi dengan berbagai ukuran layar perangkat mobile, menjaga kontras teks, memastikan jarak (padding/margin) proporsional, dan menggunakan *Material 3 Guidelines* sesuai standar Balansing.

## Tahapan Refinement UI

1.  **Analisis Kekuatan Responsif (Responsiveness):**
    - Hindari melempar nilai ukuran statis (*hardcoded values*) seperti `width: 400` atau `height: 800`.
    - Gunakan widget `Expanded`, `Flexible`, `LayoutBuilder`, atau `MediaQuery.sizeOf(context)` untuk memastikan UI menyesuaikan layar secara alami.
    - Saat menggunakan *Scrollable widgets* (`ListView`, `SingleChildScrollView`), perhatikan error *overflow* (garis kuning/hitam di ujung layar).

2.  **Harmonisasi Typography & Spasi:**
    - Terapkan style global melalui `Theme.of(context).textTheme`.
    - Gunakan spasi yang terstruktur (contoh: `SizedBox(height: 16)` untuk pemisah antar elemen, bukan padding asimetris).
    - Fokus pada "Hierarchy" tulisan: Judul besar, tebal, dengan warna yang kontras, sementara teks deskripsi lebih kecil dan *subtle*.

3.  **Pengayaan Komponen Visual (Visual Polish):**
    - Tambahkan *subtle shadows* pada `Card` atau wadah elemen penting (`BoxShadow(color: Colors.black12, blurRadius: 10)`).
    - Pastikan interaktivitas terlihat: gunakan `InkWell` pada elemen kustom yang dapat diklik (jangan cuma membungkus `GestureDetector` polos tanpa respon visual/ripple effect).
    - Gunakan sudut yang membulat (*Rounded corners*) secara konsisten (contoh: `BorderRadius.circular(12)`).

4.  **Penggunaan Bahasa (Indonesian Mandatory):**
    - Cek semua teks di layar. UI text WAJIB menggunakan Bahasa Indonesia yang formal dan mudah dipahami.
    - Contoh: "Submit" -> "Kirim", "Error occurred" -> "Terjadi kesalahan", "Loading" -> "Memuat...".

5.  **Verifikasi (Lint & Run):**
    - Lakukan uji *hot reload* di emulator dengan layar ukuran yang berbeda.
    - Pastikan tidak ada widget yang di-build ulang terus-menerus tanpa alasan logis (gunakan keyword `const` semaksimal mungkin).
