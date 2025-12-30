import 'package:flutter/material.dart';
import 'kuiz2_screen.dart';

class Kuiz1Screen extends StatefulWidget {
  const Kuiz1Screen({super.key});

  @override
  State<Kuiz1Screen> createState() => _Kuiz1ScreenState();
}

class _Kuiz1ScreenState extends State<Kuiz1Screen> {
  int _selectedQuestion = 1;
  String? _selectedAnswer;

  final List<String> _options = [
    'A. Jenis Kelamin',
    'B. Alamat',
    'C. Hobby',
    'D. Riwayat Pendidikan',
    'E. Umur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74141),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white, size: 20),
              const SizedBox(width: 5),
              const Text(
                '15:00',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Question Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(15, (index) {
                    int questionNumber = index + 1;
                    bool isActive = questionNumber == _selectedQuestion;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedQuestion = questionNumber;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? const Color(0xFFB74141)
                              : Colors.white,
                          border: Border.all(
                            color: isActive
                                ? const Color(0xFFB74141)
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$questionNumber',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: isActive ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            // Question Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Soal Nomor $_selectedQuestion / 15',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Question Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      'Radio button dapat digunakan untuk menentukan ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Answer Choices
                    ..._options.map((option) {
                      bool isSelected = _selectedAnswer == option;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAnswer = option;
                          });
                        },
                        child: Card(
                          color: isSelected
                              ? const Color(0xFFB74141)
                              : Colors.white,
                          elevation: 2,
                          shadowColor: Colors.black.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: isSelected
                                  ? const Color(0xFFB74141)
                                  : Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: option,
                                  groupValue: _selectedAnswer,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAnswer = value;
                                    });
                                  },
                                  activeColor: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            // Navigation Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerRight,
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
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Soal Selanjutnya',
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
}
