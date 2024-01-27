// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/favourite_viewModel.dart';
import 'package:the_cooker/resources/string_manager.dart';

import '../../../../resources/constatns_manager.dart';
import '../../../../resources/values_manager.dart';

class DeleteFromFavourite extends StatelessWidget {
  const DeleteFromFavourite({
    super.key,
    required this.mealId,
  });
  final String mealId;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FavouriteController>();
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.delete,
                  style: TextStyle(color: Theme.of(context).indicatorColor),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            content: Text(StringManager.deleteAlertContent,
                style: TextStyle(
                    color: Theme.of(context)
                        .indicatorColor
                        .withOpacity(ConstantsManager.opicity8))),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    await controller.deleteFavMealId(mealId);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    StringManager.ok,
                    style: TextStyle(color: Theme.of(context).indicatorColor),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Theme.of(context).indicatorColor),
                  )),
            ],
          ),
        );
      },
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(PaddingManager.p8),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(ConstantsManager.borderRadiusCard)),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.primary,
          size: SizeManager.s30,
        ),
      ),
    );
  }
}
