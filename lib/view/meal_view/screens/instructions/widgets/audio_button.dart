import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:the_cooker/viewModel/audio_viewModel.dart';
import "package:the_cooker/resources/constatns_manager.dart";
import "package:the_cooker/resources/string_manager.dart";
import "package:the_cooker/resources/values_manager.dart";

class AudioButton extends StatelessWidget {
  const AudioButton(
      {super.key,
      required this.buttonTitle,
      required this.instruction,
      required this.icon});
  final String buttonTitle;
  final String instruction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioController>(
      builder: (context, controller, child) => GestureDetector(
        onTap: () {
          switch (buttonTitle) {
            case StringManager.play:
              controller.speak(instruction);
              break;
            case StringManager.stop:
              controller.stop();
              break;
            case StringManager.pause:
              controller.pause();
              break;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius:
                BorderRadius.circular(ConstantsManager.borderRadiusCard),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(buttonTitle),
            ],
          ),
        ),
      ),
    );
  }
}
