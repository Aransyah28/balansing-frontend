---
description: Panduan pembuatan dokumentasi JSDoc/Dartdoc untuk kode aplikasi Flutter (Balansing).
---

# Documentation Generation Workflow (Flutter / Dartdoc)

**Deskripsi:** Memastikan setiap komponen (*Widget*, *Provider*, *Service*, dan *Model*) didokumentasikan dengan format Dartdoc (`///`) agar *intellisense* IDE berfungsi optimal untuk developer berikutnya.

## Tahapan Generate Dokumentasi

1.  **Identifikasi Target Dokumen:**
    - Kelas Publik (*Widgets*, *Models*, *Providers*).
    - Metode dengan *business logic* kompleks atau parameter yang membingungkan.
    - File *Services* yang mengatur komunikasi HTTP ke backend (sangat krusial untuk mencatat bentuk JSON balasan yang diharapkan).

2.  **Format Dartdoc (`///`):**
    - Dilarang keras menggunakan komentar *single line* standar (`//`) atau multi-line standar (`/* */`) untuk tujuan deskripsi komponen publik. Selalu gunakan `///`.
    - Aturan standar:
      - Baris pertama adalah ringkasan yang jelas, diakhiri titik.
      - Paragraf berikutnya memberikan rincian mendalam.
      - Sebutkan argumen jika diperlukan (meskipun Dart memiliki sistem statis yang kuat).
      - Jika ada exception spesifik yang dilempar fungsi, dokumentasikan menggunakan anotasi `Throws`.

3.  **Contoh Penulisan (Services):**
    ```dart
    /// Mengambil data hasil deteksi Anemia milik pengguna saat ini.
    ///
    /// Menghubungi API backend eksternal dan mengembalikan sebuah list [AnemiaResult].
    /// 
    /// Throws [ServerException] jika respons dari server tidak dikenali atau HTTP status bukan 200.
    Future<List<AnemiaResult>> fetchAnemiaData() async { ... }
    ```

4.  **Contoh Penulisan (Widgets):**
    ```dart
    /// Kartu statis untuk menampilkan ringkasan profil ibu atau kader.
    ///
    /// Membutuhkan [userName] dan [role] yang valid. Jika widget ini diklik,
    /// aksi [onTap] akan dipicu dengan animasi ripple.
    class ProfileSummaryCard extends StatelessWidget { ... }
    ```

5.  **Review (Lint):**
    - Jalankan alat format (`dart format .`) untuk memastikan jarak antar komentar dan kode rapi.
    - Baca ulang dokumentasi: apakah deskripsi sudah lebih dari sekedar nama fungsi? (Hindari: `/// Kelas AnemiaProvider` untuk mendokumentasikan `AnemiaProvider`).
