import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // Class Progress List (same design as home screen)
              _buildClassProgressList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassProgressList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildClassItem(
            'assets/images/logo1.png',
            '2021/2',
            'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
            'D4SM-42-03',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo2.jpg',
            '2021/2',
            'KEWARGANEGARAAN D4SM-41-GAB1 [BBO]. JUMAT 2',
            'D4SM-41-GAB1',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo3.jpg',
            '2021/2',
            'SISTEM OPERASI D4SM-44-02 [DDS]',
            'JK03',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo4.jpg',
            '2021/2',
            'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
            'D4SM-41-GAB1 [APJ]',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo5.jpg',
            '2021/2',
            'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
            'D4SM-41-GAB1 [APJ]',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo6.jpg',
            '2021/2',
            'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
            'D4SM-41-GAB1 [ARS]',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo7.jpg',
            '2021/2',
            'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
            'D4SM-43-04 [TPR]',
          ),
          const SizedBox(height: 15),
          _buildClassItem(
            'assets/images/logo8.jpg',
            '2021/2',
            'OLAH RAGA ',
            'D3TT-44-02 [EYR]',
          ),
        ],
      ),
    );
  }

  Widget _buildClassItem(
    String imagePath,
    String year,
    String courseName,
    String classCode,
  ) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to detailed class view
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Membuka kelas: $courseName'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    courseName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    classCode,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 4,
                          child: LinearProgressIndicator(
                            value: 0.89,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFB21312),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '89% Selesai',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
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
