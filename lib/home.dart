import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:up_sell_up/utils.dart';

import 'widgets/home_main_category.dart';
import 'widgets/home_offer_carosel.dart';
import 'widgets/home_product_recommendation.dart';
import 'widgets/home_stories.dart';
import 'widgets/sub_category_list.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("USell\nUp",style: TextStyle(height: 0.8,fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
        actions: [
           SizedBox(
            height: kToolbarHeight-20,
            width: 200,
            child: Center(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: const BorderRadius.all(Radius.circular(10)),color: Colors.grey[200]),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4,right: 4),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: " Search",
                        fillColor: Colors.red,
                        focusColor: Colors.red,
                        border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: const Icon(MaterialCommunityIcons.face_agent,color: Colors.black),tooltip: "Support",),
          IconButton(onPressed: (){}, icon: const Icon(MaterialCommunityIcons.hours_24,color: Colors.black),tooltip: "24/7",),
          IconButton(onPressed: (){}, icon: const Icon(MaterialCommunityIcons.barcode_scan,color: Colors.black),tooltip: "Scan",),
        ],
      ),
      body: _getView(_currentView),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.layers_triple),label: "Categories",activeIcon: CircleAvatar(child: Icon(MaterialCommunityIcons.layers_triple,color: Colors.white,),backgroundColor: Colors.black,)),
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.shopping),label: "Cart",activeIcon: CircleAvatar(child: Icon(MaterialCommunityIcons.shopping,color: Colors.white,),backgroundColor: Colors.black,)),
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.checkbox_blank,size: 30,),label: "Home",activeIcon: CircleAvatar(child: Icon(MaterialCommunityIcons.checkbox_blank,size: 30,color: Colors.white,),backgroundColor: Colors.black,)),
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.compass_outline),label: "Near by",activeIcon: CircleAvatar(child: Icon(MaterialCommunityIcons.compass_outline,color: Colors.white,),backgroundColor: Colors.black,)),
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.star_box),label: "Favourites",activeIcon: CircleAvatar(child: Icon(MaterialCommunityIcons.star_box,color: Colors.white,),backgroundColor: Colors.black,))
      ],
        currentIndex: _currentView,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: Theme.of(context).primaryColorDark,
        type: BottomNavigationBarType.fixed,
        onTap: (position){
          if(position != _currentView){
            setState(() {
              _currentView = position;
            });
          }
        },
      ),
    );
  }

  Widget _getView(int index){
    switch(index){
      case 0 : return const HomeBody();
      default : return const Center(child: CircularProgressIndicator(),);
    }
  }
}

class HomeBody extends StatelessWidget{
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OfferCarousel(),
            const Padding(
              padding: EdgeInsets.only(top: 6),
              child: HomeMainCategoryList(),
            ),
            headerText(title: "Recommended for you"),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: HomeProductRecommendations(),
            ),
            headerText(title: "Stories"),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: HomeStories(),
            ),
            headerText(title: "Shop by Category"),
            const SubCategoryListView(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("TERM OF USE",style: TextStyle(fontWeight: FontWeight.w200)),
                  Text("CONTACT",style: TextStyle(fontWeight: FontWeight.w200)),
                  Text("CAREER",style: TextStyle(fontWeight: FontWeight.w200)),
                  Text("AREA RANGE",style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("USell\nUp",style: TextStyle(height: 0.8,fontWeight: FontWeight.bold,fontSize: 18),),
                  Row(
                    children: const [
                      Text("PROJECT BY ",style: TextStyle(fontWeight: FontWeight.w200)),
                      Text("EZYENESS TECHNOLOGY",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}