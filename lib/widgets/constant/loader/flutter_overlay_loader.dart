import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:virtualguide/widgets/constant/loader/spinkit.dart';

class FlutterOverlayLoader {
  static void showLoader(context) {
    Loader.show(context,
        themeData: Theme.of(context).copyWith(colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.black54)),
        progressIndicator: Spinkit.spinkit,
        overlayColor: Colors.black45);
  }

  static void hideLoader() {
    Loader.hide();
  }
}
