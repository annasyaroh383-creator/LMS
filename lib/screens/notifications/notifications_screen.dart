import 'package:flutter/material.dart';
import '../announcement/announcement_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildNotificationItem(
            Icons.assignment,
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            '3 Hari 9 Jam Yang Lalu',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnnouncementScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          _buildNotificationItem(
            Icons.quiz,
            'Kuis Pemrograman Mobile telah tersedia. Batas waktu pengumpulan adalah 2 hari lagi.',
            '1 Hari 5 Jam Yang Lalu',
          ),
          const SizedBox(height: 15),
          _buildNotificationItem(
            Icons.announcement,
            'Pengumuman: Kelas Sistem Operasi akan dimulai besok pukul 08:00.',
            '5 Jam Yang Lalu',
          ),
          const SizedBox(height: 15),
          _buildNotificationItem(
            Icons.grade,
            'Nilai tugas Desain Antarmuka & UX telah diumumkan. Silakan cek di portal.',
            '2 Hari Yang Lalu',
          ),
          const SizedBox(height: 15),
          _buildNotificationItem(
            Icons.event,
            'Deadline pengumpulan tugas besar Basis Data adalah besok pukul 23:59.',
            '6 Jam Yang Lalu',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    IconData icon,
    String title,
    String time, [
    VoidCallback? onTap,
  ]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey.shade600),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
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
