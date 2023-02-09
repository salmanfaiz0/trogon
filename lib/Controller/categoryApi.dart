import 'package:flutter_application_1/Model/model.dart';

import 'package:http/http.dart' as http;

class CategoriesApi {
  final url = "https://futursity.com/course/api/categories";

  Future<List<CategoriesModel>?> fetchCategories() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      return categoriesModelFromJson(data);
    } else {
      return [];
    }
  }

  fetchCourse() {}
}
