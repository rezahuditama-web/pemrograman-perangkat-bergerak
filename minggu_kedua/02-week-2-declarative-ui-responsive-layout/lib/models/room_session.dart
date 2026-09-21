class RoomSession {
  final String id;
  final String roomName;
  final String activityTitle;
  final String timeSlot;
  final String status;
  final String lecturer;
  final String description;
  final int capacity;
  final bool isLabComputer;

  RoomSession({
    required this.id,
    required this.roomName,
    required this.activityTitle,
    required this.timeSlot,
    required this.status,
    required this.lecturer,
    required this.description,
    required this.capacity,
    required this.isLabComputer,
  });

  static List<RoomSession> getSampleData() {
    return [
      RoomSession(
        id: 'RS01',
        roomName: 'Lab Pemrograman 1',
        activityTitle:
            'Praktikum Pemrograman Perangkat Bergerak & Declarative UI Layout',
        timeSlot: '08.00 - 10.00 WIB',
        status: 'Berlangsung',
        lecturer: 'Dosen Praktikum TRPL',
        description:
            'Sesi praktikum pengembangan antarmuka deklaratif dan tata letak responsif menggunakan Flutter Material Design 3 untuk mahasiswa semester 5.',
        capacity: 30,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS02',
        roomName: 'Lab Pemrograman 2',
        activityTitle:
            'Praktikum Basis Data Lanjut & Optimasi Query Terdistribusi',
        timeSlot: '10.00 - 12.00 WIB',
        status: 'Akan Datang',
        lecturer: 'Tim Dosen Basis Data',
        description:
            'Pembahasan mengenai indexing, query optimization, serta pengujian performa skema database relasional pada sistem terdistribusi.',
        capacity: 35,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS03',
        roomName: 'Lab TUK',
        activityTitle:
            'Praktikum Keamanan Jaringan & Hardening Server Utama',
        timeSlot: '13.00 - 15.00 WIB',
        status: 'Selesai',
        lecturer: 'Lab Admin Jaringan',
        description:
            'Pengujian penetration testing dasar, konfigurasi firewall, dan analisis lalu lintas paket data menggunakan Wireshark.',
        capacity: 28,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS04',
        roomName: 'Lab Multimedia',
        activityTitle:
            'Ruang Bebas Sesi Praktikum Mandiri & Pengerjaan Proyek',
        timeSlot: '13.00 - 16.00 WIB',
        status: 'Tersedia',
        lecturer: 'Asisten Laboratorium',
        description:
            'Laboratorium saat ini kosong dan dapat dipinjam oleh mahasiswa untuk pengerjaan tugas akhir atau proyek mandiri dengan izin laboran.',
        capacity: 25,
        isLabComputer: false,
      ),
      RoomSession(
        id: 'RS05',
        roomName: 'Lab Pemrograman 1',
        activityTitle:
            'Praktikum Kecerdasan Buatan & Evaluasi Model Machine Learning',
        timeSlot: '13.30 - 16.00 WIB',
        status: 'Akan Datang',
        lecturer: 'Dosen AI & Data Science',
        description:
            'Eksperimen pemrosesan data menggunakan Python, TensorFlow, dan evaluasi matriks performa model klasifikasi gambar.',
        capacity: 30,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS06',
        roomName: 'Lab Pemrograman 2',
        activityTitle:
            'Praktikum Rekayasa Perangkat Lunak & Pemodelan UML',
        timeSlot: '07.30 - 10.00 WIB',
        status: 'Selesai',
        lecturer: 'Tim Dosen RPL',
        description:
            'Simulasi pemodelan UML, perancangan diagram sekuensial, dan pengerjaan sprint backlog proyek perangkat lunak.',
        capacity: 35,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS07',
        roomName: 'Lab Multimedia',
        activityTitle:
            'Praktikum Desain Pengalaman Pengguna (UX Wireframing & Prototype)',
        timeSlot: '10.00 - 12.30 WIB',
        status: 'Berlangsung',
        lecturer: 'Dosen Desain & UX',
        description:
            'Pengujian wireframing, penyusunan design system, dan usability testing langsung kepada calon pengguna aplikasi mobile.',
        capacity: 20,
        isLabComputer: true,
      ),
      RoomSession(
        id: 'RS08',
        roomName: 'Lab Multimedia',
        activityTitle:
            'Ruang Bebas Pembuatan Aset Visual & Rendering Video 3D',
        timeSlot: '13.00 - 17.00 WIB',
        status: 'Tersedia',
        lecturer: 'Laboran Multimedia',
        description:
            'Fasilitas komputer spesifikasi tinggi siap digunakan mahasiswa untuk rendering 3D dan editing video proyek kuliah.',
        capacity: 20,
        isLabComputer: true,
      ),
    ];
  }
}