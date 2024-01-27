import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/resources/values_manager.dart';

import '../../../../viewModel/search_viewModel.dart';
import '../../../onboarding/onboarding_buttons.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.inputController,
      required this.prefixIcon,
      required this.hintText});
  final TextEditingController inputController;
  final IconData prefixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultController>(
      builder: (BuildContext context, SearchResultController controller,
          Widget? child) {
        return TextFormField(
          controller: inputController,
          autofocus: true,
          onChanged: (value) => controller.getSearchResultView(value),
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.only(right: MarginManager.m10),
              child: Button(
                icon: prefixIcon,
              ),
            ),
            hintText: hintText,
          ),
        );
      },
    );
  }
}
