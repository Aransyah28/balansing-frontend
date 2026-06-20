import 'package:flutter/material.dart';
import 'package:balansing/screens/PathScreen.dart';
import 'dart:async'; // Tambahkan ini untuk menggunakan Timer

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Deklarasikan Timer
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    
    // Mulai timer 3 detik
    _timer = Timer(const Duration(seconds: 3), () {
      // Periksa apakah widget masih terpasang sebelum navigasi
      if (mounted) {
        // Navigasi setelah 3 detik
        _navigateToPathScreen();
      }
    });
  }

  @override
  void dispose() {
    // Pastikan timer dibatalkan saat widget dihapus
    _timer.cancel();
    super.dispose();
  }

  // Fungsi navigasi terpisah untuk menghindari duplikasi kode
  void _navigateToPathScreen() {
    // Menggunakan Navigator.pushReplacement untuk mengganti OnboardingScreen
    // dengan PathScreen, jadi pengguna tidak bisa kembali ke OnboardingScreen.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PathScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector( 
        // Use GestureDetector to detect taps anywhere on the screen
        onTap: () {
          // 1. Batalkan timer agar navigasi otomatis tidak terjadi lagi
          _timer.cancel(); 
          // 2. Lakukan navigasi saat di-tap
          _navigateToPathScreen();
        },
        child: Container(
          // Tambahkan color: Colors.transparent atau sejenisnya 
          // untuk memastikan Container mengisi seluruh area 
          // agar GestureDetector dapat mendeteksi tap di mana saja.
          color: Colors.white, // Sesuaikan dengan warna latar belakang Anda
          width: double.infinity, // Pastikan lebar penuh
          height: double.infinity, // Pastikan tinggi penuh
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [ 
              SizedBox(height: height*0.26,),
              Image.asset(
                'assets/images/Onboard-Logo.png',
                height: height * 0.3,
                fit: BoxFit.contain,
              ),
            ],
          ) 
        ),
      ),
    );
  }
}