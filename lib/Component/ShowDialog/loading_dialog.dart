import 'package:flutter/material.dart';

class LoadingDialog {
  Future<dynamic> init({
    required BuildContext context,
  }) { 
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        );
      }
    );
  }
}