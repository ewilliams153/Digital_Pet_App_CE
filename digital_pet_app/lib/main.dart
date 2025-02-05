import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // Method to change the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: Color(0xFFFFD1DC), // Pastel pink
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.pink.shade900,
          secondary: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Color(0xFFB0003C), // Deep pink
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: ThemeSwitcher(changeTheme: changeTheme, themeMode: _themeMode),
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  final Function(ThemeMode) changeTheme;
  final ThemeMode themeMode;

  const ThemeSwitcher({
    super.key,
    required this.changeTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: themeMode == ThemeMode.light
                      ? Colors.grey[300]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  'Mobile App Development Testing',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => changeTheme(ThemeMode.light),
                    child: const Text('Light Theme'),
                  ),
                  ElevatedButton(
                    onPressed: () => changeTheme(ThemeMode.dark),
                    child: const Text('Dark Theme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
