import 'package:url_launcher/url_launcher.dart';

class LaunchUrlComp {
  static Future<void> launcherUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
