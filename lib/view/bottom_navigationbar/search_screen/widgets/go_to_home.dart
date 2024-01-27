import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../viewModel/home_viewModel.dart';

class GoToHome extends StatelessWidget {
  const GoToHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder:
          (BuildContext context, HomeController viewModel, Widget? child) =>
              IconButton(
        icon: const Icon(Icons.home),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          viewModel.changePage(1);
        },
      ),
    );
  }
}
