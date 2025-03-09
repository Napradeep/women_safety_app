// Safety Resources Screen
import 'package:flutter/material.dart';
import 'package:women_safty_app/common/colors.dart';

class SafetyResourcesScreen extends StatelessWidget {
  const SafetyResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Safety Resources")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.phone, color: bgcolour),
            title: Text("National Helpline"),
            subtitle: Text("Dial 112 for immediate help"),
          ),
          ListTile(
            leading: Icon(Icons.shield, color: bgcolour),
            title: Text("Self-defense Tips"),
            subtitle: Text("Learn how to stay safe in emergencies."),
          ),
        ],
      ),
    );
  }
}