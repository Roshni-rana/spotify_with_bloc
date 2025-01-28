import 'package:flutter/material.dart';

/// hide loader
hideLoader(BuildContext context) {
  Navigator.pop(context);
}

snackBar({String? label}) {
  return Fluttertoast.showToast(
    msg: label,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: Colors.blueGrey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
