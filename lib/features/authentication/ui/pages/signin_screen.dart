import 'package:animate_do/animate_do.dart';
import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:assesmentmanushtech/core/blocs/common_api_state.dart';
import 'package:assesmentmanushtech/core/constants/assets.dart';
import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/language/generated/locale_keys.g.dart';
import 'package:assesmentmanushtech/core/util/responsive_helper.dart';
import 'package:assesmentmanushtech/core/widget/common_button.dart';
import 'package:assesmentmanushtech/core/widget/common_loading_dialog.dart';
import 'package:assesmentmanushtech/features/authentication/bloc/sign_in_cubit.dart';
import 'package:assesmentmanushtech/features/authentication/data/models/params/sign_in_params.dart';
import 'package:assesmentmanushtech/features/home/ui/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatefulWidget {
  static const String path = '/signin_screen';

  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SignInCubit>(),
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ResponsiveHelper.height(400),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.imagesBackground),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeInUp(
                              duration: Duration(seconds: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Assets.imagesLight1))),
                              )),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1200),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Assets.imagesLight2))),
                              )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(Assets.imagesClock))),
                              )),
                        ),
                        Positioned(
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Text(
                                    LocaleKeys.login.tr(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveHelper.fontSize(30),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ResponsiveHelper.height(30.0),
                      bottom: ResponsiveHelper.height(30.0),
                      left: ResponsiveHelper.width(30.0),
                      right: ResponsiveHelper.width(30.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1800),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: bluePrimary),
                                  boxShadow: [
                                    BoxShadow(
                                        color: blueSecondary,
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: bluePrimary))),
                                    child: TextField(
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              LocaleKeys.phone_number.tr(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: LocaleKeys.password.tr(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: ResponsiveHelper.height(30),
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: BlocConsumer<SignInCubit, CommonApiState>(
                            listener: (context, state) {
                              if (state is ApiSuccess) {
                                debugPrint("ApiSuccess");
                                context.go(HomeScreen.path);
                                debugPrint("ApiSuccess2");

                              } else if (state is ApiError) {
                                debugPrint("ApiError");
                              }
                            },
                            builder: (context, state) {
                              return CommonButton(
                                  text: LocaleKeys.login.tr(),
                                  isEnabled: true,
                                  isLoading: state is ApiLoading?true:false,
                                  textColor: Colors.white,
                                  onTap: () {
                                    if (phoneController.text.isNotEmpty ||
                                        passwordController.text.isNotEmpty) {
                                      context.read<SignInCubit>().signin(
                                          SignInParams(
                                              identifier: phoneController.text,
                                              password:
                                                  passwordController.text));
                                    } else {
                                      floatingSnackBar(
                                        message: 'Enter your phone number and password!',
                                        context: context,
                                        textColor: Colors.white,
                                        textStyle:
                                            const TextStyle(color: Colors.red),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor: bluePrimary,
                                      );
                                    }
                                  });
                            },
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.height(70),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  static showLoadingDialog(BuildContext context, {String? text}) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) => CommonLoadingDialog(
        text: text,
      ),
    );
  }

  static stopLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
