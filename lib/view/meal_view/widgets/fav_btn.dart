import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/favourite_viewModel.dart';
import 'package:the_cooker/resources/values_manager.dart';

import '../../../resources/constatns_manager.dart';

class FavouriteBtn extends StatelessWidget {
  const FavouriteBtn({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteController>(
      builder: (BuildContext context, FavouriteController controller,
              Widget? child) =>
          Positioned(
        right: 4,
        bottom: 4,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .indicatorColor
                  .withOpacity(ConstantsManager.shadow),
              blurRadius: ConstantsManager.borderRadiusCard,
            )
          ]),
          child: IconButton(
            onPressed: () {
              controller.save(id);
            },
            icon: const Icon(Icons.favorite),
            color: controller.favIds.contains(id)
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.secondary,
            iconSize: SizeManager.s40,
          ),
        ),
      ),
    );
  }
}
