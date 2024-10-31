import 'package:flutter/material.dart';
import 'package:ukkkasir/models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Harga: ${item.price} IDR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEFE2D0),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (item.quantity > 0) {
                            onQuantityChanged(item.quantity - 1);
                          }
                        },
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${item.quantity}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (item.quantity < 10) {  // Limit to maximum of 10
                            onQuantityChanged(item.quantity + 1);
                          }
                        },
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
