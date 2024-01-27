import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/home_viewModel.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/onboarding/onboarding_buttons.dart';

class SearchBarNavigation extends StatelessWidget {
  const SearchBarNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return GestureDetector(
      onTap: () {
        controller.index = 0;
        controller.changePage(controller.index);
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .indicatorColor
                  .withOpacity(ConstantsManager.shadow),
              blurRadius: ConstantsManager.borderRadiusCard,
            ),
          ],
          borderRadius:
              BorderRadius.circular(ConstantsManager.borderRadiusCard),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Button(
              icon: Icons.search,
              
            ),
            const SizedBox(
              width: SizeManager.s10,
            ),
            Text(
              StringManager.searchHint,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context)
                      .indicatorColor
                      .withOpacity(ConstantsManager.opicity)),
            ),
          ],
        ),
      ),
    );
  }
}
