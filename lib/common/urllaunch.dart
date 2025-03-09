import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  /// Launch a call to the given number
  static Future<void> launchCall(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 static Future<void> launchWhatsApp(String mobileno, String message) async {
    final whatsappUrl =
        "https://wa.me/$mobileno?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw "Could not launch WhatsApp";
    }
  }

  /// Send an SMS to the given number with an optional message
  static Future<void> sendSms(String number, String message) async {
    final Uri url = Uri(
      scheme: 'sms',
      path: number,
      query: 'body=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not send SMS to $number';
    }
  }

  /// Share a location via URL
  static Future<void> shareLocation(double latitude, double longitude) async {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not share location';
    }
  }

  /// Send a notification (Requires additional setup)
  static Future<void> sendNotification(String title, String body) async {
    // Placeholder function
    print("Notification sent: $title - $body");
  }
}
