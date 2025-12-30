import 'package:flutter/material.dart';
import '../kuiz/kuiz_screen.dart';

class Pertemuan2Screen extends StatefulWidget {
  const Pertemuan2Screen({super.key});

  @override
  State<Pertemuan2Screen> createState() => _Pertemuan2ScreenState();
}

class _Pertemuan2ScreenState extends State<Pertemuan2Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> attachments = [
    {
      'title': 'Zoom Meeting Synchronous',
      'icon': Icons.link,
      'completed': true,
    },
    {
      'title': 'Elemen-elemen Antarmuka Pengguna',
      'icon': Icons.description,
      'completed': true,
    },
    {
      'title': 'UID Guidelines and Principles',
      'icon': Icons.description,
      'completed': true,
    },
    {'title': 'User Profile', 'icon': Icons.description, 'completed': true},
    {
      'title': 'Principles of User Interface Design URL',
      'icon': Icons.link,
      'completed': true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Konsep User Interface Design',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Konsep dasar User Interface Design. Interaction Design dalam membangun antarmuka. Pentingnya interaksi pengguna dalam aplikasi. Poin utama: visibility, feedback, limitation, consistency, affordance. Hubungan desain konseptual dan perceptual. Gambaran bentuk interaksi pada produk digital.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          // Tab Bar
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Lampiran Materi'),
              Tab(text: 'Tugas dan Kuis'),
            ],
          ),
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Lampiran Materi Tab
                ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: attachments.length,
                  itemBuilder: (context, index) {
                    final attachment = attachments[index];
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      child: ListTile(
                        leading: Icon(
                          attachment['icon'],
                          color: Colors.grey.shade600,
                          size: 24,
                        ),
                        title: Text(
                          attachment['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Icon(
                          Icons.check_circle,
                          color: attachment['completed']
                              ? Colors.green
                              : Colors.grey,
                          size: 24,
                        ),
                      ),
                    );
                  },
                ),
                // Tugas dan Kuis Tab
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KuizScreen(),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.quiz,
                                size: 40,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Quiz Review 01',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.description,
                              size: 40,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tugas 01 – UI Android Mobile Game',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Buatlah desain antarmuka untuk game FPS Android dengan tema zombie apocalypse. Sertakan wireframe, mockup, dan prototype interaktif.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
