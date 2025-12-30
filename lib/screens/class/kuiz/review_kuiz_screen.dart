import 'package:flutter/material.dart';

class ReviewKuizScreen extends StatefulWidget {
  const ReviewKuizScreen({super.key});

  @override
  State<ReviewKuizScreen> createState() => _ReviewKuizScreenState();
}

class _ReviewKuizScreenState extends State<ReviewKuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74141), // Red dark
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Quiz Review I',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 20),
                const SizedBox(width: 4),
                const Text(
                  '15 : 00',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress indicators
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(15, (index) {
                    return CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green, // All answered
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                // Question title
                const Text(
                  'Soal Nomor 1 / 15',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                // Question text
                const Text(
                  'Radio button dapat digunakan untuk menentukan ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),
                // Options
                _buildOption('A', 'Jenis Kelamin', isWrong: true),
                const SizedBox(height: 10),
                _buildOption('B', 'Alamat'),
                const SizedBox(height: 10),
                _buildOption('C', 'Hobby'),
                const SizedBox(height: 10),
                _buildOption('D', 'Riwayat Pendidikan'),
                const SizedBox(height: 10),
                _buildOption('E', 'Umur'),
                const SizedBox(height: 40),
                // Bottom button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Back to review page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Kembali ke Halaman Review',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String letter, String text, {bool isWrong = false}) {
    Color backgroundColor = isWrong ? Colors.red : Colors.white;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        '$letter. $text',
        style: TextStyle(
          color: isWrong ? Colors.white : Colors.black,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
