import 'dart:async';

import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:assesmentmanushtech/core/util/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final FutureOr<void> Function() onTap;
  final bool isEnabled;
  final bool isLoading;

  const CommonButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.onTap,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled && !widget.isLoading ? widget.onTap : null,
      child: Container(
        width: ResponsiveHelper.width(340),
        height: ResponsiveHelper.height(50),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: widget.isEnabled ? bluePrimary : bluePrimary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: widget.isLoading
            ? SpinKitCircle(
                color: widget.textColor,
                size: 30.0, // Adjust the size of the spinner
              )
            : Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: widget.textColor),
              ),
      ),
    );
  }
}
