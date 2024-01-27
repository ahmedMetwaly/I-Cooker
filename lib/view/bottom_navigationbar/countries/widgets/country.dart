import "package:flutter/material.dart";
import "package:the_cooker/resources/assets_manager.dart";
import "package:the_cooker/resources/constatns_manager.dart";

import "../../../../resources/values_manager.dart";
import '../screens/country_meals.dart';

class Country extends StatelessWidget {
  const Country({
    super.key,
    required this.country,
  });
  final String country;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CountryMeals(countryTitle: country),
        ));
      },
      child: Container(
          padding: const EdgeInsets.all(PaddingManager.p10),
          height: SizeManager.mainContainer,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context)
                  .indicatorColor
                  .withOpacity(ConstantsManager.opicity),
            ),
            borderRadius:
                BorderRadius.circular(ConstantsManager.borderRadiusCard),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context)
                    .indicatorColor
                    .withOpacity(ConstantsManager.shadow),
                blurRadius: ConstantsManager.borderRadiusCard,
              )
            ],
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                country,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Image.asset(ImagesManager.flag(country.trim().toLowerCase()))
            ],
          )),
    );
  }
}
