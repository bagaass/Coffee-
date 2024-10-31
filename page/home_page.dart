// home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ukkkasir/models/cart.dart';
import 'package:ukkkasir/models/coffee.dart';
import 'package:ukkkasir/page/cart_page.dart';
import 'package:ukkkasir/provider/cart_provider.dart';
import 'package:ukkkasir/widget/coffee_card.dart';

class HomePage extends StatelessWidget {
  final List<Coffee> coffeeData = [
    Coffee(
      imageUrl: 'https://blog.alfagift.id/wp-content/uploads/2023/06/11-img.jpg',
      name: 'FRENCH FRIES',
      category: 'Snack',
      price: 8000,
    ),
    Coffee(
      imageUrl: 'https://asset.kompas.com/crops/vmDriSafVxhO05gc2dSOXby53Mc=/13x7:700x465/750x500/data/photo/2021/09/24/614dc6865eb24.jpg',
      name: 'FRIED RISE',
      category: 'Heavy food',
      price: 12000,
    ),
    Coffee(
      imageUrl: 'https://miro.medium.com/v2/resize:fit:1400/1*xdAy0yq5Bo6wF2HPSFBlNA.png',
      name: 'BLACK COFFEE',
      category: 'Coffee',
      price: 5000,
    ),
    Coffee(
      imageUrl: 'https://png.pngtree.com/thumb_back/fw800/background/20220607/pngtree-ice-chocolate-food-drink-fresh-photo-image_31122582.jpg',
      name: 'ICED CHOCOLATE',
      category: 'CHOCOLATE',
      price: 12000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.grey.shade200],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'mau makan atau minum apa hari ini?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: coffeeData.length,
                    itemBuilder: (context, index) {
                      final coffee = coffeeData[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            // Add item to cart with correct price
                            Provider.of<CartProvider>(context, listen: false).addToCart(
                              CartItem(
                                name: coffee.name,
                                imageUrl: coffee.imageUrl,
                                category: coffee.category,
                                price: coffee.price,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartPage()),
                            );
                          },
                          child: CoffeeCard(
                            imageUrl: coffee.imageUrl,
                            name: coffee.name,
                            category: coffee.category,
                            price: coffee.price,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
