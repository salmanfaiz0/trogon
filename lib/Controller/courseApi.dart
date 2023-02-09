import 'package:flutter_application_1/Model/model.dart';
import 'package:flutter_application_1/Model/modeldata.dart';

import 'package:http/http.dart' as http;

class CourseApi {
  final url = "https://futursity.com/course/api/top_courses";

  Future<List<ModelData>?> fetchCourse() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      return modelDataFromJson(data);
    } else {
      return [];
    }
  }

  fetchCategories() {}
}
