import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:up_sell_up/models/product.dart';
import 'package:up_sell_up/utils.dart';

class HomeProductRecommendations extends StatelessWidget {
  const HomeProductRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _products = [
      Product("Lorem Ipsum", 200, "https://i.ibb.co/v4Vhb7k/The-portrait-of-cute-little-kid-boy-in-stylish-jeans-clothes-looking-at-camera-against-white-studio.jpg", 150, 3, 3, false),
      Product("Lorem ipsum dolor sit amet, consectetur adipiscing eli", 200, "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTurfyRtvdp9y9g8evr86cDIapNVrBckH843FqP4CauoydBXhZv2AGRfTkmg34LA1yPzgJRHKySbcyRq9NBkiP_5ZDuOnxD-hzTVrsu7vve&usqp=CAE", 200, 3, 5, true),
      Product("Lorem Ipsum", 200, "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRB5tDRxI_H1wlq82FrsAj2LdjwMrhYujI7dX3a0zlLwXc-8YmYRCOhFx5-41oVuqYOiOAPkU0ahCvIxek7q91GndbPHZA8mYPMDThabXo&usqp=CAE", 150, 3, 3, false),
      Product("Lorem Ipsum", 200, "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZRLp6VYH0Sgs6P8UBisyim1eIm54U59vMXQFiLbfeqAig97GRg3k9uM3Vp6tLufTJ2jI19mEzpWcze-6KASXapGErGxkjtHcxh2rduXnJEzWZl8q-Pfziew&usqp=CAE", 150, 3, 3, false),
      Product("Lorem Ipsum", 200, "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTurfyRtvdp9y9g8evr86cDIapNVrBckH843FqP4CauoydBXhZv2AGRfTkmg34LA1yPzgJRHKySbcyRq9NBkiP_5ZDuOnxD-hzTVrsu7vve&usqp=CAE", 200, 3, 5, false),
      Product("Lorem Ipsum", 200, "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRB5tDRxI_H1wlq82FrsAj2LdjwMrhYujI7dX3a0zlLwXc-8YmYRCOhFx5-41oVuqYOiOAPkU0ahCvIxek7q91GndbPHZA8mYPMDThabXo&usqp=CAE", 150, 3, 3, true),
      Product("Lorem ipsum dolor sit amet", 200, "https://i.ibb.co/v4Vhb7k/The-portrait-of-cute-little-kid-boy-in-stylish-jeans-clothes-looking-at-camera-against-white-studio.jpg", 150, 3, 3, false),
      Product("Lorem Ipsum", 200, "https://i.ibb.co/v4Vhb7k/The-portrait-of-cute-little-kid-boy-in-stylish-jeans-clothes-looking-at-camera-against-white-studio.jpg", 200, 3, 5, false),
      Product("Lorem Ipsum", 200, "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZRLp6VYH0Sgs6P8UBisyim1eIm54U59vMXQFiLbfeqAig97GRg3k9uM3Vp6tLufTJ2jI19mEzpWcze-6KASXapGErGxkjtHcxh2rduXnJEzWZl8q-Pfziew&usqp=CAE", 150, 3, 3, false)
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: kIsWeb ? 6 : 3,
          shrinkWrap: true,
          childAspectRatio: .50,
          children: List.generate(_products.length, (index) {
            return ProductView(product: _products[index]);
          })),
    );
  }
}

class ProductView extends StatelessWidget {
  final Product product;

  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double discount = getOffPercentage();
    return Card(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Image.network(
                    product.image != "" ? product.image : "https://i.ibb.co/v4Vhb7k/The-portrait-of-cute-little-kid-boy-in-stylish-jeans-clothes-looking-at-camera-against-white-studio.jpg",
                    width: width / 3,
                    height: (width / 3) * 1.3,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 3.0,
                    left: 3.0,
                    child: RatingBarIndicator(
                      rating: product.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      itemCount: 5,
                      unratedColor: Colors.transparent,
                      itemSize: 14.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  Positioned(
                      right: 3.0,
                      bottom: 3.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: Colors.black38),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            product.distanceKm.toStringAsFixed(0) + " Km",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )),
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: IconButton(
                      icon: Icon(product.favourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                        color: product.favourite ? Colors.red[600] : Colors.black38,
                      ),
                      onPressed: () {},
                    )
                  )
                ],
              ),
            ),
            discount != 0.0 ? Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                    child: discountView(discount),) : Container(),
            Padding(
              padding: EdgeInsets.only(left: 4.0, top: discount != 0.0 ? 0.0 : 4),
              child: Text(
                product.sellingPrice.toStringAsFixed(0) + " AED",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
              child: Text(product.title,maxLines: 2,overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    );
  }

  double getOffPercentage() {
    return 100 - ((product.sellingPrice / product.price) * 100);
  }

  Widget discountView(double discount) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.price.toStringAsFixed(0) + " AED",
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                discount.toStringAsFixed(0) + "%",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            decoration: getOfferDecoration(radius: 3),
          ),
        ],
      ),
    );
  }
}
