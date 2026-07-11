class Ibu {
  String email;
  String password;
  String noTelp;
  String namaIbu;
  int usia;
  String provinsi;
  String kota;
  String kecamatan;
  String kelurahan;
  String rt; // Menggunakan String untuk RT karena bisa ada "001", "01A", dll.
  String rw; // Menggunakan String untuk RW karena bisa ada "001", "01B", dll.
  String alamat;

  Ibu({
    required this.email,
    required this.password,
    required this.noTelp,
    required this.namaIbu,
    required this.usia,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.rt,
    required this.rw,
    required this.alamat,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'noTelp': noTelp,
      'namaIbu': namaIbu,
      'usia': usia,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'rt': rt,
      'rw': rw,
      'alamat': alamat,
    };
  }

  factory Ibu.fromJson(Map<String, dynamic> json) {
    return Ibu(
        email: json['email']?.toString() ?? '',
        password: json['password']?.toString() ?? '',
        noTelp: json['noTelp']?.toString() ?? '',
        namaIbu: (json['namaIbu'] ?? json['nama'])?.toString() ?? '',
        usia: json['usia'] is int ? json['usia'] : int.tryParse(json['usia']?.toString() ?? '0') ?? 0,
        provinsi: json['provinsi']?.toString() ?? '',
        kota: json['kota']?.toString() ?? '',
        kecamatan: json['kecamatan']?.toString() ?? '',
        kelurahan: json['kelurahan']?.toString() ?? '',
        rt: json['rt']?.toString() ?? '',
        rw: json['rw']?.toString() ?? '',
        alamat: json['alamat']?.toString() ?? '');
  }
}
