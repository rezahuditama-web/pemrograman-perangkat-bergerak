enum SessionStatus { berlangsung, akanDatang, selesai, tersedia }

extension SessionStatusX on SessionStatus {
  String get label {
    switch (this) {
      case SessionStatus.berlangsung:
        return 'Berlangsung';
      case SessionStatus.akanDatang:
        return 'Akan Datang';
      case SessionStatus.selesai:
        return 'Selesai';
      case SessionStatus.tersedia:
        return 'Tersedia';
    }
  }
}


class RoomSession {
  final String id;
  final String roomName;
  final String category; 
  final String activityName;
  final String description;
  final String timeRange; 
  final SessionStatus status;
  final int capacity;
  final int occupied;

  const RoomSession({
    required this.id,
    required this.roomName,
    required this.category,
    required this.activityName,
    required this.description,
    required this.timeRange,
    required this.status,
    required this.capacity,
    required this.occupied,
  });
}

class RoomSessionRepository {
  static List<RoomSession> getSessions() {
    return const [
      RoomSession(
        id: 'rp-001',
        roomName: 'Lab Praktikum Pemrograman A',
        category: 'Pemrograman',
        activityName: 'Praktikum Struktur Data dan Algoritma Lanjut',
        description:
            'Sesi praktikum membahas implementasi struktur data pohon biner, '
            'traversal, dan studi kasus penerapannya pada sistem pencarian data.',
        timeRange: '08:00 - 10:00',
        status: SessionStatus.berlangsung,
        capacity: 30,
        occupied: 27,
      ),
      RoomSession(
        id: 'rp-002',
        roomName: 'Lab Praktikum Pemrograman B',
        category: 'Pemrograman',
        activityName: 'Praktikum Basis Data',
        description: 'Latihan query SQL dan normalisasi tabel.',
        timeRange: '10:15 - 12:00',
        status: SessionStatus.akanDatang,
        capacity: 25,
        occupied: 0,
      ),
      RoomSession(
        id: 'rp-003',
        roomName: 'Lab Praktikum Elektronika',
        category: 'Elektronika',
        activityName: 'Praktikum Rangkaian Digital',
        description: 'Perancangan gerbang logika dasar menggunakan IC TTL.',
        timeRange: '13:00 - 15:00',
        status: SessionStatus.selesai,
        capacity: 20,
        occupied: 0,
      ),
      RoomSession(
        id: 'rp-004',
        roomName: 'Studio Praktikum Desain Grafis',
        category: 'Desain',
        activityName: 'Praktikum Desain Antarmuka Pengguna',
        description:
            'Mahasiswa merancang wireframe dan prototipe aplikasi mobile '
            'menggunakan prinsip Material Design 3 dan pengujian usability sederhana '
            'terhadap lima responden.',
        timeRange: '09:00 - 11:00',
        status: SessionStatus.berlangsung,
        capacity: 15,
        occupied: 12,
      ),
      RoomSession(
        id: 'rp-005',
        roomName: 'Lab Praktikum Pemrograman A',
        category: 'Pemrograman',
        activityName: 'Praktikum Pemrograman Mobile',
        description: 'Sesi lanjutan membangun UI deklaratif dengan Flutter.',
        timeRange: '13:00 - 15:00',
        status: SessionStatus.akanDatang,
        capacity: 30,
        occupied: 0,
      ),
      RoomSession(
        id: 'rp-006',
        roomName: 'Lab Praktikum Elektronika',
        category: 'Elektronika',
        activityName: 'Praktikum Mikrokontroler',
        description: 'Pemrograman dasar mikrokontroler untuk sistem sensor sederhana.',
        timeRange: '15:15 - 17:00',
        status: SessionStatus.tersedia,
        capacity: 20,
        occupied: 0,
      ),
      RoomSession(
        id: 'rp-007',
        roomName: 'Studio Praktikum Desain Grafis',
        category: 'Desain',
        activityName: 'Praktikum Ilustrasi Digital',
        description: 'Latihan menggambar aset ilustrasi vektor untuk aplikasi.',
        timeRange: '11:00 - 13:00',
        status: SessionStatus.selesai,
        capacity: 15,
        occupied: 0,
      ),
      RoomSession(
        id: 'rp-008',
        roomName: 'Lab Praktikum Pemrograman B',
        category: 'Pemrograman',
        activityName: 'Praktikum Pemrograman Berorientasi Objek',
        description: 'Studi kasus penerapan inheritance dan polymorphism pada sistem sederhana.',
        timeRange: '15:15 - 17:00',
        status: SessionStatus.tersedia,
        capacity: 25,
        occupied: 0,
      ),
    ];
  }
}