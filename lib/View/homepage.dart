import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/getx.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final product = Get.put(Product());

  Widget bottonNavigator() {
    return BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Course"),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: "My Course"),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_rounded), label: "Course"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Course"),
        ]);
  }

  Widget couserWidget() {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 4),
        itemBuilder: (context, index) => Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 170,
              height: 170,
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.network(
                          product.productcategoriesList[index].thumbnail)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(product.productcategoriesList[index].name),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "${product.productcategoriesList[index].numberOfCourses.toString()} Course")
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget topCourse() {
    return ListView.separated(
      itemCount: product.productList.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 5,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(11),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius: 5, offset: Offset(2, 2), color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 220,
          width: 152,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.productList[index].thumbnail,
              ),
            ),
            Text(product.productList[index].title),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  product.productList[index].price,
                  style: TextStyle(fontSize: 12),
                )),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text("LOGO", style: TextStyle(color: Colors.black26)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Course ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text("All Course"))
                ],
              ),
            ),
            Container(
              width: 450,
              height: 230,
              // color: Colors.blue,
              child: Obx(
                () => topCourse(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Expanded(child: couserWidget())
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[800],
          onPressed: () {},
          child: Icon(Icons.menu_outlined),
        ),
        bottomNavigationBar: bottonNavigator());
  }
}
