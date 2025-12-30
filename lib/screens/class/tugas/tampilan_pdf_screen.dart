import 'package:flutter/material.dart';

class TampilanPdfScreen extends StatelessWidget {
  const TampilanPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFFB74141),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(fontSize: 16),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(child: Text('Halaman 1/26')),
          ),
        ],
      ),

      // ✅ SCROLLABLE BODY (SEPERTI PDF)
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ===== IMAGE 1 =====
            Image.asset('assets/images/telkom_logo.jpg', fit: BoxFit.contain),

            const SizedBox(height: 16),

            // ===== IMAGE 2 =====
            Image.asset('assets/images/lecturer.jpg', fit: BoxFit.contain),

            const SizedBox(height: 16),

            // ===== IMAGE 3 =====
            Image.asset('assets/images/ui_mockup.jpg', fit: BoxFit.contain),

            const SizedBox(height: 16),

            // ===== IMAGE 3 =====
            Image.asset(
              'assets/images/frustrated_user.jpg',
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
