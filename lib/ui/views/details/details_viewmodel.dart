import 'package:landing_app/app/app.bottomsheets.dart';
import 'package:landing_app/app/app.locator.dart';
import 'package:landing_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {

  // final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  void navigateToDetailsPage() {
    // _navigationService.na
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.noticeContact,
      title: ksDetailsBottomSheetTitle,
      description: ksDetailsBottomSheetDescription,
    );
  }
}
