// Trusted Contacts Screen
import 'package:flutter/material.dart';

class TrustedContactsScreen extends StatelessWidget {
  const TrustedContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trusted Contacts")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to add contacts
          },
          child: Text("Add Trusted Contact"),
        ),
      ),
    );
  }
}