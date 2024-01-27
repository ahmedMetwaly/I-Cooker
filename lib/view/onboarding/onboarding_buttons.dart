import "package:flutter/material.dart";
import "../../resources/constatns_manager.dart";
import "../../resources/values_manager.dart";

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.title,
    this.icon,
  });
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(SizeManager.s0),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ConstantsManager.borderRadiusCard)),
      elevation: SizeManager.s0,
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p10),
        
        child: title == null
            ? Icon(
              icon,
                size: SizeManager.s30,
                color: Theme.of(context).canvasColor,
              )
            : Text(title!, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
