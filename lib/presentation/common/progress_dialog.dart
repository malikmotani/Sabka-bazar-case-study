import 'package:flutter/material.dart';

import 'loading.dart';

mixin ProgressDialog {
  static bool _isDialogVisible = false;

  static show(BuildContext context) {
    _isDialogVisible = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const CircleProgressBar();
        });
  }

  static hide(BuildContext context) {
    if (_isDialogVisible) {
      _isDialogVisible = false;
      Navigator.pop(context);
    }
  }
}
