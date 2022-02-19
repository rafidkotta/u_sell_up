import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../utils.dart';

class HomeMainCategoryList extends StatelessWidget{
  const HomeMainCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MainCategory> categories = [MainCategory(icon: "XX",name: "Fashion"),MainCategory(name: "Electronics", icon: "XX"),MainCategory(name: "Home Decor", icon: "XX"),MainCategory(name: "Grocery", icon: "grocery"),MainCategory(name: "Baby Care", icon: "grocery")];
    return SizedBox(
      height: kToolbarHeight*2.8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(child: Icon(getIcon(categories[index].icon,),color: Colors.white,size: 48,),radius: 50,backgroundColor: Colors.black87,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(categories[index].name,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}

class MainCategory{
  String name;
  String icon;
  MainCategory({required this.name,required this.icon});
}