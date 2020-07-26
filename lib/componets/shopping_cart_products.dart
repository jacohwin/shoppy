import 'package:flutter/material.dart';

class Shopping_Cart_Products extends StatefulWidget {
  @override
  _Shopping_Cart_ProductsState createState() => _Shopping_Cart_ProductsState();
}

class _Shopping_Cart_ProductsState extends State<Shopping_Cart_Products> {
  var Products_On_the_cart = [
    {
      "name": "MenBlazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 1000,
      "Size": "XL",
      "Color": "Red",
      "Quantity": 1,
    },
    {
      "name": "WomenBlazer",
      "picture": "images/products/blazer2.jpeg",
      "price": 1000,
      "Size": "M",
      "Color": "Red",
      "Quantity": 2,
    },
    {
      "name": "RedDress",
      "picture": "images/products/dress1.jpeg",
      "price": 1000,
      "Size": "L",
      "Color": "Red",
      "Quantity": 2,
    },
    {
      "name": "BlackDress",
      "picture": "images/products/dress2.jpeg",
      "price": 1000,
      "Size": "XXL",
      "Color": "Red",
      "Quantity": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_On_the_cart.length,
        itemBuilder: (context, index) {
          return Single_Shopping_Cart_Product(
            cart_product_name: Products_On_the_cart[index]["name"],
            cart_product_color: Products_On_the_cart[index]["Color"],
            cart_prod_quantity: Products_On_the_cart[index]["Quantity"],
            cart_prod_price: Products_On_the_cart[index]["price"],
            cart_product_size: Products_On_the_cart[index]["Size"],
            cart_product_picture: Products_On_the_cart[index]["picture"],
          );
        });
  }
}

class Single_Shopping_Cart_Product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_prod_price;
  final cart_product_size;
  final cart_product_color;
  final cart_prod_quantity;

  Single_Shopping_Cart_Product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_prod_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //  ===LEADING SECTION=====
        leading: new Image.asset(cart_product_picture,width: 80.0, height: 80.0,),
        //====TITLE SECTION======
        title: new Text(cart_product_name),

        // =====SUBTITLE SECTION======
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
                //this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                //======this section is for the product color=====
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
//                new Text(cart_prod_quantity),
              ],
            ),

            //======this section is for the product price=======
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\Ksh.${cart_prod_price}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                color: Colors.red),
              ),
            )
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
              new Text("$cart_prod_quantity"),
              new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
