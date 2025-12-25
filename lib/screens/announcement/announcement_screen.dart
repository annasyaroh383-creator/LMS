import 'package:flutter/material.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
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
    );
  }

  Widget _buildAnnouncementItem(String title, String subtitle) {
    return Container(
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
    );
  }
}
