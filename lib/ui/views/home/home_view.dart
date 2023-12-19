import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Hi, I\'m Gabriel. I design and build user interfaces',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.navigateToDetailsPage,
                      child: const Text(
                        'Learn more about what I do',
                        style: TextStyle(color: Colors.white),
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
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
