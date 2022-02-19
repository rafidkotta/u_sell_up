import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

getOfferDecoration({required double radius}){
  return BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(radius)),color: Colors.orange[600]);
}
headerText({required String title}){
  return Container(
    width: double.infinity,
    color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
IconData getIcon(String icon){
  switch(icon){
    default : return MaterialCommunityIcons.layers_triple;
  }
}