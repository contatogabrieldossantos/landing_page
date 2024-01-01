import 'package:flutter/material.dart';
import 'package:landing_app/ui/bottom_sheets/notice/notice_contact_sheet_model.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NoticeContactSheet extends StackedView<NoticeContactSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeContactSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onViewModelReady(NoticeContactSheetModel viewModel) {
    viewModel.fetchData();
    super.onViewModelReady(viewModel);
  }

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
      child: Observer(
        builder: (context) {

          final isLoading = viewModel.isLoading;
          final onError = viewModel.onError;

          if (isLoading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Text(
                    request.title!,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  verticalSpaceTiny,
                  _buildShimmer(context),
                  verticalSpaceTiny,
                  _buildShimmer(context),
                  verticalSpaceTiny,
                  _buildShimmer(context),
                  verticalSpaceTiny,
                  _buildShimmer(context),
                  verticalSpaceTiny,
              ],
            );
          } else if (onError && !isLoading) {
            return Container(
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                color: Colors.black,
                onPressed: viewModel.fetchData,
                child: const Text(
                  'Try again',
                  style: TextStyle(color: Colors.white),
                ),
              )
            );
          } else if (!isLoading && !onError) {
            return Column(
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
                    title: Text('E-mail: ${ (viewModel.email != null) ? viewModel.email : 'Error retrieving e-mail'}'),
                    onTap: viewModel.navigateToEmail
                  ),
                  verticalSpaceTiny,
                  ListTile(
                    leading: const Icon(Icons.phone, size: 32,),
                    title: Text((viewModel.phone != null) ? viewModel.phone! : 'Error retrieving number'),
                    onTap: viewModel.navigateToPhone
                  ),
                  verticalSpaceTiny,
                  ListTile(
                    leading: Image.asset("assets/icon/whats.png", height: 36),
                    title: Text((viewModel.phone != null) ? viewModel.phone! : 'Error retrieving WhatsApp'),
                  ),
                  verticalSpaceTiny,
                  ListTile(
                    leading: Image.asset("assets/icon/linkedin.png", height: 36),
                    title: const Text('LinkedIn'),
                    onTap: viewModel.navigateToLinkedIn
                  ),
                  verticalSpaceTiny,
              ],
            );
          } else {
            return Container();
          }
        
        }
      )
    );
  }

  Widget _buildShimmer(context) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: Container(width: 36, height: 36, color: Colors.grey),
        title: Container(width: MediaQuery.of(context).size.width, height: 12, color: Colors.grey,),
      ),
    );

  @override
  NoticeContactSheetModel viewModelBuilder(BuildContext context) => NoticeContactSheetModel();
}
