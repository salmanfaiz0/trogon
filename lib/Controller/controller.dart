import 'package:flutter_application_1/Controller/api.dart';
import 'package:flutter_application_1/Controller/apii.dart';
import 'package:flutter_application_1/Model/model.dart';
import 'package:flutter_application_1/Model/modeldata.dart';

import 'package:get/get.dart';

class Product extends GetxController {
  var productList = <ModelData>[].obs;
  var productcategoriesList = <CategoriesModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCourse();
    getCateogries();
  }

  void getCourse() async {
    var product = await CourseApi().fetchCourse();
    if (product != null) {
      productList.value = product;
    }
  }

  void getCateogries() async {
    var cateri = await CategoriesApi().fetchCategories();
    if (cateri != null) {
      productcategoriesList.value = cateri;
    }
  }
}
