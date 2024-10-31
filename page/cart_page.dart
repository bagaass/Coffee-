import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ukkkasir/provider/cart_provider.dart';
import 'package:ukkkasir/widget/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final totalPrice = cartProvider.getTotalPrice();

    // Define available table numbers
    final List<String> tableNumbers = ['1', '2', '3', '4', '5',];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Customer Name Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Customer Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    cartProvider.setCustomerName(value);
                  },
                ),
                SizedBox(height: 10),
                // Dropdown for Table Number Selection
                DropdownButtonFormField<String>(
                  value: cartProvider.tableNumber.isEmpty ? null : cartProvider.tableNumber,
                  items: tableNumbers.map((table) {
                    return DropdownMenuItem(
                      value: table,
                      child: Text('Table $table'),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Select Table Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    cartProvider.setTableNumber(value ?? '');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return CartItemWidget(
                  item: item,
                  onQuantityChanged: (newQuantity) {
                    item.quantity = newQuantity;
                    cartProvider.notifyListeners();
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 19, 16, 16).withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Display Customer Name and Table Number
                if (cartProvider.customerName.isNotEmpty && cartProvider.tableNumber.isNotEmpty) ...[
                  Text(
                    'Customer: ${cartProvider.customerName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Table: ${cartProvider.tableNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'IDR $totalPrice',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Validate if the customer name and table number are provided
                    if (cartProvider.customerName.isEmpty || cartProvider.tableNumber.isEmpty) {
                      // Show an alert if either field is empty
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Perhatian!'),
                          content: Text('Harap isi nama dan no.meja untuk melanjutkan pembayaran.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Proceed to checkout if both fields are filled
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirm Checkout'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Customer: ${cartProvider.customerName}'),
                              Text('Table: ${cartProvider.tableNumber}'),
                              Text('Total amount: IDR $totalPrice'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                cartProvider.clearCart();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Berhasil Checkout!')),
                                );
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Checkout'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
