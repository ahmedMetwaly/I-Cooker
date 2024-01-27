import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/connection_checker_viewModel.dart';
import 'package:the_cooker/viewModel/shared_pref_viewModel.dart';
import 'package:the_cooker/view/connection_checker/connection_checker.dart';
import 'package:the_cooker/view/home/home.dart';
import 'package:the_cooker/view/onboarding/onboarding_screen.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SharedPrefController>();
    final connection = context.watch<ConnectionCheckerController>();
    return AnimatedSplashScreen.withScreenFunction(
      splashIconSize: SizeManager.s300,
      splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagesManager.splashScreenIcon,
              height: SizeManager.s200,
              width: SizeManager.s200,
            ),
            const SizedBox(
              height: SizeManager.s10,
            ),
            const CircularProgressIndicator(),
          ]),
      screenFunction: () async {
        connection.isConnected();
        if (controller.firstTime) {
          return const OnBoardingScreen();
        } else {
          return const ConnectionChecker(screen: Home(),);
        }
      },
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
