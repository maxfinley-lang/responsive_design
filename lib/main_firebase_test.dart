import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final projectId = Firebase.app().options.projectId;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase Test')),
        body: Center(child: Text('Initialized project: $projectId')),
      ),
    );
  }
}
