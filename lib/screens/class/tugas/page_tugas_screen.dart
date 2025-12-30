import 'package:flutter/material.dart';
import 'tampilan_pdf_screen.dart';
import 'upload_tugas_screen.dart';

class PageTugasScreen extends StatefulWidget {
  const PageTugasScreen({super.key});

  @override
  State<PageTugasScreen> createState() => _PageTugasScreenState();
}

class _PageTugasScreenState extends State<PageTugasScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('PageTugasScreen: Building widget');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74141), // Red brick
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Tugas 01 – UI Android Mobile Game',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Description
                const Text(
                  'Deskripsi Tugas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 10),
                _buildNumberedItem(1, 'Pembuatan desain UI game FPS Android'),
                _buildNumberedItem(
                  2,
                  'Cakupan desain dari awal aplikasi dibuka hingga gameplay',
                ),
                _buildNumberedItem(
                  3,
                  'Dukungan elemen UI seperti pop-up, alert, chat',
                ),
                _buildNumberedItem(4, 'Identitas game (nama, genre, platform)'),
                _buildNumberedItem(5, 'Ketentuan format file PDF maksimal 5MB'),
                _buildNumberedItem(
                  6,
                  'Deadline pengumpulan beserta waktu dan keterangan presentasi',
                ),
                const SizedBox(height: 30),
                // Status Tugas
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF7F7F), // Coral
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Status Tugas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            _buildStatusRow(
                              'Status',
                              'Sudah Mengirim untuk dinilai',
                            ),
                            const SizedBox(height: 8),
                            _buildStatusRow('Status Nilai', 'Belum Dinilai'),
                            const SizedBox(height: 8),
                            _buildStatusRow(
                              'Batas Tanggal',
                              'Jumat, 26 Februari 2021, 23:59 WIB',
                            ),
                            const SizedBox(height: 8),
                            _buildStatusRow(
                              'Sisa Waktu',
                              'Tugas sudah dikirim 4 hari 6 jam sebelumnya',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // File Tugas
                const Text(
                  'File Tugas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TampilanPdfScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Dandy Candra Pratama_770817014.pdf',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Bottom Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(
                        'PageTugasScreen: Tambahkan Tugas button pressed',
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadTugasScreen(),
                        ),
                      );
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
                      'Tambahkan Tugas',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
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

  Widget _buildNumberedItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number.',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
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
  }

  Widget _buildStatusRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}
