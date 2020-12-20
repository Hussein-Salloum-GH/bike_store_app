import 'dart:convert';

import 'package:bike_store/network/product_service.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductService productService;
  Future<Response> productResponse;

  @override
  void initState() {
    super.initState();
    productService = ProductService.instance();
    productResponse = productService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Store App"),
        actions: [
          IconButton(
            icon: Icon(Icons.open_in_new),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.directions_bike),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Hussein R. Salloum",
                style: TextStyle(fontSize: 20.0),
              ),
              accountEmail: Text(
                "Hussein.Salloum@Gmail.com",
                style: TextStyle(fontSize: 16.0),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 48.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),

            // body of drawer
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Products"),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(height: 2.0, thickness: 2.0),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: Center(
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
                          elevation: 7.0,
                          shadowColor: Colors.green,
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
                                  products['data']['data'][index]['model'] !=
                                          null
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
      ),
    );
  }
}
