import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigatorKey =
      GlobalKey<NavigatorState>();
  late Function _showDialogListener;
  Completer? _dialogCompleter;

  /// set the navigation key to route back when
  /// the view is set to true in the view model
  /// for that to work you have to set with loading the UI at is main file of the app
  GlobalKey<NavigatorState> get dialogNavigatorKey => _dialogNavigatorKey;

  void registerDialogListener(Function showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// call the dialog listener
  /// and return a future that will wait for the dialog completer
  Future showDialog() {
    _dialogCompleter = Completer();
    _showDialogListener();
    return _dialogCompleter!.future;
  }

  /// completes the _dialogCompleter
  /// to resume the future execution call
  void dialogComplete() {
    _dialogNavigatorKey.currentState?.pop();
    _dialogCompleter?.complete();
    _dialogCompleter = null;
  }

  showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: const Color(0xFF2FA2B9),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        // backgroundColor: Color(0xFFff3333),
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
