import 'package:flutter/material.dart';

class OfferCarousel extends StatelessWidget {
  const OfferCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8,left: 8,right: 8,top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text("HEAD TIL 1",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300),),
                Text("HEAD TIL 2",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300)),
                Text("HEAD TIL 3",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300)),
                Text("HEAD TIL 4",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Image.network("https://i.ibb.co/ckWxYhj/5706210.jpg",
                fit: BoxFit.cover, width: 1000.0,height: kToolbarHeight*4,),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: Container(
                  color: Colors.white38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text('AED 300/-'),
                          flex: 2,
                        ),
                        const Text(
                          'AED 600/-',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('50% Off'),
                          ),
                          decoration: const BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(7.5)),color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
