import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
            body: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).disabledColor,
                      spreadRadius: 1,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Text(
                      "Loading...",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularLoader extends StatelessWidget {
  final Size? size;
  final Color? color;
  final double? width;

  const CircularLoader({super.key, this.size, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: Get.width * (width ?? 0.05),
          height: Get.width * (width ?? 0.05),
          child: getLoader(color, context),
        ),
      ),
    );
  }

  getLoader(Color? color, BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(color: color ?? Colors.white);
    } else {
      return CircularProgressIndicator(color: color ?? Theme.of(context).scaffoldBackgroundColor, strokeWidth: 3);
    }
  }
}
