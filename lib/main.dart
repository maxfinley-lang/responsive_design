import 'package:flutter/material.dart';
import 'package:responsive_design/profile_card.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Responsive design',

      home: const ProfileCard(),
    );
  }

}