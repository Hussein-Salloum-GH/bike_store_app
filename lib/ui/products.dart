import 'dart:convert';

import 'package:bike_store/network/product_service.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductService productService;
  Future<Response> productResponse;
  List<String> productImages = [];

  @override
  void initState() {
    super.initState();
    productService = ProductService.instance();
    productResponse = productService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Response>(
        future: productResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print(snapshot.data.bodyString);
            final products = json.decode(snapshot.data.bodyString);
            //print(products['data']['data']);

            return ListView.builder(
              itemCount: products['data']['data'].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Hero(
                    tag: products['data']['data'][index]['title'],
                    child: InkWell(
                      onTap: () {},
                      child: Material(
                        elevation: 10.0,
                        shadowColor: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://bikehub.store/Images/${products['data']['data'][index]['image']}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                products['data']['data'][index]['gear'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 16.0,
                                ),
                              ),
                              title: Text(
                                products['data']['data'][index]['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18.0,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                      "\$${products['data']['data'][index]['price']}")
                                ],
                              ),
                              trailing: Text(
                                products['data']['data'][index]['model'] != null
                                    ? products['data']['data'][index]['model']
                                    : "no year",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Please try again!!");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
