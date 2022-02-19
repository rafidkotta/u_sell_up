import 'package:flutter/material.dart';
import 'package:up_sell_up/models/category.dart';
import 'package:up_sell_up/models/product.dart';

import '../utils.dart';
import 'home_product_recommendation.dart';

class SubCategoryListView extends StatefulWidget{
  const SubCategoryListView({Key? key}) : super(key: key);

  @override
  State<SubCategoryListView> createState() => _SubCategoryListViewState();
}

class _SubCategoryListViewState extends State<SubCategoryListView> {
  final List<SubCategory> _subCategories = [SubCategory(name: "Grocery", products: [Product("Lorem Ipsum", 200, "", 150, 3, 3, false),]),SubCategory(name: "Sub Category 2", products: [Product("Lorem Ipsum 2", 200, "", 150, 3, 3, false),Product("Lorem Ipsum XY", 200, "", 150, 3, 3, false),]),SubCategory(name: "Sub Category 3", products: [Product("Lorem Ipsum 3", 200, "", 150, 3, 3, false),Product("Lorem Ipsum 3", 200, "", 150, 3, 3, false),Product("Lorem Ipsum 8", 200, "", 150, 3, 3, false),Product("Lorem Ipsum 5", 200, "", 150, 3, 3, false)])];
  int _selected_category = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_subCategories.length, (index) {
              return Card(
                child: InkWell(
                  onTap: (){
                    if(index != _selected_category){
                      setState(() {
                        _selected_category = index;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(child: Icon(getIcon(_subCategories[index].name,),color: Colors.white,size: 30,),radius: 30,backgroundColor: Colors.blue,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(_subCategories[index].name,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: .50,
              children: List.generate(_subCategories[_selected_category].products.length, (index) {
                return ProductView(product: _subCategories[_selected_category].products[index]);
              })),
        )
      ],
    );
  }
  generateCategories(){

  }
}