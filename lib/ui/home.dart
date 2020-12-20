import 'package:bike_store/ui/carousel_products.dart';
import 'package:bike_store/ui/products.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Store App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CarouselProducts(),
          ),
          Padding(
            padding: const EdgeInsets.all(215.0),
            child: Divider(height: 2.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0),
            child: Container(
              child: Text(
                "PRODUCTS",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260.0),
            child: Products(),
          ),
        ],
      ),
    );
  }
}
