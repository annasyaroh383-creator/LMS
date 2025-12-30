import 'package:flutter/material.dart';

class Pertemuan1Screen extends StatefulWidget {
  const Pertemuan1Screen({super.key});

  @override
  State<Pertemuan1Screen> createState() => _Pertemuan1ScreenState();
}

class _Pertemuan1ScreenState extends State<Pertemuan1Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> attachments = [
    {
      'title': 'Zoom Meeting Synchronous',
      'icon': Icons.link,
      'completed': true,
    },
    {
      'title': 'Pengantar User Interface Design',
      'icon': Icons.description,
      'completed': false,
    },
    {
      'title': 'Empat Teori Dasar Antarmuka Pengguna',
      'icon': Icons.description,
      'completed': false,
    },
    {
      'title': 'Empat Teori Dasar Antarmuka Pengguna',
      'icon': Icons.description,
      'completed': true,
    },
    {
      'title': 'User Interface Design for Beginner',
      'icon': Icons.description,
      'completed': true,
    },
    {'title': '20 Prinsip Desain', 'icon': Icons.link, 'completed': true},
    {'title': 'Best Practice UI Design', 'icon': Icons.link, 'completed': true},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
          'Pengantar User Interface Design',
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
                  'Pentingnya prinsip-prinsip desain antarmuka. Antarmuka tidak hanya menarik secara visual, tetapi juga mendukung pengguna dalam menggunakan produk dengan baik. Materi pengenalan ulang prinsip UID sebagai bekal menuju User Experience.',
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.nightlight_round,
                        size: 100,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tidak Ada Tugas Dan Kuis Hari Ini',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
