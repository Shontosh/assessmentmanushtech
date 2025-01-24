import 'package:assesmentmanushtech/config/routes/router_manager.dart';
import 'package:assesmentmanushtech/config/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'build_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (BuildContext context) => ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: _materialRouter(context),
          );
        },
      ),
    );
  }

  Widget _materialRouter(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: RouterManager.config,
      debugShowCheckedModeBanner: false,
      title: BuildConfig.title,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
