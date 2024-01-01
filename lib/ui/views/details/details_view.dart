import 'package:flutter/material.dart';
import 'package:landing_app/ui/common/app_strings.dart';
import 'package:landing_app/ui/drawer/drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:landing_app/ui/common/app_colors.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';

import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  
  DetailsView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: _key,
      bottomNavigationBar: MaterialButton(
        color: kcDarkGreyColor,
        onPressed: viewModel.showBottomSheet,
        child: const Text(
          'Show contacts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                verticalSpaceLarge,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      leading: GestureDetector(
                        onTap: () => _key.currentState!.openDrawer(),
                        child: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ),
                    const Text(
                      ksDetailsStorieBottomSheetDescription,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      educationalDescription,
                      style: styleDetails,
                    ),
                    verticalSpaceTiny,
                    const ListTile(
                      title: Text('Bachelor in Computer Science', style: styleDetails,),
                      subtitle: Text('Unisul, Tubarão SC (BRA), Mar 2012 - Apr 2020', style: styleDetails),
                      leading: Icon(Icons.school),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      technicalSkillsDescription,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      ksDetailsStorieBottomSheetDescriptionBottom,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    verticalSpaceMedium,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(BuildContext context) => DetailsViewModel();

}
