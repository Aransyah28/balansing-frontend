# SSoT — Balansing-FrontEnd Single Source of Truth

- **Proyek:** Balansing (Aplikasi Pendeteksi Stunting, Anemia, & Analisis YOLO)
- **Framework:** Flutter (^3.5.4)
- **Status:** Active Development
- **Pemilik Dokumen:** Balansing Team

---

## 1. Konteks Produk & Solusi

### 1.1 Masalah
Aplikasi Balansing mewarisi berbagai fitur terkait kesehatan ibu dan anak (seperti deteksi stunting dan anemia) yang menggunakan Model Machine Learning (YOLO) serta API backend (Node.js) khusus. Dibutuhkan sebuah framework frontend yang tangguh, performan, dan mudah dirawat untuk menghubungkan fitur-fitur tersebut ke pengguna melalui perangkat seluler (mobile).

### 1.2 Solusi
Aplikasi seluler (mobile app) yang dibangun dengan ekosistem **Flutter**. Sistem dibagi menjadi beberapa integrasi utama:
1. **Autentikasi:** Menggunakan `supabase_flutter`.
2. **State Management:** Menggunakan `Provider` (`ChangeNotifier`) untuk performa terbaik yang selaras dengan learning curve Flutter yang mudah.
3. **Networking/API:** Menggunakan `dio` dan `http` untuk berkomunikasi dengan Backend API (Node.js/Prisma) dan Service ML (Python/Hosted API).

---

## 2. Strategi Teknikal & Rasional

### 2.1 Pilihan Framework: Flutter
Dipilih karena kemampuannya menghasilkan aplikasi lintas platform (Android/iOS) dengan performa native (`Impeller`/`Skia`), serta UI rendering yang konsisten di berbagai ukuran layar.

### 2.2 State Management: Provider + ChangeNotifier
Untuk mengoptimalkan performa dan mempermudah pewarisan kode (code handover) kepada developer yang baru mengenal Flutter, arsitektur *state management* menggunakan `Provider`. 
- Ringan, reaktif, dan direkomendasikan langsung secara native oleh tim Flutter.
- Pemisahan jelas antara `Model` (Data), `View` (UI), dan `ViewModel` (Provider/Logic).

### 2.3 Rasional Arsitektur (SOLID & DRY)
- **SoC (Separation of Concerns):** Widget UI (di dalam `lib/screens/` atau `lib/widgets/`) **TIDAK BOLEH** melakukan *business logic* atau pemanggilan API secara langsung. UI hanya bertugas menggambar komponen dan mendengarkan (listen) pada `Provider`.
- **DRY (Don't Repeat Yourself):** Komponen UI yang digunakan berulang kali (seperti tombol kustom, card analitik) wajib diekstrak ke dalam `lib/widgets/`.

---

## 3. Aliran Data (Data Flow)

1. **Trigger:** Pengguna berinteraksi dengan UI (misalnya menekan tombol "Deteksi Anemia").
2. **Provider/Controller:** UI memanggil method di dalam file Provider (misal: `AnemiaProvider`).
3. **Service (API):** Provider memanggil *Service layer* (lib/services/) yang menggunakan Dio atau http untuk fetch/post data ke Backend (menggunakan konfigurasi dari .env).
4. **State Update:** Service mengembalikan data, Provider memperbarui variablenya dan memanggil `notifyListeners()`.
5. **UI Update:** Widget yang dibungkus oleh `Consumer<T>` atau memanggil `context.watch<T>()` akan *rebuild* secara otomatis tanpa merusak *widget tree* yang lain.

---

## 4. Standar Kode & Etika AI Agent

### 4.1 Type Safety (Null Safety)
Dilarang keras menggunakan tipe `dynamic` secara asal. Selalu gunakan *type inference* yang kuat dan manfaatkan kelas Model (`lib/models/`) dengan fungsi factory `fromJson`. Pastikan *sound null safety* diterapkan (`?` atau `!` dengan hati-hati).

### 4.2 Error Handling & Feedback UI
Setiap interaksi jaringan (Network API) **WAJIB** memiliki:
1. `Loading State` (Tampilan indikator loading).
2. `Error State` (Tampilan *SnackBar* atau *Dialog* yang ramah jika gagal, menggunakan Bahasa Indonesia).
3. `Success State`.

### 4.3 Kepatuhan Desain (Material 3)
Aplikasi mematuhi panduan antarmuka (Visual Design) menggunakan Material 3. Penggunaan *shadow* halus, layout responsif (dengan `LayoutBuilder` / `Expanded`), dan *Typography* yang konsisten (seperti `GoogleFonts`) adalah standar mutlak.
