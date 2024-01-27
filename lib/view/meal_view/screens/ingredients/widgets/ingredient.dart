import 'package:flutter/material.dart';

import '../../../../../resources/constatns_manager.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
    super.key,
    required this.ingredient,
  });

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(ConstantsManager.borderRadiusCard),
            ),
           
            border: Border.all(
                color: Theme.of(context).colorScheme.primary),
            color: Theme.of(context).colorScheme.primary),
            
        child: Center(
          child: Text(
            ingredient,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
        ),
      ),
    );
  }
}
