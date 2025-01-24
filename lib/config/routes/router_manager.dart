import 'package:assesmentmanushtech/app/build_config.dart';
import 'package:assesmentmanushtech/config/routes/navigator_observer.dart';
import 'package:assesmentmanushtech/features/authentication/ui/pages/signin_screen.dart';
import 'package:assesmentmanushtech/features/home/ui/pages/cart_page.dart';
import 'package:assesmentmanushtech/features/home/ui/pages/home_screen.dart';
import 'package:assesmentmanushtech/features/startup/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterManager {
  static final config = GoRouter(
      observers: [
        CustomNavigatorObserver(),
      ],
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen(); // Sets SplashScreen as the initial route
          },
        ),
        GoRoute(
          path: SigninScreen.path,
          builder: (BuildContext context, GoRouterState state) {
            return const SigninScreen();
          },
        ),
        GoRoute(
          path: HomeScreen.path,
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),

        GoRoute(
          path: CartPage.path,
          builder: (BuildContext context, GoRouterState state) {
            return CartPage();
          },
        ),


      ]);

  static CustomTransitionPage createSlideTransitionPage(
      {required Widget child}) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final bool show;

  const FlavorBanner({super.key, required this.child, required this.show});

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topEnd,
            message:
                BuildConfig.buildType == BuildType.development ? 'dev' : 'prod',
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
