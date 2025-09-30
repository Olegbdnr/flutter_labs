import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MagicCounter(),
    );
  }
}

class MagicCounter extends StatefulWidget {
  const MagicCounter({super.key});

  @override
  State<MagicCounter> createState() => _MagicCounterState();
}

class _MagicCounterState extends State<MagicCounter> {
  int _counter = 0;
  bool _isLight = false; // для Lumos / Nox
  final TextEditingController _controller = TextEditingController();

  void _handleInput(String input) {
    setState(() {
      if (int.tryParse(input) != null) {
        // якщо це число
        _counter += int.parse(input);
      } else if (input.trim().toLowerCase() == 'avada kedavra'.toLowerCase()) {
        _counter = 0;
      } else if (input.trim().toLowerCase() == 'lumos') {
        _isLight = true;
      } else if (input.trim().toLowerCase() == 'nox') {
        _isLight = false;
      } else {
        // будь-який інший текст
        _counter++;
      }
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isLight ? Colors.white : Colors.black,
      appBar: AppBar(
        title: const Text('Magic Counter'),
        backgroundColor: _isLight ? Colors.blue : Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: _isLight ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _controller,
                onSubmitted: _handleInput,
                style: TextStyle(
                  color: _isLight ? Colors.black : Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Введіть число або закляття...',
                  hintStyle: TextStyle(
                    color: _isLight ? Colors.black54 : Colors.white54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: _isLight ? Colors.black : Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: _isLight ? Colors.blue : Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '👉 Число = додати\n👉 Avada Kedavra = скинути\n👉 Lumos / Nox = світло/темрява\n👉 Інший текст = +1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isLight ? Colors.black87 : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
