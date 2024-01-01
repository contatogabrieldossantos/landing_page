import 'package:landing_app/app/app.locator.dart';
import 'package:landing_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  void navigateToDetailsPage() {
    _navigationService.replaceWithDetailsView();
  }
  
  void navigateToExperiencesPage() {
    _navigationService.replaceWithExperiencesView();
  }

  void navigateToHomePage() {
    _navigationService.replaceWithHomeView();
  }
  
  void navigateToRepository() async {
    if (!await launchUrl(
      Uri(scheme: 'https', host: 'github.com', path: 'contatogabrieldossantos/landing_page'),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch Github');
    }
    _navigationService.replaceWithHomeView();
  }

}
