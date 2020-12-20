import 'package:bike_store/model/product.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Text("Product Details"),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Hero(
        tag: product.title,
        child: Material(
          shadowColor: Colors.red,
          elevation: 5.0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: ListView(
              children: [
                Container(
                  height: 300.0,
                  color: Colors.black,
                  child: GridTile(
                    child: Container(
                      color: Colors.white,
                      child: Image.network(
                        "http://bikehub.store/Images/${product.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Text(
                          product.gear,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "\$" + product.price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                product.brakeType != null
                                    ? product.brakeType
                                    : "No Brake Type",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Size"),
                                  content: Text("Choose the size"),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("close"),
                                    ),
                                  ],
                                );
                              });
                        },
                        color: Colors.white,
                        textColor: Colors.grey,
                        elevation: 0.4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Size"),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Color"),
                                  content: Text("Choose a color"),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("close"),
                                    ),
                                  ],
                                );
                              });
                        },
                        color: Colors.white,
                        textColor: Colors.grey,
                        elevation: 0.4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Color"),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Quantity"),
                                  content: Text("Choose the qty"),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("close"),
                                    ),
                                  ],
                                );
                              });
                        },
                        color: Colors.white,
                        textColor: Colors.grey,
                        elevation: 0.4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Qty"),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //second
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red,
                          textColor: Colors.white,
                          elevation: 0.4,
                          child: Text("Buy Now"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                ),
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                      child: Text(
                        product.model,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        product.country,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                      child: Text(
                        "Product brand",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Brand X",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                      child: Text(
                        "Product condition",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "NEW",
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SIMILAR PRODUCTS",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
