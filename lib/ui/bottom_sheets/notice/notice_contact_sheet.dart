import 'package:flutter/material.dart';
import 'package:landing_app/ui/bottom_sheets/notice/notice_contact_sheet_model.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NoticeContactSheet extends StackedView<NoticeContactSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeContactSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeContactSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          verticalSpaceTiny,
          ListTile(
            leading: const Icon(Icons.email, size: 32,),
            title: const Text('E-mail: contatogabrieldossantos@gmail.com'),
            onTap: viewModel.navigateToEmail
          ),
          verticalSpaceTiny,
          ListTile(
            leading: const Icon(Icons.phone, size: 32,),
            title: const Text('(61) 430 551 577'),
            onTap: viewModel.navigateToPhone
          ),
          ListTile(
            leading: Image.asset("assets/icon/whats.png", height: 36),
            title: const Text('(61) 430 551 577'),
          ),
          verticalSpaceTiny,
          ListTile(
            leading: Image.asset("assets/icon/linkedin.png", height: 36),
            title: const Text('LinkedIn'),
            onTap: viewModel.navigateToLinkedIn
          ),
          verticalSpaceTiny,
        ],
      ),
    );
  }

  @override
  NoticeContactSheetModel viewModelBuilder(BuildContext context) => NoticeContactSheetModel();
}
