import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// hide loader
hideLoader(BuildContext context) {
  Navigator.pop(context);
}

snackBar({required String label}) {
  return Fluttertoast.showToast(
    msg: label,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: Colors.blueGrey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
