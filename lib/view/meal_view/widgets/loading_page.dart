import 'package:flutter/material.dart';

import '../../../resources/string_manager.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringManager.loading),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}
