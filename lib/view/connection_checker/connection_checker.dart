import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:the_cooker/resources/assets_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import '../../viewModel/connection_checker_viewModel.dart';
import '../../resources/routes.dart';
import '../../resources/string_manager.dart';
import '../home/home.dart';

class ConnectionChecker extends StatelessWidget {
  const ConnectionChecker({super.key, this.screen});
  final Widget? screen;
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionCheckerController>(
        builder: (context, controller, child) {
      controller.isConnected();
      return controller.connected
          ?  screen ??const Home()
          : Scaffold(
              body: SafeArea(
                  child: Padding(
              padding: const EdgeInsets.all(PaddingManager.mainPadding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagesManager.noInternetConnection,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *0.4,
                    ),
                    const SizedBox(height: SizeManager.s10,),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.connectionChecker);
                        },
                        child: Text(
                          StringManager.retry,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                  ],
                ),
              ),
            )));
    });
  }
}