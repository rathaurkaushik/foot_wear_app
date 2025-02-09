import 'package:ecommere_app/controller/home_controller.dart';
import 'package:ecommere_app/pages/login_page.dart';
import 'package:ecommere_app/pages/product_description_page.dart';
import 'package:ecommere_app/widgets/multi_selectot_dropdown_btn.dart';
import 'package:ecommere_app/widgets/dropdown_btn.dart';
import 'package:ecommere_app/widgets/product_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Color iselected = Colors.blueAccent;

    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async => await ctrl.fetchProduct(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.off(LoginPage()),
              icon: Icon(Icons.logout_outlined, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            title: Text(
              'Footwear Store',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth < 600 ? 18 : 22, // Responsive font size
              ),
            ),
          ),

          // Body
          body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                // Category List
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.categoryList.length,
                    itemBuilder: (context, index) {
                      final category = ctrl.categoryList[index].name ?? "No Name";
                      final isSelected = ctrl.selectedCategory == category; // Assuming `selectedCategory` exists

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: InkWell(
                          onTap: () {
                            ctrl.filterByCategory(category);
                          },
                          child: Chip(
                            backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
                            label: Text(
                              category,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth < 600 ? 14 : 16, // Responsive text
                                color: isSelected ? Colors.white : Colors.black, // Better visibility
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),


                const SizedBox(height: 10), // Spacing

                // Filter & Sorting Options
                // Row(
                //   children: [
                //     Expanded(
                //       child: MultiSelectorDropdownBtn(
                //         items: ['Adidas', 'Gucci', 'Khaite', 'Nike', 'Puma'],
                //         onSelected: (selectedValues) {
                //           print("Selected brands: $selectedValues");
                //         }, selectedItems: [],
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     Expanded(
                //       child: DropdownBtn(
                //         items: ['Low to High', 'High to Low'],
                //         selectedItem: 'Sort items',
                //         onSelected: (selectedValue) {
                //           selectedValue ?? 'Sort items';
                //         },
                //       ),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 10), // Spacing

                // Product Grid
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = screenWidth < 600 ? 2 : 3; // Responsive grid columns
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: ctrl.productList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            return ProductDesign(
                              productName: ctrl.productList[index].name.toString(),
                              productPrice: (ctrl.productList[index].price ?? 0).toDouble(),
                              productImageUrl: ctrl.productList[index].image.toString(),
                              onTap: () {
                                Get.to(ProductDescriptionPage(
                                  productName: ctrl.productList[index].name.toString(),
                                  productImageUrl: ctrl.productList[index].image.toString(),
                                  productPrice: (ctrl.productList[index].price ?? 0).toDouble(),
                                  productDesc: ctrl.productList[index].description.toString(),
                                  onTap: () {

                                    Get.snackbar('Success', 'Order Placed Successfully',borderWidth: 2, colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                      titleText: SizedBox(height: 60, child: Icon(Icons.done_outlined,color: Colors.white,size: 50,weight: 10,))
                                    );

                                  },
                                ));
                              },
                              offerTag: ctrl.productList[index].offer.toString(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
