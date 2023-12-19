import 'package:landing_app/app/app.bottomsheets.dart';
import 'package:landing_app/app/app.locator.dart';
import 'package:landing_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExperiencesViewModel extends BaseViewModel {

  // final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final List<Map> experiences = [
    {
      'role': 'Intern, Junior Developer',
      'companyName': 'Nexxera S.A.',
      'description': 'Developed a banking app used to sign and validate signatures for bank contracts worldwide. The client (Santander) used this app for several years, and even after I left the company, they were still using it.',
      'dateInital': 'Mar 2012',
      'dateFinal': 'Nov 2013',
      'skills': 'Java, Android (Java SDK), JSF, Git',
    },
    {
      'role': 'Senior Developer',
      'companyName': 'Branet Logistics and health management',
      'description': 'Developed a native Android app using their Java SDK for a Brazil\'s government Health system (SUS) which was used in more than 25 cities, having 10k monthly users.',
      'dateInital': 'Jan 2015',
      'dateFinal': 'Jan 2019',
      'skills': 'Java, Android (Java SDK), JSF, Git',
    },
    {
      'role': 'Senior Developer',
      'companyName': 'Doutbox',
      'description': 'Developed several applications, mostly small Flutter apps ranging between 1k and 10k monthly users. The most significant project was a native Android app for selling tickets for bar and club entrances at various events for the second-largest company in Latin America (they used the app in more than 3k events every year).',
      'dateInital': 'Feb 2019',
      'dateFinal': 'Dec 2021',
      'skills': 'Android (Java SDK), Firebase, Dart, Flutter, Git',
    },
    {
      'role': 'Senior Developer',
      'companyName': 'Evoluum',
      'description': 'Developing various features for a major Health Plan company called Unimed. The app has over 130k monthly users, leading to a significant positive impact. Features include scheduling consults, telemedicine, doctor search, rating (consult and app), and many others.',
      'dateInital': 'Jan 2022',
      'dateFinal': 'Present',
      'skills': 'Java, Spring Boot, Flutter, Dart, Firebase, Git',
    }
  ];

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
