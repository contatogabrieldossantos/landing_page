import 'package:flutter/material.dart';
import 'package:landing_app/ui/drawer/drawer_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DrawerWidget extends StackedView<DrawerViewModel> {

  const DrawerWidget({super.key});

  @override
  DrawerViewModel viewModelBuilder(BuildContext context) => DrawerViewModel();

  @override
  Widget builder(
    BuildContext context,
    DrawerViewModel viewModel,
    Widget? child,
  ) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: GestureDetector(
              onTap: viewModel.navigateToRepository,
              child: const Text('Get this simple Flutter code!', style: TextStyle(color: Colors.white)),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: viewModel.navigateToHomePage,
          ),
          ListTile(
            title: const Text('About me'),
            onTap: viewModel.navigateToDetailsPage,
          ),
          ListTile(
            title: const Text('Work Experiences'),
            onTap: viewModel.navigateToExperiencesPage,
          ),
        ],
      ),
    );
  }

}