import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userRoleController = TextEditingController();
  final TextEditingController _tableNumberController = TextEditingController();
  final TextEditingController _menuItemController = TextEditingController();
  final TextEditingController _menuPriceController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _userRoleController.dispose();
    _tableNumberController.dispose();
    _menuItemController.dispose();
    _menuPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Admin Dashboard', style: TextStyle(fontSize: 20)),
        backgroundColor: const Color.fromARGB(255, 237, 232, 232),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSummaryCards(),
              SizedBox(height: 20),
              _buildAddSection(
                  'Add User',
                  _userNameController,
                  'Name',
                  _userRoleController,
                  'Role',
                  Icons.person,
                  const Color.fromARGB(255, 182, 194, 183), () {
                final userName = _userNameController.text;
                final userRole = _userRoleController.text;
                if (userName.isNotEmpty && userRole.isNotEmpty) {
                  _userNameController.clear();
                  _userRoleController.clear();
                  _showSnackbar('Berhasil menambahkan user');
                }
              }),
              SizedBox(height: 20),
              _buildAddSection(
                  'Add Table',
                  _tableNumberController,
                  'Table Number',
                  null,
                  '',
                  Icons.table_bar,
                  const Color.fromARGB(255, 182, 194, 183), () {
                final tableNumber = _tableNumberController.text;
                if (tableNumber.isNotEmpty) {
                  _tableNumberController.clear();
                  _showSnackbar('Berhasil menambahkan meja');
                }
              }),
              SizedBox(height: 20),
              _buildAddSection(
                  'Add Menu Item',
                  _menuItemController,
                  'Item Name',
                  _menuPriceController,
                  'Price',
                  Icons.fastfood,
                  const Color.fromARGB(255, 182, 194, 183), () {
                final menuItem = _menuItemController.text;
                final menuPrice = _menuPriceController.text;
                if (menuItem.isNotEmpty && menuPrice.isNotEmpty) {
                  _menuItemController.clear();
                  _menuPriceController.clear();
                  _showSnackbar('Berhasil menambahkan menu item');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _summaryCard('Total Users', '3', Icons.person),
        _summaryCard('Total Tables', '5', Icons.table_bar),
        _summaryCard('Total Menu', '4', Icons.restaurant_menu),
      ],
    );
  }

  Widget _summaryCard(String label, String count, IconData icon) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.brown, size: 30),
              SizedBox(height: 10),
              Text(
                count,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                label,
                style: TextStyle(
                    fontSize: 14, color: const Color.fromARGB(255, 35, 30, 30)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddSection(
    String label,
    TextEditingController controller1,
    String hint1,
    TextEditingController? controller2,
    String hint2,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                SizedBox(width: 10),
                Text(label,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            _buildTextField(controller1, hint1),
            if (controller2 != null) ...[
              SizedBox(height: 10),
              _buildTextField(controller2, hint2),
            ],
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Add', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
