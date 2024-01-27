import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../model/models.dart';
import '../../../resources/constatns_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../screens/instructions/instrusctions.dart';
import '../screens/video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
    required this.isOpen,
    required this.meal,
  });

  final dynamic isOpen;
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      icon: Icons.density_medium_rounded,
      foregroundColor: Theme.of(context).indicatorColor,
      overlayColor: Theme.of(context).indicatorColor,
      overlayOpacity: ConstantsManager.opicity,
      spacing: PaddingManager.p10,
      spaceBetweenChildren: PaddingManager.p10,
      openCloseDial: isOpen,
      children: [
        SpeedDialChild(
            label: StringManager.video,
            child: const Icon(Icons.ondemand_video_rounded),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).indicatorColor,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).indicatorColor),
            labelBackgroundColor: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VideoPlayer(
                  url: meal.mealYoutube,
                  mealTitle: meal.mealTitle,
                ),
              ));
            }),
        SpeedDialChild(
            child: const Icon(Icons.soup_kitchen),
            label: StringManager.instruction,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).indicatorColor,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).indicatorColor),
            labelBackgroundColor: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Instructions(
                        mealTitle: meal.mealTitle,
                        instructions: meal.mealInstruction,
                        imageUrl: meal.mealImagePath,
                      )));
            }),
        SpeedDialChild(
            child: const Icon(Icons.share),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).indicatorColor,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).indicatorColor),
            labelBackgroundColor: Theme.of(context).colorScheme.secondary,
            label: StringManager.share,
            onTap: () => _onShare(context, "Meal Name : ${meal.mealTitle}",
                "Video: ${meal.mealYoutube}")),
      ],
    );
  }

  void _onShare(BuildContext context, String title, String details) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share("$title \n $details",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
