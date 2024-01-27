import 'package:flutter/material.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/meal_view/screens/instructions/widgets/audio_button.dart';
import 'package:the_cooker/view/onboarding/onboarding_buttons.dart';

class Instruction extends StatelessWidget {
  const Instruction({
    super.key,
    required this.instruction,
    required this.instructionNumber,
  });

  final String instruction;
  final int instructionNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Button(
        title: "$instructionNumber",
      ),
      title: Column(
        children: [
          Text(instruction,),
          const SizedBox(height: SizeManager.s10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AudioButton(
                buttonTitle: StringManager.play,
                instruction: instruction,
                icon: Icons.play_arrow,
              ),
              AudioButton(
                  buttonTitle: StringManager.pause,
                  instruction: instruction,
                  icon: Icons.pause),
              AudioButton(
                  buttonTitle: StringManager.stop,
                  instruction: instruction,
                  icon: Icons.stop),
            ],
          ),
        ],
      ),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
