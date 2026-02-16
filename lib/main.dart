import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'firebase_options.dart'; // This is the file the CLI generated

void main() async {
  // Required for Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text('Firebase Initialized!')),
    ),
  ));
}