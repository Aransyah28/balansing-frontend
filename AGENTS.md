# AGENTS.md — Balansing-FrontEnd

> **INSTRUKSI SISTEM:** Semua AI agent yang bekerja di repo ini WAJIB membaca dan mengikuti panduan berikut. Kegagalan mematuhi aturan ini akan berakibat pada penolakan kode (Immediate Rejection).

## 1. Gambaran Proyek

**Proyek:** Balansing Mobile App (FrontEnd)
**Deskripsi:** Aplikasi mobile Flutter untuk deteksi stunting, anemia, dan integrasi analisis gambar berbasis YOLO.

## 2. Tech Stack (Strict)

- **Framework:** Flutter (^3.5.4)
- **Bahasa:** Dart (dengan Sound Null Safety)
- **State Management:** Provider (^6.1.2) + ChangeNotifier
- **Routing:** go_router (jika digunakan) atau sistem routing native bawaan
- **Networking:** Dio (^5.9.2) & http
- **Autentikasi & DB Lokal:** supabase_flutter & shared_preferences
- **Desain:** Material 3 & google_fonts
- **Linting:** flutter_lints

## 3. Aturan Inti & "Golden Rules"

### 1. Aturan Pemisahan Tanggung Jawab (Strict Separation of Concerns)
**ZERO-TOLERANCE POLICY**: Komponen Widget UI di `lib/screens/` atau `lib/widgets/` **TIDAK BOLEH** memuat logika pemanggilan API. Semua API calls dan state mutasi harus didelegasikan ke `Provider` (di dalam `lib/providers/`) atau `Service` (di dalam `lib/services/`).

### 2. Aturan Tipe (Type Integrity & Null Safety)
- **DILARANG KERAS** menggunakan tipe `dynamic` untuk variabel yang bisa diprediksi.
- Semua data JSON dari backend **WAJIB** diparsing menggunakan class Model di `lib/models/` dengan metode `fromJson`.
- Gunakan Null-Safety secara bertanggung jawab. Hindari pemaksaan dengan operator `!` kecuali sangat yakin tidak akan *null pointer exception*.

### 3. Aturan Naming (Casing & Filename)
- **PascalCase**: Nama Class, Enum, dan Widget (Contoh: `HomeScreen`, `UserProfile`).
- **camelCase**: Nama variabel, instance, dan method (Contoh: `getUserData()`, `isLoading`).
- **snake_case**: Penamaan file dan direktori (Contoh: `home_screen.dart`, `user_profile_provider.dart`).

### 4. Aturan UI & Bahasa (UI Content)
- Semua teks yang muncul di layar (UI) **WAJIB** menggunakan Bahasa Indonesia.
- Jangan gunakan *hardcoded text* berbahasa Inggris pada UI yang dibaca end-user (Contoh: `Text('Loading...')` ❌ -> `Text('Memuat...')` ✅).
- Pastikan tampilan rapi menggunakan *LayoutBuilder*, *Expanded*, dan prinsip layar yang *responsive*.

### 5. Aturan Error Handling & Feedback
- Setiap fungsi asinkron (pemanggilan jaringan/API) WAJIB menggunakan blok `try-catch`.
- Jangan biarkan layar *freeze*. Berikan *feedback visual* seperti `CircularProgressIndicator` saat proses berjalan dan tampilkan *SnackBar/Dialog* apabila terjadi error jaringan.

### 6. Aturan Performa Widget
- Gunakan keyword `const` sebanyak mungkin pada widget untuk mencegah *rebuild* yang tidak perlu.
- Gunakan pola *Consumer* atau *Selector* dari package Provider agar hanya spesifik bagian layar saja yang diperbarui.

## 4. Struktur Direktori (The Map)

```
lib/
├── models/         # (Data Object) Dart Classes untuk struktur JSON/Database
├── providers/      # (ViewModel/State) ChangeNotifier untuk logika bisnis
├── screens/        # (View) Widget halaman utama penuh
├── services/       # (Network/API) Logika koneksi Dio/Http ke Backend eksternal
├── widgets/        # Komponen UI kecil/reusable (Card, Button custom, dsb.)
└── main.dart       # Titik awal aplikasi dan injeksi Provider
```

## 5. Checklist AI Reviewer (Critical)

| Kategori | Syarat Wajib | Rejeksi Instan |
| :--- | :--- | :--- |
| **Logic/State** | State dikelola di file Provider | API calls (`http.get`) di dalam method `build()` UI |
| **Data Types** | Model classes dengan `fromJson` | Penggunaan tipe `dynamic` secara asal-asalan |
| **Naming** | `snake_case` untuk nama file Dart | `CamelCase` atau `PascalCase` untuk nama file Dart |
| **UI** | Widget dipecah jika terlalu besar (> 150 baris)| *Hardcoded strings* Bahasa Inggris di UI |
| **Performance**| Ekstensif menggunakan `const` modifier | Lupa menggunakan `const` pada widget statis |

## 6. Commands Penting

```bash
flutter pub get          # Mengunduh dependencies
flutter run              # Menjalankan aplikasi
flutter build apk        # Membangun APK Release
dart format lib/         # Merapikan format kode
flutter analyze          # Mengecek standar Linter
```
