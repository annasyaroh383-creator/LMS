import 'package:flutter/material.dart';
import '../../home/home_screen.dart';
import '../../notifications/notifications_screen.dart';
import '../class_screen.dart';
import 'pertemuan1_screen.dart';
import 'pertemuan2_screen.dart';

class DashboardClassScreen extends StatefulWidget {
  const DashboardClassScreen({super.key});

  @override
  State<DashboardClassScreen> createState() => _DashboardClassScreenState();
}

class _DashboardClassScreenState extends State<DashboardClassScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _selectedIndex = 1; // Kelas Saya aktif

  final List<Map<String, dynamic>> assignments = [
    {
      'type': 'QUIZ',
      'title': 'Quiz Review 01',
      'deadline': 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
      'completed': true,
      'icon': Icons.chat_bubble,
    },
    {
      'type': 'Tugas',
      'title': 'Tugas 01 – UID Android Mobile Game',
      'deadline': 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
      'completed': false,
      'icon': Icons.assignment,
    },
    {
      'type': 'Pertemuan 3',
      'title': 'Kuis – Assessment 2',
      'deadline': 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
      'completed': true,
      'icon': Icons.quiz,
    },
  ];

  final List<Map<String, dynamic>> materials = [
    {
      'meeting': 'Pertemuan 1',
      'title': 'Pengantar User Interface Design',
      'description': '2 URLs, 3 Files, 1 Interactive Content',
      'completed': true,
    },
    {
      'meeting': 'Pertemuan 2',
      'title': 'Konsep User Interface Design',
      'description': '1 URLs, 4 Files, 2 Interactive Content, 1 Kuis',
      'completed': true,
    },
    {
      'meeting': 'Pertemuan 3',
      'title': 'Interaksi pada UI',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'completed': true,
    },
    {
      'meeting': 'Pertemuan 4',
      'title': 'Ethnographic Observation',
      'description': '2 URLs, 1 Files, 2 Interactive Content, 1 Tugas',
      'completed': false,
    },
    {
      'meeting': 'Pertemuan 5',
      'title': 'UID Testing',
      'description': '1 URLs, 3 Files, 1 Interactive Content, 1 Kuis',
      'completed': false,
    },
    {
      'meeting': 'Pertemuan 6',
      'title': 'Assessment',
      'description': '1 URLs, 2 Files, 1 Interactive Content, 1 Tugas',
      'completed': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ClassScreen()),
        );
        break;
      case 2:
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
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: const Color(0xFFB74141),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas dan Kuis'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Materi Tab
          ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: materials.length,
            itemBuilder: (context, index) {
              final material = materials[index];
              return InkWell(
                onTap: index == 0
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pertemuan1Screen(),
                          ),
                        );
                      }
                    : index == 1
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pertemuan2Screen(),
                          ),
                        );
                      }
                    : null,
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                material['meeting'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              material['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              material['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.check_circle,
                            color: material['completed']
                                ? Colors.green
                                : Colors.grey,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // Tugas dan Kuis Tab
          ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              final assignment = assignments[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Icon(
                            assignment['icon'],
                            size: 40,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    assignment['type'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  assignment['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  assignment['deadline'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.check_circle,
                          color: assignment['completed']
                              ? Colors.green
                              : Colors.grey,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
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
