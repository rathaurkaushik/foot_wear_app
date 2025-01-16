import 'package:ecommere_app/pages/login_page.dart';
import 'package:ecommere_app/pages/product_description_page.dart';
import 'package:ecommere_app/widgets/dropdown_btn.dart';
import 'package:ecommere_app/widgets/multi_selectot_dropdown_btn.dart';
import 'package:ecommere_app/widgets/product_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            icon: Icon(Icons.logout_outlined)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Footwear Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        spacing: 10,
        children: [
          // SizedBox(height: 5,),
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6),
                    child: Chip(
                        label: Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                child: MultiSelectorDropdownBtn(
                  items: ['Shoes', 'Sneakers', 'Boots', 'Loafers'],
                  selectedItems: ['Shoes'], // Corrected: Use a List<String>
                  onSelected: (selectedValues) {
                    print(
                        "Selected items: $selectedValues"); // Now properly handles selected items
                  },
                ),
              ),
              Expanded(
                  child: DropdownBtn(
                      items: ['Low to High', 'High to Low'],
                      selectedItem: 'Sort items',
                      onSelected: (selectedValue) {
                        selectedValue ?? 'Sort items';
                      }))
            ],
          ),
          //Product list in grid view
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GridView.builder(
                shrinkWrap: true, // Prevents overflow in Column
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling if inside another scrollable widget
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductDesign(
                    productName: 'Puma Footwaer',
                    productPrice: 5000,
                    productImageUrl:
                        'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSfbnyDO8NjttC3fgZJH6o3dfK_OG5RB_6Ro4lWeaEyNf4f0z8SRIwJyGwEzc8dEdfWNuf4tCDueXI9CwhUlrB6kyJ3bsiRLh1uU1BUvddOv2YZ2NCu3PH1gQ',
                    onTap: () {
                      Get.to(ProductDescriptionPage(
                        productName: 'Puma FootWare',
                        productImageUrl:                         'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSfbnyDO8NjttC3fgZJH6o3dfK_OG5RB_6Ro4lWeaEyNf4f0z8SRIwJyGwEzc8dEdfWNuf4tCDueXI9CwhUlrB6kyJ3bsiRLh1uU1BUvddOv2YZ2NCu3PH1gQ',
                        productPrice: 5000,
                        productDesc: 'Description',
                        onTap: () {},
                      ));
                    },
                    offerTag: '20% off',
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
