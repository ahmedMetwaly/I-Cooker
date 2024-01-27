import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/connection_checker_viewModel.dart';
import 'package:the_cooker/viewModel/search_viewModel.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/search_screen/widgets/input_field.dart';
import 'package:the_cooker/view/connection_checker/connection_checker.dart';
import 'widgets/go_to_home.dart';
import 'widgets/result_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Consumer<ConnectionCheckerController>(
      builder: (BuildContext context, ConnectionCheckerController controller,
          Widget? child) {
        controller.isConnected();
        return controller.connected
            ? Scaffold(
                appBar: AppBar(
                  title: const Padding(
                    padding: EdgeInsets.all(PaddingManager.p8),
                    child: Text(StringManager.searchScreenAppBarTitle),
                  ),
                  leading: const GoToHome(),
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.mainPadding),
                    child: Column(
                      children: [
                        InputField(
                          inputController: searchController,
                          hintText: "Search",
                          prefixIcon: Icons.search,
                        ),
                        const SizedBox(
                          height: SizeManager.s10,
                        ),
                        Consumer<SearchResultController>(
                          builder: (BuildContext context,
                              SearchResultController controller,
                              Widget? child) {
                            return Expanded(
                              child: controller.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.separated(
                                      itemBuilder: (context, index) =>
                                          ResultItem(
                                              result: controller
                                                  .searchResultView[index]),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: SizeManager.s10,
                                          ),
                                      itemCount:
                                          controller.searchResultView.length),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const ConnectionChecker(screen: SearchScreen(),);
      },
    );
  }
}
