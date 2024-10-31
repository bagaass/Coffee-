import 'package:flutter/material.dart';

class ManagerHomePage extends StatelessWidget {
  // Sample transaction data, which would usually come from a database or API.
  final List<Map<String, dynamic>> transactions = [
    {
      'transactionId': 'TX001',
      'date': '2023-10-01',
      'customerName': 'Budi',
      'tableNumber': '5',
      'totalAmount': 20000,
    },
    {
      'transactionId': 'TX002',
      'date': '2023-10-01',
      'customerName': 'Aris',
      'tableNumber': '3',
      'totalAmount': 15000,
    },
    {
      'transactionId': 'TX003',
      'date': '2023-10-02',
      'customerName': 'Widy',
      'tableNumber': '2',
      'totalAmount': 10000,
    },
    // Add more sample transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        backgroundColor: const Color.fromARGB(255, 237, 234, 233),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Transaksi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return _buildTransactionCard(transaction);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(Map<String, dynamic> transaction) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction ID: ${transaction['transactionId']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Date: ${transaction['date']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Text(
              'Customer: ${transaction['customerName']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Text(
              'Table: ${transaction['tableNumber']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'IDR ${transaction['totalAmount']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
