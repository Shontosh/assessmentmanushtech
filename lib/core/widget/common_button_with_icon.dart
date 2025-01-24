import 'dart:async';

import 'package:assesmentmanushtech/core/util/responsive_helper.dart';
import 'package:flutter/material.dart';

class CommonButtonWithIcon extends StatefulWidget {
  final String text;
  final Color textColor;
  final FutureOr<void> Function() onTap;
  final bool isEnabled;
  final bool isLoading;
  final String icon;

  const CommonButtonWithIcon({
    super.key,
    required this.text,
    required this.textColor,
    required this.onTap,
    required this.icon,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  _CommonButtonWithIconState createState() => _CommonButtonWithIconState();
}

class _CommonButtonWithIconState extends State<CommonButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled && !widget.isLoading ? widget.onTap : null,
      child: Container(
        width: ResponsiveHelper.width(327),
        height: ResponsiveHelper.height(56),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: widget.isLoading
            ? Center(
          child: CircularProgressIndicator(
            color: widget.textColor,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image(image: AssetImage(widget.icon),width: 24,height: 24,),
            const SizedBox(width: 12.0),
            SizedBox(
              width: ResponsiveHelper.width(190),
              child: Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: widget.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
