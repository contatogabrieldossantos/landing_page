import 'dart:io';
import 'package:landing_app/app/services/data_service.dart';
import 'package:mobx/mobx.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

part 'notice_contact_sheet_model.g.dart';

class NoticeContactSheetModel extends _NoticeContactSheetModel with _$NoticeContactSheetModel {
  NoticeContactSheetModel() : super();
}

abstract class _NoticeContactSheetModel extends BaseViewModel with Store {

  final _dataService = DataService();

  @observable
  bool isLoading = true;

  @observable
  bool onError = false;

  String? email;
  String? phone;
  String? linkedInUrl;
  
  Future<void> fetchData() async { 

    try {
    
      _setOnError(false);
      _setIsLoading(true);

      final data = await _dataService.fetchData();
      
      if (data != null) {
        _setData(data);
      } else {
        _setOnError(true);
      }

      _setIsLoading(false);
    
    } catch (e) {
      _setOnError(true);
      _setIsLoading(false);
    } 

  }

  _setOnError(bool onError) => this.onError = onError;
  _setIsLoading(bool isLoading) => this.isLoading = isLoading;

  _setData(Map data) {
    email = data['email'];
    phone = data['number'];
    linkedInUrl = data['linked_in'];
  }

  void navigateToPhone() => launchUrl(Uri(scheme: 'tel', path: phone));

  void navigateToLinkedIn() async {
    if (!await launchUrl(
      Uri(scheme: 'https', host: 'www.linkedin.com', path: linkedInUrl!.substring(24)),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch LinkedIn');
    }

  }
  void launchWhatsApp() async {
    String phoneFormatted = phone!.replaceAll(RegExp(r'[^0-9]'),'');
    
    if (!await launchUrl(
      Uri(
        scheme: 'https',
        host: 'wa.me',
        path: phoneFormatted),
        mode: LaunchMode.externalApplication,
      )) {
      throw Exception('Could not launch LinkedIn');
    }
  }

  String getUrlWhatsApp() {
    
    String phoneFormatted = phone!.replaceAll(RegExp(r'[^0-9]'),'');
    const String message = 'Hello Gabriel!';

    if (Platform.isAndroid) {
      return "wa.me/$phone/?text=${Uri.parse(message)}"; 
    } else {
      return "api.whatsapp.com/send?phone=$phoneFormatted=${Uri.parse(message)}";
    }

  }


  void navigateToEmail() async {
    if (!await launchUrl(
      Uri(scheme: 'mailto', queryParameters: {'subject': 'Contact'}, path: email),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch LinkedIn');
    }

  }

}
