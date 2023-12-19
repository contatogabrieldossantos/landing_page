import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeContactSheetModel extends BaseViewModel {

  void navigateToPhone() {
    launchUrl(Uri(scheme: 'tel', path: '+(61)430551577'));
  }

  void navigateToLinkedIn() async {
    if (!await launchUrl(
      Uri(scheme: 'https', host: 'www.linkedin.com', path: '/in/gabriel-dos-santos-05b2a498/'),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch LinkedIn');
    }

  }
  void launchWhatsApp() async {
    const String phone = '61430551577';
    if (!await launchUrl(
      Uri(
        scheme: 'https',
        host: 'wa.me',
        path: phone),
        mode: LaunchMode.externalApplication,
      )) {
      throw Exception('Could not launch LinkedIn');
    }
  }

  String getUrlWhatsApp() {
    
    const String phone = '61430551577';
    const String message = 'Hello Gabriel!';

    if (Platform.isAndroid) {
      return "wa.me/$phone/?text=${Uri.parse(message)}"; 
    } else {
      return "api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
    }
  }


  void navigateToEmail() async {
    if (!await launchUrl(
      Uri(scheme: 'mailto', queryParameters: {'subject': 'Contact'}, path: 'contatogabrieldossantos@gmail.com'),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch LinkedIn');
    }

  }

}
