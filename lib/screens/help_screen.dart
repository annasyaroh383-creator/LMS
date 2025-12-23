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
      appBar: AppBar(
        title: Text(
          isIndonesian ? 'Bantuan' : 'Help',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
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
                  ? 'Akses Khusus Dosen dan Mahasiswa Telkom University'
                  : 'Special Access for Lecturers and Students of Telkom University',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isIndonesian
                  ? 'Sistem ini dirancang khusus untuk memberikan akses mudah kepada dosen dan mahasiswa Telkom University dalam mengelola pembelajaran online.'
                  : 'This system is designed specifically to provide easy access for lecturers and students of Telkom University in managing online learning.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isIndonesian ? 'Instruksi Login' : 'Login Instructions',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isIndonesian
                  ? 'Gunakan Akun Microsoft Office 365 Anda untuk login. Username menggunakan format iGracias diikuti dengan domain universitas.'
                  : 'Use your Microsoft Office 365 account to log in. Username uses the iGracias format followed by the university domain.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isIndonesian
                  ? 'Peringatan Kata Sandi Kuat'
                  : 'Strong Password Warning',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isIndonesian
                  ? 'Pastikan kata sandi Anda kuat dan aman. Hindari menggunakan kata sandi yang mudah ditebak.'
                  : 'Make sure your password is strong and secure. Avoid using easily guessable passwords.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            // Contact Helpdesk
            Text(
              isIndonesian ? 'Kontak Helpdesk' : 'Helpdesk Contact',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              isIndonesian ? 'Email' : 'Mail',
              'infoceloe@telkomuniversity.ac.id',
              Icons.email,
            ),
            const SizedBox(height: 10),
            _buildContactItem('WhatsApp', '+62 821-1666-3563', Icons.phone),
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
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 2,
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
        Icon(icon, color: const Color(0xFFB74747)),
        const SizedBox(width: 10),
        Text(
          '$title: ',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 16),
        ),
      ],
    );
  }
}
