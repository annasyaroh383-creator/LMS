import 'package:flutter/material.dart';
import '../class/class_screen.dart';
import '../notifications/notifications_screen.dart';
import '../home/home_screen.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Pengumuman',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Title
            const Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Metadata
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 5),
                Text(
                  'By Admin CeLOE – Rabu, 2 Juni 2021, 10:45',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Illustration Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/building_image.png', // Placeholder for maintenance illustration
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle
            const Text(
              'Maintenance LMS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            // Content Paragraphs
            const Text(
              'Dalam rangka meningkatkan kualitas layanan Learning Management System (LMS) Telkom University, kami akan melakukan maintenance pada sistem LMS mulai tanggal 3 Juni 2021 pukul 22:00 WIB hingga 4 Juni 2021 pukul 06:00 WIB.',
              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 15),
            const Text(
              'Selama periode maintenance, akses ke LMS akan dibatasi. Mahasiswa dan dosen dimohon untuk tidak mengakses sistem selama waktu tersebut. Kami mohon maaf atas ketidaknyamanan yang timbul.',
              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 15),
            const Text(
              'Setelah maintenance selesai, sistem akan kembali normal. Jika ada pertanyaan, silakan hubungi helpdesk LMS.',
              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            // Closing
            const Text(
              'Hormat Kami,',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'CeLOE Telkom University',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
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
}
