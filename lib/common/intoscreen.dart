// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:women_safty_app/common/colors.dart';
import 'package:women_safty_app/main.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<Map<String, dynamic>> pageData = [
    {
      "title": "One-Tap SOS for Instant Help",
      "body":
          "Quickly alert your trusted contacts and emergency services with a single tap. Stay safe and connected when you need it the most",
      "icon": Icons.safety_check_sharp,
      "iconColor": Colors.blue,
    },
    {
      "title": "Stay Connected in Real Time",
      "body":
          "Share your live location with trusted contacts to ensure your safety during any journey. Help is always just a step away",
      "icon": Icons.location_on_outlined,
      "iconColor": Colors.green,
    },
    {
      "title": "Stay Secure",
      "body": "Your safety and security are our priority.",
      "icon": Icons.security,
      "iconColor": Colors.red,
    },
    {
      "title": "Help is on the Way!",
      "body":
          "We’ve shared your live location with your trusted contacts and emergency services. Stay calm, help is on the way.",
      "icon": Icons.mobile_screen_share_sharp,
      "iconColor": Colors.pink,
    },
  ];

  // Reusable function to create PageViewModel
  PageViewModel buildPage(Map<String, dynamic> data) {
    return PageViewModel(
      title: data["title"],
      body: data["body"],
      image: CircleAvatar(
        maxRadius: 25,
        backgroundColor: data["iconColor"].withOpacity(0.2),
        child: Center(
          child: Icon(
            data["icon"],
            size: 30,
            color: data["iconColor"],
          ),
        ),
      ),
      decoration: PageDecoration(
        titlePadding: EdgeInsets.all(10),
        titleTextStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 15),
        imagePadding: EdgeInsets.all(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pageData.map((data) => buildPage(data)).toList(),
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(color: bgcolour.withOpacity(0.7)),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: bgcolour,
        ),
        done: Text("Get Started",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: bgcolour.withOpacity(0.7))),
        dotsDecorator: DotsDecorator(
          activeColor: bgcolour,
          color: bgcolour,
          size: const Size.square(10.0),
          activeSize: const Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
