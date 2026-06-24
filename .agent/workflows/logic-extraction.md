---
description: Mengamankan pemisahan logika dari antarmuka (SoC) dengan mengekstrak State & Logic dari file UI (Screens/Widgets) ke dalam kelas Provider (ChangeNotifier) terpisah.
---

# Logic Extraction Workflow (Flutter / Provider)

**Deskripsi:** Memindahkan *state*, pemanggilan API asinkron (Dio/Http), dan logika formulir dari widget UI menuju ke arsitektur ViewModel menggunakan `ChangeNotifier` (Provider) agar sesuai dengan `AGENTS.md`.

## Tahapan Ekstraksi

1.  **Analisis Widget UI:**
    - Identifikasi variabel state yang digunakan oleh UI (misal: boolean `isLoading`, data `List<AnemiaResult>`).
    - Identifikasi semua fungsi *async* (HTTP Requests) yang ada di dalam method widget.
    - **PENTING:** Widget harus murni untuk menggambar tampilan (`build` method), bukan mengatur data.

2.  **Pembuatan Kelas Provider (ViewModel):**
    - Buat file baru di `lib/providers/` dengan format `[fitur]_provider.dart`.
    - Buat kelas turunan dari `ChangeNotifier`.
    - Pindahkan state dan method logika ke dalam kelas ini. Panggil `notifyListeners()` setelah memodifikasi state agar UI *rebuild*.

3.  **Refactoring Widget Utama:**
    - Ubah `StatefulWidget` (jika tadinya menggunakan `setState`) menjadi `StatelessWidget` (atau tetap `StatefulWidget` jika ada *ephemeral state* seperti *animation controller*).
    - Gunakan `context.watch<T>()`, `context.read<T>()`, atau widget `Consumer<T>` untuk mengikat data dari Provider ke UI.
    - Hapus logika pemanggilan API dari dalam file *screen*, gantikan dengan pemanggilan method provider: `context.read<FiturProvider>().fetchData()`.

4.  **Registrasi Provider:**
    - Pastikan Provider yang baru dibuat telah di-registrasi di dalam daftar `MultiProvider` di file `lib/main.dart`.

5.  **Verifikasi (Clean Code Check):**
    - Apakah masih ada *hardcoded text* berbahasa Inggris di UI?
    - Apakah error dari API memanggil fungsi untuk menampilkan *SnackBar* yang informatif dalam Bahasa Indonesia?
    - Jalankan linter: `flutter analyze` dan pastikan tidak ada *warnings*.
