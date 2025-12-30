import 'package:flutter/material.dart';
import 'daftar_video_screen.dart';

class UploadTugasScreen extends StatefulWidget {
  const UploadTugasScreen({super.key});

  @override
  State<UploadTugasScreen> createState() => _UploadTugasScreenState();
}

class _UploadTugasScreenState extends State<UploadTugasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFB74141), // Red brick
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Text(
              'Upload File',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Info text
          const Text(
            'Maksimum File 5MB, Maksimum Jumlah File 20',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Upload box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
                style: BorderStyle
                    .solid, // For dashed, need custom painter, but use solid for simplicity
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Icon(Icons.cloud_upload, color: Colors.blue, size: 60),
                const SizedBox(height: 10),
                const Text(
                  'File yang akan di upload akan tampil di sini',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DaftarVideoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Pilih File',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
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
