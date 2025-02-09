import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommere_app/model/category_model.dart';
import 'package:ecommere_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference categoryCollection;
  late CollectionReference productCollection;

  List<Category> categoryList = [];
  List<Product> productList = [];
  List<Product> filterCategoryList = [];

  var selectedCategory = ''.obs; // Observable selected category

  @override
  void onInit() {
    super.onInit();
    categoryCollection = firestore.collection('category');
    productCollection = firestore.collection('products');

    // Run fetchProduct after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchProduct();
      fetchCategory();
    });
  }

  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<Category> retrivedCategoryData = categorySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      categoryList.clear();
      categoryList.assignAll(retrivedCategoryData);
    } catch (e) {
      debugPrint('Category error: $e');
    } finally {
      update();
    }
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();

      final List<Product> retrivedProduct = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productList.clear();
      filterCategoryList.assignAll(retrivedProduct);
      productList.assignAll(retrivedProduct);

      Get.snackbar('Success', 'Product fetched successfully',
          colorText: Colors.white, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    } finally {
      update();
    }
  }

  filterByCategory(String category) {
    selectedCategory.value = category; // Update selected category

    if (category.isEmpty || category == 'All') {
      productList = filterCategoryList.toList();
    } else {
      productList = filterCategoryList
          .where((product) =>
      product.category?.toLowerCase() == category.toLowerCase())
          .toList();
    }
    update();
  }
}
