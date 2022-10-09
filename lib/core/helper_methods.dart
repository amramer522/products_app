import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo({required Widget page, bool withHistory = true}) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}

showMessage({required String msg}){
  ScaffoldMessenger.of(navigatorKey.currentContext!)
      .showSnackBar(SnackBar(
      backgroundColor: Colors.green.withOpacity(.5),
      elevation: 0,
      content: Row(
        children: [
          Icon(
            Icons.message,
            color: Colors.black,
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                msg,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      )));
}
