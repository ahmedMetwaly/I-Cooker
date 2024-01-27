import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
//import 'package:the_cooker/controller/connection_checker_controller.dart';
import 'package:the_cooker/resources/routes.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/onboarding/onboarding_buttons.dart';
import '../../viewModel/on_boarding_viewModel.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingController>(
      builder: (context, onBoardingController, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: IntroductionScreen(
                  bodyPadding: const EdgeInsets.all(PaddingManager.p10),
                  showSkipButton: true,
                  curve: Curves.bounceInOut,
                  onSkip: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.homePage),
                  onDone: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.homePage),
                  skip: const Button(title: StringManager.skip),
                  next: const Icon(Icons.arrow_forward),
                  done: const Button(title: StringManager.done),
                  pages: onBoardingController.pageViewData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
