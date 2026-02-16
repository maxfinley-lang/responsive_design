import 'package:flutter/material.dart';
import 'package:responsive_design/login_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive design'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 800),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(// wide
                  children: [
                    _buildAvatar(),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildContent(context),
                    ),
                  ],
                );
              } else {
                return Column(// narrow
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAvatar(),
                    const SizedBox(height: 10),
                    _buildContent(context),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// function that returns a widget
Widget _buildAvatar() {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
      color: Colors.redAccent,
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.person, size: 25, color: Colors.white),
  );
}

// content widget for profile
Widget _buildContent(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Pointdexter Danklord',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const Text('Major: Texting'),
      const Text('Favorate class: Driving'),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen())
          );
        },
        child: const Text('Log in'),
      ),
    ],
  );
}

