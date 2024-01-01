// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_contact_sheet_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoticeContactSheetModel on _NoticeContactSheetModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_NoticeContactSheetModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$onErrorAtom =
      Atom(name: '_NoticeContactSheetModel.onError', context: context);

  @override
  bool get onError {
    _$onErrorAtom.reportRead();
    return super.onError;
  }

  @override
  set onError(bool value) {
    _$onErrorAtom.reportWrite(value, super.onError, () {
      super.onError = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
onError: ${onError}
    ''';
  }
}
