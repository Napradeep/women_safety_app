import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as pos;
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
import 'package:women_safty_app/common/colors.dart';
import 'package:women_safty_app/common/urllaunch.dart';

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  pos.Position? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Get the current location
    _currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  String? url;

  void _share() {
    if (_currentLocation != null) {
      url =
          'https://www.google.com/maps/search/?api=1&query=${_currentLocation?.latitude},${_currentLocation?.longitude}';
      Share.share(url ?? "");
    } else {
      print('Current location is not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Trigger SOS action
                UrlLauncherUtils.sendSms(
                  "6383700425",
                  "SOS! I need help. Please contact me immediately.",
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: bgcolour,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "SOS",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildQuickAction(Icons.call, "Call Police", () {
                UrlLauncherUtils.launchCall("100");
              }),
              _buildQuickAction(Icons.message, "Send Alert", () {
                UrlLauncherUtils.sendSms(
                  "6383700425",
                  ""
               //   "Emergency! Please respond urgently.",
                );
              }),
              _buildQuickAction(Icons.share, "Share Location", () {
                UrlLauncherUtils.sendSms(
                  "6383700425",
                  url ?? "",
                );
                 _share() ;
              
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onPress) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: CircleAvatar(
            backgroundColor: bgcolour.withOpacity(0.1),
            child: Icon(icon, color: bgcolour),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
