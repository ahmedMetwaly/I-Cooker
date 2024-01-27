import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/connection_checker_viewModel.dart';
import 'package:the_cooker/viewModel/home_viewModel.dart';
import '../../resources/string_manager.dart';
import '../connection_checker/connection_checker.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionCheckerController>(
      builder: (BuildContext context, ConnectionCheckerController checker,
          Widget? child) {
        checker.isConnected();
        return checker.connected
            ? Consumer<HomeController>(
                builder: (BuildContext context, HomeController controller,
                    Widget? child) {
                  return Scaffold(
                      bottomNavigationBar: SafeArea(
                        child: BottomNavigationBar(
                          items: const [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.search),
                                label: StringManager.search),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home),
                                label: StringManager.home),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.food_bank),
                                label: StringManager.countries),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.favorite),
                                label: StringManager.favourite),
                          ],
                          type: BottomNavigationBarType.fixed,
                          currentIndex: controller.index,
                          onTap: (index) {
                            controller.changePage(index);
                          },
                        ),
                      ),
                      body: // controller.child ,
                          PageView(
                        controller: controller.pageController,
                        children: controller.screens,
                        onPageChanged: (index) => controller.changePage(index),
                      ));
                },
              )
            : const ConnectionChecker();
      },
    );
  }
}
