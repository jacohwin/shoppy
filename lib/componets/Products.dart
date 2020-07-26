import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "MenBlazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "WomenBlazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "RedDress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "BlackDress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "BrownHills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "RedHills",
      "picture": "images/products/hills2.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "BlackPants",
      "picture": "images/products/pants1.jpg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "GreyPants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "FlowerSkirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
    {
      "name": "PinkSkirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 1200,
      "price": 1000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            product_name: product_list[index]["name"],
            product_picture: product_list[index]["picture"],
            prod_old_price: product_list[index]["old_price"],
            prod_price: product_list[index]["price"],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final prod_old_price;
  final prod_price;

  Single_product({
    this.product_name,
    this.product_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
//          tag: product_name,
          tag: new Text("Product name"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(

                  //here we are passing the values of the product to product details page
                  builder: (context) => new ProductDetails(
                        product_detail_name: product_name,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: product_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Text(
                              product_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          new Text(
                            "\Ksh.${prod_price}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
