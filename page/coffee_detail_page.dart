// // coffee_detail_page.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ukkkasir/models/cart.dart';
// import 'package:ukkkasir/page/cart_page.dart';
// import 'package:ukkkasir/provider/cart_provider.dart';

// class CoffeeDetailPage extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final String category;
//   final int price;

//   CoffeeDetailPage({
//     required this.imageUrl,
//     required this.name,
//     required this.category,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 237, 235, 235),
//         title: Text('Coffee Details'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Coffee Image
//             Hero(
//               tag: imageUrl,
//               child: Image.network(
//                 imageUrl,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.brown,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     category.toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "Description",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.brown[700],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Enjoy our delicious $name. It is a part of our $category collection, and is known for its rich flavor and aroma. The perfect drink for any time of the day!",
//                     style: TextStyle(
//                       fontSize: 16,
//                       height: 1.4,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           // Access CartProvider to add the coffee item and navigate to CartPage
//           final cartItem = CartItem(
//             name: name,
//             imageUrl: imageUrl,
//             category: category,
//             price: price,
//             quantity: 1,
//           );
//           Provider.of<CartProvider>(context, listen: false).addToCart(cartItem);
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CartPage()),
//           );
//         },
//         backgroundColor: const Color.fromARGB(255, 239, 234, 233),
//         icon: Icon(Icons.shopping_cart),
//         label: Text('Add to Cart'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
