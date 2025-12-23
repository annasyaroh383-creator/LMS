import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          isIndonesian ? 'Bantuan' : 'Help',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFB74747),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language Switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLanguageButton('🇮🇩 ID', true),
                const SizedBox(width: 20),
                _buildLanguageButton('🇬🇧 EN', false),
              ],
            ),
            const SizedBox(height: 30),

            // Content
            Text(
              isIndonesian
                  ? 'Instruksi Login Akun Microsoft Office 365'
                  : 'Microsoft Office 365 Account Login Instructions',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isIndonesian
                  ? 'Untuk mengakses sistem ini, Anda perlu menggunakan akun Microsoft Office 365 yang telah disediakan oleh universitas.'
                  : 'To access this system, you need to use the Microsoft Office 365 account provided by the university.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              isIndonesian ? 'Langkah-langkah login:' : 'Login steps:',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isIndonesian
                  ? '1. Buka halaman login aplikasi.\n2. Masukkan email Microsoft Office 365 Anda.\n3. Klik "Selanjutnya" dan masukkan kata sandi.\n4. Ikuti proses verifikasi dua faktor jika diperlukan.'
                  : '1. Open the application login page.\n2. Enter your Microsoft Office 365 email.\n3. Click "Next" and enter your password.\n4. Follow the two-factor verification process if required.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              isIndonesian
                  ? 'Pastikan Anda menggunakan koneksi internet yang stabil dan browser yang didukung untuk pengalaman login yang optimal.'
                  : 'Make sure you use a stable internet connection and a supported browser for the optimal login experience.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            // Contact Section
            Text(
              isIndonesian ? 'Kontak' : 'Contact',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              isIndonesian ? 'Mail' : 'Mail',
              'support@university.edu',
              Icons.email,
            ),
            const SizedBox(height: 10),
            _buildContactItem('Whatsapp', '+62 812-3456-7890', Icons.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String label, bool isID) {
    bool isActive = (isID && isIndonesian) || (!isID && !isIndonesian);
    return GestureDetector(
      onTap: () {
        setState(() {
          isIndonesian = isID;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 4,
              width: 30,
              color: const Color(0xFFB74747),
            ),
        ],
      ),
    );
  }

  Widget _buildContactItem(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 10),
        Text(
          '$title: ',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
