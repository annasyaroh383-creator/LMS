import 'package:flutter/material.dart';
import 'kuiz_screen.dart';
import 'review_kuiz_screen.dart';

class ReviewJawabanScreen extends StatefulWidget {
  const ReviewJawabanScreen({super.key});

  @override
  State<ReviewJawabanScreen> createState() => _ReviewJawabanScreenState();
}

class _ReviewJawabanScreenState extends State<ReviewJawabanScreen> {
  final List<Map<String, String>> _questions = [
    {
      'question':
          'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
      'answer': 'C. Konsistensi',
    },
    {
      'question':
          'Apa yang dimaksud dengan konsistensi dalam desain antarmuka?',
      'answer': 'A. Keseragaman',
    },
    {
      'question': 'Mengapa konsistensi penting dalam UI/UX?',
      'answer': 'B. Meningkatkan pengalaman pengguna',
    },
    {
      'question': 'Contoh konsistensi dalam aplikasi mobile adalah?',
      'answer': 'D. Warna tombol yang sama',
    },
    {
      'question': 'Apa dampak negatif dari tidak konsisten dalam desain?',
      'answer': 'E. Kebingungan pengguna',
    },
    {
      'question': 'Bagaimana cara mencapai konsistensi?',
      'answer': 'A. Menggunakan guideline desain',
    },
    {
      'question': 'Apa peran konsistensi dalam branding?',
      'answer': 'C. Memperkuat identitas merek',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74141), // Red dark
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Review Jawaban',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Summary Card
                    Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInfoRow(
                                    'Di Mulai Pada',
                                    'Kamis 25 Februari 2021 10:25',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow(
                                    'Selesai Pada',
                                    'Kamis 25 Februari 2021 10:40',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow('Status', 'Selesai'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInfoRow(
                                    'Waktu Penyelesaian',
                                    '13 Menit 22 Detik',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow('Nilai', '0 / 100'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Questions List
                    ...List.generate(_questions.length, (index) {
                      int questionNumber = index + 1;
                      return _buildQuestionItem(
                        questionNumber,
                        _questions[index],
                      );
                    }),
                  ],
                ),
              ),
            ),
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KuizScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Kirim Jawaban',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionItem(int number, Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pertanyaan $number',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            data['question']!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                'Jawaban Tersimpan: ${data['answer']}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewKuizScreen(),
                  ),
                );
              },
              child: const Text(
                'Lihat Soal',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
