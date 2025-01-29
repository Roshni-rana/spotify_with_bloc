import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// hide loader
hideLoader(BuildContext context) {
  Navigator.pop(context);
}

snackBar({required String label, required bool successColor}) {
  return Fluttertoast.showToast(
    msg: label,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: successColor ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
