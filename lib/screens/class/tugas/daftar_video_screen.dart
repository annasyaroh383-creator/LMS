import 'package:flutter/material.dart';

class DaftarVideoScreen extends StatefulWidget {
  const DaftarVideoScreen({super.key});

  @override
  State<DaftarVideoScreen> createState() => _DaftarVideoScreenState();
}

class _DaftarVideoScreenState extends State<DaftarVideoScreen> {
  final List<Map<String, String>> _videos = [
    {'title': 'Interaction Design', 'thumbnail': 'blue.jpg'},
    {
      'title': 'Pengantar Desain Antarmuka Pengguna',
      'thumbnail': 'telkom_1.jpg',
    },
    {
      'title': '4 Teori Dasar Desain Antarmuka Pengguna',
      'thumbnail': 'telkom_2.jpg',
    },
    {
      'title': 'Tutorial Dasar Figma – UI/UX Design Software',
      'thumbnail': 'figma.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFB74141), // Red brick
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Video – User Interface Design For Beginner',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // Balance the back button
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Video Player
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Thumbnail
                          Image.asset(
                            'assets/images/speaker_stage_blue.jpg',
                            fit: BoxFit.cover,
                          ),
                          // Play icon
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          // Bottom controls
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 4,
                                    color: Colors.grey[300],
                                    child: FractionallySizedBox(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 0.3, // Progress
                                      child: Container(color: Colors.red),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  '0:00 / 10:00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Section Title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Video Lain Nya',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Video List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _videos.length,
                    itemBuilder: (context, index) {
                      final video = _videos[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/${video['thumbnail']}',
                                width: 80,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                video['title']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
