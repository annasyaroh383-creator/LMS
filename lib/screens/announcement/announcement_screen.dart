import 'package:flutter/material.dart';
import 'maintenance.dart';
import '../class/class_screen.dart';
import '../notifications/notifications_screen.dart';
import '../home/home_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final int _selectedIndex = 2; // Notifikasi aktif

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // Navigate to Home Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        // Navigate to Class Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ClassScreen()),
        );
        break;
      case 2:
        // Navigate to Notifications Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74747),
        foregroundColor: Colors.white,
        title: const Text(
          'Pengumuman',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildAnnouncementItem(
                      'Maintenance Pra UAS Semester Genap 2020/2021',
                      'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MaintenanceScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    _buildAnnouncementItem(
                      'Pengumuman Kelas Pemrograman Mobile',
                      'By Admin Celoe - Senin, 1 Juni 2021, 14:30',
                    ),
                    const SizedBox(height: 15),
                    _buildAnnouncementItem(
                      'Deadline Tugas Sistem Operasi',
                      'By Admin Celoe - Minggu, 30 Mei 2021, 23:59',
                    ),
                    const SizedBox(height: 15),
                    _buildAnnouncementItem(
                      'Nilai Tugas Desain Antarmuka & UX',
                      'By Admin Celoe - Jumat, 28 Mei 2021, 16:20',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFB74141),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(
    String title,
    String subtitle, [
    VoidCallback? onTap,
  ]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/ic_speaker.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
