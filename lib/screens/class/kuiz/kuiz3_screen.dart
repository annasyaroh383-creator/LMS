import 'package:flutter/material.dart';
import 'kuiz2_screen.dart';
import 'review_jawaban_screen.dart';

class Kuiz3Screen extends StatefulWidget {
  const Kuiz3Screen({super.key});

  @override
  State<Kuiz3Screen> createState() => _Kuiz3ScreenState();
}

class _Kuiz3ScreenState extends State<Kuiz3Screen> {
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
                    bool isAnswered = index < 14; // 1-14 answered, 15 not
                    return CircleAvatar(
                      radius: 12,
                      backgroundColor: isAnswered ? Colors.green : Colors.grey,
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
                  'Soal Nomor 3 / 15',
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
                  'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),
                // Options
                _buildOption(
                  'A',
                  'Jenis kelamin',
                  isSelected: true,
                  isWrong: true,
                ),
                const SizedBox(height: 10),
                _buildOption('B', 'Alamat', isSelected: false),
                const SizedBox(height: 10),
                _buildOption('C', 'Hobby', isSelected: false),
                const SizedBox(height: 10),
                _buildOption('D', 'Riwayat Pendidikan', isSelected: false),
                const SizedBox(height: 10),
                _buildOption('E', 'Umur', isSelected: false),
                const SizedBox(height: 40),
                // Bottom buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Kuiz2Screen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Soal Sebelumnya',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewJawabanScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Selesai',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption(
    String letter,
    String text, {
    bool isSelected = false,
    bool isWrong = false,
  }) {
    Color backgroundColor;
    if (isWrong) {
      backgroundColor = Colors.red;
    } else if (isSelected) {
      backgroundColor =
          Colors.blue; // Assuming selected but correct, but here wrong
    } else {
      backgroundColor = Colors.white;
    }

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
