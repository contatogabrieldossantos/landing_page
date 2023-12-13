import 'package:landing_app/app/app.locator.dart';
import 'package:landing_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  void navigateToDetailsPage() {
    _navigationService.replaceWithDetailsView();
  }

  void navigateToHomePage() {
    _navigationService.replaceWithHomeView();
  }

}
