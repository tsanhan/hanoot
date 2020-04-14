import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food4good_app/app/data/model/product.dart';
import 'package:sprintf/sprintf.dart';

class Item extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const Item({@required this.product, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final itemName = "${product.name} ${product.units} ${product.unitName}";

    return Material(
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: product.image ?? "",
              height: 80,
              width: 80,
              placeholder: (_, __) {
                return Icon(Icons.info, color: Colors.black, size: 80);
              },
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21.5,
                  ),
                ),
                Text(
                  sprintf('%.2f ש\"ח', [product.price]),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            )
          ],
        ),
        onTap: onPressed,
      ),
    );

//    return ListTile(
////      leading:
//      leading: Container(
//        height: 200,
//        child: CachedNetworkImage(
//          imageUrl: product.image ?? "",
//          height: 100,
//          width: 50,
//          placeholder: (_, __){
//            return Icon(Icons.info, color: Colors.black, size: 50);
//          },
//        ),
//      ),
//      title: Text(
//        itemName,
//        style: TextStyle(
//          color: Colors.black,
//          fontWeight: FontWeight.bold,
//          fontSize: 22,
//        ),
//      ),
//      subtitle: Text(
//        sprintf('%.2f ש\"ח', [product.price]),
//        style: TextStyle(color: Colors.black, fontSize: 20),
//      ),
//      onTap: () {
//        // todo: add item to cart
//      },
//    );
  }
}
