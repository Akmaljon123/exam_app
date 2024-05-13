import 'dart:convert';

List<NutritionModel> nutritionModelFromJson(String str) => List<NutritionModel>.from(json.decode(str).map((x) => NutritionModel.fromJson(x)));

String nutritionModelToJson(List<NutritionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NutritionModel {
  String? name;
  num? calories;
  num? servingSizeG;
  num? fatTotalG;
  num? fatSaturatedG;
  double? proteinG;
  num? sodiumMg;
  num? potassiumMg;
  num? cholesterolMg;
  num? carbohydratesTotalG;
  num? fiberG;
  num? sugarG;

  NutritionModel({
    this.name,
    this.calories,
    this.servingSizeG,
    this.fatTotalG,
    this.fatSaturatedG,
    this.proteinG,
    this.sodiumMg,
    this.potassiumMg,
    this.cholesterolMg,
    this.carbohydratesTotalG,
    this.fiberG,
    this.sugarG,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
    name: json["name"],
    calories: json["calories"],
    servingSizeG: json["serving_size_g"],
    fatTotalG: json["fat_total_g"]?.toDouble(),
    fatSaturatedG: json["fat_saturated_g"],
    proteinG: json["protein_g"]?.toDouble(),
    sodiumMg: json["sodium_mg"],
    potassiumMg: json["potassium_mg"],
    cholesterolMg: json["cholesterol_mg"],
    carbohydratesTotalG: json["carbohydrates_total_g"]?.toDouble(),
    fiberG: json["fiber_g"]?.toDouble(),
    sugarG: json["sugar_g"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "calories": calories,
    "serving_size_g": servingSizeG,
    "fat_total_g": fatTotalG,
    "fat_saturated_g": fatSaturatedG,
    "protein_g": proteinG,
    "sodium_mg": sodiumMg,
    "potassium_mg": potassiumMg,
    "cholesterol_mg": cholesterolMg,
    "carbohydrates_total_g": carbohydratesTotalG,
    "fiber_g": fiberG,
    "sugar_g": sugarG,
  };
}
