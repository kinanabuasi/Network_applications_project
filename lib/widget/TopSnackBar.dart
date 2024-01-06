// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TopSnackBar_success(BuildContext context, String message) {
  // OverlayState? overlayState = Overlay.of(context);
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.success(
      message: message,
      backgroundColor: Colors.blue,
    ),
  );
}

TopSnackBar_error(BuildContext context, String message) {
  // OverlayState? overlayState = Overlay.of(context);
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.success(
      message: message,
      backgroundColor: Colors.red,
    ),
  );
}
