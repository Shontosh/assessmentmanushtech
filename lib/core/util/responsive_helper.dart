

import 'package:responsive_sizer/responsive_sizer.dart';

class ResponsiveHelper {
  static const double baseWidth = 375.0;
  static const double baseHeight = 812.0;

  static double width(double width) {
    return (width / baseWidth) * 100.w;
  }

  static double height(double height) {
    return (height / baseHeight) * 100.h;
  }

  static double fontSize(double fontSize) {
    return (fontSize / baseWidth) *
        100.sp; // Assumes font size scales with width
  }
}
