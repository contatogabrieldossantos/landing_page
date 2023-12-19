import 'package:flutter/material.dart';
import 'package:landing_app/ui/components/experience_widget/experience_widget.dart';
import 'package:landing_app/ui/drawer/drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:landing_app/ui/common/app_colors.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';

import '../../components/experience_widget/experience_model.dart';
import 'experiences_viewmodel.dart';

class ExperiencesView extends StackedView<ExperiencesViewModel> {
  
  ExperiencesView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget builder(
    BuildContext context,
    ExperiencesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: _key,
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
                  children: [
                    AppBar(
                      leading: GestureDetector(
                        onTap: () => _key.currentState!.openDrawer(),
                        child: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ),
                    ...viewModel.experiences.reversed.map((e) => ExperienceWidget(data: ExperienceModel.fromJson(e))).toList()
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
  ExperiencesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExperiencesViewModel();
}
