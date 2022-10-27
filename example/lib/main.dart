import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_intent/android_intent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = 'Unknown';
  final _androidIntentPlugin = AndroidIntent();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => _performKeyExchange(), child: const Text('KeyExchange')),
              Text('KEY EXCHANGE STATUS: ${_status == '00' ? 'KeyExchange Success' : 'KeyExchange Failed'}\n')
            ],
          ),
        ),
      ),
    );
  }

  _performKeyExchange() async {
    String status;
    try {
      status = await _androidIntentPlugin.performKeyExchange() ?? 'Unknown command';
    } on PlatformException {
      status = 'Failed to perform key exchange';
    }
    if (!mounted) return;
    setState(() {
      _status = status;
    });
  }
}
