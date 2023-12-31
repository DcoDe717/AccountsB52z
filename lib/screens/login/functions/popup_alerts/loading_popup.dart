import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showLoadingPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.discreteCircle(color:Colors.black12, size: 45)
              // SizedBox(height: 16.0),
              // Text(
              //   "Loading...",
              //   style: TextStyle(fontSize: 16.0),
              // ),
            ],
          ),
        ),
      );
    },
  );
}

void hideLoadingPopup(BuildContext context) {
  Navigator.of(context).pop();
}
