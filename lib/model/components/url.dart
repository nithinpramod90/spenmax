import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://spenmax.in/pricing/');

Future<void> privacyPolicy() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
