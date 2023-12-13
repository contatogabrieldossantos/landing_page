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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text('Drawer Header', style: TextStyle(color: Colors.white),),
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
            title: const Text('Professional Experiences'),
            onTap: viewModel.navigateToDetailsPage,
          ),
          ListTile(
            title: const Text('Educational'),
            onTap: viewModel.navigateToDetailsPage,
          ),
        ],
      ),
    );
  }

}