class OnBoardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnBoardingModel(this.title, this.description, this.imagePath);
}

class CategoryModel {
  final dynamic id;
  final dynamic title;
  final dynamic networkImagePath;
  final dynamic discription;

  const CategoryModel(
      this.id, this.title, this.networkImagePath, this.discription);
}

class MealModel {
  const MealModel(
      this.idMeal,
      this.mealTitle,
      this.mealCategory,
      this.mealArea,
      this.mealInstruction,
      this.mealImagePath,
      this.tags,
      this.mealYoutube,
      this.mealIngredients,
      this.mealMeasures);
  final dynamic idMeal;
  final String mealTitle;
  final String mealCategory;
  final String mealArea;
  final String mealInstruction;
  final String mealImagePath;
  final String? tags;
  final dynamic mealYoutube;
  final List mealIngredients;
  final List mealMeasures;
}

class RecommendedMealModel {
  final dynamic id;
  final String mealTitle;
  final String mealCategory;
  final String mealImage;

  RecommendedMealModel(
      this.id, this.mealTitle, this.mealCategory, this.mealImage);
 
}

class MealOfCategoryModel {
  const MealOfCategoryModel(this.id, this.mealTitle, this.mealImagePath);
  final dynamic id;
  final String mealTitle;
  final String mealImagePath;
}

class MealIngredientsWithItsMeasureModel {
  const MealIngredientsWithItsMeasureModel(this.id, this.mealTitle, this.ingredients, this.measures, this.imagePath);
  final dynamic id;
  final String mealTitle;
  final String imagePath;
  final List ingredients;
  final List measures;
}
