import 'package:flutter/material.dart';
import '../../models/room_session.dart';
import '../../widgets/room_card.dart';

class RuangPraktikumScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const RuangPraktikumScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<RuangPraktikumScreen> createState() =>
      _RuangPraktikumScreenState();
}

class _RuangPraktikumScreenState
    extends State<RuangPraktikumScreen> {
  final List<RoomSession> _allSessions =
      RoomSession.getSampleData();

  String _selectedStatus = 'Semua';

  final Set<String> _bookmarkedIds = {};

  List<RoomSession> get _filteredSessions {
    if (_selectedStatus == 'Semua') {
      return _allSessions;
    }

    return _allSessions
        .where((s) => s.status == _selectedStatus)
        .toList();
  }

  void _showDetailBottomSheet(RoomSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final isBookmarked =
                _bookmarkedIds.contains(session.id);
            final theme = Theme.of(context);

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurfaceVariant
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          session.roomName,
                          style:
                              theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      Chip(
                        label: Text(session.status),
                        backgroundColor:
                            theme.colorScheme.primaryContainer,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    session.activityTitle,
                    style:
                        theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Divider(height: 24),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.schedule),
                    title: const Text('Waktu Sesi'),
                    subtitle: Text(session.timeSlot),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person),
                    title: const Text(
                      'Penanggung Jawab / Dosen',
                    ),
                    subtitle: Text(session.lecturer),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.groups),
                    title: const Text('Kapasitas Ruang'),
                    subtitle: Text(
                      '${session.capacity} Mahasiswa',
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Deskripsi Aktivitas:',
                    style: theme.textTheme.labelLarge,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    session.description,
                    style:
                        theme.textTheme.bodyMedium?.copyWith(
                      color:
                          theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (isBookmarked) {
                            _bookmarkedIds.remove(session.id);
                          } else {
                            _bookmarkedIds.add(session.id);
                          }
                        });

                        setModalState(() {});

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              isBookmarked
                                  ? 'Pengingat untuk ${session.roomName} dihapus.'
                                  : 'Pengingat diset untuk ${session.roomName}.',
                            ),
                            duration:
                                const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        isBookmarked
                            ? Icons.notifications_active
                            : Icons.notifications_none,
                      ),
                      label: Text(
                        isBookmarked
                            ? 'Hapus Pengingat Sesi'
                            : 'Pasang Pengingat Sesi',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final categories = [
      'Semua',
      'Berlangsung',
      'Akan Datang',
      'Selesai',
      'Tersedia',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RuangKita — Dashboard Ruang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Kode identitas UI sesuai NIM 2102.
            Text(
              'Kode Identitas: M02-2102',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: 'Ganti Tema',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            color: theme.colorScheme.surfaceContainerHighest
                .withOpacity(0.3),
            width: double.infinity,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter Status Ruang:',
                  style: theme.textTheme.labelMedium,
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: categories.map((status) {
                    return ChoiceChip(
                      label: Text(status),
                      selected:
                          _selectedStatus == status,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedStatus = status;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final sessions = _filteredSessions;

                if (sessions.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada sesi ruang untuk status ini.',
                    ),
                  );
                }

                // Layout layar lebar / desktop.
                if (constraints.maxWidth >= 840) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 180,
                    ),
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return RoomCard(
                        session: sessions[index],
                        onTap: () =>
                            _showDetailBottomSheet(
                          sessions[index],
                        ),
                      );
                    },
                  );
                }

                // Layout tablet.
                if (constraints.maxWidth >= 600) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 185,
                    ),
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return RoomCard(
                        session: sessions[index],
                        onTap: () =>
                            _showDetailBottomSheet(
                          sessions[index],
                        ),
                      );
                    },
                  );
                }

                // Layout mobile.
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    return RoomCard(
                      session: sessions[index],
                      onTap: () =>
                          _showDetailBottomSheet(
                        sessions[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
