import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/connection_checker_viewModel.dart';
import 'package:the_cooker/viewModel/countries_viewModel.dart';
import 'package:the_cooker/viewModel/home_viewModel.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/connection_checker/connection_checker.dart';

import '../widgets/country.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasCalled = false;

    return Consumer<ConnectionCheckerController>(
      builder: (BuildContext context, ConnectionCheckerController controller,
              Widget? child) {
                controller.isConnected();
                      return controller.connected? Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          StringManager.countries,
                        ),
                        leading: Consumer<HomeController>(
                          builder: (BuildContext context, HomeController viewModel,
                    Widget? child) =>
                IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                viewModel.changePage(2);
              },
                          ),
                        ),
                      ),
                      body: SafeArea(
                          child: Padding(
                        padding: const EdgeInsets.all(PaddingManager.mainPadding),
                        child: Consumer<ContriesController>(
                          builder: (context, controller, child) {
              if (hasCalled == false) {
                controller.getCountries();
                hasCalled = true;
              }
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => Country(
                            country: controller.countries[index],
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.countries.length);
                          },
                        ),
                      )),
                    ):const ConnectionChecker(screen:CountriesScreen() ,);
                    },
    );
  }
}
