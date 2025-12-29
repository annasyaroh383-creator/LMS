import 'package:flutter/material.dart';
import '../class/class_screen.dart';
import '../notifications/notifications_screen.dart';
import '../home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// HEADER
          SliverAppBar(
            backgroundColor: const Color(0xFFB74141),
            expandedHeight: 260,
            pinned: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 40),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                    backgroundImage: AssetImage('assets/images/logo0.jpeg'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'ROHIMATUL M',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TAB CARD
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          indicatorColor: const Color(0xFFB74141),
                          labelColor: const Color(0xFFB74141),
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(text: 'About Me'),
                            Tab(text: 'Kelas'),
                            Tab(text: 'Edit Profile'),
                          ],
                        ),

                        /// TAB CONTENT
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AnimatedBuilder(
                            animation: _tabController,
                            builder: (context, _) {
                              switch (_tabController.index) {
                                case 0:
                                  return _aboutMeTab();
                                case 1:
                                  return const Text(
                                    'Kelas Content',
                                    style: TextStyle(fontSize: 16),
                                  );
                                case 2:
                                  return const Text(
                                    'Edit Profile Content',
                                    style: TextStyle(fontSize: 16),
                                  );
                                default:
                                  return Container();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Logout logic
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Log Out'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

  Widget _aboutMeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi User',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildInfoItem('Email address', 'user@example.com'),
            _buildInfoItem('Program Studi', 'Teknik Informatika'),
            _buildInfoItem('Fakultas', 'Fakultas Teknik'),

            const SizedBox(height: 20),

            const Text(
              'Aktivitas Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildInfoItem('First access to site', '2023-01-01 10:00'),
            _buildInfoItem('Last access to site', '2023-12-29 12:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
