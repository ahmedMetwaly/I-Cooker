import "package:flutter/material.dart";
import "package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/image_from_network.dart";

import "../../../../resources/values_manager.dart";
import "widgets/instruction.dart";

class Instructions extends StatelessWidget {
  const Instructions(
      {super.key,
      required this.mealTitle,
      required this.instructions,
      required this.imageUrl});
  final String mealTitle;
  final String instructions;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    List<String> instructionsList = instructions
        .split("\n")
        .where((element) =>
            element.isNotEmpty &&
            element.trim() != " " &&
            element.trim() != "" &&
            element.trim() != "\n")
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealTitle,
        ),
        leadingWidth: SizeManager.s63,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.mainPadding),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeManager.s50),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeManager.s50),
                  child: ImageFromNetwork(
                      imagePath: imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.4),
                ),
              ),
              const SizedBox(
                height: SizeManager.s10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Instruction(
                        instruction: instructionsList[index],
                        instructionNumber: index + 1,
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  itemCount: instructionsList.length),

              //Text(instructions),
            ],
          ),
        ),
      ),
    );
  }
}
