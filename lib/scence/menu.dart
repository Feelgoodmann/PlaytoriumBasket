import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playtorium/data/data.dart';

import 'cart.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final dataForTest = DataForTest();
  List<Item> items = [];
  bool tShirtIsChecked = false;
  bool hatIsChecked = false;
  bool hoodieIsChecked = false;
  bool watchIsChecked = false;
  bool bagIsChecked = false;
  bool beltIsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"), // The title of the app bar
        backgroundColor: Colors.blue, // You can change the background color
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: Container(
        padding: const EdgeInsets.all(100),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space items apart
              children: [
                Text(
                  dataForTest.tShirt.name,
                  style: const TextStyle(fontSize: 18),
                ), // Text on the left
                Checkbox(
                  value: tShirtIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      tShirtIsChecked = newValue ?? false;
                      if (tShirtIsChecked) {
                        items.add(dataForTest.tShirt);
                      } else {
                        items.remove(dataForTest.tShirt);
                      }
                      print("Current items in the cart: $items");
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out text and checkbox
              children: [
                Text(dataForTest.hat.name,
                    style: const TextStyle(fontSize: 18)), // Text on the left
                Checkbox(
                  value: hatIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      hatIsChecked = newValue ?? false;
                      if (hatIsChecked) {
                        items.add(dataForTest.hat);
                      } else {
                        items.remove(dataForTest.hat);
                      }
                      print("Current items in the cart: $items");
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out text and checkbox
              children: [
                Text(dataForTest.hoodie.name,
                    style: const TextStyle(fontSize: 18)), // Text on the left
                Checkbox(
                  value: hoodieIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      hoodieIsChecked = newValue ?? false;
                      if (hoodieIsChecked) {
                        items.add(dataForTest.hoodie);
                      } else {
                        items.remove(dataForTest.hoodie);
                      }
                      print("Current items in the cart: $items");
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out text and checkbox
              children: [
                Text(dataForTest.watch.name,
                    style: const TextStyle(fontSize: 18)), // Text on the left
                Checkbox(
                  value: watchIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      watchIsChecked = newValue ?? false;
                      if (watchIsChecked) {
                        items.add(dataForTest.watch);
                      } else {
                        items.remove(dataForTest.watch);
                      }
                      print("Current items in the cart: $items");
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out text and checkbox
              children: [
                Text(dataForTest.bag.name,
                    style: const TextStyle(fontSize: 18)), // Text on the left
                Checkbox(
                  value: bagIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      bagIsChecked = newValue ?? false;
                      if (bagIsChecked) {
                        items.add(dataForTest.bag);
                      } else {
                        items.remove(dataForTest.bag);
                      }
                      print("Current items in the cart: $items");
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space out text and checkbox
              children: [
                Text(dataForTest.belt.name,
                    style: const TextStyle(fontSize: 18)), // Text on the left
                Checkbox(
                  value: beltIsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      beltIsChecked = newValue ?? false;
                      if (beltIsChecked) {
                        items.add(dataForTest.belt);
                      } else {
                        items.remove(dataForTest.belt);
                      }
                      print("Current items in the cart: ${items.toString()}");
                    });
                  },
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(items), // Pass the items list
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
