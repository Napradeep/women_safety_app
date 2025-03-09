// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:women_safty_app/common/colors.dart';
import 'package:women_safty_app/common/intoscreen.dart';
import 'package:women_safty_app/view%20/location/location.dart';
import 'package:women_safty_app/view%20/safety_screen/safty_screen.dart';
import 'package:women_safty_app/view%20/setting/setting_screen.dart';
import 'package:women_safty_app/view%20/sos/sos_srceen.dart';
import 'package:women_safty_app/view%20/trustcontact/trust_contact.dart';

class WomenSafetyApp extends StatelessWidget {
  const WomenSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IntroScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    SOSScreen(),
    TrustedContactsScreen(),
    LiveLocationScreen(),
    SafetyResourcesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: bgcolour,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(WomenSafetyApp());
}





// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart' as pos;
// import 'package:geolocator/geolocator.dart';
// import 'package:share/share.dart';
// import 'package:women_safty_app/common/colors.dart';
// import 'package:women_safty_app/common/urllaunch.dart';

// class SOSScreen extends StatefulWidget {
//   const SOSScreen({super.key});

//   @override
//   State<SOSScreen> createState() => _SOSScreenState();
// }

// class _SOSScreenState extends State<SOSScreen> {
//   pos.Position? _currentLocation;
//   String? url;

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissionsAndFetchLocation();
//   }

//   Future<void> _checkPermissionsAndFetchLocation() async {
//     try {
//       // Check and request location permissions
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         throw Exception("Location services are disabled.");
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           throw Exception("Location permissions are denied.");
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         throw Exception(
//             "Location permissions are permanently denied. Please enable them in settings.");
//       }

//       // Fetch the current location
//       _currentLocation = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       setState(() {
//         url =
//             'https://www.google.com/maps/search/?api=1&query=${_currentLocation?.latitude},${_currentLocation?.longitude}';
//       });
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }

//   void _share() {
//     if (_currentLocation != null) {
//       Share.share(url ?? "No location available.");
//     } else {
//       print('Current location is not available');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("SOS")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 UrlLauncherUtils.sendSms(
//                   "6383700425",
//                   "SOS! I need help. Please contact me immediately.",
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: bgcolour,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: const Text(
//                 "SOS",
//                 style: TextStyle(fontSize: 24, color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildQuickAction(Icons.call, "Call Police", () {
//                 UrlLauncherUtils.launchCall("100");
//               }),
//               _buildQuickAction(Icons.message, "Send Alert", () {
//                 UrlLauncherUtils.sendSms(
//                   "6383700425",
//                   "Emergency! Please respond urgently.",
//                 );
//               }),
//               _buildQuickAction(Icons.share, "Share Location", _share),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickAction(IconData icon, String label, VoidCallback onPress) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onPress,
//           child: CircleAvatar(
//             backgroundColor: bgcolour.withOpacity(0.1),
//             child: Icon(icon, color: bgcolour),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }
