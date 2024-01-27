import 'package:flutter/material.dart';

import '../../../../../resources/constatns_manager.dart';

class Measure extends StatelessWidget {
  const Measure({
    super.key,
    required this.measure,
  });

  final String measure;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(ConstantsManager.borderRadiusCard),
            ),
             border: Border.all(color: Theme.of(context).colorScheme.primary),
            color: Theme.of(context).indicatorColor,),
        child: Center(
          child: Text(
            measure,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
