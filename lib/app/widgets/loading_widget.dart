import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  Color? color;
  double? size;
  LoadingWidget({
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size ?? 20,
        width: size ?? 20,
        child: GetPlatform.isAndroid
            ? CircularProgressIndicator(
                color: color ?? primaryWhite,
              )
            : CupertinoActivityIndicator(
                color: color ?? primaryWhite,
              ),
      ),
    );
  }
}
