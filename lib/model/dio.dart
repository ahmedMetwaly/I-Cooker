import 'package:dio/dio.dart';
import 'package:the_cooker/resources/constatns_manager.dart';

class DioModel {
  static late Dio _dio;
  // to initialize dio
  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://www.themealdb.com/",
        receiveDataWhenStatusError: false,
        receiveTimeout:
            const Duration(seconds: ConstantsManager.receiveTimeout),
        connectTimeout:
            const Duration(seconds: ConstantsManager.connectTimeout),
      ),
    );
  }
  

  // all data will get from api wil store here
  static Map<String, dynamic> data = {};

  // this function to get data from api take the queries then save the response in var (data)
  static Future _getData(
      {required url, required Map<String, dynamic> query}) async {
    return await _dio
        .get(
      url,
      queryParameters: query,
    )
        .then((value) {
      data = value.data;
      // print(data);
      return data;
    });
  }

  static Future search(String meal) async {
    if( meal.isNotEmpty && meal !=""){
 return await _getData(
        url: "/api/json/v1/1/search.php",
        query: {"s": meal.trim()}).then((value) {
          //print("search :$data");
        }).catchError(
      (error) {
        "Error: $error";
      },
    );
    }
   
  }

  static Future getCategoriesData() async {
    return await _getData(
        url: "api/json/v1/1/categories.php",
        query: {"c": "list"}).then((value) {
      //print(DioModel.data);
    }).catchError((error) {
      "Error: $error";
    });
  }

  static Future getRecommededMealData() async {
    return await _getData(url: "api/json/v1/1/random.php", query: {})
        .then((value) => "got random meal")
        .catchError((error) => "Error: $error");
  }

  static Future getMealsOfCategoryData(String categoryName) async {
    return await _getData(
      url: "api/json/v1/1/filter.php",
      query: {"c": categoryName.trim()},
    )
        .then((value) => "got meals of categories")
        .catchError((error) => "Error: $error");
  }

// to get specific meal details from api by id
  static Future getMealDetailsById(id) async {
    return await _getData(
      url: "api/json/v1/1/lookup.php",
      query: {"i": id.toString().trim()},
    ).then((value) {
      return "get meal by id";
    }).catchError((error) => "Error : $error");
  }

  // to get the countries
  static Future getCountriesData() async {
    return await _getData(url: "api/json/v1/1/list.php", query: {"a": "list"})
        .then((value) => "get countries")
        .catchError((error) => "Error: $error");
  }

// to get the country meals 
  static Future getCountryMealsData(String country) async {
    return await _getData(
            url: "api/json/v1/1/filter.php", query: {"a": country.trim()})
        .then((value) => "country meals is get")
        .catchError((error) => "Error : $error");
  }
}
