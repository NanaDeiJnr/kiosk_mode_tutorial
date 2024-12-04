// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(KioskHomePage());
}

class KioskHomePage extends StatefulWidget {
  const KioskHomePage({super.key});

  @override
  _KioskHomePageState createState() => _KioskHomePageState();
}

class _KioskHomePageState extends State<KioskHomePage> {
  int _tapCount = 0;

  void _onSecretTap() {
    setState(() {
      _tapCount++;
    });

    if (_tapCount == 5) { // Example: 5 taps unlocks
      _showExitDialog();
      _tapCount = 0; // Reset tap count
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit Kiosk Mode"),
        content: const Text("Enter the passcode to exit."),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Exit"),
            onPressed: () {
              // Add your exit logic here
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSecretTap,
      child: const Scaffold(
        body: Center(
          child: Text('Tap 5 times to unlock'),
        ),
      ),
    );
  }
}
