import 'dart:math';

import 'package:flutter/material.dart';
import 'package:up_sell_up/models/story.dart';

class HomeStories extends StatelessWidget{
  const HomeStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Story> _stories = [Story(image: "https://i.ibb.co/vzjJMFR/girl.png", user: 'lorem'),Story(image: "https://i.ibb.co/BCQD4YB/boy.png", user: 'ipsum'),Story(image: "https://i.ibb.co/ckWxYhj/5706210.jpg", user: 'dolor'),Story(image: "https://i.ibb.co/vzjJMFR/girl.png", user: 'lorem'),Story(image: "https://i.ibb.co/BCQD4YB/boy.png", user: 'ipsum'),Story(image: "https://i.ibb.co/vzjJMFR/girl.png", user: 'dolor')];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_stories.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 50,
                  // backgroundImage: NetworkImage(_stories[index].image),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipOval(child: Image.network(_stories[index].image,width: 100,height: 100,fit: BoxFit.cover,),),
                  ),
                ),
                Text("@"+_stories[index].user)
              ],
            ),
          );
        }),
      ),
    );
  }

}