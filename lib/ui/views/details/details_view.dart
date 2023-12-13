import 'package:flutter/material.dart';
import 'package:landing_app/ui/charts/bar_chart/skills_chart.dart';
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
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                verticalSpaceLarge,
                Column(
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
                    const SkillsChart(),
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
                MaterialButton(
                  color: kcDarkGreyColor,
                  onPressed: viewModel.showBottomSheet,
                  child: const Text(
                    'Show contacts',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewModel();
}
