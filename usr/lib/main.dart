import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taqdeer App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F3E9),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF7A5C00)),
          ),
          labelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
      home: const TaqdeerPage(),
    );
  }
}

class TaqdeerPage extends StatefulWidget {
  const TaqdeerPage({super.key});

  @override
  State<TaqdeerPage> createState() => _TaqdeerPageState();
}

class _TaqdeerPageState extends State<TaqdeerPage> {
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  String _report = "";

  void _generateReport() {
    final name = _nameController.text;
    final dob = _dobController.text;

    if (name.isEmpty || dob.isEmpty) {
      setState(() {
        _report = "Please enter your name and date of birth.";
      });
      return;
    }

    final num = (name.length + dob.length) % 9 + 1;
    const meanings = [
      "Leader and confident",
      "Sensitive and emotional",
      "Creative and joyful",
      "Practical and grounded",
      "Adventurous and curious",
      "Responsible and loyal",
      "Spiritual and wise",
      "Powerful and ambitious",
      "Humanitarian and kind"
    ];

    setState(() {
      _report = "Your Numerology Number is $num: ${meanings[num - 1]}";
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  "✨ Taqdeer App ✨",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF7A5C00),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Name",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _dobController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Date of Birth (YYYY-MM-DD)",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _generateReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A5C00),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Calculate Taqdeer",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                if (_report.isNotEmpty)
                  Text(
                    _report,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
