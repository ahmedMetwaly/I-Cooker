import "package:flutter/material.dart";

import "../../../../../resources/values_manager.dart";
import "../../../../onboarding/onboarding_buttons.dart";


class VideoHeader extends StatelessWidget {
  const VideoHeader({
    super.key,
    required this.mealTitle,
  });

  final String mealTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: PaddingManager.p10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child:
                const Button(icon: Icons.arrow_back_ios_new_rounded),
          ),
          const SizedBox(
            width: SizeManager.s10,
          ),
          Expanded(
              child: Text(
            mealTitle,
            style: Theme.of(context).textTheme.displayLarge,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
