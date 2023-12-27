import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/pages/menupage.dart';
import 'package:coffee_masters/pages/notespage.dart';
import 'package:coffee_masters/pages/offerspage.dart';
import 'package:coffee_masters/pages/orderspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coffee Masters",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "Akshay";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TextField(
              onChanged: (value) => setState(() {
                name = value;
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Name:",
              ),
            ),
            const Text("Hello"),
          ],
        ),
        Text(name),
      ],
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Just Do It!");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var dataManager = DataManager();
  Widget? currentPage;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        currentPage = MenuPage(dataManager: dataManager);
        break;
      case 1:
        currentPage = const OfferPage();
        break;
      case 2:
        currentPage = OrderPage(dataManager: dataManager);
        break;
      case 3:
        currentPage = Notes(dataManager: dataManager);
        break;
    }

    return Scaffold(
      appBar: AppBar(title: Image.asset("images/logo.png")),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(
                Icons.coffee,
                // color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Offers",
              icon: Icon(
                Icons.local_offer,
                // color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.shopping_cart_checkout,
                // color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Notes",
              icon: Icon(
                Icons.note,
                // color: Colors.black,
              ),
            ),
          ]),
    );
  }
}
