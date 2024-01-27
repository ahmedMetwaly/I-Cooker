import "package:flutter/material.dart";
import "package:the_cooker/model/models.dart";
import "package:the_cooker/resources/constatns_manager.dart";
import "package:the_cooker/resources/values_manager.dart";
import 'package:the_cooker/view/category/category_meals.dart';

import "image_from_network.dart";

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const CategoryMeals(),
              settings: RouteSettings(arguments: category.title)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(PaddingManager.p3),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius:
                    BorderRadius.circular(ConstantsManager.borderRadiusCard),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .indicatorColor
                        .withOpacity(ConstantsManager.shadow),
                    blurRadius: ConstantsManager.borderRadiusCard,
                  ),
                ],
              ),
              child: ImageFromNetwork(
                imagePath: category.networkImagePath,
                width: SizeManager.s70,
                height: SizeManager.s70,
              )),
          const SizedBox(
            height: SizeManager.s8,
          ),
          SizedBox(
              width: ConstantsManager.textSizeOfSection,
              child: Text(
                category.title,
                overflow: TextOverflow.ellipsis,
                //maxLines: 1,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
