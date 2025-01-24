import 'dart:async';
import 'package:assesmentmanushtech/app/app.dart';
import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:assesmentmanushtech/core/constants/assets.dart';
import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/language/generated/locale_keys.g.dart';
import 'package:assesmentmanushtech/core/language/language_service.dart';
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:assesmentmanushtech/core/util/responsive_helper.dart';
import 'package:assesmentmanushtech/features/authentication/ui/pages/signin_screen.dart';
import 'package:assesmentmanushtech/features/home/ui/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      getIt<AuthService>().getAccessToken() != ""
              ?context.go(HomeScreen.path):
              context.go(SigninScreen.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logosLogo,
              width: ResponsiveHelper.width(100),
              fit: BoxFit.cover,
            ),
            Text(LocaleKeys.splash_title.tr(),style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: bluePrimary),),
          ],
        ),
      ),
    );
  }
}
